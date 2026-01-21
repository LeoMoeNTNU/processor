package processor
import chisel3._
import chisel3.util._

class barrier1 extends Module {

  val io = IO(new Bundle {

    // Inputs
    val useALU_In = Input(Bool())
    val ALU1_val_In = Input(UInt(32.W))
    val ALU1_from_In = Input(UInt(5.W))
    val ALU2_val_In = Input(UInt(32.W))
    val ALU2_from_In = Input(UInt(5.W))
    val ALU_op_In = Input(UInt(5.W))

    val writeReg_In = Input(Bool())
    val toReg_In = Input(UInt(5.W))
    val writeFrom_In = Input(Bool())

    val useMemory_In = Input(Bool())
    val DM_val_In = Input(UInt(32.W))
    val DM_val_from_In = Input(UInt(5.W))
    val DM_address_In = Input(UInt(11.W))
    val DM_address_from_In = Input(UInt(5.W))
    val DM_imm_In = Input(UInt(32.W))
    val DM_operation_In = Input(UInt(3.W))

    val newPC_In = Input(Bool())
    val newPC_already_decided_In = Input(Bool())
    val PC_1_In = Input(UInt(32.W))
    val PC_1_from_In = Input(UInt(5.W))
    val PC_2_In = Input(UInt(32.W))

    // Outputs
    val useALU_Out = Output(Bool())
    val ALU1_val_Out = Output(UInt(32.W))
    val ALU1_from_Out = Output(UInt(5.W))
    val ALU2_val_Out = Output(UInt(32.W))
    val ALU2_from_Out = Output(UInt(5.W))
    val ALU_op_Out = Output(UInt(5.W))

    val writeReg_Out = Output(Bool())
    val toReg_Out = Output(UInt(5.W))
    val writeFrom_Out = Output(Bool())

    val useMemory_Out = Output(Bool())
    val DM_val_Out = Output(UInt(32.W))
    val DM_val_from_Out = Output(UInt(5.W))
    val DM_address_Out = Output(UInt(11.W))
    val DM_address_from_Out = Output(UInt(5.W))
    val DM_imm_Out = Output(UInt(32.W))
    val DM_operation_Out = Output(UInt(3.W))

    val newPC_Out = Output(Bool())
    val newPC_already_decided_Out = Output(Bool())
    val PC_1_Out = Output(UInt(32.W))
    val PC_1_from_Out = Output(UInt(5.W))
    val PC_2_Out = Output(UInt(32.W))
  })

  // Registers
  val useALU_Reg = RegNext(io.useALU_In)
  val ALU1_val_Reg = RegNext(io.ALU1_val_In)
  val ALU1_from_Reg = RegNext(io.ALU1_from_In)
  val ALU2_val_Reg = RegNext(io.ALU2_val_In)
  val ALU2_from_Reg = RegNext(io.ALU2_from_In)
  val ALU_op_Reg = RegNext(io.ALU_op_In)

  val writeReg_Reg = RegNext(io.writeReg_In)
  val toReg_Reg = RegNext(io.toReg_In)
  val writeFrom_Reg = RegNext(io.writeFrom_In)

  val useMemory_Reg = RegNext(io.useMemory_In)
  val DM_val_Reg = RegNext(io.DM_val_In)
  val DM_val_from_Reg = RegNext(io.DM_val_from_In)
  val DM_address_Reg = RegNext(io.DM_address_In)
  val DM_address_from_Reg = RegNext(io.DM_address_from_In)
  val DM_imm_Reg = RegNext(io.DM_imm_In)
  val DM_operation_Reg = RegNext(io.DM_operation_In)

  val newPC_Reg = RegNext(io.newPC_In)
  val newPC_already_decided_Reg = RegNext(io.newPC_already_decided_In)
  val PC_1_Reg = RegNext(io.PC_1_In)
  val PC_1_from_Reg = RegNext(io.PC_1_from_In)
  val PC_2_Reg = RegNext(io.PC_2_In)

  // Connect outputs
  io.useALU_Out := useALU_Reg
  io.ALU1_val_Out := ALU1_val_Reg
  io.ALU1_from_Out := ALU1_from_Reg
  io.ALU2_val_Out := ALU2_val_Reg
  io.ALU2_from_Out := ALU2_from_Reg
  io.ALU_op_Out := ALU_op_Reg

  io.writeReg_Out := writeReg_Reg
  io.toReg_Out := toReg_Reg
  io.writeFrom_Out := writeFrom_Reg

  io.useMemory_Out := useMemory_Reg
  io.DM_val_Out := DM_val_Reg
  io.DM_val_from_Out := DM_val_from_Reg
  io.DM_address_Out := DM_address_Reg
  io.DM_address_from_Out := DM_address_from_Reg
  io.DM_imm_Out := DM_imm_Reg
  io.DM_operation_Out := DM_operation_Reg

  io.newPC_Out := newPC_Reg
  io.newPC_already_decided_Out := newPC_already_decided_Reg
  io.PC_1_Out := PC_1_Reg
  io.PC_1_from_Out := PC_1_from_Reg
  io.PC_2_Out := PC_2_Reg
}