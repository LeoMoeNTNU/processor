import chisel3._
import chisel3.util._


class ALU extends Module {  

// LINES
  val io = IO(new Bundle {
    val instruction = Input(UInt(32.W))

    val funct3 = Input(UInt(3.W))
    val funct7 = Input(UInt(7.W))
    val imm = Input(SInt(32.W))
    val pc = Input(SInt(32.W))
    val opcode = Input(UInt(4.W))

    val operand2 = Input(SInt(32.W))
    val operand1 = Input(SInt(32.W))

    val ALU_out = Input(SInt(32.W))
  })


  val opcode = io.opcode
  val funct3 = io.funct3
  val funct7 = io.funct7
  val operand1 = io.operand1
  val operand2 = io.operand2

  // Switch to execute correct instruction
  switch(opcode) {
    is(0x33.U) { // R  types
      switch(funct3) { //
        is(0.U) {
          switch(funct7) {
            is(0x0.U) {
              io.ALU_out := operand1.asSInt + operand2.asSInt
            }
          }
        }
      }
    }
  }
}

