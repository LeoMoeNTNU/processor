import chisel3._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFileInline


class InstructionROM (memoryFile: String = "") extends Module {
    val io = IO(new Bundle{
        val address = Input(UInt(10.W))
        val data = Output(UInt(32.W))
    })

    val mem = SyncReadMem(1024, UInt(32.W))

    if(memoryFile.trim().nonEmpty) {
        loadMemoryFromFileInline(mem, memoryFile)
    }

    io.data := mem.read(io.address)
    //io.data(15,8) := mem.read(io.address + 1.U)
    //io.data(23,16) := mem.read(io.address + 2.U)
    //io.data(31,24) := mem.read(io.address + 3.U)
}
