
package processor

import chisel3._
import org.scalatest.flatspec.AnyFlatSpec
import chiseltest._


class secstatest extends AnyFlatSpec with ChiselScalatestTester {

  behavior of "SecondStage"

  it should "send the right rs1 and rs2 in lots of strings" in {
    test(new SecondStage) { dut =>
      /*
       val newPC=Input(Bool())
    val PCIn = Input(UInt(32.W))
      */
      
      dut.io.newPC.poke(false.B)
      dut.io.PCIn.poke(0.U)
      for(i<-0 to 30){
                val full = dut.io.instructionOut.peek().litValue
                val lower7     = full & 0x7F
                val bits19_15  = (full >> 15) & 0x1F

                println(s"lower 7 bits = $lower7")
                println(s"bits [19:15] = $bits19_15")
                println(s"PC: ${dut.io.PCOut.peek().litValue}")
                
                println(s"first reg: ${dut.io.readData1.peek().litValue}")
                println(s"second reg: ${dut.io.readData2.peek().litValue}")
                println(s"constant being sent: ${dut.io.IR.peek().litValue}")


                //readData1
                dut.clock.step()


                //println(s"from here we have ${dut.io.data(6,0).peek().litValue}")

            }
     
    }
  }
}


 