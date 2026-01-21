package processor
import chisel3._
import chisel3.util._

class barrier2 extends Module {

  val io = IO(new Bundle {

    // Inputs
   
    val newPC_In=Input(Bool())
    val PCIn_In = Input(UInt(32.W))

    // Outputs
    val newPC_Out=Output(Bool())
    val PCIn_Out=Output(UInt(32.W))
  })

  // Registers
  val newPC_Reg = RegNext(io.newPC_In)
  val PCIn_Reg = RegNext(io.PCIn_In)
  

  // Connect outputs
  io.newPC_Out := newPC_Reg
  io.PCIn_Out := PCIn_Reg
  
}