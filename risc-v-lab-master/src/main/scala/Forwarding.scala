package processor
import chisel3._
import chisel3.util._

class Forwarding extends Module {
  val io = IO(new Bundle {
    //Current instruction in ID
    val id_instruction = Input(UInt(32.W))
    //EX Currently
    val ex_rd = Input(UInt(5.W))
    val ex_result = Input(UInt(32.W))
    val ex_reg_write = Input(Bool())
    //to forward or not to forward?
    val forward = Output(Bool())
  })
  //get rs1 OR rs2
  val rs1 = io.id_instruction(19, 15)
  val rs2 = io.id_instruction(24, 20)
  //check if EX is writing to rs1 OR rs2
  val forward_rs1 = io.ex_reg_write && (io.ex_rd === rs1) && (rs1 =/= 0.U)
  val forward_rs2 = io.ex_reg_write && (io.ex_rd === rs2) && (rs2 =/= 0.U)
  //forwarding...
   io.forward := forward_rs1 || forward_rs2
}
    
