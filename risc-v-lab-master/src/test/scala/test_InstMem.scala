import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import java.io.PrintWriter



class test_InstMem extends AnyFlatSpec with ChiselScalatestTester {
    val fileBytes = java.nio.file.Files.readAllBytes(java.nio.file.Paths.get("tests\\simple\\addlarge.bin"))
    val writer = new PrintWriter("tests\\simple\\clean.hex")
    fileBytes.grouped(4).foreach { chunk =>
  // reverse the chunk for Little-Endian: 
  // [byte0, byte1, byte2, byte3] becomes byte3byte2byte1byte0
  val word = chunk.zipWithIndex.map { case (b, i) => 
    (b & 0xFF) << (i * 8) 
  }.sum
  
  writer.println(f"$word%08x")
}

writer.close()

    "test_InstMem" should "pass" in {
    
    test(new InstructionROM("tests\\simple\\clean.hex")) { dut =>

      println("Testing instruction memory")
      dut.clock.setTimeout(0)
      for (i <- 0 until 30) {
        dut.io.address.poke((i).U)
        dut.clock.step(1)
        print("Address: ")
        print(i)
        print(" - Data: ")
        //println(dut.io.data.peek())
        val binaryString = dut.io.data.peek().litValue.toString(2).reverse.padTo(32, '0').reverse
        println(s"Binary Instruction: $binaryString")
      }
    }
  }
}
