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

}

