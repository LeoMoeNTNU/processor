package processor

import chisel3._
import chisel3.util._

import org.scalatest.flatspec.AnyFlatSpec
import chiseltest._


class DMTest extends AnyFlatSpec with ChiselScalatestTester {

  behavior of "DM"

  it should "write and load a word and get it correct - very basic" in {
    test(new DM) { dut =>

        /* 
         val address=Input(UInt(11.W))
    val imm_bits=Input(UInt(12.W))
    val value=Input(UInt(32.W))
    val active=Input(Bool())

    val operation= Input(UInt(3.W))//first 5 operations are loads, and the last 3 are writes to memory. 

    
    val output=Output(UInt(32.W))
        
         */

	dut.io.address.poke(300.U)
    dut.io.imm_bits.poke(0.U)
    dut.io.value.poke(326.U)
    dut.io.active.poke(true.B)
    dut.io.operation.poke(7.U)

    dut.clock.step()
    //the next lines are strictly unnecessary
    dut.io.address.poke(300.U)
    dut.io.imm_bits.poke(0.U)
    dut.io.active.poke(true.B)
    
    //shouldn't use the input on this cycle. 
    dut.io.value.poke(0.U)
    dut.io.operation.poke(2.U)
    dut.io.output.expect(326.U, "this is the value we should receive!")
			

    }
  }

  it should "write and load a halfword and get it correct" in {
    test(new DM) { dut =>

        /* 
         val address=Input(UInt(11.W))
    val imm_bits=Input(UInt(12.W))
    val value=Input(UInt(32.W))
    val active=Input(Bool())

    val operation= Input(UInt(3.W))//first 5 operations are loads, and the last 3 are writes to memory. 

    
    val output=Output(UInt(32.W))
        
         */

	dut.io.address.poke(1023.U)
    dut.io.imm_bits.poke(0.U)
    dut.io.value.poke(121.U)
    dut.io.active.poke(true.B)
    dut.io.operation.poke(6.U)

    dut.clock.step()
    //the next lines are strictly unnecessary
    dut.io.address.poke(1023.U)
    dut.io.imm_bits.poke(0.U)
    dut.io.active.poke(true.B)
    
    //shouldn't use the input on this cycle. 
    dut.io.value.poke(0.U)
    dut.io.operation.poke(1.U)
    dut.io.output.expect(121.U, "this is the value we should receive!")
			

    }
  }


  it should "write a halfword and get it back with half of an input as well" in {
    test(new DM) { dut =>

        /* 
         val address=Input(UInt(11.W))
    val imm_bits=Input(UInt(12.W))
    val value=Input(UInt(32.W))
    val active=Input(Bool())

    val operation= Input(UInt(3.W))//first 5 operations are loads, and the last 3 are writes to memory. 

    
    val output=Output(UInt(32.W))
        
         */

	dut.io.address.poke(21.U)
    dut.io.imm_bits.poke(0.U)
    dut.io.value.poke(121.U)
    dut.io.active.poke(true.B)
    dut.io.operation.poke(6.U)

    dut.clock.step()
    //the next lines are strictly unnecessary
    dut.io.address.poke(21.U)
    dut.io.imm_bits.poke(0.U)
    dut.io.active.poke(true.B)
    
    //shouldn't use the input on this cycle. 
    dut.io.value.poke((12<<16).U)
    dut.io.operation.poke(1.U)
    val expected =  ((12 << 16) | 121) 
    dut.io.output.expect(expected.U, "this is the value we should receive!")
    //This will probably fail because I've done things wrongly. 
			

    }
  }

  it should "write a word with increment forward and read it correctly NOT DONE" in {
    test(new DM) { dut =>

        /* 
         val address=Input(UInt(11.W))
    val imm_bits=Input(UInt(12.W))
    val value=Input(UInt(32.W))
    val active=Input(Bool())

    val operation= Input(UInt(3.W))//first 5 operations are loads, and the last 3 are writes to memory. 

    
    val output=Output(UInt(32.W))
        
         */

	dut.io.address.poke(200.U)
    dut.io.imm_bits.poke(5.U)
    dut.io.value.poke(567.U)
    dut.io.active.poke(true.B)
    dut.io.operation.poke(7.U)

    dut.clock.step()
    //the next lines are strictly unnecessary
    dut.io.address.poke(205.U)
    dut.io.imm_bits.poke(0.U)
    dut.io.active.poke(true.B)
    
    //shouldn't use the input on this cycle. 
    dut.io.operation.poke(2.U)
     
    dut.io.output.expect(567.U, "this is the value we should receive!")
    //This will probably fail because I've done things wrongly. 
			

    }
  }

  it should "write a word with imm backwards it back correctly NOT DONE" in {
    test(new DM) { dut =>

        /* 
         val address=Input(UInt(11.W))
    val imm_bits=Input(UInt(12.W))
    val value=Input(UInt(32.W))
    val active=Input(Bool())

    val operation= Input(UInt(3.W))//first 5 operations are loads, and the last 3 are writes to memory. 

    
    val output=Output(UInt(32.W))
        
         */

	dut.io.address.poke(1900.U)
    dut.io.imm_bits.poke("b1111_1111_1011".U)
    dut.io.value.poke(16.U)
    dut.io.active.poke(true.B)
    dut.io.operation.poke(6.U)

    dut.clock.step()
    //the next lines are strictly unnecessary
    dut.io.address.poke(1895.U)
    dut.io.imm_bits.poke(0.U)
    dut.io.active.poke(true.B)
    
    //shouldn't use the input on this cycle. 
    dut.io.value.poke(0.U)
    dut.io.operation.poke(2.U)
     
    dut.io.output.expect(16.U, "this is the value we should receive!")
    //This will probably fail because I've done things wrongly. 
			

    }
  }

}