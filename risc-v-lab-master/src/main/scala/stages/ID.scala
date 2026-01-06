import chisel3._
import chisel3.util._

class ID extends Module {

  val io = IO(new Bundle {
    // Input: vector of enum values
    //The input should be: colorMoving, from To, newBoard.

    val PCIn = Input(UInt(32.W))
    val PCOut=Output(UInt(32.W))

    val instruction=Input(UInt(32.W))
    val readData1=Output(UInt(32.W))
    val readData2=Output(UInt(32.W))



  })

    val instruction_reg=RegInit(UInt(32.W))
    instruction_reg:=io.instruction

    val PCIN_reg=RegInit(UInt(32.W))
    PCIN_reg:=io.PCIn
    io.PCOut:=PCIN_reg

}