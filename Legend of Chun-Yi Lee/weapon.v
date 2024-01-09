module weapon(
    input clk, rst,
    input [2:0] type,
    input [3:0] state_CY,
    input [9:0] pos_h_CY, pos_v_CY,
    input gameover,
    output reg [3:0] state,
    output reg [9:0] pos_h, pos_v
    );

    parameter EMPTY = 4'hf, WOODEN_FRONT = 4'h0, WOODEN_BACK = 4'h1, WOODEN_LEFT = 4'h2, WOODEN_RIGHT = 4'h3, 
              BASYS_FRONT = 4'h4, BASYS_BACK = 4'h5, BASYS_LEFT = 4'h6, BASYS_RIGHT = 4'h7,
              CAR_FRONT = 4'h8, CAR_BACK = 4'h9, CAR_LEFT = 4'hA, CAR_RIGHT = 4'hB;
    
    always @(posedge clk)begin
        if (gameover)begin
            state <= EMPTY;
        end else begin
            case (type)
                0:begin//wooden
                    case (state_CY)
                        4'hA: begin
                            state <= WOODEN_BACK;
                            pos_h <= pos_h_CY;
                            pos_v <= pos_v_CY-20;
                        end
                        4'hB: begin
                            state <= WOODEN_FRONT;
                            pos_h <= pos_h_CY;
                            pos_v <= pos_v_CY+20;
                        end
                        4'hC: begin
                            state <= WOODEN_LEFT;
                            pos_h <= pos_h_CY+20;
                            pos_v <= pos_v_CY;
                        end
                        4'hD: begin
                            state <= WOODEN_RIGHT;
                            pos_h <= pos_h_CY-20;
                            pos_v <= pos_v_CY;
                        end
                        default: begin
                            state <= EMPTY;
                            pos_h <= pos_h_CY;
                            pos_v <= pos_v_CY;
                        end
                    endcase
                end
                1:begin
                end
                2:begin
                end
            endcase
        end
    end

endmodule