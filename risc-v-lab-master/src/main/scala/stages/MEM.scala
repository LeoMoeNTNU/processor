import chisel3._
import chisel3.util._

class MEM extends Module {

  val io = IO(new Bundle {
    // Input: vector of enum values
    //The input should be: colorMoving, from To, newBoard.

    val zero = Input(UInt(32.W))

    val ALU_result=Input(UInt(32.W))//idk if 32 or 64. Drawing says 64. 

    val Write_Data=Input(UInt(32.W))
    val Sum_in=Input(UInt(32.W))

    val Sum_out=Output(UInt(32.W))
    val ReadData=Output(UInt(32.W)) 
    val ALU_result=Output(UInt(32.W))




  })

  //This one needs an Instruction Memory


    val zero_reg=RegInit(UInt(32.W))
    zero_reg:=io.zero
    
    val ALU_result_reg=RegInit(UInt(32.W))
    ALU_result_reg:=io.ALU_result

    val Sum_in_reg=RegInit(UInt(32.W))
    Sum_in_reg:=io.Sum_in


   


}