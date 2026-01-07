import chisel3._
import chisel3.util._



class InstructionROM (instructions: Array[Byte]) extends Module {
    val io = IO(new Bundle{
        val address = Input(UInt(10.W))
        val data = Output(UInt(32.W))
    })

    val mem = VecInit(instructions.toIndexedSeq.map(_.S(8.W).asUInt))
    val b0 = mem(io.address)
    val b1 = mem(io.address + 1.U)
    val b2 = mem(io.address + 2.U)
    val b3 = mem(io.address + 3.U)

    // Cat(MSB, ..., LSB)
    io.data := Cat(b3, b2, b1, b0)
        
}
