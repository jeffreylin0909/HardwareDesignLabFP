module RGB_GEN(
    input valid,
	input [11:0] pixel_CY,
	input [11:0] pixel_monster_1,
	output reg [11:0] RGB
	);

    always @(*) begin
        if (valid == 1'b1)begin
            if (pixel_CY+pixel_monster_1 != 12'h0)begin
                RGB = pixel_CY+pixel_monster_1;
            end else begin
                RGB = 12'hFDA;
            end
        end else begin
            RGB = 12'h0;
        end
    end

endmodule
