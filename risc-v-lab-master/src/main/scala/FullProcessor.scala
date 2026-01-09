package processor
import chisel3._
import chisel3.util._

class FullProcessor extends Module {

  val io = IO(new Bundle {
    val regs=Output(Vec(32,UInt(32.W)))
    val ALU_input1=Output(UInt(32.W))
    val ALU_input2=Output(UInt(32.W))
    

    
    //There should probably be something here to write to registers as well. 
  })

     val FirstStage=Module(new FirstStage)
     val SecondStage=Module(new SecondStage)
     val ThirdStage=Module(new ThirdStage)


    io.regs:=ThirdStage.io.regs
    io.ALU_input1:=ThirdStage.io.value1
    io.ALU_input2:=ThirdStage.io.value2

    //ALU is in FirstStage. 
    //ALU sends to both second and thirdstage. 
    //I'll fix all of this at some point but first I need to get me some binary files. 

    FirstStage.io.ALU_input1:=ThirdStage.io.value1
    FirstStage.io.ALU_input2:=ThirdStage.io.value2
    FirstStage.io.fullInstruction:=ThirdStage.io.fullInstructionOut

    FirstStage.io.DataMemoryActive:=ThirdStage.io.dataMemoryActive
    FirstStage.io.DataMemoryReadOrWrite:=ThirdStage.io.dataReadOrWrite
    FirstStage.io.DataMemoryAddress:=ThirdStage.io.datapointer
    FirstStage.io.DataToWrite:=ThirdStage.io.dataToWrite

    SecondStage.io.PCIn:=FirstStage.io.PC
    SecondStage.io.newPC:=FirstStage.io.newPC //This one gets specifically used when there was a branch. 


    ThirdStage.io.RF_input1:=SecondStage.io.readData1
    ThirdStage.io.RF_input2:=SecondStage.io.readData2
    ThirdStage.io.fullInstructionForALU:=SecondStage.io.instructionOut
    ThirdStage.io.IR:=SecondStage.io.IR
    ThirdStage.io.RF_write:=FirstStage.io.RF_write
    ThirdStage.io.RF_val:=FirstStage.io.RF_val
    ThirdStage.io.RF_address:=FirstStage.io.RF_address
    /*
    FIRST STAGE: 
       val ALU_input1 = Input(UInt(32.W))

    val ALU_input2=Input(UInt(32.W))//idk if 32 or 64. Drawing says 64. 
    val fullInstruction=Input(UInt(32.W))
    

    val DataMemoryActive=Input(Bool())
    val DataMemoryReadOrWrite=Input(UInt(32.W)) 
    val DataMemoryAddress=Input(UInt(32.W))
    val DataToWrite=Input(UInt(32.W))

    val newPC=Output(Bool())
    val PC=Output(UInt(32.W))

    val RF_write=Output(Bool())
    val RF_val=Output(UInt(32.W))
    val RF_address=Output(UInt(32.W))

    SECOND STAGE: 
    val newPC=Input(UInt(32.W))
    val PCIn = Input(UInt(32.W))
    val PCOut=Output(UInt(32.W))
    //we are sending PC through because we may use it    
    val readData1=Output(UInt(5.W))
    val readData2=Output(UInt(5.W))

    val instructionOut=Output(UInt(32.W))
    //This one is because we send the whole instruction forward

    val IR=Output(UInt(32.W))

    THIRD STAGE: 
      val RF_input1=Input(UInt(5.W))
    val RF_input2=Input(UInt(5.W))

    val RF_write=Input(Bool())
    val RF_val=Input(UInt(32.W))
    val RF_address=Input(UInt(32.W))

    val fullInstructionForALU=Input(UInt(32.W))
    val fullInstructionOut=Output(UInt(32.W))
    val IR=Input(UInt(32.W))

    val value1=Output(UInt(32.W))
    val value2=Output(UInt(32.W))

    val datapointer=Output(UInt(32.W))
    val dataMemoryActive=Output(Bool())
    val dataReadOrWrite=Output(Bool())//read is true and write is false. 
    val dataToWrite=Output(UInt(32.W))


    */



}


