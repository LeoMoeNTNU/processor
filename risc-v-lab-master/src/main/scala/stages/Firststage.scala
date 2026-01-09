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


      }
      is("b0010011".U,"b0000011".U,"b1100111".U,"b1110011".U){//I-type
        ALU.io.from1:=Utils.rs1(Instruction)
        ALU.io.from2:=0.U
        ALU.io.toReg:=Utils.rd(Instruction)
        io.RF_write:=true.B
        io.RF_address:=Utils.rd(Instruction)
        io.RF_val:=ALU.io.output
        
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