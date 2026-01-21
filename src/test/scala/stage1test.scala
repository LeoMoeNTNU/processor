package processor

import chisel3._
import org.scalatest.flatspec.AnyFlatSpec
import chiseltest._

//There are several things that I should figure out in this one!
//The first is whether or not it correctly does operations
//The second is whether or not it does memory correctly
//I am also curious about branches
//luipc would also be interesting. 


class stage1Test extends AnyFlatSpec with ChiselScalatestTester {

  behavior of "most important stage lol."
    /*INTERFACE:
        val useALU=Input(Bool())
    val ALU1_val=Input(UInt(32.W))
    val ALU1_from=Input(UInt(5.W))//if not from rs1, just say 0. 
    val ALU2_val=Input(UInt(32.W))
    val ALU2_from = Input(UInt(5.W))
    val ALU_op = Input(UInt(5.W))
    
    val writeReg=Input(Bool())
    val toReg=Input(UInt(5.W))
    val writeFrom=Input(Bool())//true = ALU, false = DM

    val useMemory=Input(Bool())
    val DM_val=Input(UInt(32.W))//This one only matters when storing, not when loading. 
    val DM_val_from=Input(UInt(5.W))//needed for forwarding. 
    val DM_address=Input(UInt(11.W))//Because I only use 11 in mine. 
    val DM_address_from= Input(UInt(5.W))//needed for forwarding. 
    val DM_imm=Input(UInt(32.W))//I havent actually checked the maximal amount of bits on this one. 
    val DM_operation=Input(UInt(3.W))//There are 8 possible operations.

    val newPC=Input(Bool())
    val newPC_already_decided= Input(Bool())//if false, we use alu for it and if not be just add the imms. 
    val PC_1=Input(UInt(32.W))
    val PC_1_from=Input(UInt(5.W))
    val PC_2=Input(UInt(32.W))

    //outputs for stage2barrier.
    val newPC_out=Output(Bool())
    val PC_val_out = Output(UInt(32.W))

    //outputs directly to stage 3:
    val regWrite=Output(Bool())
    val regToWrite=Output(UInt(5.W))
    val regWriteVal=Output(UInt(32.W))
    
    
    */
  it should "do an XOR" in {
    test(new FirstStage) { dut =>
        dut.io.useALU.poke(true.B)
        dut.io.ALU1_val.poke("b001101".U)
        dut.io.ALU1_from.poke(23.U)
        dut.io.ALU2_val.poke("b110101".U)
        dut.io.ALU2_from.poke(19.U)
        dut.io.ALU_op.poke(2.U)//2 is XOR
        dut.io.writeReg.poke(true.B)
        dut.io.toReg.poke(17.U)
        dut.io.writeFrom.poke(true.B)

        //below are meant to be irrelevant...
        dut.io.useMemory.poke(false.B)
        dut.io.DM_val.poke(false.B)
        dut.io.DM_val_from.poke(0.U)
        dut.io.DM_address.poke(0.U)
        dut.io.DM_address_from.poke(0.U)
        dut.io.DM_imm.poke(0.U)
        dut.io.DM_operation.poke(0.U)
        
        dut.io.newPC.poke(false.B)
        dut.io.newPC_already_decided.poke(false.B)
        dut.io.PC_1.poke(0.U)
        dut.io.PC_1_from.poke(0.U)
        dut.io.PC_2.poke(0.U)

        dut.io.regWrite.expect(true.B)
        dut.io.regToWrite.expect(17.U)
        dut.io.regWriteVal.expect("b111000".U,"this should be an XOR!")
    }
}


it should "do forwarding correctly" in {


    //x5 = x4(6) + x3(7)
    //x2= x4(6)+ x5(10)
    //it should replace x5(10) with 13 and output 19.
    test(new FirstStage) { dut =>
        dut.io.useALU.poke(true.B)
        dut.io.ALU1_val.poke(6.U)
        dut.io.ALU1_from.poke(4.U)
        dut.io.ALU2_val.poke(7.U)
        dut.io.ALU2_from.poke(3.U)
        dut.io.ALU_op.poke(0.U)
        dut.io.writeReg.poke(true.B)
        dut.io.toReg.poke(5.U)
        dut.io.writeFrom.poke(true.B)

        //below are meant to be irrelevant...
        dut.io.useMemory.poke(false.B)
        dut.io.DM_val.poke(false.B)
        dut.io.DM_val_from.poke(0.U)
        dut.io.DM_address.poke(0.U)
        dut.io.DM_address_from.poke(0.U)
        dut.io.DM_imm.poke(0.U)
        dut.io.DM_operation.poke(0.U)
        
        dut.io.newPC.poke(false.B)
        dut.io.newPC_already_decided.poke(false.B)
        dut.io.PC_1.poke(0.U)
        dut.io.PC_1_from.poke(0.U)
        dut.io.PC_2.poke(0.U)

        dut.io.regWrite.expect(true.B)
        dut.io.regToWrite.expect(5.U)
        dut.io.regWriteVal.expect(13.U,"this should be an XOR!")

        dut.clock.step()

        //x5 = x4(6) + x3(7)
    //x2= x4(6)+ x5(10)
    //it should replace x5(10) with 13 and output 19.

        dut.io.useALU.poke(true.B)
        dut.io.ALU1_val.poke(6.U)
        dut.io.ALU1_from.poke(4.U)
        dut.io.ALU2_val.poke(10.U)
        dut.io.ALU2_from.poke(5.U)
        dut.io.ALU_op.poke(0.U)
        dut.io.writeReg.poke(true.B)
        dut.io.toReg.poke(2.U)
        dut.io.writeFrom.poke(true.B)

        //below are meant to be irrelevant...
        dut.io.useMemory.poke(false.B)
        dut.io.DM_val.poke(false.B)
        dut.io.DM_val_from.poke(0.U)
        dut.io.DM_address.poke(0.U)
        dut.io.DM_address_from.poke(0.U)
        dut.io.DM_imm.poke(0.U)
        dut.io.DM_operation.poke(0.U)
        
        dut.io.newPC.poke(false.B)
        dut.io.newPC_already_decided.poke(false.B)
        dut.io.PC_1.poke(0.U)
        dut.io.PC_1_from.poke(0.U)
        dut.io.PC_2.poke(0.U)

        dut.io.regWrite.expect(true.B)
        dut.io.regToWrite.expect(2.U)
        dut.io.regWriteVal.expect(19.U,"It should be 19 instead of 16 because it has been forwarded!")
    }
}



}