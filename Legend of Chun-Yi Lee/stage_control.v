module stage_control(
    input clk, rst,
    input gameover,
    input [7:0] kills,
    input SPACE_signal,
    output reg [3:0] stage
    );
    
    reg [3:0] next_stage;

    //stage change
	always@(posedge clk) begin
	   if (rst)begin
	       stage <= 4'h0;
	   end else begin
	       stage <= next_stage;
	   end
	end

	//determine state change
	always@(*)begin
        case (stage)
            4'h0:begin
                if (SPACE_signal)begin
                    next_stage = 4'h1;
                end else begin
                    next_stage = stage;
                end
            end
            4'h1:begin
                if (gameover)begin
                    next_stage = 4'hf;
                end else begin
                    next_stage = stage;
                end
            end
            4'hf:begin
                if (SPACE_signal)begin
                    next_stage = 4'h0;
                end else begin
                    next_stage = stage;
                end
            end
            default:begin
            end
        endcase
	end
endmodule