module mem_addr_gen(h_cnt, v_cnt, pos_h, pos_v, pixel_addr);
    input [9:0] h_cnt, v_cnt;
    input [9:0] pos_h, pos_v;
    output[16:0] pixel_addr;
	
	wire [9:0] h_cnt_new, v_cnt_new;
	
	assign h_cnt_new = h_cnt+pos_h;
	assign v_cnt_new = v_cnt+pos_v;
	
	assign pixel_addr = (v_cnt_new*20 + h_cnt_new-319)%400;	
	//(h_cnt, v_cnt) as coords
endmodule