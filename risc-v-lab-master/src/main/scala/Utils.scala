package processor
import chisel3._
import chisel3.util._


object Utils{



def opcode(x: UInt): UInt = {
  x(6,0)
}

def rd(x:UInt):UInt={
    x(11,7)
}
  
//all of these are 3-bit. 
def rs1(x: UInt):UInt={
  x(19,15)

}
def rs2(x:UInt):UInt={
  x(24,20)
}

def funct3(x: UInt):UInt={
  x(14,12)
}

def I_imm(x:UInt):UInt={
    x(31,20)
}

def S_imm(x:UInt):UInt={
    x(11,7)&(x(31,25)<<5.U)//idk if this is valid syntax just yet. 
}
def B_imm(x:UInt):UInt={
    0.U//I haven't understood this yet. 
}

def U_imm(x:UInt):UInt={
    x(31,12)
}

def J_imm(x:UInt):UInt={
    0.U//idk bro. 
}

}

