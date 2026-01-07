package processor 
import chisel3._
import chisel3.util._

class Decoder extends Module {
    val io = IO(new Bundle {
        //Input
        val instruction = Input(UInt(32.W))
        //Outputs
        val funct3 = Output(UInt(3.W))
        val funct7 = Output(UInt(7.W))
        val rs1 = Output(UInt(5.W))
        val rs2 = Output(UInt(5.W))
        val rd = Output(UInt(5.W))
        val imm = Output(UInt(32.W))
        val alu_op = Output(UInt(4.W))
        val reg_write = Output(Bool())
        //val mem_read = Output(Bool())
        //val mem_write = Output(Bool())
        val alu_src = Output(Bool())
    })
    //Extraction
    val instr = io.instruction
    val opcode = Utils.opcode(instr)
    io.alu_op := opcode
    io.funct3 := Utils.funct3(instr)
    io.funct7 := Utils.funct7(instr)
    //RegisterNumbers
    io.rs1 := Utils.rs1(instr)
    io.rs2 := Utils.rs2(instr)
    io.rd := Utils.rd(instr)
    //ImmediateGen AND Default
    val imm = Wire(UInt(32.W))
    imm := 0.U
    //Switching
    switch(opcode) {
        is("b0110011".U) {
            imm := 0.U
        }
        is("b0010011".U) {
            imm := Utils.I_imm(instr)
        }
        is("b0000011".U) {
            imm := Utils.I_imm(instr)
        }
        is("b0100011".U) {
            imm := Utils.S_imm(instr)
        }
        is("b1100011".U) {
            imm := Utils.B_imm(instr)
        }
        is("b1101111".U) {
            imm := Utils.J_imm(instr)
        }
        is("b0110111".U) {
            imm := Utils.U_imm(instr)
        }
        is("b0010111".U) {
            imm := Utils.U_imm(instr)
        }
    }
    io.imm := imm
    // Control signals, defaults
    io.alu_op := 0.U
    io.reg_write := false.B
    //io.mem_read := false.B
    //io.mem_write := false.B
    //io.alu_src := false.B

    //SWITCH OPCODE
    switch(opcode) {
        // R-type
        is("b0110011".U) {
            io.reg_write := true.B
            io.alu_src := false.B
        }
        // I-type
        is("b0010011".U) {
            io.reg_write := true.B
            io.alu_src := true.B
        }
        // Load
        is("b0000011".U) {
            io.reg_write := true.B
            io.alu_src := true.B
            //io.mem_read := true.B
            io.alu_op := 0.U
        }
        // Store
        is("b0100011".U) {
            io.alu_src := true.B
            //io.mem_write := true.B
            io.alu_op := 0.U
        }
    }
}
