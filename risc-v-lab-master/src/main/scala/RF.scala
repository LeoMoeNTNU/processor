package processor

import chisel3._
import chisel3.util._


class RegisterFile extends Module {
    val io = IO(new Bundle{
        val rs1 = Input(UInt(5.W))
        val rs2 = Input(UInt(5.W))
        val write_dest = Input(UInt(5.W))
        val write_enable = Input(Bool())
        val write_data = Input(UInt(32.W))
        val rs1_val = Output(UInt(32.W))
        val rs2_val = Output(UInt(32.W))
        val printRF = Input(Bool())      
    })

    if(io.printRF == true.B){
        for(i <- 0 until 10){
            print(mem(i))
        }
    }
    val mem = RegInit(VecInit(Seq.fill(32)(0.U(32.W))))
    io.rs1_val := mem(io.rs1)
    io.rs2_val := mem(io.rs2)
    when(io.write_enable){
        mem(io.write_dest) := io.write_data
    }  
}