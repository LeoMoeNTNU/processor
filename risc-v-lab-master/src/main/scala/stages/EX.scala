import chisel3._
import chisel3.util._

class EX extends Module {

  val io = IO(new Bundle {
    // Input: vector of enum values
    //The input should be: colorMoving, from To, newBoard.

    val PCIn = Input(UInt(32.W))

    val immGen=Input(UInt(32.W))//idk if 32 or 64. Drawing says 64. 

    val ReadData1=Input(UInt(32.W))
    val ReadData2=Input(UInt(32.W))

    val sum=Output(UInt(32.W))
    val zero=Output(UInt(32.W))//idk the bit width. 
    val ALU_result=Output(UInt(32.W))




  })

  //This one needs an Instruction Memory


    val PCIn_reg=RegInit(UInt(32.W))
    PCIn_reg:=io.PCIn
    
    val immGen_reg=RegInit(UInt(32.W))
    immGen_reg:=io.immGen

    val ReadData1_reg=RegInit(UInt(32.W))
    ReadData1_reg:=io.ReadData1

    val ReadData2_reg=RegInit(UInt(32.W))
    ReadData1_reg:=io.ReadData2


}