module Top(clk, rst, PS2_DATA, PS2_CLK, vgaRed, vgaBlue, vgaGreen, hsync, vsync);
    
    parameter [8:0] A_CODE  = {1'b0, 8'h1C};
    parameter [8:0] D_CODE  = {1'b0, 8'h23};
    parameter [8:0] W_CODE  = {1'b0, 8'h1D};
    parameter [8:0] S_CODE  = {1'b0, 8'h1B};
    
	input clk, rst;//button
	inout PS2_DATA, PS2_CLK;
    output [3:0] vgaRed, vgaGreen, vgaBlue;
    output hsync, vsync;
	
	wire clk_d2;//25MHz
    wire clk_d22;
    wire [16:0] pixel_addr;
    wire [11:0] pixel;
	wire [11:0] data;
    wire valid;
	//640*480
    wire [9:0] h_cnt, v_cnt;
	wire [9:0] h_cnt_re, v_cnt_re;
	
	wire [9:0] pos_h, pos_v;
	//signals
	wire rst_db;
	wire rst_op;
	
	assign h_cnt_re = h_cnt>>1;
	assign v_cnt_re = v_cnt>>1;
	
	assign {vgaRed, vgaGreen, vgaBlue} = (valid==1'b1) ? pixel : 12'h0;
	
	//clock
	clk_div #(2) CD0(.clk(clk), .clk_d(clk_d2));
	clk_div #(19) CD1(.clk(clk), .clk_d(clk_d22));
	
	//keyboard
	wire [511:0] key_down;
    wire [8:0] last_change;
    wire been_ready;
	
	//signals
	debounce DB1(.s(rst), .s_db(rst_db), .clk(clk));
	onepulse OP1(.s(rst_db), .s_op(rst_op), .clk(clk_d22));
	
	//control
	state_control SC0(
		.clk(clk_d22),
		.rst(rst_op),
		.A_signal(key_down[A_CODE]),
		.D_signal(key_down[D_CODE]),
		.W_signal(key_down[W_CODE]),
		.S_signal(key_down[S_CODE]),
		.pos_h(pos_h),
		.pos_v(pos_v)
	);
	mem_addr_gen MAG(
		.h_cnt(h_cnt_re),
		.v_cnt(v_cnt_re), 
		.pos_h(pos_h),
		.pos_v(pos_v),
		.pixel_addr(pixel_addr)
	);
     
	//display
    blk_mem_gen_0 BMG0(
		.clka(clk_d2),
        .wea(0),
        .addra(pixel_addr),
        .dina(data[11:0]),
        .douta(pixel)
    ); 

    vga_controller VC0(
        .pclk(clk_d2),
        .reset(rst),
        .hsync(hsync),
        .vsync(vsync),
        .valid(valid),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt)
    );
	
	KeyboardDecoder key_de (
        .key_down(key_down),
        .last_change(last_change),
        .key_valid(been_ready),
        .PS2_DATA(PS2_DATA),
        .PS2_CLK(PS2_CLK),
        .rst(rst),
        .clk(clk)
    );
	
endmodule