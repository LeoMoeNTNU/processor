package processor
import chisel3._
import chisel3.util._

class ALU extends Module {  
  val io = IO(new Bundle {
    //inputs
    
    val val1 = Input(UInt(32.W))
    val val2 = Input(UInt(32.W))

    val operation= Input(UInt(5.W))

    //val mathematical_operation =Input(UInt(x.W))
    //for now I just assume add and check that the forwarding works.

    
    val output=Output(UInt(32.W))

  })


  val output_inside=WireDefault(0.U(32.W))


  switch(io.operation){
    is(0.U){
      output_inside:= io.val1+io.val2
    }
    is(1.U){
      output_inside:= io.val1-io.val2

    }
    is(2.U){
      output_inside:= io.val1^io.val2 //XOR

    }
    is(3.U){
            output_inside:= io.val1|io.val2 //OR 
    }
    is(4.U){
      output_inside:= io.val1&io.val2 //AND 

    }
    is(5.U){
      output_inside:= io.val1<<io.val2(4,0)
    }
    is(6.U){
      output_inside:=io.val1>>io.val2(4,0)
    }
    is(7.U){//TODO: meant to be sra but is probably wrong
    output_inside:=(io.val1.asSInt >> io.val2(4,0)).asUInt

      output_inside:=Cat(io.val1(31),(io.val1>>io.val2(4,0)))//I hope this works but what do I actually know. 
    }
    is(8.U){//slt
      output_inside := Mux(io.val1.asSInt<io.val2.asSInt, 1.U, 0.U)


    }
    is(9.U){//sltu TODO: no idea if it actually zero-extends or how that works.
      output_inside := Mux(io.val1<io.val2, 1.U, 0.U)//need to test this one and the previous one. 
    }
  
    is(10.U){//equal 
      output_inside:=Cat(0.U(31.W),io.val1===io.val2)

    }
    is(11.U){//unequal
      output_inside:=Cat(0.U(31.W),!(io.val1===io.val2))
    }
    is(12.U){//less than signed
      val op1=Cat(!io.val1(31),io.val1(30,0))
      val op2=Cat(!io.val2(31),io.val2(30,0))
      output_inside:=Cat(0.U(31.W),op1<op2)
    }
    is(13.U){//greater or equal signed
     val op1=Cat(!io.val1(31),io.val1(30,0))
      val op2=Cat(!io.val2(31),io.val2(30,0))
      output_inside:=Cat(0.U(31.W),op1>=op2)

    }
    is(14.U){//less than unsigned
      output_inside:=Cat(0.U(31.W),io.val1<io.val2)

    }
    is(15.U){//greater or equal unsigned
      output_inside:=Cat(0.U(31.W),io.val1>=io.val2)
    }
    //The problem with the last 3 is that we could probably make a comparator that sets a bunch of flags and is just a generic compare. 
    //This also doesn't work because some of the operations are unsigned and other aren't. 
    /*
     val sign=(Utils.B_imm(Instruction))(10)
          falsePC:=PC+1.U
          val constant=Utils.B_imm(Instruction)
          //truePC:=Cat(PC(31,11), (PC(10,0)+constant(10,0))(10,0)) I LIKED THIS IDEA BUT IT DOESNT WORK SADLY  
          
          when(sign){
            val valueToSubtract= (!Utils.B_imm(Instruction)(9,0))+1.U
            truePC:=PC- valueToSubtract
            printf(p"if true we will jump backwards with ${valueToSubtract} to ${truePC}\n")
          
          }.otherwise{
            truePC:=PC+(Utils.B_imm(Instruction)(9,0))
          }
    */
    /*
    is(16.U){
      val sign=(Utils.I_imm(Instruction))(11)//This one does in fact not exist!
      val valueToWrite=WireDefault(0.U(32.W))//This one needs to get overwritten immediately. 
      when(sign){
        valueToSubtract:=(!Utils.I_imm(instruction))(10,0)+1.U 
        valueToWrite:=inputToALU1-valueToSubtract
        //The reason that I dont wrap around all of this with another (10,0) is that it doesn't work. I've thought about it...
      }

    }
    is(17.U){

    }
    is(18.U){

    }
    */      

  }


  printf(p"we are doing ALU operation ${io.operation}  with values${Hexadecimal(io.val1)} and ${Hexadecimal(io.val2)}and outputting ${Hexadecimal(output_inside)}\n")

  io.output:=output_inside
  //The two below are for forwarding!


}

