//control satge
module stage_control(
    input clk, rst,
    input gameover,
    input [3:0] kills,
    input SPACE_signal,
    output reg [3:0] stage,
    output reg changing_stage
    );
    
    reg [3:0] next_stage;
    reg [7:0] change_stage_counter;

    reg [7:0] n_change_stage_counter;

    wire SPACE_signal_op;
    onepulse OP(SPACE_signal, SPACE_signal_op, clk);

    //for change_stage_counter
    always@(posedge clk) begin
	   if (rst)begin
	       change_stage_counter <= 8'd100;
	   end else begin
	       change_stage_counter <= n_change_stage_counter;
	   end
	end
    always@(*)begin
        case (stage)
            4'h0:begin
                n_change_stage_counter = 8'd100;
            end
            4'h1:begin
                if(kills == 4'h2)begin
                    if (change_stage_counter == 0)begin
                        n_change_stage_counter = 8'd100;
                    end else begin
                        n_change_stage_counter = change_stage_counter-1;
                    end
                end else begin
                    n_change_stage_counter = 8'd100;
                end
            end
            4'h2:begin
                if(kills == 4'h4)begin
                    if (change_stage_counter == 0)begin
                        n_change_stage_counter = 8'd100;
                    end else begin
                        n_change_stage_counter = change_stage_counter-1;
                    end
                end else begin
                    n_change_stage_counter = 8'd100;
                end
            end
            4'h3:begin
                if(kills == 4'h6)begin
                    if (change_stage_counter == 0)begin
                        n_change_stage_counter = 8'd100;
                    end else begin
                        n_change_stage_counter = change_stage_counter-1;
                    end
                end else begin
                    n_change_stage_counter = 8'd100;
                end
            end
            4'h4:begin
                if(kills == 4'h8)begin
                    if (change_stage_counter == 0)begin
                        n_change_stage_counter = 8'd100;
                    end else begin
                        n_change_stage_counter = change_stage_counter-1;
                    end
                end else begin
                    n_change_stage_counter = 8'd100;
                end
            end
            4'he:begin
                n_change_stage_counter = 8'd100;
            end
            4'hf:begin
                n_change_stage_counter = 8'd100;
            end
            default:begin
            end
        endcase
	end

    //stage change
	always@(posedge clk) begin
	   if (rst)begin
	       stage <= 4'h0;
	   end else begin
	       stage <= next_stage;
	   end
	end
	always@(*)begin
        case (stage)
            4'h0:begin
                if (SPACE_signal_op)begin
                    next_stage = 4'h1;
                end else begin
                    next_stage = stage;
                end
            end
            4'h1:begin
                if (gameover)begin
                    next_stage = 4'hf;
                end else if(change_stage_counter == 0)begin
                    next_stage = 4'h2;
                end else begin
                    next_stage = stage;
                end
            end
            4'h2:begin
                if (gameover)begin
                    next_stage = 4'hf;
                end else if(change_stage_counter == 0)begin
                    next_stage = 4'h3;
                end else begin
                    next_stage = stage;
                end
            end
            4'h3:begin
                if (gameover)begin
                    next_stage = 4'hf;
                end else if(change_stage_counter == 0)begin
                    next_stage = 4'h4;
                end else begin
                    next_stage = stage;
                end
            end
            4'h4:begin
                if (gameover)begin
                    next_stage = 4'hf;
                end else if(change_stage_counter == 0)begin
                    next_stage = 4'he;
                end else begin
                    next_stage = stage;
                end
            end
            4'he:begin
                if (SPACE_signal_op)begin
                    next_stage = 4'h0;
                end else begin
                    next_stage = stage;
                end
            end
            4'hf:begin
                if (SPACE_signal_op)begin
                    next_stage = 4'h0;
                end else begin
                    next_stage = stage;
                end
            end
            default:begin
            end
        endcase
	end

    always@(posedge clk) begin
	   if (rst)begin
	       changing_stage <= 0;
	   end else begin
	       if (stage!=next_stage)begin
                changing_stage <= 1;
           end else begin
                changing_stage <= 0;
           end
	   end
	end
endmodule