package processor

import chisel3._
import chisel3.util._

class ALU extends Module {  
  val io = IO(new Bundle {
    //inputs
    val alu_instruction = Input(UInt(32.W))
    val alu_funct7 = Input(UInt(7.W))
    val alu_funct3 = Input(UInt(3.W))
    val alu_imm = Input(SInt(32.W))
    val alu_pc = Input(UInt(32.W))
    val alu_opcode = Input(UInt(7.W))

    val alu_op1 = Input(SInt(32.W)) // Operand 1
    val alu_op2 = Input(SInt(32.W)) //Operand 2

    val alu_out = Output(SInt(32.W)) // ALU output
  })

  val alu_opcode = Utils.opcode(io.alu_instruction)
  val alu_funct3 = Utils.funct3(io.alu_instruction)
  val alu_funct7 = Utils.funct7(io.alu_instruction)
  val alu_op1 = io.alu_op1
  val alu_op2 = io.alu_op2

  val result = Wire(SInt(32.W))

  // Switch to execute correct instruction
  switch(alu_opcode) {
    is(0x33.U) { // R  types
      switch(alu_funct3) { //
        is(0.U) {
          switch(alu_funct7) {
            is(0x0.U) {
              io.alu_out := alu_op1.asSInt + alu_op2.asSInt
            }
          }
        }
      }
    }
  }
}

