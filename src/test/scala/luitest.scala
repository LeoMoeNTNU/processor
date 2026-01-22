package processor

import chisel3._
import chisel3.util._

import org.scalatest.flatspec.AnyFlatSpec
import chiseltest._


class luitest extends AnyFlatSpec with ChiselScalatestTester {

  behavior of "lui.out"

   it should "check a0 and a7 after the whole thing has run " in {//tests\riscv-tests\bge.out


    test(new FP("tests/riscv-tests/lui.out",true)) { dut =>
        while(!dut.io.done.peekBoolean()){
            dut.clock.step()

            //Then I need to print the value. 
            //what is a0
            /*
            val full = dut.io.data.peek().litValue
                  val sliced = full & 0x7F   // mask lower 7 bits
                  println(s"from here we have ${sliced.toString(2)}")
            
            */
        }
        dut.clock.step()
        dut.clock.step()
        val a0=dut.io.regs.get(10).peek().litValue
        val a7= dut.io.regs.get(17).peek().litValue
        dut.io.regs.get(10).expect(0.U,"a0 should be zero at the end of the test!")
        dut.io.regs.get(17).expect(93.U,"a7 should be 93 at the end of the test!")
        

    }
  }
}