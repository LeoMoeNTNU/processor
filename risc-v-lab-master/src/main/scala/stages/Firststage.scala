package processor
import chisel3._
import chisel3.util._

class FirstStage extends Module {

  val io = IO(new Bundle {

    val ALU_input1 = Input(UInt(32.W))

    val ALU_input2=Input(UInt(32.W))//idk if 32 or 64. Drawing says 64. 
    val fullInstruction=Input(UInt(32.W))
    

    val DataMemoryActive=Input(Bool())
    val DataMemoryReadOrWrite=Input(UInt(32.W)) 
    val DataMemoryAddress=Input(UInt(32.W))
    val DataToWrite=Input(UInt(32.W))

    val newPC=Output(Bool())
    val PC=Output(UInt(32.W))

    val RF_write=Output(Bool())
    val RF_val=Output(UInt(32.W))
    val RF_address=Output(UInt(32.W))


  })


    io.newPC:=false.B
    io.PC:=0.U
    io.RF_write:=false.B
    io.RF_val:=0.U
    io.RF_address:=0.U
  //This one needs an Instruction Memory
    val fullInstruction_reg=RegInit(0.U(32.W))
    fullInstruction_reg:=io.fullInstruction


    val ALU_input1_reg=RegInit(0.U(32.W))
    ALU_input1_reg:=io.ALU_input1
    
    val ALU_input2_reg=RegInit(0.U(32.W))
    ALU_input2_reg:=io.ALU_input2

    val DataMemoryActive_reg=RegInit(false.B)
    DataMemoryActive_reg:=io.DataMemoryActive

    val DataMemoryReadOrWrite_reg=RegInit(0.U(32.W))
    DataMemoryReadOrWrite_reg:=io.DataMemoryReadOrWrite

    val DataMemoryAddress_reg=RegInit(0.U(32.W))
    DataMemoryAddress_reg:=io.DataMemoryAddress

    val DataToWrite_reg=RegInit(0.U(32.W))
    DataToWrite_reg:=io.DataToWrite

    val ALU= Module(new ALU)
    ALU.io.val1:=ALU_input1_reg
    ALU.io.val2:=ALU_input2_reg
    ALU.io.from1:=0.U
    ALU.io.from2:=0.U
    ALU.io.toReg:=0.U



     val Instruction=Wire(UInt(32.W))
    Instruction:=fullInstruction_reg
    switch(Utils.opcode(Instruction)){
      is("b0110011".U){//R-type
        ALU.io.from1:=Utils.rs1(Instruction)
        ALU.io.from2:=Utils.rs2(Instruction)
        ALU.io.toReg:=Utils.rd(Instruction)
        io.RF_write:=true.B
        io.RF_address:=Utils.rd(Instruction)
        io.RF_val:=ALU.io.output

        ALU.io.operation:=0.U//default value that can't be used. 
        switch(Utils.funct3(Instruction)){
          is(0.U){
            Mux(Utils.funct7(Instruction)===0.U, 0.U, 1.U)
            //plus or minus, both. 
          }
          is(4.U){
            ALU.io.operation:=2.U
          }
          is(6.U){
            ALU.io.operation:=3.U
          }
          is(7.U){
            ALU.io.operation:=4.U
          }
          is(1.U){
            ALU.io.operation:=5.U
          }
          is(5.U){
            Mux(Utils.funct7(Instruction)===0.U, 6.U, 7.U)


          }
          is(2.U){
            ALU.io.operation:=8.U
          }
          is(3.U){
            ALU.io.operation:=9.U
          }

        }


      }
      is("b0010011".U){//I-type
      //This isn't on every I-instruction...
        ALU.io.from1:=Utils.rs1(Instruction)
        ALU.io.from2:=0.U
        ALU.io.toReg:=Utils.rd(Instruction)
        io.RF_write:=true.B
        io.RF_address:=Utils.rd(Instruction)
        io.RF_val:=ALU.io.output

       ALU.io.operation:=0.U//default value that can't be used. 
        switch(Utils.funct3(Instruction)){
          is(0.U){
            ALU.io.operation:=0.U
          }
          is(4.U){
            ALU.io.operation:=2.U
          }
          is(6.U){
            ALU.io.operation:=3.U
          }
          is(7.U){
            ALU.io.operation:=4.U
          }
          is(1.U){
            ALU.io.operation:=10.U
          }
          is(5.U){
            Mux(Utils.I_imm(Instruction)(11)===1.U, 12.U, 11.U)//The logic in this could be checked but seems solid to me. 
            //imm[5:11]=0x20 or 0x0 is same as picking either 10 0000 or 00 0000, which can be done by just checking bit 11. 


          }
          is(2.U){
            ALU.io.operation:=8.U
          }
          is(3.U){
            ALU.io.operation:=9.U
          }

        }


        
      }

      

      is("b0000011".U,"b1100111".U,"b1110011".U){//Other I-types.


      }

      is("b0100011".U){//S-type
       

      }
      is("b1100011".U){//B-type
        
      }
  
      is("b1101111".U){//J-type
     
      }
      is("b0110111".U,"b0010111".U){//U-type
        
      }
    }



}