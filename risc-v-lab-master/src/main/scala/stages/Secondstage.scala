import chisel3._
import chisel3.util._

class SecondStage extends Module {

  val io = IO(new Bundle {
    // Input: vector of enum values
    //The input should be: colorMoving, from To, newBoard.

    val PCIn = Input(UInt(32.W))

    val Instruction=Input(UInt(32.W))
    
    val PCOut=Output(UInt(32.W))
    val readData1=Output(UInt(32.W))
    val readData2=Output(UInt(32.W))

    val IR=Output(UInt(32.W))


  })

    val PCIn_reg=RegInit(UInt(32.W))
    PCIn_reg:=io.PCIn

    val Instruction_reg=RegInit(UInt(32.W))
    Instruction_reg:=io.Instruction
    

}