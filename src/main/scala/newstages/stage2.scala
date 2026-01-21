package processor
import chisel3._
import chisel3.util._

/*
This one maintains PC. 
It also checks if the instruction is a branch specifically to pause on that instance. 
Anything that writes to PC is a branch and needs to be paused right now. 


*/

class SecondStage(path:String) extends Module {

  val io = IO(new Bundle {

    val newPC=Input(Bool())
    val PCIn = Input(UInt(32.W))
      
    val instruction=Output(UInt(32.W))

    val PC_out=Output(UInt(32.W))

    val debug_waiting=Output(Bool())


  })

  printf("stage 2:\n")

    val waiting = RegInit(false.B)
    val PC=RegInit(0.U(32.W))
    val IM=Module(new IM(path))
    IM.io.address:=PC

    io.PC_out:=PC

    io.debug_waiting:=waiting

    //TODO: Initialize instruction memory with a string for the address...

    when(waiting){
        val nop = "b0000_0000_0000_0000_0000_0000_0001_0011".U//addi x0, x0, 0

        io.instruction:= nop 
        when(io.newPC){
            PC:=io.PCIn
            waiting:=false.B
        }
    }.otherwise{
        io.instruction:=IM.io.data
        when(
            Utils.opcode(IM.io.data)==="b1100011".U|
            Utils.opcode(IM.io.data)==="b1101111".U|
            Utils.opcode(IM.io.data)==="b1100111".U){
            waiting:= true.B
        }.otherwise{
            PC:=PC+1.U
        }
    }


    

}