package processor 
import chisel3._
import chisel3.util._

class Decoder extends Module {
    val io = IO(new Bundle {
        //Inputs
        val dec_instruction = Input(UInt(32.W))
        val dec_pc = Input(UInt(32.W))
        val dec_rs1_data = Input(SInt(32.W))
        val dec_rs2_data = Input(SInt(32.W))
        //Outputs
        val dec_rs1 = Output(UInt(5.W))
        val dec_rs2 = Output(UInt(5.W))
        val dec_rd = Output(UInt(5.W))
        val dec_imm = Output(SInt(32.W))
        val dec_alu_op = Output(UInt(4.W))
        val dec_pc_out = Output(UInt(32.W))
        val dec_rs1_data_out = Output(SInt(32.W))
        val dec_rs2_data_out = Output(SInt(32.W))
        val dec_instruction_out = Output(UInt(32.W))        
    })
    //Extraction
    val instruction = io.dec_instruction
    val opcode = Utils.opcode(instruction)
    val funct3 = Utils.funct3(instruction)
    val funct7 = Utils.funct7(instruction)
    //RegisterNumbers
    val dec_rs1 = Utils.rs1(instruction)
    val dec_rs2 = Utils.rs2(instruction)
    val dec_rd = Utils.rd(instruction)
    io.dec_rs1 := dec_rs1
    io.dec_rs2 := dec_rs2
    io.dec_rd := dec_rd
    //ImmediateGen AND Default
    val imm = Wire(SInt(32.W))
    imm := 0.S
    //Switching
    switch(opcode) {
    is("b0110011".U) { imm := 0.S }
    is("b0010011".U) { imm := Utils.I_imm(instruction).asSInt }
    is("b0000011".U) { imm := Utils.I_imm(instruction).asSInt }
    is("b0100011".U) { imm := Utils.S_imm(instruction).asSInt }
    is("b1100011".U) { imm := Utils.B_imm(instruction).asSInt }
    is("b1101111".U) { imm := Utils.J_imm(instruction).asSInt }
    is("b0110111".U) { imm := Utils.U_imm(instruction).asSInt }
    is("b0010111".U) { imm := Utils.U_imm(instruction).asSInt }
  }
  //ALU Operations
   io.dec_alu_op := 0.U
    
    switch(opcode) {
        is("b0110011".U) {//R-type
            switch(funct3) {
                is(0.U) {
                    switch(funct7) {
                        is(0x0.U) { io.dec_alu_op := 0.U }//ADD
                        is(0x20.U) { io.dec_alu_op := 1.U }//SUB
                    }
                }
                is(1.U) { io.dec_alu_op := 2.U }//SLL
                is(2.U) { io.dec_alu_op := 3.U }//SLT
                is(3.U) { io.dec_alu_op := 4.U }//SLTU
                is(4.U) { io.dec_alu_op := 5.U }//XOR
                is(5.U) {
                    switch(funct7) {
                        is(0x0.U) { io.dec_alu_op := 6.U }//SRL
                        is(0x20.U) { io.dec_alu_op := 7.U }//SRA
                    }
                }
                is(6.U) { io.dec_alu_op := 8.U }//OR
                is(7.U) { io.dec_alu_op := 9.U }//AND
            }
        }
        is("b0010011".U) {//I-type
            io.dec_alu_op := 0.U//ADDI
        }
        is("b0000011".U) {//Load
            io.dec_alu_op := 0.U//ADD, AddressCalc
        }
        is("b0100011".U) {//Store  
            io.dec_alu_op := 0.U//ADD, AddressCalc
        }
    }
  //Defaults
  io.dec_imm := imm
  io.dec_pc_out := io.dec_pc
  io.dec_rs1_data_out := io.dec_rs1_data
  io.dec_rs2_data_out := io.dec_rs2_data
  io.dec_instruction_out := instruction

}
