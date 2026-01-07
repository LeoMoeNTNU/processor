package processor 
import chisel3._
import chisel3.util._

class Decoder extends Module {
    val io = IO(new Bundle {
        val instruction = Input(UInt(32.W))
        val funct3 = Output(UInt(3.W))
        val funct7 = Output(UInt(7.W))
        val rs1 = Output(UInt(5.W))
        val rs2 = Output(UInt(5.W))
        val rd = Output(UInt(5.W))
        val imm = Output(UInt(32.W))
        val alu_op = Output(UInt(7.W))
        val reg_write = Output(Bool())
        val alu_src = Output(Bool())
    })

    val instr = io.instruction
    val opcode = Utils.opcode(instr)

    // 1. SET DEFAULTS FIRST
    // This provides a fallback if the switch cases aren't met
    io.alu_op := opcode        // Default to the actual opcode
    io.funct3 := Utils.funct3(instr)
    io.funct7 := Utils.funct7(instr)
    io.rs1 := Utils.rs1(instr)
    io.rs2 := Utils.rs2(instr)
    io.rd := Utils.rd(instr)
    io.reg_write := false.B
    io.alu_src := false.B

    // 2. IMMEDIATE GENERATION
    val imm = WireDefault(0.U(32.W)) // Uses WireDefault to avoid uninitialized errors
    switch(opcode) {
        is("b0010011".U) { imm := Utils.I_imm(instr) }
        is("b0000011".U) { imm := Utils.I_imm(instr) }
        is("b0100011".U) { imm := Utils.S_imm(instr) }
        is("b1100011".U) { imm := Utils.B_imm(instr) }
        is("b1101111".U) { imm := Utils.J_imm(instr) }
        is("b0110111".U) { imm := Utils.U_imm(instr) }
        is("b0010111".U) { imm := Utils.U_imm(instr) }
    }
    io.imm := imm

    // 3. CONTROL SIGNAL OVERRIDES
    switch(opcode) {
        is("b0110011".U) { // R-type
            io.reg_write := true.B
            io.alu_src := false.B
        }
        is("b0010011".U) { // I-type
            io.reg_write := true.B
            io.alu_src := true.B
        }
        is("b0000011".U) { // Load
            io.reg_write := true.B
            io.alu_src := true.B
            io.alu_op := 0.U   // Specific override if your ALU expects 0 for Loads
        }
        is("b0100011".U) { // Store
            io.alu_src := true.B
            io.alu_op := 0.U
        }
    }
}