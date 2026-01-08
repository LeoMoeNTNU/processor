package processor
import chisel3._
import chisel3.util._

class ALU extends Module {  
  val io = IO(new Bundle {
    //inputs
    
    val val1 = Input(UInt(32.W))
    val val2 = Input(UInt(32.W))
    val from1=Input(UInt(5.W))
    val from2=Input(UInt(5.W))

    //val mathematical_operation =Input(UInt(x.W))
    //for now I just assume add and check that the forwarding works.

    val toReg=Input(UInt(5.W))
    
    val output=Output(UInt(32.W))

  })

  val updatedRegister=RegInit(0.U(5.W))
  val storedValue=RegInit(0.U(32.W))

  val inputToALU1=Wire(UInt(32.W))
  val inputToALU2=Wire(UInt(32.W))

  when(io.from1===updatedRegister){
    inputToALU1:=storedValue
  }.otherwise{
    inputToALU1:=io.val1
  }

  when(io.from2===updatedRegister){
    inputToALU2:=storedValue
  }.otherwise{
    inputToALU2:=io.val2
  }

  val output_inside=inputToALU1+inputToALU2//This may cause overflow. I only want 32 bits. 

  io.output:=output_inside
  storedValue:=output_inside
  updatedRegister:=io.toReg

}

