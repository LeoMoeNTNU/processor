package processor
import chisel3._
import chisel3.util._

class ALU extends Module {  
  val io = IO(new Bundle {
    //inputs
    
    val val1 = Input(UInt(32.W))
    val val2 = Input(UInt(32.W))
    val from1=Input(UInt(5.W))
    val from2=Input(UInt(5.W))

    val operation= Input(UInt(4.W))

    //val mathematical_operation =Input(UInt(x.W))
    //for now I just assume add and check that the forwarding works.

    val toReg=Input(UInt(5.W))
    
    val output=Output(UInt(32.W))

  })

  val updatedRegister=RegInit(0.U(5.W))
  val storedValue=RegInit(0.U(32.W))

  val inputToALU1=Wire(UInt(32.W))
  val inputToALU2=Wire(UInt(32.W))

  when(io.from1===updatedRegister){
    inputToALU1:=storedValue
  }.otherwise{
    inputToALU1:=io.val1
  }

  when(io.from2===updatedRegister){
    inputToALU2:=storedValue
  }.otherwise{
    inputToALU2:=io.val2
  }
  val output_inside=WireDefault(0.U(32.W))

  switch(io.operation){
    is(0.U){
      output_inside:= inputToALU1+inputToALU2
    }
    is(1.U){
      output_inside:= inputToALU1-inputToALU2

    }
    is(2.U){
      output_inside:= inputToALU1^inputToALU2//XOR NOT DONE

    }
    is(3.U){
            output_inside:= inputToALU1|inputToALU2 //OR NOT DONE

    }
    is(4.U){
      output_inside:= inputToALU1&inputToALU2 //AND NOT DONE

    }
    is(5.U){
      output_inside:= inputToALU1<<inputToALU2
    }
    is(6.U){
      output_inside:=inputToALU1>>inputToALU2
    }
    is(7.U){
      output_inside:=Cat(inputToALU1(31),(inputToALU1>>inputToALU2))//I hope this works but what do I actually know. 
    }
    is(8.U){
      output_inside := Mux(inputToALU1.asSInt<inputToALU2.asSInt, 1.U, 0.U)


    }
    is(9.U){
      output_inside := Mux(inputToALU1<inputToALU2, 1.U, 0.U)//need to test this one and the previous one. 

    }
    is(10.U){
      output_inside:= inputToALU1<<inputToALU2(4,0)
    }
    is(11.U){
output_inside:= inputToALU1>>inputToALU2(4,0)
    }
    is(12.U){
      output_inside:=Cat(inputToALU1(31),(inputToALU1>>inputToALU2(4,0)))
    }




  }



  io.output:=output_inside
  storedValue:=output_inside
  updatedRegister:=io.toReg

}

