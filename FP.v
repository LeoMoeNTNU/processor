module ALU(
  input         clock,
  input         reset,
  input  [31:0] io_val1,
  input  [31:0] io_val2,
  input  [4:0]  io_operation,
  output [31:0] io_output
);
  wire [31:0] _output_inside_T_1 = io_val1 + io_val2; // @[ALU.scala 28:30]
  wire [31:0] _output_inside_T_3 = io_val1 - io_val2; // @[ALU.scala 31:30]
  wire [31:0] _output_inside_T_4 = io_val1 ^ io_val2; // @[ALU.scala 35:30]
  wire [31:0] _output_inside_T_5 = io_val1 | io_val2; // @[ALU.scala 39:36]
  wire [31:0] _output_inside_T_6 = io_val1 & io_val2; // @[ALU.scala 42:30]
  wire [62:0] _GEN_16 = {{31'd0}, io_val1}; // @[ALU.scala 46:30]
  wire [62:0] _output_inside_T_8 = _GEN_16 << io_val2[4:0]; // @[ALU.scala 46:30]
  wire [31:0] _output_inside_T_10 = io_val1 >> io_val2[4:0]; // @[ALU.scala 49:29]
  wire [32:0] _output_inside_T_14 = {io_val1[31],_output_inside_T_10}; // @[Cat.scala 33:92]
  wire [31:0] _output_inside_T_15 = io_val1; // @[ALU.scala 55:36]
  wire [31:0] _output_inside_T_16 = io_val2; // @[ALU.scala 55:51]
  wire  _output_inside_T_19 = io_val1 < io_val2; // @[ALU.scala 60:35]
  wire  _output_inside_T_21 = io_val1 == io_val2; // @[ALU.scala 64:43]
  wire [31:0] _output_inside_T_22 = {31'h0,_output_inside_T_21}; // @[Cat.scala 33:92]
  wire  _output_inside_T_24 = ~_output_inside_T_21; // @[ALU.scala 68:36]
  wire [31:0] _output_inside_T_25 = {31'h0,_output_inside_T_24}; // @[Cat.scala 33:92]
  wire  _op1_T_1 = ~io_val1[31]; // @[ALU.scala 71:19]
  wire [31:0] op1 = {_op1_T_1,io_val1[30:0]}; // @[Cat.scala 33:92]
  wire  _op2_T_1 = ~io_val2[31]; // @[ALU.scala 72:19]
  wire [31:0] op2 = {_op2_T_1,io_val2[30:0]}; // @[Cat.scala 33:92]
  wire  _output_inside_T_26 = op1 < op2; // @[ALU.scala 73:39]
  wire [31:0] _output_inside_T_27 = {31'h0,_output_inside_T_26}; // @[Cat.scala 33:92]
  wire  _output_inside_T_28 = op1 >= op2; // @[ALU.scala 78:39]
  wire [31:0] _output_inside_T_29 = {31'h0,_output_inside_T_28}; // @[Cat.scala 33:92]
  wire [31:0] _output_inside_T_31 = {31'h0,_output_inside_T_19}; // @[Cat.scala 33:92]
  wire  _output_inside_T_32 = io_val1 >= io_val2; // @[ALU.scala 86:43]
  wire [31:0] _output_inside_T_33 = {31'h0,_output_inside_T_32}; // @[Cat.scala 33:92]
  wire [31:0] _GEN_0 = 5'hf == io_operation ? _output_inside_T_33 : 32'h0; // @[ALU.scala 26:23 86:20 23:32]
  wire [31:0] _GEN_1 = 5'he == io_operation ? _output_inside_T_31 : _GEN_0; // @[ALU.scala 26:23 82:20]
  wire [31:0] _GEN_2 = 5'hd == io_operation ? _output_inside_T_29 : _GEN_1; // @[ALU.scala 26:23 78:20]
  wire [31:0] _GEN_3 = 5'hc == io_operation ? _output_inside_T_27 : _GEN_2; // @[ALU.scala 26:23 73:20]
  wire [31:0] _GEN_4 = 5'hb == io_operation ? _output_inside_T_25 : _GEN_3; // @[ALU.scala 26:23 68:20]
  wire [31:0] _GEN_5 = 5'ha == io_operation ? _output_inside_T_22 : _GEN_4; // @[ALU.scala 26:23 64:20]
  wire [31:0] _GEN_6 = 5'h9 == io_operation ? {{31'd0}, io_val1 < io_val2} : _GEN_5; // @[ALU.scala 26:23 60:21]
  wire [31:0] _GEN_7 = 5'h8 == io_operation ? {{31'd0}, $signed(_output_inside_T_15) < $signed(_output_inside_T_16)} :
    _GEN_6; // @[ALU.scala 26:23 55:21]
  wire [32:0] _GEN_8 = 5'h7 == io_operation ? _output_inside_T_14 : {{1'd0}, _GEN_7}; // @[ALU.scala 26:23 52:20]
  wire [32:0] _GEN_9 = 5'h6 == io_operation ? {{1'd0}, _output_inside_T_10} : _GEN_8; // @[ALU.scala 26:23 49:20]
  wire [62:0] _GEN_10 = 5'h5 == io_operation ? _output_inside_T_8 : {{30'd0}, _GEN_9}; // @[ALU.scala 26:23 46:20]
  wire [62:0] _GEN_11 = 5'h4 == io_operation ? {{31'd0}, _output_inside_T_6} : _GEN_10; // @[ALU.scala 26:23 42:20]
  wire [62:0] _GEN_12 = 5'h3 == io_operation ? {{31'd0}, _output_inside_T_5} : _GEN_11; // @[ALU.scala 26:23 39:26]
  wire [62:0] _GEN_13 = 5'h2 == io_operation ? {{31'd0}, _output_inside_T_4} : _GEN_12; // @[ALU.scala 26:23 35:20]
  wire [62:0] _GEN_14 = 5'h1 == io_operation ? {{31'd0}, _output_inside_T_3} : _GEN_13; // @[ALU.scala 26:23 31:20]
  wire [62:0] _GEN_15 = 5'h0 == io_operation ? {{31'd0}, _output_inside_T_1} : _GEN_14; // @[ALU.scala 26:23 28:20]
  wire [31:0] output_inside = _GEN_15[31:0]; // @[ALU.scala 23:32]
  assign io_output = _GEN_15[31:0]; // @[ALU.scala 23:32]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset) begin
          $fwrite(32'h80000002,"we are doing ALU operation %d and outputting %d\n",io_operation,output_inside); // @[ALU.scala 127:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module DM(
  input         clock,
  input  [10:0] io_address,
  input  [11:0] io_imm_bits,
  input  [31:0] io_value,
  input         io_active,
  input  [2:0]  io_operation,
  output [31:0] io_output
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [31:0] dataMem [0:2047]; // @[DM.scala 42:22]
  wire  dataMem_io_output_MPORT_en; // @[DM.scala 42:22]
  wire [10:0] dataMem_io_output_MPORT_addr; // @[DM.scala 42:22]
  wire [31:0] dataMem_io_output_MPORT_data; // @[DM.scala 42:22]
  wire  dataMem_io_output_MPORT_1_en; // @[DM.scala 42:22]
  wire [10:0] dataMem_io_output_MPORT_1_addr; // @[DM.scala 42:22]
  wire [31:0] dataMem_io_output_MPORT_1_data; // @[DM.scala 42:22]
  wire  dataMem_io_output_MPORT_2_en; // @[DM.scala 42:22]
  wire [10:0] dataMem_io_output_MPORT_2_addr; // @[DM.scala 42:22]
  wire [31:0] dataMem_io_output_MPORT_2_data; // @[DM.scala 42:22]
  wire  dataMem_io_output_MPORT_3_en; // @[DM.scala 42:22]
  wire [10:0] dataMem_io_output_MPORT_3_addr; // @[DM.scala 42:22]
  wire [31:0] dataMem_io_output_MPORT_3_data; // @[DM.scala 42:22]
  wire  dataMem_io_output_MPORT_4_en; // @[DM.scala 42:22]
  wire [10:0] dataMem_io_output_MPORT_4_addr; // @[DM.scala 42:22]
  wire [31:0] dataMem_io_output_MPORT_4_data; // @[DM.scala 42:22]
  wire  dataMem_MPORT_1_en; // @[DM.scala 42:22]
  wire [10:0] dataMem_MPORT_1_addr; // @[DM.scala 42:22]
  wire [31:0] dataMem_MPORT_1_data; // @[DM.scala 42:22]
  wire  dataMem_MPORT_3_en; // @[DM.scala 42:22]
  wire [10:0] dataMem_MPORT_3_addr; // @[DM.scala 42:22]
  wire [31:0] dataMem_MPORT_3_data; // @[DM.scala 42:22]
  wire [31:0] dataMem_MPORT_data; // @[DM.scala 42:22]
  wire [10:0] dataMem_MPORT_addr; // @[DM.scala 42:22]
  wire  dataMem_MPORT_mask; // @[DM.scala 42:22]
  wire  dataMem_MPORT_en; // @[DM.scala 42:22]
  wire [31:0] dataMem_MPORT_2_data; // @[DM.scala 42:22]
  wire [10:0] dataMem_MPORT_2_addr; // @[DM.scala 42:22]
  wire  dataMem_MPORT_2_mask; // @[DM.scala 42:22]
  wire  dataMem_MPORT_2_en; // @[DM.scala 42:22]
  wire [31:0] dataMem_MPORT_4_data; // @[DM.scala 42:22]
  wire [10:0] dataMem_MPORT_4_addr; // @[DM.scala 42:22]
  wire  dataMem_MPORT_4_mask; // @[DM.scala 42:22]
  wire  dataMem_MPORT_4_en; // @[DM.scala 42:22]
  wire  sign = io_imm_bits[11]; // @[DM.scala 23:25]
  wire [11:0] _valueToSubtract_T = ~io_imm_bits; // @[DM.scala 26:31]
  wire [10:0] valueToSubtract = _valueToSubtract_T[10:0] + 11'h1; // @[DM.scala 26:50]
  wire [10:0] _signedAddress_T_1 = io_address - valueToSubtract; // @[DM.scala 27:35]
  wire [11:0] _GEN_190 = {{1'd0}, io_address}; // @[DM.scala 30:35]
  wire [11:0] _signedAddress_T_4 = _GEN_190 + io_imm_bits; // @[DM.scala 30:35]
  wire  _T = 3'h0 == io_operation; // @[DM.scala 48:29]
  wire [31:0] _io_output_T_2 = {io_value[31:8],dataMem_io_output_MPORT_data[7:0]}; // @[Cat.scala 33:92]
  wire [31:0] _io_output_T_5 = {io_value[31:16],dataMem_io_output_MPORT_1_data[15:0]}; // @[Cat.scala 33:92]
  wire [31:0] _io_output_T_9 = {io_value[31:8],dataMem_io_output_MPORT_3_data[7:0]}; // @[Cat.scala 33:92]
  wire [31:0] _io_output_T_13 = {io_value[31:16],dataMem_io_output_MPORT_4_data[15:0]}; // @[Cat.scala 33:92]
  wire  _GEN_15 = 3'h6 == io_operation ? 1'h0 : 3'h7 == io_operation; // @[DM.scala 42:22 48:29]
  wire  _GEN_26 = 3'h5 == io_operation ? 1'h0 : 3'h6 == io_operation; // @[DM.scala 42:22 48:29]
  wire  _GEN_31 = 3'h5 == io_operation ? 1'h0 : _GEN_15; // @[DM.scala 42:22 48:29]
  wire [31:0] _GEN_37 = 3'h4 == io_operation ? _io_output_T_13 : 32'h0; // @[DM.scala 48:29 77:26]
  wire  _GEN_40 = 3'h4 == io_operation ? 1'h0 : 3'h5 == io_operation; // @[DM.scala 42:22 48:29]
  wire  _GEN_45 = 3'h4 == io_operation ? 1'h0 : _GEN_26; // @[DM.scala 42:22 48:29]
  wire  _GEN_50 = 3'h4 == io_operation ? 1'h0 : _GEN_31; // @[DM.scala 42:22 48:29]
  wire [31:0] _GEN_56 = 3'h3 == io_operation ? _io_output_T_9 : _GEN_37; // @[DM.scala 48:29 71:26]
  wire  _GEN_59 = 3'h3 == io_operation ? 1'h0 : 3'h4 == io_operation; // @[DM.scala 42:22 48:29]
  wire  _GEN_62 = 3'h3 == io_operation ? 1'h0 : _GEN_40; // @[DM.scala 42:22 48:29]
  wire  _GEN_67 = 3'h3 == io_operation ? 1'h0 : _GEN_45; // @[DM.scala 42:22 48:29]
  wire  _GEN_72 = 3'h3 == io_operation ? 1'h0 : _GEN_50; // @[DM.scala 42:22 48:29]
  wire [31:0] _GEN_78 = 3'h2 == io_operation ? dataMem_io_output_MPORT_2_data : _GEN_56; // @[DM.scala 48:29 64:27]
  wire  _GEN_81 = 3'h2 == io_operation ? 1'h0 : 3'h3 == io_operation; // @[DM.scala 42:22 48:29]
  wire  _GEN_84 = 3'h2 == io_operation ? 1'h0 : _GEN_59; // @[DM.scala 42:22 48:29]
  wire  _GEN_87 = 3'h2 == io_operation ? 1'h0 : _GEN_62; // @[DM.scala 42:22 48:29]
  wire  _GEN_92 = 3'h2 == io_operation ? 1'h0 : _GEN_67; // @[DM.scala 42:22 48:29]
  wire  _GEN_97 = 3'h2 == io_operation ? 1'h0 : _GEN_72; // @[DM.scala 42:22 48:29]
  wire [31:0] _GEN_103 = 3'h1 == io_operation ? _io_output_T_5 : _GEN_78; // @[DM.scala 48:29 56:26]
  wire  _GEN_106 = 3'h1 == io_operation ? 1'h0 : 3'h2 == io_operation; // @[DM.scala 42:22 48:29]
  wire  _GEN_109 = 3'h1 == io_operation ? 1'h0 : _GEN_81; // @[DM.scala 42:22 48:29]
  wire  _GEN_112 = 3'h1 == io_operation ? 1'h0 : _GEN_84; // @[DM.scala 42:22 48:29]
  wire  _GEN_115 = 3'h1 == io_operation ? 1'h0 : _GEN_87; // @[DM.scala 42:22 48:29]
  wire  _GEN_120 = 3'h1 == io_operation ? 1'h0 : _GEN_92; // @[DM.scala 42:22 48:29]
  wire  _GEN_125 = 3'h1 == io_operation ? 1'h0 : _GEN_97; // @[DM.scala 42:22 48:29]
  wire [31:0] _GEN_131 = 3'h0 == io_operation ? _io_output_T_2 : _GEN_103; // @[DM.scala 48:29 50:25]
  wire  _GEN_134 = 3'h0 == io_operation ? 1'h0 : 3'h1 == io_operation; // @[DM.scala 42:22 48:29]
  wire  _GEN_137 = 3'h0 == io_operation ? 1'h0 : _GEN_106; // @[DM.scala 42:22 48:29]
  wire  _GEN_140 = 3'h0 == io_operation ? 1'h0 : _GEN_109; // @[DM.scala 42:22 48:29]
  wire  _GEN_143 = 3'h0 == io_operation ? 1'h0 : _GEN_112; // @[DM.scala 42:22 48:29]
  wire  _GEN_146 = 3'h0 == io_operation ? 1'h0 : _GEN_115; // @[DM.scala 42:22 48:29]
  wire  _GEN_151 = 3'h0 == io_operation ? 1'h0 : _GEN_120; // @[DM.scala 42:22 48:29]
  wire  _GEN_156 = 3'h0 == io_operation ? 1'h0 : _GEN_125; // @[DM.scala 42:22 48:29]
  assign dataMem_io_output_MPORT_en = io_active & _T;
  assign dataMem_io_output_MPORT_addr = sign ? _signedAddress_T_1 : _signedAddress_T_4[10:0];
  assign dataMem_io_output_MPORT_data = dataMem[dataMem_io_output_MPORT_addr]; // @[DM.scala 42:22]
  assign dataMem_io_output_MPORT_1_en = io_active & _GEN_134;
  assign dataMem_io_output_MPORT_1_addr = sign ? _signedAddress_T_1 : _signedAddress_T_4[10:0];
  assign dataMem_io_output_MPORT_1_data = dataMem[dataMem_io_output_MPORT_1_addr]; // @[DM.scala 42:22]
  assign dataMem_io_output_MPORT_2_en = io_active & _GEN_137;
  assign dataMem_io_output_MPORT_2_addr = sign ? _signedAddress_T_1 : _signedAddress_T_4[10:0];
  assign dataMem_io_output_MPORT_2_data = dataMem[dataMem_io_output_MPORT_2_addr]; // @[DM.scala 42:22]
  assign dataMem_io_output_MPORT_3_en = io_active & _GEN_140;
  assign dataMem_io_output_MPORT_3_addr = _signedAddress_T_4[10:0];
  assign dataMem_io_output_MPORT_3_data = dataMem[dataMem_io_output_MPORT_3_addr]; // @[DM.scala 42:22]
  assign dataMem_io_output_MPORT_4_en = io_active & _GEN_143;
  assign dataMem_io_output_MPORT_4_addr = _signedAddress_T_4[10:0];
  assign dataMem_io_output_MPORT_4_data = dataMem[dataMem_io_output_MPORT_4_addr]; // @[DM.scala 42:22]
  assign dataMem_MPORT_1_en = io_active & _GEN_146;
  assign dataMem_MPORT_1_addr = sign ? _signedAddress_T_1 : _signedAddress_T_4[10:0];
  assign dataMem_MPORT_1_data = dataMem[dataMem_MPORT_1_addr]; // @[DM.scala 42:22]
  assign dataMem_MPORT_3_en = io_active & _GEN_151;
  assign dataMem_MPORT_3_addr = sign ? _signedAddress_T_1 : _signedAddress_T_4[10:0];
  assign dataMem_MPORT_3_data = dataMem[dataMem_MPORT_3_addr]; // @[DM.scala 42:22]
  assign dataMem_MPORT_data = {dataMem_MPORT_1_data[31:8],io_value[7:0]};
  assign dataMem_MPORT_addr = sign ? _signedAddress_T_1 : _signedAddress_T_4[10:0];
  assign dataMem_MPORT_mask = 1'h1;
  assign dataMem_MPORT_en = io_active & _GEN_146;
  assign dataMem_MPORT_2_data = {dataMem_MPORT_3_data[31:16],io_value[15:0]};
  assign dataMem_MPORT_2_addr = sign ? _signedAddress_T_1 : _signedAddress_T_4[10:0];
  assign dataMem_MPORT_2_mask = 1'h1;
  assign dataMem_MPORT_2_en = io_active & _GEN_151;
  assign dataMem_MPORT_4_data = io_value;
  assign dataMem_MPORT_4_addr = sign ? _signedAddress_T_1 : _signedAddress_T_4[10:0];
  assign dataMem_MPORT_4_mask = 1'h1;
  assign dataMem_MPORT_4_en = io_active & _GEN_156;
  assign io_output = io_active ? _GEN_131 : 32'h0; // @[DM.scala 45:14 47:20]
  always @(posedge clock) begin
    if (dataMem_MPORT_en & dataMem_MPORT_mask) begin
      dataMem[dataMem_MPORT_addr] <= dataMem_MPORT_data; // @[DM.scala 42:22]
    end
    if (dataMem_MPORT_2_en & dataMem_MPORT_2_mask) begin
      dataMem[dataMem_MPORT_2_addr] <= dataMem_MPORT_2_data; // @[DM.scala 42:22]
    end
    if (dataMem_MPORT_4_en & dataMem_MPORT_4_mask) begin
      dataMem[dataMem_MPORT_4_addr] <= dataMem_MPORT_4_data; // @[DM.scala 42:22]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2048; initvar = initvar+1)
    dataMem[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module FirstStage(
  input         clock,
  input         reset,
  input  [31:0] io_ALU1_val,
  input  [31:0] io_ALU2_val,
  input  [4:0]  io_ALU_op,
  input         io_writeReg,
  input  [4:0]  io_toReg,
  input         io_writeFrom,
  input         io_useMemory,
  input  [31:0] io_DM_val,
  input  [10:0] io_DM_address,
  input  [31:0] io_DM_imm,
  input  [2:0]  io_DM_operation,
  input         io_newPC,
  input         io_newPC_already_decided,
  input  [31:0] io_PC_1,
  input  [31:0] io_PC_2,
  output        io_newPC_out,
  output [31:0] io_PC_val_out,
  output        io_regWrite,
  output [4:0]  io_regToWrite,
  output [31:0] io_regWriteVal
);
  wire  ALU_clock; // @[stage1.scala 64:17]
  wire  ALU_reset; // @[stage1.scala 64:17]
  wire [31:0] ALU_io_val1; // @[stage1.scala 64:17]
  wire [31:0] ALU_io_val2; // @[stage1.scala 64:17]
  wire [4:0] ALU_io_operation; // @[stage1.scala 64:17]
  wire [31:0] ALU_io_output; // @[stage1.scala 64:17]
  wire  DM_clock; // @[stage1.scala 65:16]
  wire [10:0] DM_io_address; // @[stage1.scala 65:16]
  wire [11:0] DM_io_imm_bits; // @[stage1.scala 65:16]
  wire [31:0] DM_io_value; // @[stage1.scala 65:16]
  wire  DM_io_active; // @[stage1.scala 65:16]
  wire [2:0] DM_io_operation; // @[stage1.scala 65:16]
  wire [31:0] DM_io_output; // @[stage1.scala 65:16]
  wire [31:0] _GEN_2 = {{21'd0}, io_DM_address}; // @[stage1.scala 100:72 101:18 103:18]
  wire [31:0] forwarded_PC_1 = io_newPC ? io_PC_1 : 32'h0; // @[stage1.scala 153:17 152:33]
  wire [31:0] _io_PC_val_out_T_1 = forwarded_PC_1 + io_PC_2; // @[stage1.scala 162:36]
  wire [31:0] _io_PC_val_out_T_5 = forwarded_PC_1 + 32'h1; // @[stage1.scala 172:38]
  wire [31:0] _GEN_6 = ALU_io_output[0] ? _io_PC_val_out_T_1 : _io_PC_val_out_T_5; // @[stage1.scala 169:29 170:22 172:22]
  wire [31:0] _GEN_7 = io_newPC_already_decided ? _io_PC_val_out_T_1 : _GEN_6; // @[stage1.scala 160:35 162:20]
  ALU ALU ( // @[stage1.scala 64:17]
    .clock(ALU_clock),
    .reset(ALU_reset),
    .io_val1(ALU_io_val1),
    .io_val2(ALU_io_val2),
    .io_operation(ALU_io_operation),
    .io_output(ALU_io_output)
  );
  DM DM ( // @[stage1.scala 65:16]
    .clock(DM_clock),
    .io_address(DM_io_address),
    .io_imm_bits(DM_io_imm_bits),
    .io_value(DM_io_value),
    .io_active(DM_io_active),
    .io_operation(DM_io_operation),
    .io_output(DM_io_output)
  );
  assign io_newPC_out = io_newPC; // @[stage1.scala 149:15]
  assign io_PC_val_out = io_newPC ? _GEN_7 : 32'h0; // @[stage1.scala 150:16 153:17]
  assign io_regWrite = io_writeReg; // @[stage1.scala 125:14]
  assign io_regToWrite = io_toReg; // @[stage1.scala 126:16]
  assign io_regWriteVal = io_writeFrom ? ALU_io_output : DM_io_output; // @[stage1.scala 127:21 128:19 130:19]
  assign ALU_clock = clock;
  assign ALU_reset = reset;
  assign ALU_io_val1 = io_ALU1_val; // @[stage1.scala 69:66 70:16 72:16]
  assign ALU_io_val2 = io_ALU2_val; // @[stage1.scala 75:66 76:16 78:16]
  assign ALU_io_operation = io_ALU_op; // @[stage1.scala 80:19]
  assign DM_clock = clock;
  assign DM_io_address = _GEN_2[10:0];
  assign DM_io_imm_bits = io_DM_imm[11:0]; // @[stage1.scala 96:17]
  assign DM_io_value = io_DM_val; // @[stage1.scala 105:68 106:16 108:16]
  assign DM_io_active = io_useMemory; // @[stage1.scala 97:15]
  assign DM_io_operation = io_DM_operation; // @[stage1.scala 98:18]
endmodule
module IM(
  input  [9:0]  io_address,
  output [31:0] io_data
);
  wire [31:0] _GEN_1 = 7'h1 == io_address[6:0] ? 32'h113 : 32'h93; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_2 = 7'h2 == io_address[6:0] ? 32'h208f33 : _GEN_1; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_3 = 7'h3 == io_address[6:0] ? 32'he93 : _GEN_2; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_4 = 7'h4 == io_address[6:0] ? 32'h200193 : _GEN_3; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_5 = 7'h5 == io_address[6:0] ? 32'h1ddf1a63 : _GEN_4; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_6 = 7'h6 == io_address[6:0] ? 32'h100093 : _GEN_5; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_7 = 7'h7 == io_address[6:0] ? 32'h100113 : _GEN_6; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_8 = 7'h8 == io_address[6:0] ? 32'h208f33 : _GEN_7; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_9 = 7'h9 == io_address[6:0] ? 32'h200e93 : _GEN_8; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_10 = 7'ha == io_address[6:0] ? 32'h300193 : _GEN_9; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_11 = 7'hb == io_address[6:0] ? 32'h1bdf1e63 : _GEN_10; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_12 = 7'hc == io_address[6:0] ? 32'h300093 : _GEN_11; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_13 = 7'hd == io_address[6:0] ? 32'h700113 : _GEN_12; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_14 = 7'he == io_address[6:0] ? 32'h208f33 : _GEN_13; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_15 = 7'hf == io_address[6:0] ? 32'ha00e93 : _GEN_14; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_16 = 7'h10 == io_address[6:0] ? 32'h400193 : _GEN_15; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_17 = 7'h11 == io_address[6:0] ? 32'h1bdf1263 : _GEN_16; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_18 = 7'h12 == io_address[6:0] ? 32'h93 : _GEN_17; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_19 = 7'h13 == io_address[6:0] ? 32'hffff8137 : _GEN_18; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_20 = 7'h14 == io_address[6:0] ? 32'h208f33 : _GEN_19; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_21 = 7'h15 == io_address[6:0] ? 32'hffff8eb7 : _GEN_20; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_22 = 7'h16 == io_address[6:0] ? 32'h500193 : _GEN_21; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_23 = 7'h17 == io_address[6:0] ? 32'h19df1663 : _GEN_22; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_24 = 7'h18 == io_address[6:0] ? 32'h800000b7 : _GEN_23; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_25 = 7'h19 == io_address[6:0] ? 32'h113 : _GEN_24; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_26 = 7'h1a == io_address[6:0] ? 32'h208f33 : _GEN_25; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_27 = 7'h1b == io_address[6:0] ? 32'h80000eb7 : _GEN_26; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_28 = 7'h1c == io_address[6:0] ? 32'h600193 : _GEN_27; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_29 = 7'h1d == io_address[6:0] ? 32'h17df1a63 : _GEN_28; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_30 = 7'h1e == io_address[6:0] ? 32'h800000b7 : _GEN_29; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_31 = 7'h1f == io_address[6:0] ? 32'hffff8137 : _GEN_30; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_32 = 7'h20 == io_address[6:0] ? 32'h208f33 : _GEN_31; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_33 = 7'h21 == io_address[6:0] ? 32'h7fff8eb7 : _GEN_32; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_34 = 7'h22 == io_address[6:0] ? 32'h700193 : _GEN_33; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_35 = 7'h23 == io_address[6:0] ? 32'h15df1e63 : _GEN_34; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_36 = 7'h24 == io_address[6:0] ? 32'h93 : _GEN_35; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_37 = 7'h25 == io_address[6:0] ? 32'h8137 : _GEN_36; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_38 = 7'h26 == io_address[6:0] ? 32'hfff10113 : _GEN_37; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_39 = 7'h27 == io_address[6:0] ? 32'h208f33 : _GEN_38; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_40 = 7'h28 == io_address[6:0] ? 32'h8eb7 : _GEN_39; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_41 = 7'h29 == io_address[6:0] ? 32'hfffe8e93 : _GEN_40; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_42 = 7'h2a == io_address[6:0] ? 32'h800193 : _GEN_41; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_43 = 7'h2b == io_address[6:0] ? 32'h13df1e63 : _GEN_42; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_44 = 7'h2c == io_address[6:0] ? 32'h800000b7 : _GEN_43; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_45 = 7'h2d == io_address[6:0] ? 32'hfff08093 : _GEN_44; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_46 = 7'h2e == io_address[6:0] ? 32'h113 : _GEN_45; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_47 = 7'h2f == io_address[6:0] ? 32'h208f33 : _GEN_46; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_48 = 7'h30 == io_address[6:0] ? 32'h80000eb7 : _GEN_47; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_49 = 7'h31 == io_address[6:0] ? 32'hfffe8e93 : _GEN_48; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_50 = 7'h32 == io_address[6:0] ? 32'h900193 : _GEN_49; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_51 = 7'h33 == io_address[6:0] ? 32'h11df1e63 : _GEN_50; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_52 = 7'h34 == io_address[6:0] ? 32'h800000b7 : _GEN_51; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_53 = 7'h35 == io_address[6:0] ? 32'hfff08093 : _GEN_52; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_54 = 7'h36 == io_address[6:0] ? 32'h8137 : _GEN_53; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_55 = 7'h37 == io_address[6:0] ? 32'hfff10113 : _GEN_54; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_56 = 7'h38 == io_address[6:0] ? 32'h208f33 : _GEN_55; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_57 = 7'h39 == io_address[6:0] ? 32'h80008eb7 : _GEN_56; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_58 = 7'h3a == io_address[6:0] ? 32'hffee8e93 : _GEN_57; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_59 = 7'h3b == io_address[6:0] ? 32'ha00193 : _GEN_58; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_60 = 7'h3c == io_address[6:0] ? 32'hfdf1c63 : _GEN_59; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_61 = 7'h3d == io_address[6:0] ? 32'h800000b7 : _GEN_60; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_62 = 7'h3e == io_address[6:0] ? 32'h8137 : _GEN_61; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_63 = 7'h3f == io_address[6:0] ? 32'hfff10113 : _GEN_62; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_64 = 7'h40 == io_address[6:0] ? 32'h208f33 : _GEN_63; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_65 = 7'h41 == io_address[6:0] ? 32'h80008eb7 : _GEN_64; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_66 = 7'h42 == io_address[6:0] ? 32'hfffe8e93 : _GEN_65; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_67 = 7'h43 == io_address[6:0] ? 32'hb00193 : _GEN_66; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_68 = 7'h44 == io_address[6:0] ? 32'hddf1c63 : _GEN_67; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_69 = 7'h45 == io_address[6:0] ? 32'h800000b7 : _GEN_68; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_70 = 7'h46 == io_address[6:0] ? 32'hfff08093 : _GEN_69; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_71 = 7'h47 == io_address[6:0] ? 32'hffff8137 : _GEN_70; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_72 = 7'h48 == io_address[6:0] ? 32'h208f33 : _GEN_71; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_73 = 7'h49 == io_address[6:0] ? 32'h7fff8eb7 : _GEN_72; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_74 = 7'h4a == io_address[6:0] ? 32'hfffe8e93 : _GEN_73; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_75 = 7'h4b == io_address[6:0] ? 32'hc00193 : _GEN_74; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_76 = 7'h4c == io_address[6:0] ? 32'hbdf1c63 : _GEN_75; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_77 = 7'h4d == io_address[6:0] ? 32'h93 : _GEN_76; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_78 = 7'h4e == io_address[6:0] ? 32'hfff00113 : _GEN_77; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_79 = 7'h4f == io_address[6:0] ? 32'h208f33 : _GEN_78; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_80 = 7'h50 == io_address[6:0] ? 32'hfff00e93 : _GEN_79; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_81 = 7'h51 == io_address[6:0] ? 32'hd00193 : _GEN_80; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_82 = 7'h52 == io_address[6:0] ? 32'hbdf1063 : _GEN_81; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_83 = 7'h53 == io_address[6:0] ? 32'hfff00093 : _GEN_82; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_84 = 7'h54 == io_address[6:0] ? 32'h100113 : _GEN_83; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_85 = 7'h55 == io_address[6:0] ? 32'h208f33 : _GEN_84; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_86 = 7'h56 == io_address[6:0] ? 32'he93 : _GEN_85; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_87 = 7'h57 == io_address[6:0] ? 32'he00193 : _GEN_86; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_88 = 7'h58 == io_address[6:0] ? 32'h9df1463 : _GEN_87; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_89 = 7'h59 == io_address[6:0] ? 32'hfff00093 : _GEN_88; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_90 = 7'h5a == io_address[6:0] ? 32'hfff00113 : _GEN_89; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_91 = 7'h5b == io_address[6:0] ? 32'h208f33 : _GEN_90; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_92 = 7'h5c == io_address[6:0] ? 32'hffe00e93 : _GEN_91; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_93 = 7'h5d == io_address[6:0] ? 32'hf00193 : _GEN_92; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_94 = 7'h5e == io_address[6:0] ? 32'h7df1863 : _GEN_93; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_95 = 7'h5f == io_address[6:0] ? 32'h100093 : _GEN_94; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_96 = 7'h60 == io_address[6:0] ? 32'h80000137 : _GEN_95; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_97 = 7'h61 == io_address[6:0] ? 32'hfff10113 : _GEN_96; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_98 = 7'h62 == io_address[6:0] ? 32'h208f33 : _GEN_97; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_99 = 7'h63 == io_address[6:0] ? 32'h80000eb7 : _GEN_98; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_100 = 7'h64 == io_address[6:0] ? 32'h1000193 : _GEN_99; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_101 = 7'h65 == io_address[6:0] ? 32'h5df1a63 : _GEN_100; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_102 = 7'h66 == io_address[6:0] ? 32'hd00093 : _GEN_101; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_103 = 7'h67 == io_address[6:0] ? 32'hb00113 : _GEN_102; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_104 = 7'h68 == io_address[6:0] ? 32'h2080b3 : _GEN_103; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_105 = 7'h69 == io_address[6:0] ? 32'h1800e93 : _GEN_104; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_106 = 7'h6a == io_address[6:0] ? 32'h1100193 : _GEN_105; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_107 = 7'h6b == io_address[6:0] ? 32'h3d09e63 : _GEN_106; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_108 = 7'h6c == io_address[6:0] ? 32'he00093 : _GEN_107; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_109 = 7'h6d == io_address[6:0] ? 32'hb00113 : _GEN_108; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_110 = 7'h6e == io_address[6:0] ? 32'h208133 : _GEN_109; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_111 = 7'h6f == io_address[6:0] ? 32'h1900e93 : _GEN_110; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_112 = 7'h70 == io_address[6:0] ? 32'h1200193 : _GEN_111; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_113 = 7'h71 == io_address[6:0] ? 32'h3d11263 : _GEN_112; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_114 = 7'h72 == io_address[6:0] ? 32'hd00093 : _GEN_113; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_115 = 7'h73 == io_address[6:0] ? 32'h1080b3 : _GEN_114; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_116 = 7'h74 == io_address[6:0] ? 32'h1a00e93 : _GEN_115; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_117 = 7'h75 == io_address[6:0] ? 32'h1300193 : _GEN_116; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_118 = 7'h76 == io_address[6:0] ? 32'h1d09863 : _GEN_117; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_119 = 7'h77 == io_address[6:0] ? 32'h513 : _GEN_118; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_120 = 7'h78 == io_address[6:0] ? 32'h5d00893 : _GEN_119; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_121 = 7'h79 == io_address[6:0] ? 32'h73 : _GEN_120; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_122 = 7'h7a == io_address[6:0] ? 32'h100513 : _GEN_121; // @[Utils.scala 16:{45,45}]
  wire [31:0] _GEN_123 = 7'h7b == io_address[6:0] ? 32'h5d00893 : _GEN_122; // @[Utils.scala 16:{45,45}]
  assign io_data = 7'h7c == io_address[6:0] ? 32'h73 : _GEN_123; // @[InstructionMemory.scala 35:{12,12}]
endmodule
module SecondStage(
  input         clock,
  input         reset,
  input         io_newPC,
  input  [31:0] io_PCIn,
  output [31:0] io_instruction,
  output [31:0] io_PC_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire [9:0] IM_io_address; // @[stage2.scala 31:18]
  wire [31:0] IM_io_data; // @[stage2.scala 31:18]
  reg  waiting; // @[stage2.scala 29:26]
  reg [31:0] PC; // @[stage2.scala 30:19]
  wire  _T_3 = IM_io_data[6:0] == 7'h6f; // @[stage2.scala 52:37]
  wire  _T_4 = IM_io_data[6:0] == 7'h63 | _T_3; // @[stage2.scala 51:52]
  wire  _T_6 = IM_io_data[6:0] == 7'h67; // @[stage2.scala 53:37]
  wire  _T_7 = _T_4 | _T_6; // @[stage2.scala 52:52]
  wire [31:0] _PC_T_1 = PC + 32'h1; // @[stage2.scala 56:19]
  wire  _GEN_2 = _T_7 | waiting; // @[stage2.scala 53:53 54:20 29:26]
  IM IM ( // @[stage2.scala 31:18]
    .io_address(IM_io_address),
    .io_data(IM_io_data)
  );
  assign io_instruction = waiting ? 32'h13 : IM_io_data; // @[stage2.scala 40:18 43:23 49:23]
  assign io_PC_out = PC; // @[stage2.scala 34:14]
  assign IM_io_address = PC[9:0]; // @[stage2.scala 32:18]
  always @(posedge clock) begin
    if (reset) begin // @[stage2.scala 29:26]
      waiting <= 1'h0; // @[stage2.scala 29:26]
    end else if (waiting) begin // @[stage2.scala 40:18]
      if (io_newPC) begin // @[stage2.scala 44:23]
        waiting <= 1'h0; // @[stage2.scala 46:20]
      end
    end else begin
      waiting <= _GEN_2;
    end
    if (reset) begin // @[stage2.scala 30:19]
      PC <= 32'h0; // @[stage2.scala 30:19]
    end else if (waiting) begin // @[stage2.scala 40:18]
      if (io_newPC) begin // @[stage2.scala 44:23]
        PC <= io_PCIn; // @[stage2.scala 45:15]
      end
    end else if (!(_T_7)) begin // @[stage2.scala 53:53]
      PC <= _PC_T_1; // @[stage2.scala 56:15]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  waiting = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  PC = _RAND_1[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ThirdStage(
  input         clock,
  input         reset,
  input  [31:0] io_instruction,
  input  [31:0] io_PC,
  input         io_regWrite,
  input  [4:0]  io_regToWrite,
  input  [31:0] io_regWriteVal,
  output [31:0] io_ALU1_val,
  output [31:0] io_ALU2_val,
  output [4:0]  io_ALU_op,
  output        io_writeReg,
  output [4:0]  io_toReg,
  output        io_writeFrom,
  output        io_useMemory,
  output [31:0] io_DM_val,
  output [10:0] io_DM_address,
  output [31:0] io_DM_imm,
  output [2:0]  io_DM_operation,
  output        io_newPC,
  output        io_newPC_already_decided,
  output [31:0] io_PC_1,
  output [31:0] io_PC_2,
  output [31:0] io_regs_0,
  output [31:0] io_regs_1,
  output [31:0] io_regs_2,
  output [31:0] io_regs_3,
  output [31:0] io_regs_4,
  output [31:0] io_regs_5,
  output [31:0] io_regs_6,
  output [31:0] io_regs_7,
  output [31:0] io_regs_8,
  output [31:0] io_regs_9,
  output [31:0] io_regs_10,
  output [31:0] io_regs_11,
  output [31:0] io_regs_12,
  output [31:0] io_regs_13,
  output [31:0] io_regs_14,
  output [31:0] io_regs_15,
  output [31:0] io_regs_16,
  output [31:0] io_regs_17,
  output [31:0] io_regs_18,
  output [31:0] io_regs_19,
  output [31:0] io_regs_20,
  output [31:0] io_regs_21,
  output [31:0] io_regs_22,
  output [31:0] io_regs_23,
  output [31:0] io_regs_24,
  output [31:0] io_regs_25,
  output [31:0] io_regs_26,
  output [31:0] io_regs_27,
  output [31:0] io_regs_28,
  output [31:0] io_regs_29,
  output [31:0] io_regs_30,
  output [31:0] io_regs_31
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] regs_0; // @[stage3.scala 59:21]
  reg [31:0] regs_1; // @[stage3.scala 59:21]
  reg [31:0] regs_2; // @[stage3.scala 59:21]
  reg [31:0] regs_3; // @[stage3.scala 59:21]
  reg [31:0] regs_4; // @[stage3.scala 59:21]
  reg [31:0] regs_5; // @[stage3.scala 59:21]
  reg [31:0] regs_6; // @[stage3.scala 59:21]
  reg [31:0] regs_7; // @[stage3.scala 59:21]
  reg [31:0] regs_8; // @[stage3.scala 59:21]
  reg [31:0] regs_9; // @[stage3.scala 59:21]
  reg [31:0] regs_10; // @[stage3.scala 59:21]
  reg [31:0] regs_11; // @[stage3.scala 59:21]
  reg [31:0] regs_12; // @[stage3.scala 59:21]
  reg [31:0] regs_13; // @[stage3.scala 59:21]
  reg [31:0] regs_14; // @[stage3.scala 59:21]
  reg [31:0] regs_15; // @[stage3.scala 59:21]
  reg [31:0] regs_16; // @[stage3.scala 59:21]
  reg [31:0] regs_17; // @[stage3.scala 59:21]
  reg [31:0] regs_18; // @[stage3.scala 59:21]
  reg [31:0] regs_19; // @[stage3.scala 59:21]
  reg [31:0] regs_20; // @[stage3.scala 59:21]
  reg [31:0] regs_21; // @[stage3.scala 59:21]
  reg [31:0] regs_22; // @[stage3.scala 59:21]
  reg [31:0] regs_23; // @[stage3.scala 59:21]
  reg [31:0] regs_24; // @[stage3.scala 59:21]
  reg [31:0] regs_25; // @[stage3.scala 59:21]
  reg [31:0] regs_26; // @[stage3.scala 59:21]
  reg [31:0] regs_27; // @[stage3.scala 59:21]
  reg [31:0] regs_28; // @[stage3.scala 59:21]
  reg [31:0] regs_29; // @[stage3.scala 59:21]
  reg [31:0] regs_30; // @[stage3.scala 59:21]
  reg [31:0] regs_31; // @[stage3.scala 59:21]
  wire [31:0] _GEN_65 = 5'h1 == io_instruction[19:15] ? regs_1 : regs_0; // @[stage3.scala 101:{20,20}]
  wire [31:0] _GEN_66 = 5'h2 == io_instruction[19:15] ? regs_2 : _GEN_65; // @[stage3.scala 101:{20,20}]
  wire [31:0] _GEN_67 = 5'h3 == io_instruction[19:15] ? regs_3 : _GEN_66; // @[stage3.scala 101:{20,20}]
  wire [31:0] _GEN_68 = 5'h4 == io_instruction[19:15] ? regs_4 : _GEN_67; // @[stage3.scala 101:{20,20}]
  wire [31:0] _GEN_69 = 5'h5 == io_instruction[19:15] ? regs_5 : _GEN_68; // @[stage3.scala 101:{20,20}]
  wire [31:0] _GEN_70 = 5'h6 == io_instruction[19:15] ? regs_6 : _GEN_69; // @[stage3.scala 101:{20,20}]
  wire [31:0] _GEN_71 = 5'h7 == io_instruction[19:15] ? regs_7 : _GEN_70; // @[stage3.scala 101:{20,20}]
  wire [31:0] _GEN_72 = 5'h8 == io_instruction[19:15] ? regs_8 : _GEN_71; // @[stage3.scala 101:{20,20}]
  wire [31:0] _GEN_73 = 5'h9 == io_instruction[19:15] ? regs_9 : _GEN_72; // @[stage3.scala 101:{20,20}]
  wire [31:0] _GEN_74 = 5'ha == io_instruction[19:15] ? regs_10 : _GEN_73; // @[stage3.scala 101:{20,20}]
  wire [31:0] _GEN_75 = 5'hb == io_instruction[19:15] ? regs_11 : _GEN_74; // @[stage3.scala 101:{20,20}]
  wire [31:0] _GEN_76 = 5'hc == io_instruction[19:15] ? regs_12 : _GEN_75; // @[stage3.scala 101:{20,20}]
  wire [31:0] _GEN_77 = 5'hd == io_instruction[19:15] ? regs_13 : _GEN_76; // @[stage3.scala 101:{20,20}]
  wire [31:0] _GEN_78 = 5'he == io_instruction[19:15] ? regs_14 : _GEN_77; // @[stage3.scala 101:{20,20}]
  wire [31:0] _GEN_79 = 5'hf == io_instruction[19:15] ? regs_15 : _GEN_78; // @[stage3.scala 101:{20,20}]
  wire [31:0] _GEN_80 = 5'h10 == io_instruction[19:15] ? regs_16 : _GEN_79; // @[stage3.scala 101:{20,20}]
  wire [31:0] _GEN_81 = 5'h11 == io_instruction[19:15] ? regs_17 : _GEN_80; // @[stage3.scala 101:{20,20}]
  wire [31:0] _GEN_82 = 5'h12 == io_instruction[19:15] ? regs_18 : _GEN_81; // @[stage3.scala 101:{20,20}]
  wire [31:0] _GEN_83 = 5'h13 == io_instruction[19:15] ? regs_19 : _GEN_82; // @[stage3.scala 101:{20,20}]
  wire [31:0] _GEN_84 = 5'h14 == io_instruction[19:15] ? regs_20 : _GEN_83; // @[stage3.scala 101:{20,20}]
  wire [31:0] _GEN_85 = 5'h15 == io_instruction[19:15] ? regs_21 : _GEN_84; // @[stage3.scala 101:{20,20}]
  wire [31:0] _GEN_86 = 5'h16 == io_instruction[19:15] ? regs_22 : _GEN_85; // @[stage3.scala 101:{20,20}]
  wire [31:0] _GEN_87 = 5'h17 == io_instruction[19:15] ? regs_23 : _GEN_86; // @[stage3.scala 101:{20,20}]
  wire [31:0] _GEN_88 = 5'h18 == io_instruction[19:15] ? regs_24 : _GEN_87; // @[stage3.scala 101:{20,20}]
  wire [31:0] _GEN_89 = 5'h19 == io_instruction[19:15] ? regs_25 : _GEN_88; // @[stage3.scala 101:{20,20}]
  wire [31:0] _GEN_90 = 5'h1a == io_instruction[19:15] ? regs_26 : _GEN_89; // @[stage3.scala 101:{20,20}]
  wire [31:0] _GEN_91 = 5'h1b == io_instruction[19:15] ? regs_27 : _GEN_90; // @[stage3.scala 101:{20,20}]
  wire [31:0] _GEN_92 = 5'h1c == io_instruction[19:15] ? regs_28 : _GEN_91; // @[stage3.scala 101:{20,20}]
  wire [31:0] _GEN_93 = 5'h1d == io_instruction[19:15] ? regs_29 : _GEN_92; // @[stage3.scala 101:{20,20}]
  wire [31:0] _GEN_94 = 5'h1e == io_instruction[19:15] ? regs_30 : _GEN_93; // @[stage3.scala 101:{20,20}]
  wire [31:0] _GEN_95 = 5'h1f == io_instruction[19:15] ? regs_31 : _GEN_94; // @[stage3.scala 101:{20,20}]
  wire [31:0] _GEN_97 = 5'h1 == io_instruction[24:20] ? regs_1 : regs_0; // @[stage3.scala 103:{20,20}]
  wire [31:0] _GEN_98 = 5'h2 == io_instruction[24:20] ? regs_2 : _GEN_97; // @[stage3.scala 103:{20,20}]
  wire [31:0] _GEN_99 = 5'h3 == io_instruction[24:20] ? regs_3 : _GEN_98; // @[stage3.scala 103:{20,20}]
  wire [31:0] _GEN_100 = 5'h4 == io_instruction[24:20] ? regs_4 : _GEN_99; // @[stage3.scala 103:{20,20}]
  wire [31:0] _GEN_101 = 5'h5 == io_instruction[24:20] ? regs_5 : _GEN_100; // @[stage3.scala 103:{20,20}]
  wire [31:0] _GEN_102 = 5'h6 == io_instruction[24:20] ? regs_6 : _GEN_101; // @[stage3.scala 103:{20,20}]
  wire [31:0] _GEN_103 = 5'h7 == io_instruction[24:20] ? regs_7 : _GEN_102; // @[stage3.scala 103:{20,20}]
  wire [31:0] _GEN_104 = 5'h8 == io_instruction[24:20] ? regs_8 : _GEN_103; // @[stage3.scala 103:{20,20}]
  wire [31:0] _GEN_105 = 5'h9 == io_instruction[24:20] ? regs_9 : _GEN_104; // @[stage3.scala 103:{20,20}]
  wire [31:0] _GEN_106 = 5'ha == io_instruction[24:20] ? regs_10 : _GEN_105; // @[stage3.scala 103:{20,20}]
  wire [31:0] _GEN_107 = 5'hb == io_instruction[24:20] ? regs_11 : _GEN_106; // @[stage3.scala 103:{20,20}]
  wire [31:0] _GEN_108 = 5'hc == io_instruction[24:20] ? regs_12 : _GEN_107; // @[stage3.scala 103:{20,20}]
  wire [31:0] _GEN_109 = 5'hd == io_instruction[24:20] ? regs_13 : _GEN_108; // @[stage3.scala 103:{20,20}]
  wire [31:0] _GEN_110 = 5'he == io_instruction[24:20] ? regs_14 : _GEN_109; // @[stage3.scala 103:{20,20}]
  wire [31:0] _GEN_111 = 5'hf == io_instruction[24:20] ? regs_15 : _GEN_110; // @[stage3.scala 103:{20,20}]
  wire [31:0] _GEN_112 = 5'h10 == io_instruction[24:20] ? regs_16 : _GEN_111; // @[stage3.scala 103:{20,20}]
  wire [31:0] _GEN_113 = 5'h11 == io_instruction[24:20] ? regs_17 : _GEN_112; // @[stage3.scala 103:{20,20}]
  wire [31:0] _GEN_114 = 5'h12 == io_instruction[24:20] ? regs_18 : _GEN_113; // @[stage3.scala 103:{20,20}]
  wire [31:0] _GEN_115 = 5'h13 == io_instruction[24:20] ? regs_19 : _GEN_114; // @[stage3.scala 103:{20,20}]
  wire [31:0] _GEN_116 = 5'h14 == io_instruction[24:20] ? regs_20 : _GEN_115; // @[stage3.scala 103:{20,20}]
  wire [31:0] _GEN_117 = 5'h15 == io_instruction[24:20] ? regs_21 : _GEN_116; // @[stage3.scala 103:{20,20}]
  wire [31:0] _GEN_118 = 5'h16 == io_instruction[24:20] ? regs_22 : _GEN_117; // @[stage3.scala 103:{20,20}]
  wire [31:0] _GEN_119 = 5'h17 == io_instruction[24:20] ? regs_23 : _GEN_118; // @[stage3.scala 103:{20,20}]
  wire [31:0] _GEN_120 = 5'h18 == io_instruction[24:20] ? regs_24 : _GEN_119; // @[stage3.scala 103:{20,20}]
  wire [31:0] _GEN_121 = 5'h19 == io_instruction[24:20] ? regs_25 : _GEN_120; // @[stage3.scala 103:{20,20}]
  wire [31:0] _GEN_122 = 5'h1a == io_instruction[24:20] ? regs_26 : _GEN_121; // @[stage3.scala 103:{20,20}]
  wire [31:0] _GEN_123 = 5'h1b == io_instruction[24:20] ? regs_27 : _GEN_122; // @[stage3.scala 103:{20,20}]
  wire [31:0] _GEN_124 = 5'h1c == io_instruction[24:20] ? regs_28 : _GEN_123; // @[stage3.scala 103:{20,20}]
  wire [31:0] _GEN_125 = 5'h1d == io_instruction[24:20] ? regs_29 : _GEN_124; // @[stage3.scala 103:{20,20}]
  wire [31:0] _GEN_126 = 5'h1e == io_instruction[24:20] ? regs_30 : _GEN_125; // @[stage3.scala 103:{20,20}]
  wire [31:0] _GEN_127 = 5'h1f == io_instruction[24:20] ? regs_31 : _GEN_126; // @[stage3.scala 103:{20,20}]
  wire  _T_3 = 3'h0 == io_instruction[14:12]; // @[stage3.scala 105:34]
  wire  _T_5 = io_instruction[31:25] == 7'h20; // @[stage3.scala 107:35]
  wire  _T_6 = 3'h4 == io_instruction[14:12]; // @[stage3.scala 105:34]
  wire  _T_7 = 3'h6 == io_instruction[14:12]; // @[stage3.scala 105:34]
  wire  _T_8 = 3'h7 == io_instruction[14:12]; // @[stage3.scala 105:34]
  wire  _T_9 = 3'h1 == io_instruction[14:12]; // @[stage3.scala 105:34]
  wire  _T_10 = 3'h5 == io_instruction[14:12]; // @[stage3.scala 105:34]
  wire [2:0] _GEN_129 = _T_5 ? 3'h7 : 3'h6; // @[stage3.scala 131:50 133:24 136:24]
  wire  _T_13 = 3'h2 == io_instruction[14:12]; // @[stage3.scala 105:34]
  wire  _T_14 = 3'h3 == io_instruction[14:12]; // @[stage3.scala 105:34]
  wire [3:0] _GEN_130 = 3'h3 == io_instruction[14:12] ? 4'h9 : 4'h0; // @[stage3.scala 105:34 144:22 77:11]
  wire [3:0] _GEN_131 = 3'h2 == io_instruction[14:12] ? 4'h8 : _GEN_130; // @[stage3.scala 105:34 141:22]
  wire [3:0] _GEN_132 = 3'h5 == io_instruction[14:12] ? {{1'd0}, _GEN_129} : _GEN_131; // @[stage3.scala 105:34]
  wire [3:0] _GEN_133 = 3'h1 == io_instruction[14:12] ? 4'h5 : _GEN_132; // @[stage3.scala 105:34 128:20]
  wire [3:0] _GEN_134 = 3'h7 == io_instruction[14:12] ? 4'h4 : _GEN_133; // @[stage3.scala 105:34 124:20]
  wire [3:0] _GEN_135 = 3'h6 == io_instruction[14:12] ? 4'h3 : _GEN_134; // @[stage3.scala 105:34 120:20]
  wire [3:0] _GEN_136 = 3'h4 == io_instruction[14:12] ? 4'h2 : _GEN_135; // @[stage3.scala 105:34 116:22]
  wire [3:0] _GEN_137 = 3'h0 == io_instruction[14:12] ? {{3'd0}, _T_5} : _GEN_136; // @[stage3.scala 105:34]
  wire [19:0] _io_ALU2_val_T_3 = io_instruction[31] ? 20'hfffff : 20'h0; // @[Bitwise.scala 77:12]
  wire [31:0] _io_ALU2_val_T_5 = {_io_ALU2_val_T_3,io_instruction[31:20]}; // @[Cat.scala 33:92]
  wire [2:0] _GEN_170 = _io_ALU2_val_T_5[11] ? 3'h7 : 3'h6; // @[stage3.scala 193:48 195:22 198:22]
  wire [2:0] _GEN_171 = _T_9 ? _GEN_170 : 3'h0; // @[stage3.scala 176:34 77:11]
  wire [2:0] _GEN_172 = _T_8 ? 3'h4 : _GEN_171; // @[stage3.scala 176:34 189:20]
  wire [2:0] _GEN_173 = _T_7 ? 3'h3 : _GEN_172; // @[stage3.scala 176:34 186:20]
  wire [2:0] _GEN_174 = _T_6 ? 3'h2 : _GEN_173; // @[stage3.scala 176:34 182:20]
  wire [2:0] _GEN_175 = _T_3 ? 3'h0 : _GEN_174; // @[stage3.scala 176:34 178:20]
  wire [2:0] _io_DM_operation_T_3 = 3'h5 + io_instruction[14:12]; // @[stage3.scala 282:29]
  wire [3:0] _GEN_336 = _T_8 ? 4'hf : 4'h0; // @[stage3.scala 298:18 300:38 323:30]
  wire [3:0] _GEN_337 = _T_7 ? 4'he : _GEN_336; // @[stage3.scala 300:38 320:28]
  wire [3:0] _GEN_338 = _T_10 ? 4'hd : _GEN_337; // @[stage3.scala 300:38 317:28]
  wire [3:0] _GEN_339 = _T_6 ? 4'hc : _GEN_338; // @[stage3.scala 300:38 314:28]
  wire [3:0] _GEN_340 = _T_14 ? 4'h0 : _GEN_339; // @[stage3.scala 298:18 300:38]
  wire [3:0] _GEN_341 = _T_13 ? 4'h0 : _GEN_340; // @[stage3.scala 298:18 300:38]
  wire [3:0] _GEN_342 = _T_9 ? 4'hb : _GEN_341; // @[stage3.scala 300:38 305:28]
  wire [3:0] _GEN_343 = _T_3 ? 4'ha : _GEN_342; // @[stage3.scala 300:38 302:28]
  wire [31:0] _io_PC_2_T_4 = {21'h0,io_instruction[31],io_instruction[7],io_instruction[30:25],io_instruction[11:9]}; // @[Cat.scala 33:92]
  wire [31:0] _io_PC_2_T_9 = {11'h0,io_instruction[31],io_instruction[19:12],io_instruction[20],io_instruction[30:21],1'h0
    }; // @[Cat.scala 33:92]
  wire [19:0] _io_ALU1_val_T_4 = {io_instruction[31:24],12'h0}; // @[Cat.scala 33:92]
  wire [31:0] _GEN_501 = {_io_ALU1_val_T_4, 12'h0}; // @[stage3.scala 401:38]
  wire [34:0] _io_ALU1_val_T_5 = {{3'd0}, _GEN_501}; // @[stage3.scala 401:38]
  wire [34:0] _GEN_377 = 7'h17 == io_instruction[6:0] ? _io_ALU1_val_T_5 : 35'h0; // @[stage3.scala 428:20 73:13 98:28]
  wire [31:0] _GEN_379 = 7'h17 == io_instruction[6:0] ? io_PC : 32'h0; // @[stage3.scala 430:20 75:13 98:28]
  wire [4:0] _GEN_380 = 7'h17 == io_instruction[6:0] ? io_instruction[11:7] : 5'h0; // @[stage3.scala 436:17 80:10 98:28]
  wire  _GEN_381 = 7'h37 == io_instruction[6:0] | 7'h17 == io_instruction[6:0]; // @[stage3.scala 400:18 98:28]
  wire [34:0] _GEN_382 = 7'h37 == io_instruction[6:0] ? _io_ALU1_val_T_5 : _GEN_377; // @[stage3.scala 401:20 98:28]
  wire [31:0] _GEN_384 = 7'h37 == io_instruction[6:0] ? 32'h0 : _GEN_379; // @[stage3.scala 403:20 98:28]
  wire [4:0] _GEN_385 = 7'h37 == io_instruction[6:0] ? io_instruction[11:7] : _GEN_380; // @[stage3.scala 409:17 98:28]
  wire  _GEN_386 = 7'h67 == io_instruction[6:0] | _GEN_381; // @[stage3.scala 373:18 98:28]
  wire [34:0] _GEN_387 = 7'h67 == io_instruction[6:0] ? {{3'd0}, io_PC} : _GEN_382; // @[stage3.scala 374:20 98:28]
  wire [31:0] _GEN_389 = 7'h67 == io_instruction[6:0] ? 32'h4 : _GEN_384; // @[stage3.scala 376:20 98:28]
  wire [4:0] _GEN_390 = 7'h67 == io_instruction[6:0] ? io_instruction[11:7] : _GEN_385; // @[stage3.scala 382:17 98:28]
  wire [31:0] _GEN_392 = 7'h67 == io_instruction[6:0] ? _GEN_95 : 32'h0; // @[stage3.scala 395:16 98:28]
  wire [31:0] _GEN_394 = 7'h67 == io_instruction[6:0] ? _io_PC_2_T_9 : 32'h0; // @[stage3.scala 397:16 98:28]
  wire  _GEN_395 = 7'h6f == io_instruction[6:0] | _GEN_386; // @[stage3.scala 346:18 98:28]
  wire [34:0] _GEN_396 = 7'h6f == io_instruction[6:0] ? {{3'd0}, io_PC} : _GEN_387; // @[stage3.scala 347:20 98:28]
  wire [31:0] _GEN_398 = 7'h6f == io_instruction[6:0] ? 32'h4 : _GEN_389; // @[stage3.scala 349:20 98:28]
  wire [4:0] _GEN_399 = 7'h6f == io_instruction[6:0] ? io_instruction[11:7] : _GEN_390; // @[stage3.scala 355:17 98:28]
  wire  _GEN_400 = 7'h6f == io_instruction[6:0] | 7'h67 == io_instruction[6:0]; // @[stage3.scala 366:17 98:28]
  wire [31:0] _GEN_401 = 7'h6f == io_instruction[6:0] ? io_PC : _GEN_392; // @[stage3.scala 368:16 98:28]
  wire [31:0] _GEN_403 = 7'h6f == io_instruction[6:0] ? _io_PC_2_T_9 : _GEN_394; // @[stage3.scala 370:16 98:28]
  wire [34:0] _GEN_405 = 7'h63 == io_instruction[6:0] ? {{3'd0}, _GEN_95} : _GEN_396; // @[stage3.scala 293:20 98:28]
  wire [31:0] _GEN_407 = 7'h63 == io_instruction[6:0] ? _GEN_127 : _GEN_398; // @[stage3.scala 295:20 98:28]
  wire [3:0] _GEN_409 = 7'h63 == io_instruction[6:0] ? _GEN_343 : 4'h0; // @[stage3.scala 77:11 98:28]
  wire  _GEN_410 = 7'h63 == io_instruction[6:0] ? 1'h0 : _GEN_395; // @[stage3.scala 328:20 98:28]
  wire [4:0] _GEN_411 = 7'h63 == io_instruction[6:0] ? 5'h0 : _GEN_399; // @[stage3.scala 329:17 98:28]
  wire  _GEN_413 = 7'h63 == io_instruction[6:0] | _GEN_400; // @[stage3.scala 340:17 98:28]
  wire  _GEN_414 = 7'h63 == io_instruction[6:0] ? 1'h0 : _GEN_400; // @[stage3.scala 98:28 341:33]
  wire [31:0] _GEN_415 = 7'h63 == io_instruction[6:0] ? io_PC : _GEN_401; // @[stage3.scala 342:16 98:28]
  wire [31:0] _GEN_416 = 7'h63 == io_instruction[6:0] ? _io_PC_2_T_4 : _GEN_403; // @[stage3.scala 343:16 98:28]
  wire [34:0] _GEN_419 = 7'h23 == io_instruction[6:0] ? 35'h0 : _GEN_405; // @[stage3.scala 265:20 98:28]
  wire [31:0] _GEN_421 = 7'h23 == io_instruction[6:0] ? 32'h0 : _GEN_407; // @[stage3.scala 267:20 98:28]
  wire  _GEN_423 = 7'h23 == io_instruction[6:0] ? 1'h0 : _GEN_410; // @[stage3.scala 272:20 98:28]
  wire [4:0] _GEN_424 = 7'h23 == io_instruction[6:0] ? 5'h0 : _GEN_411; // @[stage3.scala 273:17 98:28]
  wire [31:0] _GEN_426 = 7'h23 == io_instruction[6:0] ? _GEN_127 : 32'h0; // @[stage3.scala 277:18 98:28]
  wire [31:0] _GEN_428 = 7'h23 == io_instruction[6:0] ? _GEN_95 : 32'h0; // @[stage3.scala 279:22 98:28]
  wire [31:0] _GEN_430 = 7'h23 == io_instruction[6:0] ? _io_ALU2_val_T_5 : 32'h0; // @[stage3.scala 281:18 98:28]
  wire [2:0] _GEN_431 = 7'h23 == io_instruction[6:0] ? _io_DM_operation_T_3 : 3'h0; // @[stage3.scala 282:24 98:28]
  wire  _GEN_432 = 7'h23 == io_instruction[6:0] ? 1'h0 : _GEN_413; // @[stage3.scala 284:17 98:28]
  wire  _GEN_433 = 7'h23 == io_instruction[6:0] ? 1'h0 : _GEN_414; // @[stage3.scala 98:28 285:33]
  wire [31:0] _GEN_434 = 7'h23 == io_instruction[6:0] ? 32'h0 : _GEN_415; // @[stage3.scala 286:16 98:28]
  wire [31:0] _GEN_436 = 7'h23 == io_instruction[6:0] ? 32'h0 : _GEN_416; // @[stage3.scala 288:16 98:28]
  wire [3:0] _GEN_437 = 7'h23 == io_instruction[6:0] ? 4'h0 : _GEN_409; // @[stage3.scala 77:11 98:28]
  wire [34:0] _GEN_439 = 7'h3 == io_instruction[6:0] ? 35'h0 : _GEN_419; // @[stage3.scala 237:20 98:28]
  wire [31:0] _GEN_441 = 7'h3 == io_instruction[6:0] ? 32'h0 : _GEN_421; // @[stage3.scala 239:20 98:28]
  wire  _GEN_443 = 7'h3 == io_instruction[6:0] | _GEN_423; // @[stage3.scala 244:20 98:28]
  wire [4:0] _GEN_444 = 7'h3 == io_instruction[6:0] ? io_instruction[11:7] : _GEN_424; // @[stage3.scala 245:17 98:28]
  wire  _GEN_445 = 7'h3 == io_instruction[6:0] ? 1'h0 : _GEN_423; // @[stage3.scala 246:21 98:28]
  wire  _GEN_446 = 7'h3 == io_instruction[6:0] | 7'h23 == io_instruction[6:0]; // @[stage3.scala 248:21 98:28]
  wire [31:0] _GEN_447 = 7'h3 == io_instruction[6:0] ? 32'h0 : _GEN_426; // @[stage3.scala 249:18 98:28]
  wire [31:0] _GEN_449 = 7'h3 == io_instruction[6:0] ? _GEN_95 : _GEN_428; // @[stage3.scala 251:22 98:28]
  wire [31:0] _GEN_451 = 7'h3 == io_instruction[6:0] ? _io_ALU2_val_T_5 : _GEN_430; // @[stage3.scala 253:18 98:28]
  wire [2:0] _GEN_452 = 7'h3 == io_instruction[6:0] ? io_instruction[14:12] : _GEN_431; // @[stage3.scala 254:24 98:28]
  wire  _GEN_453 = 7'h3 == io_instruction[6:0] ? 1'h0 : _GEN_432; // @[stage3.scala 256:17 98:28]
  wire  _GEN_454 = 7'h3 == io_instruction[6:0] ? 1'h0 : _GEN_433; // @[stage3.scala 98:28 257:33]
  wire [31:0] _GEN_455 = 7'h3 == io_instruction[6:0] ? 32'h0 : _GEN_434; // @[stage3.scala 258:16 98:28]
  wire [31:0] _GEN_457 = 7'h3 == io_instruction[6:0] ? 32'h0 : _GEN_436; // @[stage3.scala 260:16 98:28]
  wire [3:0] _GEN_458 = 7'h3 == io_instruction[6:0] ? 4'h0 : _GEN_437; // @[stage3.scala 77:11 98:28]
  wire [34:0] _GEN_460 = 7'h13 == io_instruction[6:0] ? {{3'd0}, _GEN_95} : _GEN_439; // @[stage3.scala 171:20 98:28]
  wire [31:0] _GEN_462 = 7'h13 == io_instruction[6:0] ? _io_ALU2_val_T_5 : _GEN_441; // @[stage3.scala 173:20 98:28]
  wire [3:0] _GEN_464 = 7'h13 == io_instruction[6:0] ? {{1'd0}, _GEN_175} : _GEN_458; // @[stage3.scala 98:28]
  wire  _GEN_465 = 7'h13 == io_instruction[6:0] | _GEN_443; // @[stage3.scala 217:20 98:28]
  wire [4:0] _GEN_466 = 7'h13 == io_instruction[6:0] ? io_instruction[11:7] : _GEN_444; // @[stage3.scala 218:17 98:28]
  wire  _GEN_467 = 7'h13 == io_instruction[6:0] | _GEN_445; // @[stage3.scala 219:21 98:28]
  wire  _GEN_468 = 7'h13 == io_instruction[6:0] ? 1'h0 : _GEN_446; // @[stage3.scala 221:21 98:28]
  wire [31:0] _GEN_469 = 7'h13 == io_instruction[6:0] ? 32'h0 : _GEN_447; // @[stage3.scala 222:18 98:28]
  wire [31:0] _GEN_471 = 7'h13 == io_instruction[6:0] ? 32'h0 : _GEN_449; // @[stage3.scala 224:22 98:28]
  wire [31:0] _GEN_472 = 7'h13 == io_instruction[6:0] ? 32'h0 : _GEN_451; // @[stage3.scala 225:18 98:28]
  wire [2:0] _GEN_473 = 7'h13 == io_instruction[6:0] ? 3'h0 : _GEN_452; // @[stage3.scala 226:24 98:28]
  wire  _GEN_474 = 7'h13 == io_instruction[6:0] ? 1'h0 : _GEN_453; // @[stage3.scala 228:17 98:28]
  wire  _GEN_475 = 7'h13 == io_instruction[6:0] ? 1'h0 : _GEN_454; // @[stage3.scala 98:28 229:33]
  wire [31:0] _GEN_476 = 7'h13 == io_instruction[6:0] ? 32'h0 : _GEN_455; // @[stage3.scala 230:16 98:28]
  wire [31:0] _GEN_478 = 7'h13 == io_instruction[6:0] ? 32'h0 : _GEN_457; // @[stage3.scala 232:16 98:28]
  wire [34:0] _GEN_481 = 7'h33 == io_instruction[6:0] ? {{3'd0}, _GEN_95} : _GEN_460; // @[stage3.scala 101:20 98:28]
  wire [3:0] _GEN_485 = 7'h33 == io_instruction[6:0] ? _GEN_137 : _GEN_464; // @[stage3.scala 98:28]
  wire [31:0] _GEN_492 = 7'h33 == io_instruction[6:0] ? 32'h0 : _GEN_471; // @[stage3.scala 155:22 98:28]
  assign io_ALU1_val = _GEN_481[31:0];
  assign io_ALU2_val = 7'h33 == io_instruction[6:0] ? _GEN_127 : _GEN_462; // @[stage3.scala 103:20 98:28]
  assign io_ALU_op = {{1'd0}, _GEN_485};
  assign io_writeReg = 7'h33 == io_instruction[6:0] | _GEN_465; // @[stage3.scala 148:20 98:28]
  assign io_toReg = 7'h33 == io_instruction[6:0] ? io_instruction[11:7] : _GEN_466; // @[stage3.scala 149:17 98:28]
  assign io_writeFrom = 7'h33 == io_instruction[6:0] | _GEN_467; // @[stage3.scala 150:21 98:28]
  assign io_useMemory = 7'h33 == io_instruction[6:0] ? 1'h0 : _GEN_468; // @[stage3.scala 152:21 98:28]
  assign io_DM_val = 7'h33 == io_instruction[6:0] ? 32'h0 : _GEN_469; // @[stage3.scala 153:18 98:28]
  assign io_DM_address = _GEN_492[10:0];
  assign io_DM_imm = 7'h33 == io_instruction[6:0] ? 32'h0 : _GEN_472; // @[stage3.scala 157:18 98:28]
  assign io_DM_operation = 7'h33 == io_instruction[6:0] ? 3'h0 : _GEN_473; // @[stage3.scala 158:24 98:28]
  assign io_newPC = 7'h33 == io_instruction[6:0] ? 1'h0 : _GEN_474; // @[stage3.scala 160:17 98:28]
  assign io_newPC_already_decided = 7'h33 == io_instruction[6:0] ? 1'h0 : _GEN_475; // @[stage3.scala 98:28 161:33]
  assign io_PC_1 = 7'h33 == io_instruction[6:0] ? 32'h0 : _GEN_476; // @[stage3.scala 162:16 98:28]
  assign io_PC_2 = 7'h33 == io_instruction[6:0] ? 32'h0 : _GEN_478; // @[stage3.scala 164:16 98:28]
  assign io_regs_0 = regs_0; // @[stage3.scala 60:10]
  assign io_regs_1 = regs_1; // @[stage3.scala 60:10]
  assign io_regs_2 = regs_2; // @[stage3.scala 60:10]
  assign io_regs_3 = regs_3; // @[stage3.scala 60:10]
  assign io_regs_4 = regs_4; // @[stage3.scala 60:10]
  assign io_regs_5 = regs_5; // @[stage3.scala 60:10]
  assign io_regs_6 = regs_6; // @[stage3.scala 60:10]
  assign io_regs_7 = regs_7; // @[stage3.scala 60:10]
  assign io_regs_8 = regs_8; // @[stage3.scala 60:10]
  assign io_regs_9 = regs_9; // @[stage3.scala 60:10]
  assign io_regs_10 = regs_10; // @[stage3.scala 60:10]
  assign io_regs_11 = regs_11; // @[stage3.scala 60:10]
  assign io_regs_12 = regs_12; // @[stage3.scala 60:10]
  assign io_regs_13 = regs_13; // @[stage3.scala 60:10]
  assign io_regs_14 = regs_14; // @[stage3.scala 60:10]
  assign io_regs_15 = regs_15; // @[stage3.scala 60:10]
  assign io_regs_16 = regs_16; // @[stage3.scala 60:10]
  assign io_regs_17 = regs_17; // @[stage3.scala 60:10]
  assign io_regs_18 = regs_18; // @[stage3.scala 60:10]
  assign io_regs_19 = regs_19; // @[stage3.scala 60:10]
  assign io_regs_20 = regs_20; // @[stage3.scala 60:10]
  assign io_regs_21 = regs_21; // @[stage3.scala 60:10]
  assign io_regs_22 = regs_22; // @[stage3.scala 60:10]
  assign io_regs_23 = regs_23; // @[stage3.scala 60:10]
  assign io_regs_24 = regs_24; // @[stage3.scala 60:10]
  assign io_regs_25 = regs_25; // @[stage3.scala 60:10]
  assign io_regs_26 = regs_26; // @[stage3.scala 60:10]
  assign io_regs_27 = regs_27; // @[stage3.scala 60:10]
  assign io_regs_28 = regs_28; // @[stage3.scala 60:10]
  assign io_regs_29 = regs_29; // @[stage3.scala 60:10]
  assign io_regs_30 = regs_30; // @[stage3.scala 60:10]
  assign io_regs_31 = regs_31; // @[stage3.scala 60:10]
  always @(posedge clock) begin
    if (reset) begin // @[stage3.scala 59:21]
      regs_0 <= 32'h0; // @[stage3.scala 59:21]
    end else if (io_regWrite) begin // @[stage3.scala 65:20]
      if (5'h0 == io_regToWrite) begin // @[stage3.scala 66:24]
        regs_0 <= io_regWriteVal; // @[stage3.scala 66:24]
      end
    end
    if (reset) begin // @[stage3.scala 59:21]
      regs_1 <= 32'h0; // @[stage3.scala 59:21]
    end else if (io_regWrite) begin // @[stage3.scala 65:20]
      if (5'h1 == io_regToWrite) begin // @[stage3.scala 66:24]
        regs_1 <= io_regWriteVal; // @[stage3.scala 66:24]
      end
    end
    if (reset) begin // @[stage3.scala 59:21]
      regs_2 <= 32'h0; // @[stage3.scala 59:21]
    end else if (io_regWrite) begin // @[stage3.scala 65:20]
      if (5'h2 == io_regToWrite) begin // @[stage3.scala 66:24]
        regs_2 <= io_regWriteVal; // @[stage3.scala 66:24]
      end
    end
    if (reset) begin // @[stage3.scala 59:21]
      regs_3 <= 32'h0; // @[stage3.scala 59:21]
    end else if (io_regWrite) begin // @[stage3.scala 65:20]
      if (5'h3 == io_regToWrite) begin // @[stage3.scala 66:24]
        regs_3 <= io_regWriteVal; // @[stage3.scala 66:24]
      end
    end
    if (reset) begin // @[stage3.scala 59:21]
      regs_4 <= 32'h0; // @[stage3.scala 59:21]
    end else if (io_regWrite) begin // @[stage3.scala 65:20]
      if (5'h4 == io_regToWrite) begin // @[stage3.scala 66:24]
        regs_4 <= io_regWriteVal; // @[stage3.scala 66:24]
      end
    end
    if (reset) begin // @[stage3.scala 59:21]
      regs_5 <= 32'h0; // @[stage3.scala 59:21]
    end else if (io_regWrite) begin // @[stage3.scala 65:20]
      if (5'h5 == io_regToWrite) begin // @[stage3.scala 66:24]
        regs_5 <= io_regWriteVal; // @[stage3.scala 66:24]
      end
    end
    if (reset) begin // @[stage3.scala 59:21]
      regs_6 <= 32'h0; // @[stage3.scala 59:21]
    end else if (io_regWrite) begin // @[stage3.scala 65:20]
      if (5'h6 == io_regToWrite) begin // @[stage3.scala 66:24]
        regs_6 <= io_regWriteVal; // @[stage3.scala 66:24]
      end
    end
    if (reset) begin // @[stage3.scala 59:21]
      regs_7 <= 32'h0; // @[stage3.scala 59:21]
    end else if (io_regWrite) begin // @[stage3.scala 65:20]
      if (5'h7 == io_regToWrite) begin // @[stage3.scala 66:24]
        regs_7 <= io_regWriteVal; // @[stage3.scala 66:24]
      end
    end
    if (reset) begin // @[stage3.scala 59:21]
      regs_8 <= 32'h0; // @[stage3.scala 59:21]
    end else if (io_regWrite) begin // @[stage3.scala 65:20]
      if (5'h8 == io_regToWrite) begin // @[stage3.scala 66:24]
        regs_8 <= io_regWriteVal; // @[stage3.scala 66:24]
      end
    end
    if (reset) begin // @[stage3.scala 59:21]
      regs_9 <= 32'h0; // @[stage3.scala 59:21]
    end else if (io_regWrite) begin // @[stage3.scala 65:20]
      if (5'h9 == io_regToWrite) begin // @[stage3.scala 66:24]
        regs_9 <= io_regWriteVal; // @[stage3.scala 66:24]
      end
    end
    if (reset) begin // @[stage3.scala 59:21]
      regs_10 <= 32'h0; // @[stage3.scala 59:21]
    end else if (io_regWrite) begin // @[stage3.scala 65:20]
      if (5'ha == io_regToWrite) begin // @[stage3.scala 66:24]
        regs_10 <= io_regWriteVal; // @[stage3.scala 66:24]
      end
    end
    if (reset) begin // @[stage3.scala 59:21]
      regs_11 <= 32'h0; // @[stage3.scala 59:21]
    end else if (io_regWrite) begin // @[stage3.scala 65:20]
      if (5'hb == io_regToWrite) begin // @[stage3.scala 66:24]
        regs_11 <= io_regWriteVal; // @[stage3.scala 66:24]
      end
    end
    if (reset) begin // @[stage3.scala 59:21]
      regs_12 <= 32'h0; // @[stage3.scala 59:21]
    end else if (io_regWrite) begin // @[stage3.scala 65:20]
      if (5'hc == io_regToWrite) begin // @[stage3.scala 66:24]
        regs_12 <= io_regWriteVal; // @[stage3.scala 66:24]
      end
    end
    if (reset) begin // @[stage3.scala 59:21]
      regs_13 <= 32'h0; // @[stage3.scala 59:21]
    end else if (io_regWrite) begin // @[stage3.scala 65:20]
      if (5'hd == io_regToWrite) begin // @[stage3.scala 66:24]
        regs_13 <= io_regWriteVal; // @[stage3.scala 66:24]
      end
    end
    if (reset) begin // @[stage3.scala 59:21]
      regs_14 <= 32'h0; // @[stage3.scala 59:21]
    end else if (io_regWrite) begin // @[stage3.scala 65:20]
      if (5'he == io_regToWrite) begin // @[stage3.scala 66:24]
        regs_14 <= io_regWriteVal; // @[stage3.scala 66:24]
      end
    end
    if (reset) begin // @[stage3.scala 59:21]
      regs_15 <= 32'h0; // @[stage3.scala 59:21]
    end else if (io_regWrite) begin // @[stage3.scala 65:20]
      if (5'hf == io_regToWrite) begin // @[stage3.scala 66:24]
        regs_15 <= io_regWriteVal; // @[stage3.scala 66:24]
      end
    end
    if (reset) begin // @[stage3.scala 59:21]
      regs_16 <= 32'h0; // @[stage3.scala 59:21]
    end else if (io_regWrite) begin // @[stage3.scala 65:20]
      if (5'h10 == io_regToWrite) begin // @[stage3.scala 66:24]
        regs_16 <= io_regWriteVal; // @[stage3.scala 66:24]
      end
    end
    if (reset) begin // @[stage3.scala 59:21]
      regs_17 <= 32'h0; // @[stage3.scala 59:21]
    end else if (io_regWrite) begin // @[stage3.scala 65:20]
      if (5'h11 == io_regToWrite) begin // @[stage3.scala 66:24]
        regs_17 <= io_regWriteVal; // @[stage3.scala 66:24]
      end
    end
    if (reset) begin // @[stage3.scala 59:21]
      regs_18 <= 32'h0; // @[stage3.scala 59:21]
    end else if (io_regWrite) begin // @[stage3.scala 65:20]
      if (5'h12 == io_regToWrite) begin // @[stage3.scala 66:24]
        regs_18 <= io_regWriteVal; // @[stage3.scala 66:24]
      end
    end
    if (reset) begin // @[stage3.scala 59:21]
      regs_19 <= 32'h0; // @[stage3.scala 59:21]
    end else if (io_regWrite) begin // @[stage3.scala 65:20]
      if (5'h13 == io_regToWrite) begin // @[stage3.scala 66:24]
        regs_19 <= io_regWriteVal; // @[stage3.scala 66:24]
      end
    end
    if (reset) begin // @[stage3.scala 59:21]
      regs_20 <= 32'h0; // @[stage3.scala 59:21]
    end else if (io_regWrite) begin // @[stage3.scala 65:20]
      if (5'h14 == io_regToWrite) begin // @[stage3.scala 66:24]
        regs_20 <= io_regWriteVal; // @[stage3.scala 66:24]
      end
    end
    if (reset) begin // @[stage3.scala 59:21]
      regs_21 <= 32'h0; // @[stage3.scala 59:21]
    end else if (io_regWrite) begin // @[stage3.scala 65:20]
      if (5'h15 == io_regToWrite) begin // @[stage3.scala 66:24]
        regs_21 <= io_regWriteVal; // @[stage3.scala 66:24]
      end
    end
    if (reset) begin // @[stage3.scala 59:21]
      regs_22 <= 32'h0; // @[stage3.scala 59:21]
    end else if (io_regWrite) begin // @[stage3.scala 65:20]
      if (5'h16 == io_regToWrite) begin // @[stage3.scala 66:24]
        regs_22 <= io_regWriteVal; // @[stage3.scala 66:24]
      end
    end
    if (reset) begin // @[stage3.scala 59:21]
      regs_23 <= 32'h0; // @[stage3.scala 59:21]
    end else if (io_regWrite) begin // @[stage3.scala 65:20]
      if (5'h17 == io_regToWrite) begin // @[stage3.scala 66:24]
        regs_23 <= io_regWriteVal; // @[stage3.scala 66:24]
      end
    end
    if (reset) begin // @[stage3.scala 59:21]
      regs_24 <= 32'h0; // @[stage3.scala 59:21]
    end else if (io_regWrite) begin // @[stage3.scala 65:20]
      if (5'h18 == io_regToWrite) begin // @[stage3.scala 66:24]
        regs_24 <= io_regWriteVal; // @[stage3.scala 66:24]
      end
    end
    if (reset) begin // @[stage3.scala 59:21]
      regs_25 <= 32'h0; // @[stage3.scala 59:21]
    end else if (io_regWrite) begin // @[stage3.scala 65:20]
      if (5'h19 == io_regToWrite) begin // @[stage3.scala 66:24]
        regs_25 <= io_regWriteVal; // @[stage3.scala 66:24]
      end
    end
    if (reset) begin // @[stage3.scala 59:21]
      regs_26 <= 32'h0; // @[stage3.scala 59:21]
    end else if (io_regWrite) begin // @[stage3.scala 65:20]
      if (5'h1a == io_regToWrite) begin // @[stage3.scala 66:24]
        regs_26 <= io_regWriteVal; // @[stage3.scala 66:24]
      end
    end
    if (reset) begin // @[stage3.scala 59:21]
      regs_27 <= 32'h0; // @[stage3.scala 59:21]
    end else if (io_regWrite) begin // @[stage3.scala 65:20]
      if (5'h1b == io_regToWrite) begin // @[stage3.scala 66:24]
        regs_27 <= io_regWriteVal; // @[stage3.scala 66:24]
      end
    end
    if (reset) begin // @[stage3.scala 59:21]
      regs_28 <= 32'h0; // @[stage3.scala 59:21]
    end else if (io_regWrite) begin // @[stage3.scala 65:20]
      if (5'h1c == io_regToWrite) begin // @[stage3.scala 66:24]
        regs_28 <= io_regWriteVal; // @[stage3.scala 66:24]
      end
    end
    if (reset) begin // @[stage3.scala 59:21]
      regs_29 <= 32'h0; // @[stage3.scala 59:21]
    end else if (io_regWrite) begin // @[stage3.scala 65:20]
      if (5'h1d == io_regToWrite) begin // @[stage3.scala 66:24]
        regs_29 <= io_regWriteVal; // @[stage3.scala 66:24]
      end
    end
    if (reset) begin // @[stage3.scala 59:21]
      regs_30 <= 32'h0; // @[stage3.scala 59:21]
    end else if (io_regWrite) begin // @[stage3.scala 65:20]
      if (5'h1e == io_regToWrite) begin // @[stage3.scala 66:24]
        regs_30 <= io_regWriteVal; // @[stage3.scala 66:24]
      end
    end
    if (reset) begin // @[stage3.scala 59:21]
      regs_31 <= 32'h0; // @[stage3.scala 59:21]
    end else if (io_regWrite) begin // @[stage3.scala 65:20]
      if (5'h1f == io_regToWrite) begin // @[stage3.scala 66:24]
        regs_31 <= io_regWriteVal; // @[stage3.scala 66:24]
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  regs_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  regs_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  regs_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  regs_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  regs_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  regs_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  regs_6 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  regs_7 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  regs_8 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  regs_9 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  regs_10 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  regs_11 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  regs_12 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  regs_13 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  regs_14 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  regs_15 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  regs_16 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  regs_17 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  regs_18 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  regs_19 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  regs_20 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  regs_21 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  regs_22 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  regs_23 = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  regs_24 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  regs_25 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  regs_26 = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  regs_27 = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  regs_28 = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  regs_29 = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  regs_30 = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  regs_31 = _RAND_31[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module barrier1(
  input         clock,
  input  [31:0] io_ALU1_val_In,
  input  [31:0] io_ALU2_val_In,
  input  [4:0]  io_ALU_op_In,
  input         io_writeReg_In,
  input  [4:0]  io_toReg_In,
  input         io_writeFrom_In,
  input         io_useMemory_In,
  input  [31:0] io_DM_val_In,
  input  [10:0] io_DM_address_In,
  input  [31:0] io_DM_imm_In,
  input  [2:0]  io_DM_operation_In,
  input         io_newPC_In,
  input         io_newPC_already_decided_In,
  input  [31:0] io_PC_1_In,
  input  [31:0] io_PC_2_In,
  output [31:0] io_ALU1_val_Out,
  output [31:0] io_ALU2_val_Out,
  output [4:0]  io_ALU_op_Out,
  output        io_writeReg_Out,
  output [4:0]  io_toReg_Out,
  output        io_writeFrom_Out,
  output        io_useMemory_Out,
  output [31:0] io_DM_val_Out,
  output [10:0] io_DM_address_Out,
  output [31:0] io_DM_imm_Out,
  output [2:0]  io_DM_operation_Out,
  output        io_newPC_Out,
  output        io_newPC_already_decided_Out,
  output [31:0] io_PC_1_Out,
  output [31:0] io_PC_2_Out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] ALU1_val_Reg; // @[barrier1.scala 64:29]
  reg [31:0] ALU2_val_Reg; // @[barrier1.scala 66:29]
  reg [4:0] ALU_op_Reg; // @[barrier1.scala 68:27]
  reg  writeReg_Reg; // @[barrier1.scala 70:29]
  reg [4:0] toReg_Reg; // @[barrier1.scala 71:26]
  reg  writeFrom_Reg; // @[barrier1.scala 72:30]
  reg  useMemory_Reg; // @[barrier1.scala 74:30]
  reg [31:0] DM_val_Reg; // @[barrier1.scala 75:27]
  reg [10:0] DM_address_Reg; // @[barrier1.scala 77:31]
  reg [31:0] DM_imm_Reg; // @[barrier1.scala 79:27]
  reg [2:0] DM_operation_Reg; // @[barrier1.scala 80:33]
  reg  newPC_Reg; // @[barrier1.scala 82:26]
  reg  newPC_already_decided_Reg; // @[barrier1.scala 83:42]
  reg [31:0] PC_1_Reg; // @[barrier1.scala 84:25]
  reg [31:0] PC_2_Reg; // @[barrier1.scala 86:25]
  assign io_ALU1_val_Out = ALU1_val_Reg; // @[barrier1.scala 90:19]
  assign io_ALU2_val_Out = ALU2_val_Reg; // @[barrier1.scala 92:19]
  assign io_ALU_op_Out = ALU_op_Reg; // @[barrier1.scala 94:17]
  assign io_writeReg_Out = writeReg_Reg; // @[barrier1.scala 96:19]
  assign io_toReg_Out = toReg_Reg; // @[barrier1.scala 97:16]
  assign io_writeFrom_Out = writeFrom_Reg; // @[barrier1.scala 98:20]
  assign io_useMemory_Out = useMemory_Reg; // @[barrier1.scala 100:20]
  assign io_DM_val_Out = DM_val_Reg; // @[barrier1.scala 101:17]
  assign io_DM_address_Out = DM_address_Reg; // @[barrier1.scala 103:21]
  assign io_DM_imm_Out = DM_imm_Reg; // @[barrier1.scala 105:17]
  assign io_DM_operation_Out = DM_operation_Reg; // @[barrier1.scala 106:23]
  assign io_newPC_Out = newPC_Reg; // @[barrier1.scala 108:16]
  assign io_newPC_already_decided_Out = newPC_already_decided_Reg; // @[barrier1.scala 109:32]
  assign io_PC_1_Out = PC_1_Reg; // @[barrier1.scala 110:15]
  assign io_PC_2_Out = PC_2_Reg; // @[barrier1.scala 112:15]
  always @(posedge clock) begin
    ALU1_val_Reg <= io_ALU1_val_In; // @[barrier1.scala 64:29]
    ALU2_val_Reg <= io_ALU2_val_In; // @[barrier1.scala 66:29]
    ALU_op_Reg <= io_ALU_op_In; // @[barrier1.scala 68:27]
    writeReg_Reg <= io_writeReg_In; // @[barrier1.scala 70:29]
    toReg_Reg <= io_toReg_In; // @[barrier1.scala 71:26]
    writeFrom_Reg <= io_writeFrom_In; // @[barrier1.scala 72:30]
    useMemory_Reg <= io_useMemory_In; // @[barrier1.scala 74:30]
    DM_val_Reg <= io_DM_val_In; // @[barrier1.scala 75:27]
    DM_address_Reg <= io_DM_address_In; // @[barrier1.scala 77:31]
    DM_imm_Reg <= io_DM_imm_In; // @[barrier1.scala 79:27]
    DM_operation_Reg <= io_DM_operation_In; // @[barrier1.scala 80:33]
    newPC_Reg <= io_newPC_In; // @[barrier1.scala 82:26]
    newPC_already_decided_Reg <= io_newPC_already_decided_In; // @[barrier1.scala 83:42]
    PC_1_Reg <= io_PC_1_In; // @[barrier1.scala 84:25]
    PC_2_Reg <= io_PC_2_In; // @[barrier1.scala 86:25]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  ALU1_val_Reg = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  ALU2_val_Reg = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  ALU_op_Reg = _RAND_2[4:0];
  _RAND_3 = {1{`RANDOM}};
  writeReg_Reg = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  toReg_Reg = _RAND_4[4:0];
  _RAND_5 = {1{`RANDOM}};
  writeFrom_Reg = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  useMemory_Reg = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  DM_val_Reg = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  DM_address_Reg = _RAND_8[10:0];
  _RAND_9 = {1{`RANDOM}};
  DM_imm_Reg = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  DM_operation_Reg = _RAND_10[2:0];
  _RAND_11 = {1{`RANDOM}};
  newPC_Reg = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  newPC_already_decided_Reg = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  PC_1_Reg = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  PC_2_Reg = _RAND_14[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module barrier2(
  input         clock,
  input         io_newPC_In,
  input  [31:0] io_PCIn_In,
  output        io_newPC_Out,
  output [31:0] io_PCIn_Out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg  newPC_Reg; // @[barrier2.scala 20:26]
  reg [31:0] PCIn_Reg; // @[barrier2.scala 21:25]
  assign io_newPC_Out = newPC_Reg; // @[barrier2.scala 25:16]
  assign io_PCIn_Out = PCIn_Reg; // @[barrier2.scala 26:15]
  always @(posedge clock) begin
    newPC_Reg <= io_newPC_In; // @[barrier2.scala 20:26]
    PCIn_Reg <= io_PCIn_In; // @[barrier2.scala 21:25]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  newPC_Reg = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  PCIn_Reg = _RAND_1[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module barrier3(
  input         clock,
  input  [31:0] io_instruction_In,
  input  [31:0] io_PC_In,
  input         io_regWrite_In,
  input  [4:0]  io_regToWrite_In,
  input  [31:0] io_regWriteVal_In,
  output [31:0] io_instruction_Out,
  output [31:0] io_PC_Out,
  output        io_regWrite_Out,
  output [4:0]  io_regToWrite_Out,
  output [31:0] io_regWriteVal_Out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] instruction_Reg; // @[barrier3.scala 31:32]
  reg [31:0] PCIn_Reg; // @[barrier3.scala 32:25]
  assign io_instruction_Out = instruction_Reg; // @[barrier3.scala 36:21]
  assign io_PC_Out = PCIn_Reg; // @[barrier3.scala 37:12]
  assign io_regWrite_Out = io_regWrite_In; // @[barrier3.scala 39:18]
  assign io_regToWrite_Out = io_regToWrite_In; // @[barrier3.scala 40:20]
  assign io_regWriteVal_Out = io_regWriteVal_In; // @[barrier3.scala 41:21]
  always @(posedge clock) begin
    instruction_Reg <= io_instruction_In; // @[barrier3.scala 31:32]
    PCIn_Reg <= io_PC_In; // @[barrier3.scala 32:25]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  instruction_Reg = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  PCIn_Reg = _RAND_1[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module FP(
  input         clock,
  input         reset,
  output [31:0] io_regs_0,
  output [31:0] io_regs_1,
  output [31:0] io_regs_2,
  output [31:0] io_regs_3,
  output [31:0] io_regs_4,
  output [31:0] io_regs_5,
  output [31:0] io_regs_6,
  output [31:0] io_regs_7,
  output [31:0] io_regs_8,
  output [31:0] io_regs_9,
  output [31:0] io_regs_10,
  output [31:0] io_regs_11,
  output [31:0] io_regs_12,
  output [31:0] io_regs_13,
  output [31:0] io_regs_14,
  output [31:0] io_regs_15,
  output [31:0] io_regs_16,
  output [31:0] io_regs_17,
  output [31:0] io_regs_18,
  output [31:0] io_regs_19,
  output [31:0] io_regs_20,
  output [31:0] io_regs_21,
  output [31:0] io_regs_22,
  output [31:0] io_regs_23,
  output [31:0] io_regs_24,
  output [31:0] io_regs_25,
  output [31:0] io_regs_26,
  output [31:0] io_regs_27,
  output [31:0] io_regs_28,
  output [31:0] io_regs_29,
  output [31:0] io_regs_30,
  output [31:0] io_regs_31
);
  wire  FS_clock; // @[FP.scala 22:18]
  wire  FS_reset; // @[FP.scala 22:18]
  wire [31:0] FS_io_ALU1_val; // @[FP.scala 22:18]
  wire [31:0] FS_io_ALU2_val; // @[FP.scala 22:18]
  wire [4:0] FS_io_ALU_op; // @[FP.scala 22:18]
  wire  FS_io_writeReg; // @[FP.scala 22:18]
  wire [4:0] FS_io_toReg; // @[FP.scala 22:18]
  wire  FS_io_writeFrom; // @[FP.scala 22:18]
  wire  FS_io_useMemory; // @[FP.scala 22:18]
  wire [31:0] FS_io_DM_val; // @[FP.scala 22:18]
  wire [10:0] FS_io_DM_address; // @[FP.scala 22:18]
  wire [31:0] FS_io_DM_imm; // @[FP.scala 22:18]
  wire [2:0] FS_io_DM_operation; // @[FP.scala 22:18]
  wire  FS_io_newPC; // @[FP.scala 22:18]
  wire  FS_io_newPC_already_decided; // @[FP.scala 22:18]
  wire [31:0] FS_io_PC_1; // @[FP.scala 22:18]
  wire [31:0] FS_io_PC_2; // @[FP.scala 22:18]
  wire  FS_io_newPC_out; // @[FP.scala 22:18]
  wire [31:0] FS_io_PC_val_out; // @[FP.scala 22:18]
  wire  FS_io_regWrite; // @[FP.scala 22:18]
  wire [4:0] FS_io_regToWrite; // @[FP.scala 22:18]
  wire [31:0] FS_io_regWriteVal; // @[FP.scala 22:18]
  wire  SS_clock; // @[FP.scala 23:18]
  wire  SS_reset; // @[FP.scala 23:18]
  wire  SS_io_newPC; // @[FP.scala 23:18]
  wire [31:0] SS_io_PCIn; // @[FP.scala 23:18]
  wire [31:0] SS_io_instruction; // @[FP.scala 23:18]
  wire [31:0] SS_io_PC_out; // @[FP.scala 23:18]
  wire  TS_clock; // @[FP.scala 24:18]
  wire  TS_reset; // @[FP.scala 24:18]
  wire [31:0] TS_io_instruction; // @[FP.scala 24:18]
  wire [31:0] TS_io_PC; // @[FP.scala 24:18]
  wire  TS_io_regWrite; // @[FP.scala 24:18]
  wire [4:0] TS_io_regToWrite; // @[FP.scala 24:18]
  wire [31:0] TS_io_regWriteVal; // @[FP.scala 24:18]
  wire [31:0] TS_io_ALU1_val; // @[FP.scala 24:18]
  wire [31:0] TS_io_ALU2_val; // @[FP.scala 24:18]
  wire [4:0] TS_io_ALU_op; // @[FP.scala 24:18]
  wire  TS_io_writeReg; // @[FP.scala 24:18]
  wire [4:0] TS_io_toReg; // @[FP.scala 24:18]
  wire  TS_io_writeFrom; // @[FP.scala 24:18]
  wire  TS_io_useMemory; // @[FP.scala 24:18]
  wire [31:0] TS_io_DM_val; // @[FP.scala 24:18]
  wire [10:0] TS_io_DM_address; // @[FP.scala 24:18]
  wire [31:0] TS_io_DM_imm; // @[FP.scala 24:18]
  wire [2:0] TS_io_DM_operation; // @[FP.scala 24:18]
  wire  TS_io_newPC; // @[FP.scala 24:18]
  wire  TS_io_newPC_already_decided; // @[FP.scala 24:18]
  wire [31:0] TS_io_PC_1; // @[FP.scala 24:18]
  wire [31:0] TS_io_PC_2; // @[FP.scala 24:18]
  wire [31:0] TS_io_regs_0; // @[FP.scala 24:18]
  wire [31:0] TS_io_regs_1; // @[FP.scala 24:18]
  wire [31:0] TS_io_regs_2; // @[FP.scala 24:18]
  wire [31:0] TS_io_regs_3; // @[FP.scala 24:18]
  wire [31:0] TS_io_regs_4; // @[FP.scala 24:18]
  wire [31:0] TS_io_regs_5; // @[FP.scala 24:18]
  wire [31:0] TS_io_regs_6; // @[FP.scala 24:18]
  wire [31:0] TS_io_regs_7; // @[FP.scala 24:18]
  wire [31:0] TS_io_regs_8; // @[FP.scala 24:18]
  wire [31:0] TS_io_regs_9; // @[FP.scala 24:18]
  wire [31:0] TS_io_regs_10; // @[FP.scala 24:18]
  wire [31:0] TS_io_regs_11; // @[FP.scala 24:18]
  wire [31:0] TS_io_regs_12; // @[FP.scala 24:18]
  wire [31:0] TS_io_regs_13; // @[FP.scala 24:18]
  wire [31:0] TS_io_regs_14; // @[FP.scala 24:18]
  wire [31:0] TS_io_regs_15; // @[FP.scala 24:18]
  wire [31:0] TS_io_regs_16; // @[FP.scala 24:18]
  wire [31:0] TS_io_regs_17; // @[FP.scala 24:18]
  wire [31:0] TS_io_regs_18; // @[FP.scala 24:18]
  wire [31:0] TS_io_regs_19; // @[FP.scala 24:18]
  wire [31:0] TS_io_regs_20; // @[FP.scala 24:18]
  wire [31:0] TS_io_regs_21; // @[FP.scala 24:18]
  wire [31:0] TS_io_regs_22; // @[FP.scala 24:18]
  wire [31:0] TS_io_regs_23; // @[FP.scala 24:18]
  wire [31:0] TS_io_regs_24; // @[FP.scala 24:18]
  wire [31:0] TS_io_regs_25; // @[FP.scala 24:18]
  wire [31:0] TS_io_regs_26; // @[FP.scala 24:18]
  wire [31:0] TS_io_regs_27; // @[FP.scala 24:18]
  wire [31:0] TS_io_regs_28; // @[FP.scala 24:18]
  wire [31:0] TS_io_regs_29; // @[FP.scala 24:18]
  wire [31:0] TS_io_regs_30; // @[FP.scala 24:18]
  wire [31:0] TS_io_regs_31; // @[FP.scala 24:18]
  wire  FB_clock; // @[FP.scala 27:18]
  wire [31:0] FB_io_ALU1_val_In; // @[FP.scala 27:18]
  wire [31:0] FB_io_ALU2_val_In; // @[FP.scala 27:18]
  wire [4:0] FB_io_ALU_op_In; // @[FP.scala 27:18]
  wire  FB_io_writeReg_In; // @[FP.scala 27:18]
  wire [4:0] FB_io_toReg_In; // @[FP.scala 27:18]
  wire  FB_io_writeFrom_In; // @[FP.scala 27:18]
  wire  FB_io_useMemory_In; // @[FP.scala 27:18]
  wire [31:0] FB_io_DM_val_In; // @[FP.scala 27:18]
  wire [10:0] FB_io_DM_address_In; // @[FP.scala 27:18]
  wire [31:0] FB_io_DM_imm_In; // @[FP.scala 27:18]
  wire [2:0] FB_io_DM_operation_In; // @[FP.scala 27:18]
  wire  FB_io_newPC_In; // @[FP.scala 27:18]
  wire  FB_io_newPC_already_decided_In; // @[FP.scala 27:18]
  wire [31:0] FB_io_PC_1_In; // @[FP.scala 27:18]
  wire [31:0] FB_io_PC_2_In; // @[FP.scala 27:18]
  wire [31:0] FB_io_ALU1_val_Out; // @[FP.scala 27:18]
  wire [31:0] FB_io_ALU2_val_Out; // @[FP.scala 27:18]
  wire [4:0] FB_io_ALU_op_Out; // @[FP.scala 27:18]
  wire  FB_io_writeReg_Out; // @[FP.scala 27:18]
  wire [4:0] FB_io_toReg_Out; // @[FP.scala 27:18]
  wire  FB_io_writeFrom_Out; // @[FP.scala 27:18]
  wire  FB_io_useMemory_Out; // @[FP.scala 27:18]
  wire [31:0] FB_io_DM_val_Out; // @[FP.scala 27:18]
  wire [10:0] FB_io_DM_address_Out; // @[FP.scala 27:18]
  wire [31:0] FB_io_DM_imm_Out; // @[FP.scala 27:18]
  wire [2:0] FB_io_DM_operation_Out; // @[FP.scala 27:18]
  wire  FB_io_newPC_Out; // @[FP.scala 27:18]
  wire  FB_io_newPC_already_decided_Out; // @[FP.scala 27:18]
  wire [31:0] FB_io_PC_1_Out; // @[FP.scala 27:18]
  wire [31:0] FB_io_PC_2_Out; // @[FP.scala 27:18]
  wire  SB_clock; // @[FP.scala 28:18]
  wire  SB_io_newPC_In; // @[FP.scala 28:18]
  wire [31:0] SB_io_PCIn_In; // @[FP.scala 28:18]
  wire  SB_io_newPC_Out; // @[FP.scala 28:18]
  wire [31:0] SB_io_PCIn_Out; // @[FP.scala 28:18]
  wire  TB_clock; // @[FP.scala 29:18]
  wire [31:0] TB_io_instruction_In; // @[FP.scala 29:18]
  wire [31:0] TB_io_PC_In; // @[FP.scala 29:18]
  wire  TB_io_regWrite_In; // @[FP.scala 29:18]
  wire [4:0] TB_io_regToWrite_In; // @[FP.scala 29:18]
  wire [31:0] TB_io_regWriteVal_In; // @[FP.scala 29:18]
  wire [31:0] TB_io_instruction_Out; // @[FP.scala 29:18]
  wire [31:0] TB_io_PC_Out; // @[FP.scala 29:18]
  wire  TB_io_regWrite_Out; // @[FP.scala 29:18]
  wire [4:0] TB_io_regToWrite_Out; // @[FP.scala 29:18]
  wire [31:0] TB_io_regWriteVal_Out; // @[FP.scala 29:18]
  FirstStage FS ( // @[FP.scala 22:18]
    .clock(FS_clock),
    .reset(FS_reset),
    .io_ALU1_val(FS_io_ALU1_val),
    .io_ALU2_val(FS_io_ALU2_val),
    .io_ALU_op(FS_io_ALU_op),
    .io_writeReg(FS_io_writeReg),
    .io_toReg(FS_io_toReg),
    .io_writeFrom(FS_io_writeFrom),
    .io_useMemory(FS_io_useMemory),
    .io_DM_val(FS_io_DM_val),
    .io_DM_address(FS_io_DM_address),
    .io_DM_imm(FS_io_DM_imm),
    .io_DM_operation(FS_io_DM_operation),
    .io_newPC(FS_io_newPC),
    .io_newPC_already_decided(FS_io_newPC_already_decided),
    .io_PC_1(FS_io_PC_1),
    .io_PC_2(FS_io_PC_2),
    .io_newPC_out(FS_io_newPC_out),
    .io_PC_val_out(FS_io_PC_val_out),
    .io_regWrite(FS_io_regWrite),
    .io_regToWrite(FS_io_regToWrite),
    .io_regWriteVal(FS_io_regWriteVal)
  );
  SecondStage SS ( // @[FP.scala 23:18]
    .clock(SS_clock),
    .reset(SS_reset),
    .io_newPC(SS_io_newPC),
    .io_PCIn(SS_io_PCIn),
    .io_instruction(SS_io_instruction),
    .io_PC_out(SS_io_PC_out)
  );
  ThirdStage TS ( // @[FP.scala 24:18]
    .clock(TS_clock),
    .reset(TS_reset),
    .io_instruction(TS_io_instruction),
    .io_PC(TS_io_PC),
    .io_regWrite(TS_io_regWrite),
    .io_regToWrite(TS_io_regToWrite),
    .io_regWriteVal(TS_io_regWriteVal),
    .io_ALU1_val(TS_io_ALU1_val),
    .io_ALU2_val(TS_io_ALU2_val),
    .io_ALU_op(TS_io_ALU_op),
    .io_writeReg(TS_io_writeReg),
    .io_toReg(TS_io_toReg),
    .io_writeFrom(TS_io_writeFrom),
    .io_useMemory(TS_io_useMemory),
    .io_DM_val(TS_io_DM_val),
    .io_DM_address(TS_io_DM_address),
    .io_DM_imm(TS_io_DM_imm),
    .io_DM_operation(TS_io_DM_operation),
    .io_newPC(TS_io_newPC),
    .io_newPC_already_decided(TS_io_newPC_already_decided),
    .io_PC_1(TS_io_PC_1),
    .io_PC_2(TS_io_PC_2),
    .io_regs_0(TS_io_regs_0),
    .io_regs_1(TS_io_regs_1),
    .io_regs_2(TS_io_regs_2),
    .io_regs_3(TS_io_regs_3),
    .io_regs_4(TS_io_regs_4),
    .io_regs_5(TS_io_regs_5),
    .io_regs_6(TS_io_regs_6),
    .io_regs_7(TS_io_regs_7),
    .io_regs_8(TS_io_regs_8),
    .io_regs_9(TS_io_regs_9),
    .io_regs_10(TS_io_regs_10),
    .io_regs_11(TS_io_regs_11),
    .io_regs_12(TS_io_regs_12),
    .io_regs_13(TS_io_regs_13),
    .io_regs_14(TS_io_regs_14),
    .io_regs_15(TS_io_regs_15),
    .io_regs_16(TS_io_regs_16),
    .io_regs_17(TS_io_regs_17),
    .io_regs_18(TS_io_regs_18),
    .io_regs_19(TS_io_regs_19),
    .io_regs_20(TS_io_regs_20),
    .io_regs_21(TS_io_regs_21),
    .io_regs_22(TS_io_regs_22),
    .io_regs_23(TS_io_regs_23),
    .io_regs_24(TS_io_regs_24),
    .io_regs_25(TS_io_regs_25),
    .io_regs_26(TS_io_regs_26),
    .io_regs_27(TS_io_regs_27),
    .io_regs_28(TS_io_regs_28),
    .io_regs_29(TS_io_regs_29),
    .io_regs_30(TS_io_regs_30),
    .io_regs_31(TS_io_regs_31)
  );
  barrier1 FB ( // @[FP.scala 27:18]
    .clock(FB_clock),
    .io_ALU1_val_In(FB_io_ALU1_val_In),
    .io_ALU2_val_In(FB_io_ALU2_val_In),
    .io_ALU_op_In(FB_io_ALU_op_In),
    .io_writeReg_In(FB_io_writeReg_In),
    .io_toReg_In(FB_io_toReg_In),
    .io_writeFrom_In(FB_io_writeFrom_In),
    .io_useMemory_In(FB_io_useMemory_In),
    .io_DM_val_In(FB_io_DM_val_In),
    .io_DM_address_In(FB_io_DM_address_In),
    .io_DM_imm_In(FB_io_DM_imm_In),
    .io_DM_operation_In(FB_io_DM_operation_In),
    .io_newPC_In(FB_io_newPC_In),
    .io_newPC_already_decided_In(FB_io_newPC_already_decided_In),
    .io_PC_1_In(FB_io_PC_1_In),
    .io_PC_2_In(FB_io_PC_2_In),
    .io_ALU1_val_Out(FB_io_ALU1_val_Out),
    .io_ALU2_val_Out(FB_io_ALU2_val_Out),
    .io_ALU_op_Out(FB_io_ALU_op_Out),
    .io_writeReg_Out(FB_io_writeReg_Out),
    .io_toReg_Out(FB_io_toReg_Out),
    .io_writeFrom_Out(FB_io_writeFrom_Out),
    .io_useMemory_Out(FB_io_useMemory_Out),
    .io_DM_val_Out(FB_io_DM_val_Out),
    .io_DM_address_Out(FB_io_DM_address_Out),
    .io_DM_imm_Out(FB_io_DM_imm_Out),
    .io_DM_operation_Out(FB_io_DM_operation_Out),
    .io_newPC_Out(FB_io_newPC_Out),
    .io_newPC_already_decided_Out(FB_io_newPC_already_decided_Out),
    .io_PC_1_Out(FB_io_PC_1_Out),
    .io_PC_2_Out(FB_io_PC_2_Out)
  );
  barrier2 SB ( // @[FP.scala 28:18]
    .clock(SB_clock),
    .io_newPC_In(SB_io_newPC_In),
    .io_PCIn_In(SB_io_PCIn_In),
    .io_newPC_Out(SB_io_newPC_Out),
    .io_PCIn_Out(SB_io_PCIn_Out)
  );
  barrier3 TB ( // @[FP.scala 29:18]
    .clock(TB_clock),
    .io_instruction_In(TB_io_instruction_In),
    .io_PC_In(TB_io_PC_In),
    .io_regWrite_In(TB_io_regWrite_In),
    .io_regToWrite_In(TB_io_regToWrite_In),
    .io_regWriteVal_In(TB_io_regWriteVal_In),
    .io_instruction_Out(TB_io_instruction_Out),
    .io_PC_Out(TB_io_PC_Out),
    .io_regWrite_Out(TB_io_regWrite_Out),
    .io_regToWrite_Out(TB_io_regToWrite_Out),
    .io_regWriteVal_Out(TB_io_regWriteVal_Out)
  );
  assign io_regs_0 = TS_io_regs_0; // @[FP.scala 31:12]
  assign io_regs_1 = TS_io_regs_1; // @[FP.scala 31:12]
  assign io_regs_2 = TS_io_regs_2; // @[FP.scala 31:12]
  assign io_regs_3 = TS_io_regs_3; // @[FP.scala 31:12]
  assign io_regs_4 = TS_io_regs_4; // @[FP.scala 31:12]
  assign io_regs_5 = TS_io_regs_5; // @[FP.scala 31:12]
  assign io_regs_6 = TS_io_regs_6; // @[FP.scala 31:12]
  assign io_regs_7 = TS_io_regs_7; // @[FP.scala 31:12]
  assign io_regs_8 = TS_io_regs_8; // @[FP.scala 31:12]
  assign io_regs_9 = TS_io_regs_9; // @[FP.scala 31:12]
  assign io_regs_10 = TS_io_regs_10; // @[FP.scala 31:12]
  assign io_regs_11 = TS_io_regs_11; // @[FP.scala 31:12]
  assign io_regs_12 = TS_io_regs_12; // @[FP.scala 31:12]
  assign io_regs_13 = TS_io_regs_13; // @[FP.scala 31:12]
  assign io_regs_14 = TS_io_regs_14; // @[FP.scala 31:12]
  assign io_regs_15 = TS_io_regs_15; // @[FP.scala 31:12]
  assign io_regs_16 = TS_io_regs_16; // @[FP.scala 31:12]
  assign io_regs_17 = TS_io_regs_17; // @[FP.scala 31:12]
  assign io_regs_18 = TS_io_regs_18; // @[FP.scala 31:12]
  assign io_regs_19 = TS_io_regs_19; // @[FP.scala 31:12]
  assign io_regs_20 = TS_io_regs_20; // @[FP.scala 31:12]
  assign io_regs_21 = TS_io_regs_21; // @[FP.scala 31:12]
  assign io_regs_22 = TS_io_regs_22; // @[FP.scala 31:12]
  assign io_regs_23 = TS_io_regs_23; // @[FP.scala 31:12]
  assign io_regs_24 = TS_io_regs_24; // @[FP.scala 31:12]
  assign io_regs_25 = TS_io_regs_25; // @[FP.scala 31:12]
  assign io_regs_26 = TS_io_regs_26; // @[FP.scala 31:12]
  assign io_regs_27 = TS_io_regs_27; // @[FP.scala 31:12]
  assign io_regs_28 = TS_io_regs_28; // @[FP.scala 31:12]
  assign io_regs_29 = TS_io_regs_29; // @[FP.scala 31:12]
  assign io_regs_30 = TS_io_regs_30; // @[FP.scala 31:12]
  assign io_regs_31 = TS_io_regs_31; // @[FP.scala 31:12]
  assign FS_clock = clock;
  assign FS_reset = reset;
  assign FS_io_ALU1_val = FB_io_ALU1_val_Out; // @[FP.scala 85:30]
  assign FS_io_ALU2_val = FB_io_ALU2_val_Out; // @[FP.scala 87:30]
  assign FS_io_ALU_op = FB_io_ALU_op_Out; // @[FP.scala 89:30]
  assign FS_io_writeReg = FB_io_writeReg_Out; // @[FP.scala 91:30]
  assign FS_io_toReg = FB_io_toReg_Out; // @[FP.scala 92:30]
  assign FS_io_writeFrom = FB_io_writeFrom_Out; // @[FP.scala 93:30]
  assign FS_io_useMemory = FB_io_useMemory_Out; // @[FP.scala 95:30]
  assign FS_io_DM_val = FB_io_DM_val_Out; // @[FP.scala 96:30]
  assign FS_io_DM_address = FB_io_DM_address_Out; // @[FP.scala 98:30]
  assign FS_io_DM_imm = FB_io_DM_imm_Out; // @[FP.scala 100:30]
  assign FS_io_DM_operation = FB_io_DM_operation_Out; // @[FP.scala 101:30]
  assign FS_io_newPC = FB_io_newPC_Out; // @[FP.scala 103:30]
  assign FS_io_newPC_already_decided = FB_io_newPC_already_decided_Out; // @[FP.scala 104:30]
  assign FS_io_PC_1 = FB_io_PC_1_Out; // @[FP.scala 105:30]
  assign FS_io_PC_2 = FB_io_PC_2_Out; // @[FP.scala 107:30]
  assign SS_clock = clock;
  assign SS_reset = reset;
  assign SS_io_newPC = SB_io_newPC_Out; // @[FP.scala 38:16]
  assign SS_io_PCIn = SB_io_PCIn_Out; // @[FP.scala 39:15]
  assign TS_clock = clock;
  assign TS_reset = reset;
  assign TS_io_instruction = TB_io_instruction_Out; // @[FP.scala 51:22]
  assign TS_io_PC = TB_io_PC_Out; // @[FP.scala 52:13]
  assign TS_io_regWrite = TB_io_regWrite_Out; // @[FP.scala 53:19]
  assign TS_io_regToWrite = TB_io_regToWrite_Out; // @[FP.scala 54:21]
  assign TS_io_regWriteVal = TB_io_regWriteVal_Out; // @[FP.scala 55:22]
  assign FB_clock = clock;
  assign FB_io_ALU1_val_In = TS_io_ALU1_val; // @[FP.scala 59:30]
  assign FB_io_ALU2_val_In = TS_io_ALU2_val; // @[FP.scala 61:30]
  assign FB_io_ALU_op_In = TS_io_ALU_op; // @[FP.scala 63:30]
  assign FB_io_writeReg_In = TS_io_writeReg; // @[FP.scala 65:30]
  assign FB_io_toReg_In = TS_io_toReg; // @[FP.scala 66:30]
  assign FB_io_writeFrom_In = TS_io_writeFrom; // @[FP.scala 67:30]
  assign FB_io_useMemory_In = TS_io_useMemory; // @[FP.scala 69:30]
  assign FB_io_DM_val_In = TS_io_DM_val; // @[FP.scala 70:30]
  assign FB_io_DM_address_In = TS_io_DM_address; // @[FP.scala 72:30]
  assign FB_io_DM_imm_In = TS_io_DM_imm; // @[FP.scala 74:30]
  assign FB_io_DM_operation_In = TS_io_DM_operation; // @[FP.scala 75:30]
  assign FB_io_newPC_In = TS_io_newPC; // @[FP.scala 77:30]
  assign FB_io_newPC_already_decided_In = TS_io_newPC_already_decided; // @[FP.scala 78:32]
  assign FB_io_PC_1_In = TS_io_PC_1; // @[FP.scala 79:30]
  assign FB_io_PC_2_In = TS_io_PC_2; // @[FP.scala 81:30]
  assign SB_clock = clock;
  assign SB_io_newPC_In = FS_io_newPC_out; // @[FP.scala 34:19]
  assign SB_io_PCIn_In = FS_io_PC_val_out; // @[FP.scala 35:18]
  assign TB_clock = clock;
  assign TB_io_instruction_In = SS_io_instruction; // @[FP.scala 42:25]
  assign TB_io_PC_In = SS_io_PC_out; // @[FP.scala 43:16]
  assign TB_io_regWrite_In = FS_io_regWrite; // @[FP.scala 46:22]
  assign TB_io_regToWrite_In = FS_io_regToWrite; // @[FP.scala 47:24]
  assign TB_io_regWriteVal_In = FS_io_regWriteVal; // @[FP.scala 48:25]
endmodule
