//for setting gameover signal and image select ("empty image" or "heart image") signal of "heart sprite" in state control
module lives_gameover_hearts(
    input clk,
    input [3:0] lives,//now lives
    output gameover,//gameover signal in state control
    output reg [3:0] pixel_idx_heart_0, pixel_idx_heart_1, pixel_idx_heart_2//image select ("empty image" or "heart image") signal "heart sprite" in state control
    );
    always @(posedge clk)begin
        //if pixel_idx_heart_0,1,2 == 0, means image == empty
        case (lives)
            0:begin//lives == 0, all heart set to empty
                pixel_idx_heart_0 <= 1;
                pixel_idx_heart_1 <= 1;
                pixel_idx_heart_2 <= 1;
            end
            1:begin//lives == 1, one heart set to "heart image", others set to "empty image"
                pixel_idx_heart_0 <= 0;
                pixel_idx_heart_1 <= 1;
                pixel_idx_heart_2 <= 1;
            end
            2:begin//lives == 2, two hearts set to "heart image", the other set to "empty image"
                pixel_idx_heart_0 <= 0;
                pixel_idx_heart_1 <= 0;
                pixel_idx_heart_2 <= 1;
            end
            3:begin//lives == 3, all heart set to "heart image"
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

    //if lives == 0, gameover
    assign gameover = (lives == 4'd0);

endmodule