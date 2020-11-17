`timescale 1ns / 1ps
`include "iob_lib.vh"

`define W 96

module circuit_tb;

   `CLOCK(clk, 10)
   `RESET(rst, 1, 10)
   `SIGNAL(en, 1)
     `SIGNAL(r, 32)// sinal que armazena o número aleatório
  `SIGNAL(y, 32)
   `SIGNAL_OUT(y, `W)

   integer i;
   
   initial begin
      $dumpfile("circuit.vcd");
      $dumpvars();
      en=0;
      for (i=0; i<100; i=i+1) begin
         @(posedge clk) #1 r= $random; en=1; $display("%d: %d",i+1,r, y) en=1;
          @(posedge clk) #1 en=0;
      end

      @(posedge clk) #100 $finish;

   end 

   circuit
     #(
       .W(`W)
       ) 
   c0
     (
      .rst(rst),
      .clk(clk),
      .en(en),
      .r(r),
      .y(y)
      );


endmodule
