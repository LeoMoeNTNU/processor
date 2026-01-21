package processor

import chisel3._
import org.scalatest.flatspec.AnyFlatSpec
import chiseltest._


class stage3Test extends AnyFlatSpec with ChiselScalatestTester {

  behavior of "stage3"

  /*INTERFACE:
   val instruction=Input(UInt(32.W))

    val PC=Input(UInt(32.W))//We need PC because we are sometimes sending it through to the ALU.

    //signals for the register file. 
    val regWrite=Input(Bool())
    val regToWrite=Input(UInt(5.W))
    val regWriteVal=Input(UInt(32.W))


    //control signals (many)
    val useALU=Output(Bool())
    val ALU1_val=Output(UInt(32.W))
    val ALU1_from=Output(UInt(5.W))//if not from rs1, just say 0. 
    val ALU2_val=Output(UInt(32.W))
    val ALU2_from = Output(UInt(5.W))
    val ALU_op = Output(UInt(5.W))
    
    val writeReg=Output(Bool())
    val toReg=Output(Bool())
    val writeFrom=Output(Bool())//true = ALU, false = DM

    val useMemory=Output(Bool())
    val DM_val=Output(UInt(32.W))//This one only matters when storing, not when loading. 
    val DM_val_from=Output(UInt(5.W))//needed for forwarding. 
    val DM_address=Output(UInt(11.W))//Because I only use 11 in mine. 
    val DM_address_from= Output(UInt(5.W))//needed for forwarding. 
    val DM_imm=Output(UInt(32.W))//I havent actually checked the maximal amount of bits on this one. 
    val DM_operation=Output(UInt(3.W))//There are 8 possible operations.

    val newPC=Output(Bool())
    val newPC_already_decided= Output(Bool())//if false, we use alu for it and if not be just add the imms. 
    val PC_1=Output(UInt(32.W))
    val PC_1_from=Output(UInt(5.W))
    val PC_2=Output(UInt(32.W))
  
  
  */

  it should "be able to write to a register" in {
    test(new ThirdStage()) { dut =>
      /*
      val regWrite=Input(Bool())
    val regToWrite=Input(UInt(5.W))
    val regWriteVal=Input(UInt(32.W))
      */
      dut.io.instruction.poke(0.U)
      dut.io.PC.poke(0.U)
      dut.io.regWrite.poke(true.B)
      dut.io.regToWrite.poke(5.U)
      dut.io.regWriteVal.poke(712.U)
      dut.clock.step()
      //im poking with add x10<-x5,x5 
      dut.io.instruction.poke("b0000_0000_0101_0010_1000_0101_0011_0011".U)

      dut.io.useALU.expect(true.B,"we should use the ALU")
      dut.io.ALU1_val.expect(712.U,"this is the first value we are using!")
      dut.io.ALU2_from.expect(5.U)
      dut.io.ALU2_val.expect(712.U,"second value we are using is also 712.U")
      dut.io.ALU2_from.expect(5.U)
      dut.io.ALU_op.expect(0.U)
      dut.io.writeReg.expect(true.B)
      dut.io.toReg.expect(10.U)
      dut.io.writeFrom.expect(true.B,"true signifies that we use ALU!")
      dut.io.useMemory.expect(false.B)
      dut.io.newPC.expect(false.B)
    }
}

it should "throw out correct signals for a branch" in {
    test(new ThirdStage()) { dut =>
      /*
      val regWrite=Input(Bool())
    val regToWrite=Input(UInt(5.W))
    val regWriteVal=Input(UInt(32.W))
      */
      //branch, funct3=0x4
      dut.io.instruction.poke("b0000000_10101_00101_100_01010_1100011".U)

      dut.io.useALU.expect(true.B,"we should use the ALU")
      dut.io.ALU1_from.expect(5.U)
      dut.io.ALU2_from.expect(21.U)
      dut.io.ALU_op.expect(12.U)
      dut.io.writeReg.expect(false.B)
      dut.io.useMemory.expect(false.B)
      dut.io.newPC.expect(true.B)
      dut.io.newPC_already_decided.expect(false.B)
    }
}

}