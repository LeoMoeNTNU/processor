package processor
import chisel3._
import chisel3.util._

class ThirdStage(debug:Boolean) extends Module {

/*
What this one will practically do, is receive an instruction and output a bunch of control signals.
These, I will map out first. 
The thing I dont know how to do yet in general, is how to make good tests for everything.
The other thing that needs to happen is that I choose the right imm to send out. 
It will also have all the registers, so that it can send those out as well. 

*/

  val io = IO(new Bundle {

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
    val toReg=Output(UInt(5.W))
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

    val regs= if(debug)
    Some(Output(Vec(32,UInt(32.W)))) else None //for testing!

  })


  val regs = RegInit(VecInit(Seq.fill(32)(0.U(32.W))))
  
  if(debug){
    io.regs.get:=regs

  }
  printf("stage 3:\n")

    //easier to write this way.
  val ins=WireDefault(io.instruction)

  when(io.regWrite){
    regs(io.regToWrite):=io.regWriteVal
  }
    //woo this one will be big and very important!


  //default signals: 
    io.useALU := false.B
io.ALU1_val := 0.U
io.ALU1_from := 0.U
io.ALU2_val := 0.U
io.ALU2_from := 0.U
io.ALU_op := 0.U

io.writeReg := false.B
io.toReg := 0.U
io.writeFrom := false.B

io.useMemory := false.B
io.DM_val := 0.U
io.DM_val_from := 0.U
io.DM_address := 0.U
io.DM_address_from := 0.U
io.DM_imm := 0.U
io.DM_operation := 0.U

io.newPC := false.B
io.newPC_already_decided := false.B
io.PC_1 := 0.U
io.PC_1_from := 0.U
io.PC_2 := 0.U


  switch(Utils.opcode(ins)){
    is("b0110011".U){//R-type. 
        io.useALU:=true.B
        io.ALU1_val:=regs(Utils.rs1(ins))
        io.ALU1_from:=Utils.rs1(ins)
        io.ALU2_val:=regs(Utils.rs2(ins))
        io.ALU2_from:=Utils.rs2(ins)
        switch(Utils.funct3(ins)){
          is(0.U){//ADD OR SUB
            when(Utils.funct7(ins)==="b10_0000".U){
              //SUB
              io.ALU_op:=1.U
            }.otherwise{
              io.ALU_op:=0.U
              //ADD
            }
          }
          is(4.U){//XOR
            io.ALU_op:=2.U

          }
          is(6.U){//OR
          io.ALU_op:=3.U

          }
          is(7.U){//AND
          io.ALU_op:=4.U

          }
          is(1.U){//bitshift left
          io.ALU_op:=5.U
          }
          is(5.U){//bitshift right 2 versions.
           when(Utils.funct7(ins)==="b10_0000".U){
              //sra
              io.ALU_op:=7.U
            }.otherwise{
              //srl
              io.ALU_op:=6.U
            }

          }
          is(2.U){//slt
            io.ALU_op:=8.U
          }
          is(3.U){//sltu
            io.ALU_op:=9.U
          }
        }

        io.writeReg:=true.B
        io.toReg:=Utils.rd(ins)
        io.writeFrom:=true.B

        io.useMemory:=false.B
        io.DM_val:=0.U
        io.DM_val_from:=0.U
        io.DM_address:=0.U
        io.DM_address_from:=0.U
        io.DM_imm:=0.U
        io.DM_operation:=0.U

        io.newPC:=false.B
        io.newPC_already_decided:=false.B
        io.PC_1:=0.U
        io.PC_1_from:=0.U
        io.PC_2:=0.U


    }

    is("b0010011".U){//first I-type
        io.useALU:=true.B
        io.ALU1_val:=regs(Utils.rs1(ins))
        io.ALU1_from:=Utils.rs1(ins)
        io.ALU2_val:=Utils.I_imm(ins)
        io.ALU2_from:=0.U

        switch(Utils.funct3(ins)){
          is(0.U){//ADD
          io.ALU_op:=0.U

          }
          is(4.U){//XOR
          io.ALU_op:=2.U

          }
          is(6.U){//OR
          io.ALU_op:=3.U
          }
          is(7.U){//AND
          io.ALU_op:=4.U
          }
          is(1.U){//left bit shift
          io.ALU_op:=5.U
          when(Utils.I_imm(ins)(11)===1.U(1.W)){
            //srai
            io.ALU_op:=7.U
          }.otherwise{
            //srli
            io.ALU_op:=6.U

          }
          
          }
          is(5.U){//right shift 2 versions
            //This one needs to be fixed NOW!
          
          }
          is(2.U){//slti
          
          }
          is(3.U){//sltiu

          }
        }

        //TODO: ALU.op. I haven't fixed this yet.

        io.writeReg:=true.B
        io.toReg:=Utils.rd(ins)
        io.writeFrom:=true.B

        io.useMemory:=false.B
        io.DM_val:=0.U
        io.DM_val_from:=0.U
        io.DM_address:=0.U
        io.DM_imm:=0.U
        io.DM_operation:=0.U

        io.newPC:=false.B
        io.newPC_already_decided:=false.B
        io.PC_1:=0.U
        io.PC_1_from:=0.U
        io.PC_2:=0.U

    }
    is("b0000011".U){//I-type, loads :)
        io.useALU:=false.B
        io.ALU1_val:=0.U
        io.ALU1_from:=0.U
        io.ALU2_val:=0.U
        io.ALU2_from:=0.U

        //TODO: ALU.op. I haven't fixed this yet.

        io.writeReg:=true.B
        io.toReg:=Utils.rd(ins)
        io.writeFrom:=false.B//false refers to using the data memory instead of the 

        io.useMemory:=true.B
        io.DM_val:=0.U//value is used for stores.
        io.DM_val_from:=0.U
        io.DM_address:=regs(Utils.rs1(ins))
        io.DM_address_from:=Utils.rs1(ins)
        io.DM_imm:=Utils.I_imm(ins)
        io.DM_operation:=Utils.funct3(ins)

        io.newPC:=false.B
        io.newPC_already_decided:=false.B
        io.PC_1:=0.U
        io.PC_1_from:=0.U
        io.PC_2:=0.U

    }
    is("b0100011".U){//S-type
        io.useALU:=false.B
        io.ALU1_val:=0.U
        io.ALU1_from:=0.U
        io.ALU2_val:=0.U
        io.ALU2_from:=0.U

        //TODO: ALU.op. I haven't fixed this yet.

        io.writeReg:=false.B
        io.toReg:=0.U
        io.writeFrom:=false.B//false refers to using the data memory instead of the 

        io.useMemory:=true.B
        io.DM_val:=regs(Utils.rs2(ins)) //value is used for stores.
        io.DM_val_from:=Utils.rs2(ins)
        io.DM_address:=regs(Utils.rs1(ins))
        io.DM_address_from:=Utils.rs1(ins)
        io.DM_imm:=Utils.I_imm(ins)
        io.DM_operation:=5.U+Utils.funct3(ins)//idk that this works but I think so. 

        io.newPC:=false.B
        io.newPC_already_decided:=false.B
        io.PC_1:=0.U
        io.PC_1_from:=0.U
        io.PC_2:=0.U

    }
    is("b1100011".U){//B-type
        io.useALU:=true.B
        io.ALU1_val:=regs(Utils.rs1(ins))
        io.ALU1_from:=Utils.rs1(ins)
        io.ALU2_val:=regs(Utils.rs2(ins))
        io.ALU2_from:=Utils.rs2(ins)

        io.ALU_op:=0.U
     
            switch(Utils.funct3(ins)){
                is(0.U){//equal
                  io.ALU_op:=10.U
                }
                is(1.U){//unequal
                  io.ALU_op:=11.U
                }
                is(2.U){//something wrong, should print!

                }
                is(3.U){//something wrong, should print!

                }
                is(4.U){//less than signed
                  io.ALU_op:=12.U
                }
                is(5.U){//greater or equal signed
                  io.ALU_op:=13.U
                }
                is(6.U){//less than unsigned
                  io.ALU_op:=14.U
                }
                is(7.U){//greater or equal unsigned
                    io.ALU_op:=15.U
                }
            
        }

        io.writeReg:=false.B
        io.toReg:=0.U
        io.writeFrom:=false.B//false refers to using the data memory instead of the 

        io.useMemory:=false.B
        io.DM_val:=0.U
        io.DM_val_from:=0.U
        io.DM_address:=0.U
        io.DM_address_from:=0.U
        io.DM_imm:=0.U
        io.DM_operation:=0.U

        io.newPC:=true.B
        io.newPC_already_decided:=false.B
        io.PC_1:=io.PC
        io.PC_2:=Utils.B_imm(ins)
    }
    is("b1101111".U){//jal
        io.useALU:=true.B
        io.ALU1_val:=io.PC
        io.ALU1_from:=0.U
        io.ALU2_val:=4.U
        io.ALU2_from:=0.U

        //TODO: ALU.op. whatever add is. 

        io.writeReg:=true.B
        io.toReg:=Utils.rd(ins)
        io.writeFrom:=true.B//false refers to using the data memory instead of the 

        io.useMemory:=false.B
        io.DM_val:=0.U
        io.DM_val_from:=0.U
        io.DM_address:=0.U
        io.DM_address_from:=0.U
        io.DM_imm:=0.U
        io.DM_operation:=0.U

        io.newPC:=true.B
        io.newPC_already_decided:=true.B
        io.PC_1:=io.PC
        io.PC_1_from:=0.U
        io.PC_2:=Utils.J_imm(ins)
    }
     is("b1100111".U){//jalr
        io.useALU:=true.B
        io.ALU1_val:=io.PC
        io.ALU1_from:=0.U
        io.ALU2_val:=4.U
        io.ALU2_from:=0.U

        //TODO: ALU.op. whatever add is. 

        io.writeReg:=true.B
        io.toReg:=Utils.rd(ins)
        io.writeFrom:=true.B//false refers to using the data memory instead of the 

        io.useMemory:=false.B
        io.DM_val:=0.U
        io.DM_val_from:=0.U
        io.DM_address:=0.U
        io.DM_address_from:=0.U
        io.DM_imm:=0.U
        io.DM_operation:=0.U

        io.newPC:=true.B
        io.newPC_already_decided:=true.B
        io.PC_1:=regs(Utils.rs1(ins))
        io.PC_1_from:=Utils.rs1(ins)
        io.PC_2:=Utils.J_imm(ins)
    }
      is("b0110111".U){//lui
        io.useALU:=true.B
        io.ALU1_val:=Utils.U_imm(ins)<<12.U//TODO: check that U_imm isnt already bitshifted
        io.ALU1_from:=0.U
        io.ALU2_val:=0.U
        io.ALU2_from:=0.U

        //TODO: ALU.op. whatever add is. 

        io.writeReg:=true.B
        io.toReg:=Utils.rd(ins)
        io.writeFrom:=true.B//false refers to using the data memory instead of the 

        io.useMemory:=false.B
        io.DM_val:=0.U
        io.DM_val_from:=0.U
        io.DM_address:=0.U
        io.DM_address_from:=0.U
        io.DM_imm:=0.U
        io.DM_operation:=0.U

        io.newPC:=false.B
        io.newPC_already_decided:=false.B
        io.PC_1:=0.U
        io.PC_1_from:=0.U
        io.PC_2:=0.U
    }
    is("b0010111".U){//auipc
        io.useALU:=true.B
        io.ALU1_val:=Utils.U_imm(ins)<<12.U//TODO: check that U_imm isnt already bitshifted
        io.ALU1_from:=0.U
        io.ALU2_val:=io.PC
        io.ALU2_from:=0.U

        //TODO: ALU.op. whatever add is. 

        io.writeReg:=true.B
        io.toReg:=Utils.rd(ins)
        io.writeFrom:=true.B//false refers to using the data memory instead of the 

        io.useMemory:=false.B
        io.DM_val:=0.U
        io.DM_val_from:=0.U
        io.DM_address:=0.U
        io.DM_address_from:=0.U
        io.DM_imm:=0.U
        io.DM_operation:=0.U

        io.newPC:=false.B
        io.newPC_already_decided:=false.B
        io.PC_1:=0.U
        io.PC_1_from:=0.U
        io.PC_2:=0.U
    }

  }





}