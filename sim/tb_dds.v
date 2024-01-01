`timescale  1ns/1ns

module  tb_dds();

//**************************************************************//
//*************** Parameter and Internal Signal ****************//
//**************************************************************//
//wire  define
wire    [7:0]   data_out    ;

//reg   define
reg             sys_clk     ;
reg             sys_rst_n   ;
reg     [3:0]   wave_select ;

//**************************************************************//
//************************** Main Code *************************//
//**************************************************************//
//sys_rst_n,sys_clk,key
initial
    begin
        sys_clk     =  1'b0;
        sys_rst_n   <=  1'b0;

        wave_select <=  4'b0000;
        #200;
        sys_rst_n   <=   1'b1;
        #10000
        wave_select <=  4'b0001;
        #8000000;
        wave_select <=  4'b0010;
        #8000000;
        wave_select <=  4'b0100;
        #8000000;
        wave_select <=  4'b1000;
        #8000000;
        wave_select <=  4'b0000;
        #8000000;
    end

always #10 sys_clk = ~sys_clk;

//**************************************************************//
//************************ Instantiation ***********************//
//**************************************************************//
//------------- top_dds_inst -------------
dds     dds_inst
(
    .sys_clk     (sys_clk    ),   //系统时钟,50MHz
    .sys_rst_n   (sys_rst_n  ),   //复位信号,低电平有效
    .wave_select (wave_select),   //输出波形选择

    .data_out    (data_out   )    //波形输出
);

endmodule
