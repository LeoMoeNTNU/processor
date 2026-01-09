package processor

import chisel3._
import org.scalatest.flatspec.AnyFlatSpec
import chiseltest._


class IMTest extends AnyFlatSpec with ChiselScalatestTester {

  behavior of "ALU"

  it should "do simple add" in {
    test(new IM) { dut =>

			for(i<-0 to 10){
                dut.io.address.poke(i.U)
                val full = dut.io.data.peek().litValue
                val sliced = full & 0x7F   // mask lower 7 bits
                println(s"from here we have $sliced")

                //println(s"from here we have ${dut.io.data(6,0).peek().litValue}")

            }
			

    }
  }
}