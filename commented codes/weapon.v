//define behavior of weapon
module weapon(
    input clk, rst,
    input [2:0] type,
    input [3:0] state_CY,//image of CY
    input [9:0] pos_h_CY, pos_v_CY,//coordinate of CY
    input [3:0] stage,

    output reg [3:0] state,//image to use 
    output reg [9:0] pos_h, pos_v//coordinate
    );

    reg [3:0] n_state;
    reg [9:0] n_pos_h, n_pos_v;

    parameter EMPTY = 4'hf, WOODEN_FRONT = 4'h0, WOODEN_BACK = 4'h1, WOODEN_LEFT = 4'h2, WOODEN_RIGHT = 4'h3, 
              BASYS_FRONT = 4'h4, BASYS_BACK = 4'h5, BASYS_LEFT = 4'h6, BASYS_RIGHT = 4'h7,
              CAR_FRONT = 4'h8, CAR_BACK = 4'h9, CAR_LEFT = 4'hA, CAR_RIGHT = 4'hB;
    
    //for state
    always@(posedge clk)begin
        if (rst)begin
            state <= EMPTY;
        end else begin
            state <= n_state;
        end
    end
    always@(*)begin
        if (stage==4'h0 || stage==4'he || stage==4'hf)begin//if in initail stage or gameover stage or win stage, set to empty
            n_state = EMPTY;
        end else begin
            case (type)
                0:begin//wooden fpga
                    case (state_CY)
                        4'hA: begin//CY attacking back
                            n_state = WOODEN_BACK;
                        end
                        4'hB: begin//CY attacking front
                            n_state = WOODEN_FRONT;
                        end
                        4'hC: begin//CY attacking left
                            n_state = WOODEN_LEFT;
                        end
                        4'hD: begin//CY attacking right
                            n_state = WOODEN_RIGHT;
                        end
                        default: begin
                            n_state = EMPTY;
                        end
                    endcase
                end
            endcase
        end
    end

    //for pos
    always@(posedge clk)begin
        if (rst)begin
            pos_h <= pos_h_CY;
            pos_v <= pos_v_CY;
        end else begin
            pos_h <= n_pos_h;
            pos_v <= n_pos_v;
        end
    end
    always@(*)begin
        if (stage==4'h0 || stage==4'he || stage==4'hf)begin//if in initail stage or gameover stage or win stage, set to CY's coord
            n_pos_h = pos_h_CY;
            n_pos_v = pos_v_CY;
        end else begin
            case (type)
                0:begin//wooden
                    case (state_CY)
                        4'hA: begin//CY attacking back
                            n_pos_h = pos_h_CY;
                            n_pos_v = pos_v_CY-20;
                        end
                        4'hB: begin//CY attacking front
                            n_pos_h = pos_h_CY;
                            n_pos_v = pos_v_CY+20;
                        end
                        4'hC: begin//CY attacking left
                            n_pos_h = pos_h_CY+20;
                            n_pos_v = pos_v_CY;
                        end
                        4'hD: begin//CY attacking right
                            n_pos_h = pos_h_CY-20;
                            n_pos_v = pos_v_CY;
                        end
                        default: begin
                            n_pos_h = pos_h_CY;
                            n_pos_v = pos_v_CY;
                        end
                    endcase
                end
            endcase
        end
    end

endmodule