package processor

import chisel3._
import chisel3.util._

import org.scalatest.flatspec.AnyFlatSpec
import chiseltest._


class FPTest extends AnyFlatSpec with ChiselScalatestTester {

  behavior of "DM"

  it should "this one doesnt test anything yet, sadly :(" in {
    test(new FP("tests/ripes/add.out",true)) { dut =>

      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
    }
  }

}