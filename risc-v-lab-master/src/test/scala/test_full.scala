package processor
import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import java.nio.file._

class test_InstMem extends AnyFlatSpec with ChiselScalatestTester {

    val fileBytes = Files.readAllBytes(Paths.get("tests\\simple\\addlarge.bin"))
    val targetSize = 1024
    val paddedFile = fileBytes.padTo(targetSize, 0.toByte).take(targetSize)
    
  "test_InstMem" should "pass" in {
    test(new RVCPU(paddedFile)) { dut =>

      println("Testing instruction memory")
      dut.clock.setTimeout(0)
      for (i <- 0 until 10) {
        
        print("Address: ")
        print(dut.io.PC.peek())
        print(" - Data: ")
        val binaryString = dut.io.instmem_out.peek().litValue.toString(2).reverse.padTo(32, '0').reverse
        println(s"Binary Instruction: $binaryString")
        dut.clock.step(1)
      }
    }
  }
}
