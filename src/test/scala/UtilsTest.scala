package processor

import chisel3._
import org.scalatest.flatspec.AnyFlatSpec
import chiseltest._


class UtilsWrapper extends Module {
  val io = IO(new Bundle {
    val inst   = Input(UInt(32.W))
    val opcode = Output(UInt(7.W))
    val rd     = Output(UInt(5.W))
    val rs1    = Output(UInt(5.W))
    val rs2    = Output(UInt(5.W))
    val funct3 = Output(UInt(3.W))
  })

  io.opcode := Utils.opcode(io.inst)
  io.rd     := Utils.rd(io.inst)
  io.rs1    := Utils.rs1(io.inst)
  io.rs2    := Utils.rs2(io.inst)
  io.funct3 := Utils.funct3(io.inst)
}


class UtilsTest extends AnyFlatSpec with ChiselScalatestTester {

  behavior of "Utils"

  it should "extract fields correctly" in {
    test(new UtilsWrapper) { dut =>
      val inst = "b0110_0110_1100_1111_1010_0001_0101_1011".U

      dut.io.inst.poke(inst)

      dut.io.opcode.expect("b101_1011".U)
      dut.io.rd.expect("b00010".U)
      dut.io.rs1.expect("b11111".U)
      dut.io.rs2.expect("b01100".U)
      dut.io.funct3.expect("b010".U)
    }
  }
}
