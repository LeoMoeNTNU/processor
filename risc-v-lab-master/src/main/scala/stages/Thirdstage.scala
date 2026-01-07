package processor
import chisel3._
import chisel3.util._

/*
class MEM extends Module {

  val io = IO(new Bundle {
    // Input: vector of enum values
    //The input should be: colorMoving, from To, newBoard.

    val RF_input1=Input(UInt(5.W))//pretty sure that these dont need to be 32 bits. 
    val RF_input2=Input(UInt(5.W))

    val fullInstructionForALU=Input(UInt(32.W))
    val fullInstructionOut=Output(UInt(32.W))
    val IR=Input(UInt(32.W))

    val value1=Output(UInt(32.W))
    val value2=Output(UInt(32.W))

    val datapointer=Output(UInt(32.W))
    val dataMemoryActive=Output(Bool())
    val dataReadOrWrite=Output(Bool())//read is true and write is false. 
    val dataToWrite=Output(UInt(32.W))

    //There should probably be something here to write to registers as well. 
  })

  //This one needs an Instruction Memory
    val fullInstructionForALU_reg=RegInit(UInt(32.W))
    fullInstructionForALU_reg:=io.fullInstructionForALU
    io.fullInstructionOut:=fullInstructionForALU_reg

    val RF_input1_reg=RegInit(UInt(32.W))
    RF_input1_reg:=io.RF_input1
    
    val RF_input2_reg=RegInit(UInt(32.W))
    RF_input2_reg:=io.RF_input2

    val IR_reg=RegInit(UInt(32.W))
    IR_reg:=io.IR

    val regs = RegInit(VecInit(Seq.fill(32)(0.U(32.W))))

    val Instruction=Wire()
    Instruction:=fullInstructionForALU_reg
    switch(Utils.opcode(Instruction)){
      is("b0110011".U){//R-type
        io.dataMemoryActive:=false.B
        io.dataReadOrWrite:=false.B//false is for write. 
        io.datapointer:=0.U
        io.IR:=0.U//R-type doesn't use IR.
      }
      is("b0010011".U,"b0000011".U,"b1100111".U,"b1110011".U){//I-type
        io.IR:=Utils.I_imm(Instruction)

        //sometimes, this is a write instruction and sometimes not. We probably need another switch statement inside of here. 
      }
      
      is("b0100011".U){//S-type
        io.IR:=Utils.S_imm(Instruction)
        io.dataMemoryActive:=true.B
        io.dataReadOrWrite:=false.B//false is for write. 
       
        io.datapointer:=RF_input1_reg+Utils.S_imm(Instruction)
        io.dataToWrite:=regs(RF_input2_reg)
        //One problem that I haven't resolved here yet is that, depending on the specific instruction, we will write a word, halfword or byte. 
        //idk how to fix...

      }
      is("b1100011".U){//B-type
        io.IR:=Utils.B_imm(Instruction)
        io.dataMemoryActive:=false.B
        io.dataReadOrWrite:=false.B//false is for write. 
        io.datapointer:=0.U
      }
  
      is("b1101111".U){//J-type
        io.IR:=Utils.J_imm(Instruction)
        io.dataMemoryActive:=false.B
        io.dataReadOrWrite:=false.B//false is for write. 
        io.datapointer:=0.U
      }
      is("b0110111".U,"b0010111".U){//U-type
        io.IR:=Utils.U_imm(Instruction)
        io.dataMemoryActive:=false.B
        io.dataReadOrWrite:=false.B//false is for write. 
        io.datapointer:=0.U
      }
    }

    //There are different possibilities here to work with. 


   


}
*/