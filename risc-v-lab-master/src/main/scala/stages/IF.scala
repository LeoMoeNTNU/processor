import chisel3._
import chisel3.util._

class EX extends Module {

  val io = IO(new Bundle {
    // Input: vector of enum values
    //The input should be: colorMoving, from To, newBoard.

    val sum = Input(UInt(32.W))

    val pcPlusFour=Output(UInt(32.W))
    val Instruction=Output(UInt(32.W))//idk if this one is actually supposed to be 32 bits. 




  })

  //This one needs an Instruction Memory
    val sum_reg=RegInit(UInt(32.W))
    sumReg:=sum

    val PC=RegInit(UInt(32.W))
    PC:=sum
    
    io.pcPlusFour:=PC+4.U

}