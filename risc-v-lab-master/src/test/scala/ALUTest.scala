package processor

import chisel3._
import org.scalatest.flatspec.AnyFlatSpec
import chiseltest._


class ALUTest extends AnyFlatSpec with ChiselScalatestTester {

  behavior of "ALU"
	/* 
	interface: 
		 val val1 = Input(UInt(32.W))
    val val2 = Input(UInt(32.W))
    val from1=Input(UInt(5.W))
    val from2=Input(UInt(5.W))

    val toReg=Input(UInt(5.W))
    
    val output=Output(UInt(5.W))
	 */
  it should "do simple add" in {
    test(new ALU) { dut =>

			dut.io.val1.poke(234.U)
			dut.io.val2.poke(5.U)
			dut.io.from1.poke(3.U)
			dut.io.from2.poke(4.U)

			dut.io.output.expect(239.U)
			

    }
  }

	  it should "do forwarding " in {
    test(new ALU) { dut =>

			dut.io.val1.poke(2.U)
			dut.io.val2.poke(3.U)
			dut.io.from1.poke(3.U)
			dut.io.from2.poke(4.U)
			dut.io.toReg.poke(5.U)
			dut.io.output.expect(5.U,"2 plus 3 is 5")
			dut.clock.step()

			dut.io.val1.poke(3.U)
			dut.io.val2.poke(4.U)
			dut.io.from1.poke(4.U)
			dut.io.from2.poke(5.U)
			dut.io.toReg.poke(6.U)
		
			dut.io.output.expect(8.U)
			

    }
  }

	  it should "do forwarding several times!" in {
    test(new ALU) { dut =>

			dut.io.val1.poke(234.U)
			dut.io.val2.poke(5.U)
			dut.io.from1.poke(3.U)
			dut.io.from2.poke(4.U)
			dut.clock.step()

			dut.io.output.expect(239.U)
			

    }
  }
}