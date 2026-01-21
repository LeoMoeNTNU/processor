package processor
import chisel3._
import chisel3.util._

class barrier3 extends Module {

  val io = IO(new Bundle {

    // Inputs
    val instruction_In=Input(UInt(32.W))

    val PC_In=Input(UInt(32.W))

    val regWrite_In=Input(Bool())
    val regToWrite_In=Input(UInt(5.W))
    val regWriteVal_In=Input(UInt(32.W))

    //Outputs
    val instruction_Out=Output(UInt(32.W))

    val PC_Out=Output(UInt(32.W))//We need PC because we are sometimes sending it through to the ALU.

    //signals for the register file. 
    val regWrite_Out=Output(Bool())
    val regToWrite_Out=Output(UInt(5.W))
    val regWriteVal_Out=Output(UInt(32.W))

  })

  // Registers
  val instruction_Reg = RegNext(io.instruction_In)
  val PCIn_Reg = RegNext(io.PC_In)
  

  // Connect outputs
  io.instruction_Out:=instruction_Reg
  io.PC_Out:=PCIn_Reg

  io.regWrite_Out:=io.regWrite_In
  io.regToWrite_Out:=io.regToWrite_In
  io.regWriteVal_Out:=io.regWriteVal_In
  
}