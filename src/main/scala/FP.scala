package processor
import chisel3._
import chisel3.util._

/*
This one maintains PC. 
It also checks if the instruction is a branch specifically to pause on that instance. 
Anything that writes to PC is a branch and needs to be paused right now. 


*/

class FP(path:String, debug:Boolean) extends Module {

  val io = IO(new Bundle {
    //This will only have debug signals.
    val regs= if(debug)
    Some(Output(Vec(32,UInt(32.W)))) else None


  })
    //stages:
    val FS=Module(new FirstStage)
    val SS=Module(new SecondStage(path))
    val TS=Module(new ThirdStage(debug))

    //barriers:
    val FB=Module(new barrier1)
    val SB=Module(new barrier2)
    var TB=Module(new barrier3)

    if(debug){
      io.regs.get:=TS.io.regs.get

    }

    //stage1 to barrier 2:
    SB.io.newPC_In:=FS.io.newPC_out
    SB.io.PCIn_In:=FS.io.PC_val_out

    //barrier 2 to stage 2:
    SS.io.newPC:=SB.io.newPC_Out
    SS.io.PCIn:=SB.io.PCIn_Out

    //stage2 to barrier 3:
    TB.io.instruction_In:=SS.io.instruction
    TB.io.PC_In:=SS.io.PC_out

    //stage 1 to barrier 3: 
    TB.io.regWrite_In:=FS.io.regWrite
    TB.io.regToWrite_In:=FS.io.regToWrite
    TB.io.regWriteVal_In:=FS.io.regWriteVal

    //barrier 3 to stage 3:
    TS.io.instruction:=TB.io.instruction_Out
    TS.io.PC:=TB.io.PC_Out
    TS.io.regWrite:=TB.io.regWrite_Out
    TS.io.regToWrite:=TB.io.regToWrite_Out
    TS.io.regWriteVal:=TB.io.regWriteVal_Out

    //stage 3 to barrier 1:
   FB.io.useALU_In              := TS.io.useALU
FB.io.ALU1_val_In            := TS.io.ALU1_val
FB.io.ALU1_from_In           := TS.io.ALU1_from
FB.io.ALU2_val_In            := TS.io.ALU2_val
FB.io.ALU2_from_In           := TS.io.ALU2_from
FB.io.ALU_op_In              := TS.io.ALU_op

FB.io.writeReg_In            := TS.io.writeReg
FB.io.toReg_In               := TS.io.toReg
FB.io.writeFrom_In           := TS.io.writeFrom

FB.io.useMemory_In           := TS.io.useMemory
FB.io.DM_val_In              := TS.io.DM_val
FB.io.DM_val_from_In         := TS.io.DM_val_from
FB.io.DM_address_In          := TS.io.DM_address
FB.io.DM_address_from_In     := TS.io.DM_address_from
FB.io.DM_imm_In              := TS.io.DM_imm
FB.io.DM_operation_In        := TS.io.DM_operation

FB.io.newPC_In               := TS.io.newPC
FB.io.newPC_already_decided_In := TS.io.newPC_already_decided
FB.io.PC_1_In                := TS.io.PC_1
FB.io.PC_1_from_In           := TS.io.PC_1_from
FB.io.PC_2_In                := TS.io.PC_2

    //barrier 1 to stage 1:
FS.io.useALU                 := FB.io.useALU_Out
FS.io.ALU1_val               := FB.io.ALU1_val_Out
FS.io.ALU1_from              := FB.io.ALU1_from_Out
FS.io.ALU2_val               := FB.io.ALU2_val_Out
FS.io.ALU2_from              := FB.io.ALU2_from_Out
FS.io.ALU_op                 := FB.io.ALU_op_Out

FS.io.writeReg               := FB.io.writeReg_Out
FS.io.toReg                  := FB.io.toReg_Out
FS.io.writeFrom              := FB.io.writeFrom_Out

FS.io.useMemory              := FB.io.useMemory_Out
FS.io.DM_val                 := FB.io.DM_val_Out
FS.io.DM_val_from            := FB.io.DM_val_from_Out
FS.io.DM_address             := FB.io.DM_address_Out
FS.io.DM_address_from        := FB.io.DM_address_from_Out
FS.io.DM_imm                 := FB.io.DM_imm_Out
FS.io.DM_operation           := FB.io.DM_operation_Out

FS.io.newPC                  := FB.io.newPC_Out
FS.io.newPC_already_decided  := FB.io.newPC_already_decided_Out
FS.io.PC_1                   := FB.io.PC_1_Out
FS.io.PC_1_from              := FB.io.PC_1_from_Out
FS.io.PC_2                   := FB.io.PC_2_Out
    



}