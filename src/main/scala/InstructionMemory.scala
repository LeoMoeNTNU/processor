package processor

import chisel3._
import chisel3.util._
import lib.Executable



class IM (path:String) extends Module {

    //val exe = Executable.from("tests/ripes/add.out")

    val exe = Executable.from(path)

    ///riscv-tests
    // \\wsl.localhost\Ubuntu-24.04\home\moeth\risvcourse\3\processor\risc-v-lab-master\tests\ripes\add.out
    //val text = exe.getSection(".text")
    val text = exe.getSegment(".text")
    
    print(text.getWords) // returns a Seq[Long] of instructions
    print(text.start) // start address of the section
    print(exe.getEntryPoint) // returns the start PC of the program
    text.getWords.foreach(println)

    val io = IO(new Bundle{
        val address = Input(UInt(10.W))
        val data = Output(UInt(32.W))

        val B_Imm=Output(UInt(32.W))
    })
    val instrVec = VecInit(text.getWords.map(w => w.U(32.W)))

    io.B_Imm:=Utils.B_imm(instrVec(io.address))//this one gives the B-imm, which I need for testing solely. 

    io.data:=instrVec(io.address)

}
