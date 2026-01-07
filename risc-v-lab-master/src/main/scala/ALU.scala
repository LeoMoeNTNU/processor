package processor
import chisel3._
import chisel3.util._

class ALU extends Module {  
  val io = IO(new Bundle {
    //inputs
    val alu_funct7 = Input(UInt(7.W))
    val alu_funct3 = Input(UInt(3.W))
    val alu_imm = Input(SInt(32.W))
    val alu_pcin = Input(UInt(32.W))
    val alu_opcode = Input(UInt(7.W))
    val rd = Input(UInt(5.W))


    val alu_rs1 = Input(SInt(32.W)) // Operand 1
    val alu_rs2 = Input(SInt(32.W)) // Operand 2

    val alu_pcout = Output(SInt(32.W)) // PC out
    val alu_out = Output(SInt(32.W)) // ALU output
  })

  // Linking registers
  val alu_opcode = RegInit(0.U(7.W))
  alu_opcode := io.alu_opcode
  val alu_funct3 = RegInit(0.U(3.W))
  alu_funct3 := io.alu_funct3
  val alu_funct7 = RegInit(0.U(7.W))
  alu_funct7 := io.alu_funct7
  val alu_rs1 = RegInit(0.U(32.W))
  alu_rs1 := io.alu_rs1
  val alu_rs2 = RegInit(0.U(32.W))
  alu_rs2 := io.alu_rs2


  // Switch to execute correct instruction
  switch(alu_opcode) {
    is(0x33.U) { // R  types
      switch(alu_funct3) { //
        is(0.U) {
          switch(alu_funct7) {
            is(0x0.U) {
              io.alu_out := alu_rs1.asSInt + alu_rs2.asSInt
            }
          }
        }
      }
    }
  }
}

