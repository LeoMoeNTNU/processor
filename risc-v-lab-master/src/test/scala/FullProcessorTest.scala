package processor

import chisel3._
import org.scalatest.flatspec.AnyFlatSpec
import chiseltest._


class FPTest extends AnyFlatSpec with ChiselScalatestTester {

  behavior of "ALU"

  it should "do additions" in {
    test(new FullProcessor) { dut =>

			for(i<-0 to 10){
                println(s"AFTER ${i} CYCLES:")
                for(j<-0 to 32){
                    println(s"reg ${j}: ${dut.io.regs(j).peek().litValue}")
                }
               

            }
			

    }
  }
}