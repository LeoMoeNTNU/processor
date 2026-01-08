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
    
    val output=Output(UInt(5.W))

  })

  val updatedRegister=RegInit()
}

