package processor

import chisel3._
import org.scalatest.flatspec.AnyFlatSpec
import chiseltest._


class stage2Test extends AnyFlatSpec with ChiselScalatestTester {

  behavior of "stage2"

  /*INTERFACE:
  val newPC=Input(Bool())
    val PCIn = Input(UInt(32.W))
      
    val instruction=Output(UInt(32.W))

    val debug_waiting=Output(Bool())
  
  
  */

  it should "wait after finding a branch simply" in {
    test(new SecondStage("tests/ripes/add.out")) { dut =>

        dut.io.newPC.poke(false.B)
        dut.io.PCIn.poke(false.B)


			for(i<-0 to 8){
                println(i)
                val full = dut.io.instruction.peek().litValue
                val sliced = full & 0x7F   // mask lower 7 bits
                println(s"from here we have ${sliced.toString(2)}")
               // val full = dut.io.data.peek().litValue
                if(i<6){
                    dut.io.debug_waiting.expect(false.B)
                }
                if(i==5){
                    //This was the right way of doing this! 
                    val inst = dut.io.instruction.peek().litValue
                    val opcode = inst & 0x7F   // lowest 7 bits
                    assert(opcode == BigInt("1100011", 2), "this should be a branch")



                    val raw = dut.io.debug_b_imm.peek().litValue
                    val signed = raw.toInt  // BigInt → Int with sign interpretation
                    println(s"jump length = $signed")

                    val rs1 = dut.io.debug_rs1.peek().litValue
                    println(s"rs1  = $rs1")
                    assert(rs1==30)

                    val rs2 = dut.io.debug_rs2.peek().litValue
                    println(s"rs2 = $rs2")
                    assert(rs2==29)


                }
                if(i==6){
                    dut.io.debug_waiting.expect(true.B)
                }
                dut.clock.step()



               // val branchValue=Utils.B_imm(dut.io.data)
              //  val b_val=branchValue.peek().litValue
                // println(s"from the above instruction we have the B_imm $branchValue")


                //println(s"from here we have ${dut.io.data(6,0).peek().litValue}")

            }
			

    }
  }
}