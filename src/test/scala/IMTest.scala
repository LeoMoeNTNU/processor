  package processor

  import chisel3._
  import org.scalatest.flatspec.AnyFlatSpec
  import chiseltest._


  class IMTest extends AnyFlatSpec with ChiselScalatestTester {

    behavior of "ALU"

    it should "do simple add" in {
      test(new IM("tests/ripes/add.out")) { dut =>

        for(i<-0 to 50){
                  println(i)
                  dut.io.address.poke(i.U)
                  val full = dut.io.data.peek().litValue
                  val sliced = full & 0x7F   // mask lower 7 bits
                  println(s"from here we have ${sliced.toString(2)}")

                // val full = dut.io.data.peek().litValue
                val b_imm=dut.io.B_Imm.peek().litValue
                println(s"from the above we have the branch jump $b_imm")


                // val branchValue=Utils.B_imm(dut.io.data)
                //  val b_val=branchValue.peek().litValue
                  // println(s"from the above instruction we have the B_imm $branchValue")


                  //println(s"from here we have ${dut.io.data(6,0).peek().litValue}")

              }
        

      }
    }
  }