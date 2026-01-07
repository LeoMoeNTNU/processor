package processor 
import chisel3._
import chisel3.util._

class Decoder extends Module {
    val io = IO(new Bundle {
        //Input
        val instruction = Input(UInt(32.W))
        //Outputs
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
    val funct3 = Utils.funct3(instr)
    val funct7 = Utils.funct7(instr)
    //RegisterNumbers
    io.rs1 := Utils.rs1(instr)
    io.rs2 := Utils.rs2(instr)
    io.rd := Utils.rd(instr)
    //ImmediateGen AND Default
    val imm = Wire(UInt(32.W))
    imm := 0.U
    //Switching
    switch(opcode) {
    is("b0110011".U) { imm := 0.U }
    is("b0010011".U) { imm := Utils.I_imm(instr) }
    is("b0000011".U) { imm := Utils.I_imm(instr) }
    is("b0100011".U) { imm := Utils.S_imm(instr) }
    is("b1100011".U) { imm := Utils.B_imm(instr) }
    is("b1101111".U) { imm := Utils.J_imm(instr) }
    is("b0110111".U) { imm := Utils.U_imm(instr) }
    is("b0010111".U) { imm := Utils.U_imm(instr) }
  }
  io.imm := imm
    // Control signals, defaults
    io.alu_op := 0.U
    io.reg_write := false.B
    io.mem_read := false.B
    io.mem_write := false.B
    io.alu_src := false.B
    
    //SWITCH OPCODE
    switch(opcode) {
        // R-type
        is("b0110011".U) {
            io.reg_write := true.B
            io.alu_src := false.B
            
            switch(funct3) {
                is(0.U) { io.alu_op := Mux(funct7(5), 1.U, 0.U) } // SUB OR ADD
                is(1.U) { io.alu_op := 2.U }  // SLL
                is(2.U) { io.alu_op := 3.U }  // SLT
                is(3.U) { io.alu_op := 4.U }  // SLTU
                is(4.U) { io.alu_op := 5.U }  // XOR
                is(5.U) { io.alu_op := Mux(funct7(5), 7.U, 6.U) }  // SRA OR SRL
                is(6.U) { io.alu_op := 8.U }  // OR
                is(7.U) { io.alu_op := 9.U }  // AND
            }
        }
        
        // I-type
        is("b0010011".U) {
            io.reg_write := true.B
            io.alu_src := true.B
            
            switch(funct3) {
                is(0.U) { io.alu_op := 0.U }  // ADDI
                is(1.U) { io.alu_op := 2.U }  // SLLI
                is(2.U) { io.alu_op := 3.U }  // SLTI
                is(3.U) { io.alu_op := 4.U }  // SLTIU
                is(4.U) { io.alu_op := 5.U }  // XORI
                is(5.U) { io.alu_op := Mux(funct7(5), 7.U, 6.U) }  // SRAI or SRLI
                is(6.U) { io.alu_op := 8.U }  // ORI
                is(7.U) { io.alu_op := 9.U }  // ANDI
            }
        }
        // Load
        is("b0000011".U) {
            io.reg_write := true.B
            io.alu_src := true.B
            io.mem_read := true.B
            io.alu_op := 0.U
        }
        // Store
        is("b0100011".U) {
            io.alu_src := true.B
            io.mem_write := true.B
            io.alu_op := 0.U
        }
