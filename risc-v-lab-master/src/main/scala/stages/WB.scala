import chisel3._
import chisel3.util._

class MEM extends Module {

  val io = IO(new Bundle {
    // Input: vector of enum values
    //The input should be: colorMoving, from To, newBoard.

    val ReadData = Input(UInt(32.W))

    val ALU_result=Input(UInt(32.W))//idk if 32 or 64. Drawing says 64. 

    val Write_data=Output(UInt(32.W))




  })

  //This one needs an Instruction Memory


    val ReadData_reg=RegInit(UInt(32.W))
    ReadData_reg:=io.ReadData
    
    val ALU_result_reg=RegInit(UInt(32.W))
    ALU_result_reg:=io.ALU_result



   


}