
package processor
import chisel3._
import chisel3.util._



class ThirdStage extends Module {

  val io = IO(new Bundle {

    val RF_input1=Input(UInt(5.W))
    val RF_input2=Input(UInt(5.W))

    val RF_write=Input(Bool())
    val RF_val=Input(UInt(32.W))
    val RF_address=Input(UInt(32.W))

    val fullInstructionForALU=Input(UInt(32.W))
    val fullInstructionOut=Output(UInt(32.W))
    val IR=Input(UInt(32.W))

    val value1=Output(UInt(32.W))
    val value2=Output(UInt(32.W))

    val datapointer=Output(UInt(32.W))
    val dataMemoryActive=Output(Bool())
    val dataReadOrWrite=Output(Bool())//read is true and write is false. 
    val dataToWrite=Output(UInt(32.W))

    val regs=Output(Vec(32,UInt(32.W)))

    //There should probably be something here to write to registers as well. 
  })


    io.value1:=0.U
    io.value2:=0.U
    io.datapointer:=0.U
    io.dataMemoryActive:=false.B
    io.dataReadOrWrite:=false.B
    io.dataToWrite:=0.U
    
  //This one needs an Instruction Memory
    val fullInstructionForALU_reg=RegInit(0.U(32.W))
    fullInstructionForALU_reg:=io.fullInstructionForALU
    io.fullInstructionOut:=fullInstructionForALU_reg

    val RF_input1_reg=RegInit(0.U(32.W))
    RF_input1_reg:=io.RF_input1
    
    val RF_input2_reg=RegInit(0.U(32.W))
    RF_input2_reg:=io.RF_input2

    val RF_write_reg=RegInit(false.B)
    RF_write_reg:=io.RF_write

    val RF_val_reg=RegInit(0.U(32.W))
    RF_val_reg:=io.RF_val

    val RF_address_reg=RegInit(0.U(32.W))
    RF_address_reg:=io.RF_address

    val IR_reg=RegInit(0.U(32.W))
    IR_reg:=io.IR

    val regs = RegInit(VecInit(Seq.fill(32)(0.U(32.W))))
    for(i<-0 until 32){
      io.regs(i):=regs(i)
    }

    when(RF_write_reg===true.B){
      regs(RF_address_reg):=RF_val_reg
    }

    val Instruction=Wire(UInt(32.W))
    Instruction:=fullInstructionForALU_reg
    switch(Utils.opcode(Instruction)){
      is("b0110011".U){//R-type
        io.dataMemoryActive:=false.B
        io.dataReadOrWrite:=false.B//false is for write. 
        io.datapointer:=0.U
        io.value1:=regs(RF_input1_reg)
        io.value2:=regs(RF_input2_reg)


      }
      is("b0010011".U,"b0000011".U,"b1100111".U,"b1110011".U){//I-type
        io.value1:=regs(RF_input1_reg)
        
        io.value2:=regs(IR_reg)
        //This line won't always be correct. In a bunch of instructions, I will have to set some of the bits to zero. 
        //Check instruction sheet bro. 


        //sometimes, this is a write instruction and sometimes not. We probably need another switch statement inside of here. 
      }
      
      is("b0100011".U){//S-type
        io.dataMemoryActive:=true.B
        io.dataReadOrWrite:=false.B//false is for write. 
       
        io.datapointer:=RF_input1_reg+Utils.S_imm(Instruction)
        io.dataToWrite:=regs(RF_input2_reg)
        //One problem that I haven't resolved here yet is that, depending on the specific instruction, we will write a word, halfword or byte. 
        //idk how to fix...

      }
      is("b1100011".U){//B-type
        io.dataMemoryActive:=false.B
        io.dataReadOrWrite:=false.B//false is for write. 
        io.datapointer:=0.U
      }
  
      is("b1101111".U){//J-type
        io.dataMemoryActive:=false.B
        io.dataReadOrWrite:=false.B//false is for write. 
        io.datapointer:=0.U
      }
      is("b0110111".U,"b0010111".U){//U-type
        io.dataMemoryActive:=false.B
        io.dataReadOrWrite:=false.B//false is for write. 
        io.datapointer:=0.U
      }
    }

    //There are different possibilities here to work with. 


   


}
