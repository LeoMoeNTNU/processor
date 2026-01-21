package processor
import chisel3._
import chisel3.util._

class DM extends Module {
  val io = IO(new Bundle {
    //inputs

    val address=Input(UInt(11.W))
    val imm_bits=Input(UInt(12.W))
    val value=Input(UInt(32.W))
    val active=Input(Bool())

    val operation= Input(UInt(3.W))//first 5 operations are loads, and the last 3 are writes to memory.


    val output=Output(UInt(32.W))

  })



    val sign=io.imm_bits(11)
    val signedAddress=WireDefault(0.U(11.W))//This one needs to get overwritten in the when-statement.
    when(sign){
        val valueToSubtract=((~io.imm_bits)(10,0)+1.U) //not +1 is how we convert to a positive number.
        signedAddress:=(io.address-valueToSubtract)(10,0)
    //The reason that I dont wrap around all of this with another (10,0) is that it doesn't work. I've thought about it...
    }.otherwise{
        signedAddress:=(io.address+io.imm_bits)(10,0)
    }


    val unsignedAddress=io.address+io.imm_bits

    val addressInHardwareSigned=Cat(signedAddress)
    val addressInHardwareUnsigned=Cat(unsignedAddress)



    //val dataMem= RegInit(VecInit(Seq.fill(8192)(0.U(8.W))))
    val dataMem = Mem(2048, UInt(32.W))


    io.output:=0.U

    when(io.active){
        switch(io.operation){
            is(0.U){
               io.output:=Cat(
                io.value(31,8),
                (dataMem(addressInHardwareSigned))(7,0)
            )
            }
            is(1.U){
                io.output:=Cat(
                io.value(31,16),
                (dataMem(addressInHardwareSigned))(15,0)
            )


            }
            is(2.U){
                 io.output:=Cat(dataMem(addressInHardwareSigned)
            )



            }
            is(3.U){
                io.output:=Cat(
                    io.value(31,8), (dataMem(addressInHardwareUnsigned))(7,0)
                )

            }
            is(4.U){
                io.output:=Cat(
                    io.value(31,16), (dataMem(addressInHardwareUnsigned))(15,0)
                )


            }
            is(5.U){
                dataMem(addressInHardwareSigned):=Cat((dataMem(addressInHardwareSigned))(31,8),io.value(7,0))
                io.output:=0.U

            }
            is(6.U){
                dataMem(addressInHardwareSigned):=Cat(dataMem(addressInHardwareSigned)(31,16),io.value(15,0))
                io.output:=0.U
            }
            is(7.U){
                dataMem(addressInHardwareSigned):=io.value(31,0)
                io.output:=0.U
            }

        }
    }


}