package processor
import chisel3._
import chisel3.stage.ChiselStage

object GenerateVerilog extends App {
  (new ChiselStage).emitVerilog(new FP("tests/ripes/add.out"))
}
