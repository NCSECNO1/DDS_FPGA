`timescale  1ns/1ns

module  top_dds
(
    input   wire            sys_clk     ,   //系统时钟,50MHz
    input   wire            sys_rst_n   ,   //复位信号,低电平有效
    input   wire    [3:0]   key         ,   //输入4位按键

    output  wire            dac_clk     ,   //输入DAC模块时钟
    output  wire    [7:0]   dac_data        //输入DAC模块波形数据
);

//********************************************************************//
//****************** Parameter and Internal Signal *******************//
//********************************************************************//
//wire  define
wire    [3:0]   wave_select ;   //波形选择

//dac_clka:DAC模块时钟
assign  dac_clk  = ~sys_clk;

//********************************************************************//
//*************************** Instantiation **************************//
//********************************************************************//
//-------------------------- dds_inst -----------------------------
dds     dds_inst
(
    .sys_clk        (sys_clk    ),   //系统时钟,50MHz
    .sys_rst_n      (sys_rst_n  ),   //复位信号,低电平有效
    .wave_select    (wave_select),   //输出波形选择

    .data_out       (dac_data   )    //波形输出
);

//----------------------- key_control_inst ------------------------
key_control key_control_inst
(
    .sys_clk        (sys_clk    ),   //系统时钟,50MHz
    .sys_rst_n      (sys_rst_n  ),   //复位信号,低电平有效
    .key            (key        ),   //输入4位按键

    .wave_select    (wave_select)    //输出波形选择
 );

endmodule
