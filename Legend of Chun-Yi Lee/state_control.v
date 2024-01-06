module state_control(
    input clk, rst, 
    input A_signal, D_signal, W_signal, S_signal, J_signal, K_signal, L_signal, SPACE_signal, 
    output reg [3:0] pixel_idx_CY,
    output reg [9:0] pos_h_CY, pos_v_CY,
    output reg [3:0] pixel_idx_monster_1,
    output reg [9:0] pos_h_monster_1, pos_v_monster_1
    );
	
	reg [3:0] stage, next_stage;
	wire backstage, nextstage;
	
	//stage change
	always@(posedge clk) begin
	   if (rst)begin
	       stage <= 4'h0;
	   end else begin
	       stage <= next_stage;
	   end
	end
	//determin state change
	always@(*)begin
	   if (nextstage)begin
	       next_stage = stage+1;
	   end else begin
	       if (backstage)begin
               next_stage = stage-1;
           end else begin
               next_stage = stage;
           end
	   end
	end
	//CY
	always@(posedge clk)begin
	   if (A_signal) begin
           if (pos_h_CY < 319) begin
               pos_h_CY <= pos_h_CY+1;
           end else begin
               pos_h_CY <= 319;
           end
       end else begin
           if (D_signal) begin
               if (pos_h_CY > 20) begin
                   pos_h_CY <= pos_h_CY-1;
               end else begin
                   pos_h_CY <= 20;
               end
           end else begin
               if (W_signal) begin
                   if (pos_v_CY < 239) begin
                       pos_v_CY <= pos_v_CY+1;
                   end else begin
                       pos_v_CY <= 239;
                   end
               end else begin
                   if (S_signal) begin
                       if (pos_v_CY > 20) begin
                           pos_v_CY <= pos_v_CY-1;
                       end else begin
                           pos_v_CY <= 20;
                       end
                   end else begin
                       pos_h_CY <= pos_h_CY;
                       pos_v_CY <= pos_v_CY;
                   end
               end
           end
       end
	end
	
	//monster_1
	always@(posedge clk)begin
	   if (pos_h_monster_1 < 319)begin
           pos_h_monster_1 <= pos_h_monster_1+1;
       end else begin
           pos_h_monster_1 <= 20;
       end
	end
	
endmodule