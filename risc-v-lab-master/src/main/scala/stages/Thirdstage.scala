package processor
import chisel3._
import chisel3.util._


class MEM extends Module {

  val io = IO(new Bundle {
    // Input: vector of enum values
    //The input should be: colorMoving, from To, newBoard.

    val RF_input1=Input(UInt(32.W))//pretty sure that these dont need to be 32 bits. 
    val RF_input2=Input(UInt(32.W))

    val fullInstructionForALU=Input(UInt(32.W))
    val fullInstructionOut=Output(UInt(32.W))
    val IR=Input(UInt(32.W))

    val value1=Output(UInt(32.W))
    val value2=Output(UInt(32.W))

    val datapointer=Output(UInt(32.W))
    val dataMemoryActive=Output(Bool())
    val dataReadOrWrite=Output(Bool())//read is true and write is false. 

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


    switch(Utils.opcode(fullInstructionforALU_reg)){
      is("b0110011".U){//R-type
        io.IR:=0.U//R-type doesn't use IR.
      }
      is("b0010011".U){
        io.IR:=Utils.I_imm(Instruction)
      }
      is("b0000011".U){
        io.IR:=Utils.I_imm(Instruction)
      }
      is("b0100011".U){
        io.IR:=Utils.S_imm(Instruction)
      }
      is("b1100011".U){
        io.IR:=Utils.B_imm(Instruction)
      }
      is("b1100111".U){
        io.IR:=Utils.I_imm(Instruction)
      }
      is("b1101111".U){
        io.IR:=Utils.J_imm(Instruction)
      }
      is("b0110111".U){
        io.IR:=Utils.U_imm(Instruction)
      }
      is("b0010111".U){
        io.IR:=Utils.U_imm(Instruction)
      }
      is("b1110011".U){
        io.IR:=Utils.I_imm(Instruction)
      }
    }

    //There are different possibilities here to work with. 


   


}