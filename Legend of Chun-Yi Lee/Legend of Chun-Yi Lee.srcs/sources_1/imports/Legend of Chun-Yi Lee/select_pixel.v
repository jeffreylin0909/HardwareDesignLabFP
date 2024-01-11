module select_pixel(
	input [9:0] h_cnt, v_cnt,
	input [9:0] pos_h,pos_v,
	input [9:0] size_h,size_v,
	input [3:0] now_pixel_idx,
	input [11:0] pixel_0,
	input [11:0] pixel_1,
	input [11:0] pixel_2,
	input [11:0] pixel_3,
	input [11:0] pixel_4,
	input [11:0] pixel_5,
	input [11:0] pixel_6,
	input [11:0] pixel_7,
	input [11:0] pixel_8,
	input [11:0] pixel_9,
	input [11:0] pixel_A,
	input [11:0] pixel_B,
	input [11:0] pixel_C,
	input [11:0] pixel_D,
	input [11:0] pixel_E,
	input [11:0] pixel_F,
	output reg [11:0] now_pixel
	);
	
	always @(*) begin
		if ((h_cnt+pos_h)%320 < size_h && (v_cnt+pos_v)%240 < size_v)begin
			case (now_pixel_idx)
			    4'h0: now_pixel = pixel_0;
				4'h1: now_pixel = pixel_1;
				4'h2: now_pixel = pixel_2;
				4'h3: now_pixel = pixel_3;
				4'h4: now_pixel = pixel_4;
				4'h5: now_pixel = pixel_5;
				4'h6: now_pixel = pixel_6;
				4'h7: now_pixel = pixel_7;
				4'h8: now_pixel = pixel_8;
				4'h9: now_pixel = pixel_9;
				4'hA: now_pixel = pixel_A;
				4'hB: now_pixel = pixel_B;
				4'hC: now_pixel = pixel_C;
				4'hD: now_pixel = pixel_D;
				4'hE: now_pixel = pixel_E;
				4'hF: now_pixel = pixel_F;
			endcase
		end else begin
			now_pixel = 12'h0;
		end
	end

endmodule