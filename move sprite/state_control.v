module state_control(clk, rst, A_signal, D_signal, W_signal, S_signal, pos_h, pos_v, pos_h_m, pos_v_m);
	input clk, rst, A_signal, D_signal, W_signal, S_signal;
	
	output reg [9:0] pos_h, pos_v, pos_h_m, pos_v_m;
	
	always@(posedge clk)begin
	   if (pos_h_m < 319)begin
	       pos_h_m <= pos_h_m+1;
	   end else begin
	       pos_h_m <= 20;
	   end
	
	   if (A_signal) begin
	       if (pos_h < 319) begin
	           pos_h <= pos_h+1;
	       end else begin
	           pos_h <= 319;
	       end
	   end else begin
	       if (D_signal) begin
               if (pos_h > 20) begin
                   pos_h <= pos_h-1;
               end else begin
                   pos_h <= 20;
               end
           end else begin
               if (W_signal) begin
                   if (pos_v < 239) begin
                       pos_v <= pos_v+1;
                   end else begin
                       pos_v <= 239;
                   end
               end else begin
                   if (S_signal) begin
                       if (pos_v > 20) begin
                           pos_v <= pos_v-1;
                       end else begin
                           pos_v <= 20;
                       end
                   end else begin
                       pos_v <= pos_v;
                   end
               end
           end
	   end
	end
	
endmodule