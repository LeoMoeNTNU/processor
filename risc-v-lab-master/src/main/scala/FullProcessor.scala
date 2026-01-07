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
    //val PC = Output(UInt(10.W))
    //val instmem_out = Output(UInt(32.W))
  })

  val pc = RegInit(0.U(10.W))
  //pc := Mux(Branch, alu.io.pcoutpc + 4.U
  pc := pc + 4.U

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
 
  val rd_reg = RegInit(0.U(5.W))
  rd_reg := decoder.io.rd
  
  val write_enable_reg = RegInit(0.U(1.W))
  write_enable_reg := decoder.io.reg_write
  
  
  //Second stage
  val RF = Module(new RegisterFile())
  RF.io.rs1 := decoder.io.rs1
  RF.io.rs2 := decoder.io.rs2
  RF.io.write_dest := rd_reg
  RF.io.write_enable := write_enable_reg


  val m = Wire(UInt(32.W))
  m := Mux(decoder.io.alu_src, decoder.io.imm, RF.io.rs2_val)
  // Third stage - ALU and data memory
  val alu = Module(new ALU)
  alu.io.alu_rs1 := RF.io.rs1_val
  alu.io.alu_rs2 := m
  alu.io.alu_opcode := decoder.io.alu_op
  alu.io.alu_funct7 := decoder.io.funct7 
  alu.io.alu_funct3 := decoder.io.funct3
  RF.io.write_data := alu.io.alu_out

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

