module stage_control(
    input clk, rst,
    input nextstage, backstage, cave, gameover,
    output reg [3:0] stage
    );
    
    reg [3:0] next_stage;

    //stage change
	always@(posedge clk) begin
	   if (rst)begin
	       stage <= 4'd0;
	   end else begin
	       stage <= next_stage;
	   end
	end

	//determine state change
	always@(*)begin
        if (nextstage)begin
            next_stage = stage+1;
        end else begin
            if (backstage)begin
                    if (stage == 4'h0)begin
                        next_stage = stage;
                    end else begin
                        next_stage = stage-1;
                    end
            end else if (cave) begin
                next_stage = 4'hb;
            end else if (gameover) begin
                next_stage = 4'hf;
            end begin
                next_stage = stage;
            end
        end
	end
endmodule