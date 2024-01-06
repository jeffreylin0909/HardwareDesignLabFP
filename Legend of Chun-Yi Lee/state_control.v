module state_control(
    input clk, rst, 
    input A_signal, D_signal, W_signal, S_signal, J_signal, K_signal, L_signal, SPACE_signal, 
    output reg [9:0] pos_h_CY, pos_v_CY,
    output reg [9:0] pos_h_monster_1, pos_v_monster_1
    );
	
//	reg [3:0] stage, next_stage;
//	wire [9:0] init_pos_h_CY[15:0];
//	wire [9:0] init_pos_v_CY[15:0];
//	wire [9:0] init_pos_h_monster_1[15:0];
//	wire [9:0] init_pos_v_monster_1[15:0];
	
//	assign init_pos_h_CY[0] = 0;
//	assign init_pos_v_CY[0] = 0;
//	assign init_pos_h_CY[1] = 1;
//	assign init_pos_v_CY[1] = 1;
	
//	//stage change
//	always@(posedge clk) begin
//	   if (rst)begin
//	       stage <= 4'h0;
//	       pos_h_CY <= init_pos_h_CY[next_stage];
//	       pos_v_CY <= init_pos_v_CY[next_stage];
//	   end else begin
//	       stage <= next_stage;
//	       pos_h_CY <= init_pos_h_CY[next_stage];
//	       pos_v_CY <= init_pos_v_CY[next_stage];
//	   end
//	end
//	//determin state change
//	wire SPACE_signal_op;
//	onepulse OP(SPACE_signal,SPACE_signal_op,clk);
//	always@(*)begin
//	   if (SPACE_signal_op)begin
//	       next_stage = stage+1;
//	   end else begin
//	       next_stage = stage;
//	   end
//	end
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