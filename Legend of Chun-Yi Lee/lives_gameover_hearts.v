module lives_gameover_hearts(
    input clk,
    input [3:0] lives,
    output gameover,
    output reg [3:0] pixel_idx_heart_0, pixel_idx_heart_1, pixel_idx_heart_2
    );
    always @(posedge clk)begin
        case (lives)
            0:begin
                pixel_idx_heart_0 <= 1;
                pixel_idx_heart_1 <= 1;
                pixel_idx_heart_2 <= 1;
            end
            1:begin
                pixel_idx_heart_0 <= 0;
                pixel_idx_heart_1 <= 1;
                pixel_idx_heart_2 <= 1;
            end
            2:begin
                pixel_idx_heart_0 <= 0;
                pixel_idx_heart_1 <= 0;
                pixel_idx_heart_2 <= 1;
            end
            3:begin
                pixel_idx_heart_0 <= 0;
                pixel_idx_heart_1 <= 0;
                pixel_idx_heart_2 <= 0;
            end
            default:begin
                pixel_idx_heart_0 <= 0;
                pixel_idx_heart_1 <= 0;
                pixel_idx_heart_2 <= 0;
            end
        endcase
    end

    assign gameover = (lives == 4'd0);

endmodule