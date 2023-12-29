module state_control(clk, rst, A_signal, D_signal, W_signal, S_signal, pos_h, pos_v);
	input clk, rst, A_signal, D_signal, W_signal, S_signal;
	
	output reg [9:0] pos_h, pos_v;
	
	always@(posedge clk)begin
	   if (A_signal) begin
	       if (pos_h < 320) begin
	           pos_h <= pos_h+1;
	       end else begin
	           pos_h <= 0;
	       end
	   end else begin
	       if (D_signal) begin
               if (pos_h > 0) begin
                   pos_h <= pos_h-1;
               end else begin
                   pos_h <= 319;
               end
           end else begin
               if (W_signal) begin
                   if (pos_v < 240) begin
                       pos_v <= pos_v+1;
                   end else begin
                       pos_v <= 0;
                   end
               end else begin
                   if (S_signal) begin
                       if (pos_v > 0) begin
                           pos_v <= pos_v-1;
                       end else begin
                           pos_v <= 239;
                       end
                   end else begin
                       pos_v <= pos_v;
                   end
               end
           end
	   end
	end
	
endmodule