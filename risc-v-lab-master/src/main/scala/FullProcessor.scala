package processor
/*
 * Blinking LED: the hardware version of Hello World
 *
 * Copyright: 2013, Technical University of Denmark, DTU Compute
 * Author: Martin Schoeberl (martin@jopdesign.com)
 * 
 */

import chisel3._
import chisel3.util._
import java.nio.file._

class RVCPU(instructions: Array[Byte]) extends Module {
  val io = IO(new Bundle {
    val PC = Output(UInt(10.W))
    val instmem_out = Output(UInt(32.W))
  })

  //instantiate modules for first stage.
  // Instantiate Instruction memory.
  val instMem = Module(new InstructionROM(instructions))
  instMem.io.address := pc

  /* // For testing
  io.PC := pc
  io.instmem_out := instMem.io.data
  */

  // Instantiate decoder.
  val decoder = Module(new Decoder())
  decoder.io.instruction := instMem.io.data
  
  val pc = RegInit(0.U(10.W))
  pc := pc + 4.U
  
  //Second stage
  val RF = Module(new RegisterFile())
  RF.io.rs1 := decoder.io.dec_rs1
  RF.io.rs2 := decoder.io.dec_rs2
  val write_dest = Input(UInt(5.W))
  val write_enable = Input(Bool())
  val write_data = Input(UInt(32.W))
  val rs1_val = Output(UInt(32.W))
  val rs2_val = Output(UInt(32.W))
  rs1 = Wire(UInt(32.W))
  rs2 = Wire(UInt(32.W))

  // Third stage - ALU and data memory
  val alu = Module(new ALU)
  alu.io.alu_op1 := RF.io.rs1_val
  alu.io.alu_op2 := RF.io.rs2_val
  alu.io.alu_instruction := decoder.io.dec_instruction_out
  alu.io.alu_funct7 := decoder.io.dec_
  alu.io.alu_funct3 :=
  alu.io.alu_imm :=
  alu.io.alu_pc :=
  alu.io.alu_opcode := 

}

/**
 * An object extending App to generate the Verilog code.
 */
object FullProcessor extends App {
  val fileBytes = Files.readAllBytes(Paths.get("tests\\simple\\addlarge.bin"))
  val targetSize = 1024
  val paddedFile = fileBytes.padTo(targetSize, 0.toByte).take(targetSize)
  println("Hello World, I will now generate the Verilog file!")
  emitVerilog(new RVCPU(paddedFile))
}

