package processor
import chisel3._
import chisel3.util._
object Utils {
  // Field extraction
  def opcode(x: UInt): UInt = x(6,0)
  def rd(x: UInt): UInt = x(11,7)
  def rs1(x: UInt): UInt = x(19,15)
  def rs2(x: UInt): UInt = x(24,20)
  def funct3(x: UInt): UInt = x(14,12)
  def funct7(x: UInt): UInt = x(31,25)
  
  // 32-bit sign-extended immediates, U_imm = <<12
  def I_imm(x: UInt): UInt = Cat(Fill(20, x(31)), x(31,20))//I probably want to take away the Fill()
  def S_imm(x: UInt): UInt = Cat(Fill(20, x(31)), x(31,25), x(11,7))//I probably want to take away the Fill()
  def B_imm(x: UInt): UInt = Cat(0.U(21.W),x(31), x(7), x(30,25), x(11,9))//21 bits of zero and 11 bits of meaning. 
  //I have modified B_imm to take 1 fewer bits so that the number becomes correct. 
  def U_imm(x: UInt): UInt = Cat(x(31,24), 0.S(12.W))
  def J_imm(x: UInt): UInt = Cat(0.U(11.W), x(31), x(19,12), x(20), x(30,21), 0.U(1.W))
}

