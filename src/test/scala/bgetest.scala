package processor

import chisel3._
import chisel3.util._

import org.scalatest.flatspec.AnyFlatSpec
import chiseltest._


class bgetest extends AnyFlatSpec with ChiselScalatestTester {

  behavior of "bge.out"


   it should "verify that the jumps are reasonable and not overly big I may have to jump back " in {//tests\riscv-tests\bge.out
    test(new FP("tests/riscv-tests/bge.out",true)) { dut =>
        for(i<-0 to 50){
            dut.clock.step()

        }

    }
  }
}