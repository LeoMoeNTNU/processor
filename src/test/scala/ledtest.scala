//\\wsl.localhost\Ubuntu-24.04\home\moeth\risvcourse\4\processor\risc-v-lab-master\led_stuff\led_for_simul.out

package processor

import chisel3._
import chisel3.util._

import org.scalatest.flatspec.AnyFlatSpec
import chiseltest._


class ledTest extends AnyFlatSpec with ChiselScalatestTester {

  behavior of "ledtest"

  it should "im just using this to look at outputs" in {
    test(new FP("led_stuff/my_led.out",true)) { dut =>
        for(i<-0 until 100){
      dut.clock.step()

        }
     
    }
  }

}