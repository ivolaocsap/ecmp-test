`timescale 1ns / 1ps
`include "iob_lib.vh"
//pleasee let this work
module circuit
  #(
    parameter W=32
    )
  (
   `INPUT(rst,1),
   `INPUT(clk,1),
   `INPUT(r,100),
   `INPUT(en,1),
   
   `OUTPUT(y,100)
   );

   `SIGNAL(cnt, 7) //7-bit counter as iterator
   `SIGNAL(acc_r, 100) //numero random
   `SIGNAL(y_int, 100) //internal y
   `SIGNAL(y_int_n_1, 100) //y(n-1) registo onde é guardado
  
   `SIGNAL2OUT(y, y_int) //connect internal y to output

   //y shift register 
   `REG_ARE(clk, rst, 1'b0, cnt!=99, y_int_n_1, y_int)


   //iteration counter
   `COUNTER_ARE(clk, rst, cnt!=99, cnt)

  //testestestes

   `COMB y_int = 2*(y_int_n_1) + acc_r ;
   
   
endmodule
