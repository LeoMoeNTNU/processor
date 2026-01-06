package processor
import chisel3._
import chisel3.util._

class FirstStage extends Module {

  val io = IO(new Bundle {
    // Input: vector of enum values
    //The input should be: colorMoving, from To, newBoard.

    val ALU_input1 = Input(UInt(32.W))

    val ALU_input2=Input(UInt(32.W))//idk if 32 or 64. Drawing says 64. 
    

    val DataMemoryActive=Input(Bool())
    val DataMemoryReadOrWrite=Input(UInt(32.W)) 
    val DataMemoryAddress=Input(UInt(32.W))

    val PC=Output(UInt(32.W))
    val IM_Pointer=Output(UInt(32.W))//idk the bit width. 





  })

  //This one needs an Instruction Memory


    val ALU_input1_reg=RegInit(UInt(32.W))
    ALU_input1_reg:=io.ALU_input1
    
    val ALU_input2_reg=RegInit(UInt(32.W))
    ALU_input2_reg:=io.ALU_input2

    val DataMemoryActive_reg=RegInit(Bool())
    DataMemoryActive_reg:=io.DataMemoryActive

    val DataMemoryReadOrWrite_reg=RegInit(UInt(32.W))
    DataMemoryReadOrWrite_reg:=io.DataMemoryReadOrWrite

    val DataMemoryAddress_reg=RegInit(UInt(32.W))
    DataMemoryAddress_reg:=io.DataMemoryAddress


}