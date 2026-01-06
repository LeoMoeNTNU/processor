import chisel3._
import chisel3.util._

class MEM extends Module {

  val io = IO(new Bundle {
    // Input: vector of enum values
    //The input should be: colorMoving, from To, newBoard.

    val RF_input1=Input(UInt(32.W))//pretty sure that these dont need to be 32 bits. 
    val RF_input2=Input(UInt(32.W))

    val fullInstructionForALU=Input(UInt(32.W))
    val IR=Input(UInt(32.W))

    val value1=Output(UInt(32.W))
    val value2=Output(UInt(32.W))

    val datapointer=Output(UInt(32.W))
    val dataMemoryActive=Output(Bool())
    val dataReadOrWrite=Output(Bool())//read is true and write is false. 
  })

  //This one needs an Instruction Memory
    val fullInstructionForALU_reg=RegInit(UInt(32.W))
    fullInstructionForALU_reg:=io.fullInstructionForALU

    val RF_input1_reg=RegInit(UInt(32.W))
    RF_input1_reg:=io.RF_input1
    
    val RF_input2_reg=RegInit(UInt(32.W))
    RF_input2_reg:=io.RF_input2

    val IR_reg=RegInit(UInt(32.W))
    IR_reg:=io.IR


   


}