

package processor
import chisel3._
import chisel3.util._


class SecondStage extends Module {

  val io = IO(new Bundle {

    val newPC=Input(Bool())
    val PCIn = Input(UInt(32.W))
    val PCOut=Output(UInt(32.W))
    //we are sending PC through because we may use it to calculate the next PC.    
    val readData1=Output(UInt(5.W))
    val readData2=Output(UInt(5.W))

    val instructionOut=Output(UInt(32.W))
    //This one is because we send the whole instruction forward

    val IR=Output(UInt(32.W))


  })




    val newPC_reg=RegInit(0.U(32.W))
    newPC_reg:=io.newPC

    val PCIn_reg=RegInit(0.U(32.W))
    PCIn_reg:=io.PCIn

    val waitingForNewPC=RegInit(false.B)//if I change this, things will happen of course...
    val PC=RegInit(0.U(32.W))//I am assuming that PC always starts at zero. 
    
    PC:=PC+1.U
    io.PCOut:=PC

    val InstructionMemory=Module(new IM())
    InstructionMemory.io.address:=PC

    val Instruction=InstructionMemory.io.data

    io.instructionOut:=Instruction//This line will change with branches and maybe jumps too. 
    
    io.IR:=0.U//This line is necessary because there are so many uncovered opcodes. 
    
    io.readData1:=Utils.rs1(Instruction)
    io.readData2:=Utils.rs2(Instruction)

    switch(Utils.opcode(Instruction)){
      is("b0110011".U){//R-type
        io.IR:=0.U//R-type doesn't use IR.
      }
      is("b0010011".U,"b0000011".U,"b1100111".U,"b1110011".U){
        io.IR:=Utils.I_imm(Instruction)
      }
      
      is("b0100011".U){
        io.IR:=Utils.S_imm(Instruction)
      }
      is("b1100011".U){
        io.IR:=Utils.B_imm(Instruction)
      }
  
      is("b1101111".U){
        io.IR:=Utils.J_imm(Instruction)
      }
      is("b0110111".U,"b0010111".U){//U-type
        io.IR:=Utils.U_imm(Instruction)
      }
    }
    

}

 
