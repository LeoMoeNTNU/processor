package processor

import chisel3._
import chisel3.util._

import org.scalatest.flatspec.AnyFlatSpec
import chiseltest._


class FPTest extends AnyFlatSpec with ChiselScalatestTester {

  behavior of "DM"

  it should "write and load a word and get it correct - very basic" in {
    test(new FP("tests/ripes/add.out")) { dut =>

    }
  }
}