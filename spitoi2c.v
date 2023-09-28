`timescale 1ns / 1ps
`include "sipo.v"
`include "i2cslave.v"
`include "i2cmaster.v"
`include "spi_fsm.v"

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:18:58 03/19/2018 
// Design Name: 
// Module Name:    spitoi2c 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module spitoi2c(
input start,
input [7:0]data,
input clk,
input reset,
output i2c_sda,
output i2c_scl
    );
	 
//wire mosi;
wire ss;	
wire din; 
wire done;
wire siso;
wire [7:0]in;
wire i2cmreset;
	 
spi_fsm spi_fsm1(
clk,
reset,
data,
start,
din,
ss,
i2cmreset,
siso
);

sipo sipo1(
in,
din,
clk,
ss,
siso
//.ndone(i2cmreset)
);

i2cmaster i2cmaster1(
clk,
i2cmreset,
in,
i2c_sda,
i2c_scl
);

//bridge bridge1(
//.mosi(mosi),
//.ss(ss),
//.clk(clk),
//.miso(siso),
//.i2c_sda(i2c_sda),
//.i2c_scl(i2c_scl)
//);

//i2cslave i2cslave1(
//.i2c_sda(i2c_sda),
//.i2c_scl(i2c_scl)
//);

endmodule

