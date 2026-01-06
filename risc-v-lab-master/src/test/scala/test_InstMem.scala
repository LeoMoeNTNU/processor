import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class test_InstMem extends AnyFlatSpec with ChiselScalatestTester {

  "test_InstMem" should "pass" in {
    test(new InstructionROM("tests\\simple\\InstructionMemoryInit.mem")) { dut =>

      println("Testing instruction memory")
      dut.clock.setTimeout(0)
      for (i <- 0 until 100) {
        dut.io.address.poke((i).U)
        dut.clock.step(1)
        print("Address: ")
        print(i)
        print(" - Data: ")
        val binaryString = dut.io.data.peek().litValue.toString(2).reverse.padTo(32, '0').reverse
        println(s"Binary Instruction: $binaryString")
      }
    }
  }
}
