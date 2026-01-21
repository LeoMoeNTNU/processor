package processor
import chisel3._
import chisel3.util._

/*
This stage will receive a bunch of control signals. 
It will have: 
    Data Memory
    PC_c
    ALU
    forwarded register!



*/

class FirstStage extends Module {

  val io = IO(new Bundle {

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
 

  })


  val forwardedRegister=RegInit(0.U(5.W))
  val forwardedValue=RegInit(0.U(32.W))



  val ALU=Module(new ALU)
  val DM=Module(new DM)
  //val PC_C= Module(new PC_C)
  //ALU input.
  //forwarding for ALU_val2
  when(forwardedRegister===io.ALU1_from&&forwardedRegister=/=0.U){
    ALU.io.val1:=forwardedValue
  }.otherwise{
    ALU.io.val1:=io.ALU1_val
  }
  //forwarding for ALU_val2
  when(forwardedRegister===io.ALU2_from&&forwardedRegister=/=0.U){
    ALU.io.val2:=forwardedValue
  }.otherwise{
    ALU.io.val2:=io.ALU2_val
  }
  ALU.io.operation:=io.ALU_op

  //DM input: 
  /*Interface:
    val address=Input(UInt(11.W))
    val imm_bits=Input(UInt(12.W))
    val value=Input(UInt(32.W))
    val active=Input(Bool())

    val operation= Input(UInt(3.W))//first 5 operations are loads, and the last 3 are writes to memory.


    val output=Output(UInt(32.W))
  
  
  */
  DM.io.imm_bits:=io.DM_imm
  DM.io.active:=io.useMemory
  DM.io.operation:=io.DM_operation
  //forwarding for memory address...
  when(forwardedRegister===io.DM_address_from&&forwardedRegister=/=0.U){
    DM.io.address:=forwardedValue
  }.otherwise{
    DM.io.address:=io.DM_address
  }
  when(forwardedRegister===io.DM_val_from&&forwardedRegister=/=0.U){
    DM.io.value:=forwardedValue
  }.otherwise{
    DM.io.value:=io.DM_val
  }
  //now I've set the inputs for this one!

  /*Inputs:
   val writeReg=Input(Bool())
    val toReg=Input(UInt(5.W))
    val writeFrom=Input(Bool())//true = ALU, false = DM
  */ 

  /*outputs:
    val regWrite=Output(Bool())
    val regToWrite=Output(UInt(5.W))
    val regWriteVal=Output(UInt(32.W))
  
  */

  io.regWrite:=io.writeReg
  io.regToWrite:=io.toReg
  when(io.writeFrom){
    io.regWriteVal:=ALU.io.output
  }.otherwise{
    io.regWriteVal:=DM.io.output
  }


  //PC_C is next for below here. 

  /*inputs:
    val newPC=Input(Bool())
    val newPC_already_decided= Input(Bool())//if false, we use alu for it and if not be just add the imms. 
    val PC_1=Input(UInt(32.W))
    val PC_1_from=Input(UInt(5.W))
    val PC_2=Input(UInt(32.W))

    //outputs for stage2barrier.
    val newPC_out=Output(Bool())
    val PC_val_out = Output(UInt(32.W))
    
    
    */
  io.newPC_out:=io.newPC
  io.PC_val_out:=0.U//this is just a default value

  val forwarded_PC_1=WireDefault(0.U(32.W))
  when(io.newPC){

     when(forwardedRegister===io.PC_1_from&&forwardedRegister=/=0.U){
        forwarded_PC_1:=forwardedValue
        }.otherwise{
        forwarded_PC_1:=io.PC_1
        }
    when(io.newPC_already_decided){

      io.PC_val_out:=forwarded_PC_1+io.PC_2
      //check forwarding!
     



    }.otherwise{//Here we do the thing with the ALU.output(0)
      when(ALU.io.output(0)){
        io.PC_val_out:=forwarded_PC_1+io.PC_2
      }.otherwise{
        io.PC_val_out:=forwarded_PC_1+1.U
      }
    }
  }

  //Here I will actually do the forwarding:
  when(io.writeReg&io.toReg=/=0.U){
    forwardedRegister:=io.toReg
    forwardedValue:=Mux(io.writeFrom,ALU.io.output,DM.io.output)
  }
  


}