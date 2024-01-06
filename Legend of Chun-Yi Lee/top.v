module Top(clk, rst, PS2_DATA, PS2_CLK, vgaRed, vgaBlue, vgaGreen, hsync, vsync);
    
    parameter [8:0] A_CODE  = {1'b0, 8'h1C};
    parameter [8:0] D_CODE  = {1'b0, 8'h23};
    parameter [8:0] W_CODE  = {1'b0, 8'h1D};
    parameter [8:0] S_CODE  = {1'b0, 8'h1B};
    parameter [8:0] J_CODE  = {1'b0, 8'h3B};
    parameter [8:0] K_CODE  = {1'b0, 8'h42};
    parameter [8:0] L_CODE  = {1'b0, 8'h4B};
    parameter [8:0] SPACE_CODE  = {1'b0, 8'h29};
    
	//keyboard
	inout PS2_DATA, PS2_CLK;
	wire [511:0] key_down;
    wire [8:0] last_change;
    wire been_ready;
	//VGA
    output [3:0] vgaRed, vgaGreen, vgaBlue;
    output hsync, vsync;
    wire [9:0] h_cnt, v_cnt;
    wire valid;
	//system
	input rst;
	wire rst_db;
	wire rst_op;
	input clk;//50MHz, used in keyboard and debounce
	wire clk_d2;//25MHz, used  in VGA
    wire clk_d22;//191Hz, used  in state control
    //for block memory (image)
    wire [11:0] pixel_CY_back_stand;
    wire [11:0] pixel_CY_back_walk_L;
    wire [11:0] pixel_CY_back_walk_R;
    wire [11:0] pixel_CY_front_stand;
    wire [11:0] pixel_CY_front_walk_L;
    wire [11:0] pixel_CY_front_walk_R;
    wire [11:0] pixel_CY_left_stand;
    wire [11:0] pixel_CY_left_walk;
    wire [11:0] pixel_CY_right_stand;
    wire [11:0] pixel_CY_right_walk;
    wire [11:0] pixel_BOSS_student;
    wire [11:0] pixel_CS_student;
    wire [11:0] pixel_EECS_student;
    wire [11:0] pixel_NTHU_student;
    wire [11:0] pixel_CR;
    wire [11:0] pixel_EM;
    wire [11:0] pixel_JX;
    wire [11:0] pixel_YC;
    wire [11:0] pixel_ZY;
    wire [11:0] pixel_key;
    wire [11:0] pixel_heart;
    wire [11:0] pixel_potion;
    wire [11:0] pixel_yoshi;
    wire [11:0] pixel_car;
    wire [11:0] pixel_wooden_fpga;
    wire [11:0] pixel_golden_fpga;
    wire [11:0] pixel_basys_3_fpga;
    wire [11:0] pixel_computer_room_walls;
    wire [11:0] pixel_computer_room_entrance;
    wire [11:0] pixel_overwall_wall;
    //for sprites
    //for CY
    wire [16:0] pixel_addr_CY;
    wire [11:0] pixel_CY;
    
    wire [3:0] pixel_idx_CY;
    wire [9:0] pos_h_CY, pos_v_CY;
    //for monster_1
    wire [16:0] pixel_addr_monster_1;
    wire [11:0] pixel_monster_1;
    
    wire [3:0] pixel_idx_monster_1;
    wire [9:0] pos_h_monster_1, pos_v_monster_1;
	
	select_pixel SP0(
        .h_cnt(h_cnt), .v_cnt(v_cnt),
        .pos_h(pos_h_CY),.pos_v(pos_v_CY),
        .size_h(20),.size_v(20),
        .now_pixel_idx(0),
        .pixel_1(pixel_CY_front_stand),
        .pixel_2(pixel),
        .pixel_3(pixel),
        .pixel_4(pixel),
        .pixel_5(pixel),
        .pixel_6(pixel),
        .pixel_7(pixel),
        .pixel_8(pixel),
        .pixel_9(pixel),
        .pixel_A(pixel),
        .pixel_B(pixel),
        .pixel_C(pixel),
        .pixel_D(pixel),
        .pixel_E(pixel),
        .pixel_F(pixel),
        .now_pixel(pixel_CY)
	);
	
	select_pixel SP1(
        .h_cnt(h_cnt), .v_cnt(v_cnt),
        .pos_h(pos_h_monster_1),.pos_v(pos_v_monster_1),
        .size_h(20),.size_v(20),
        .now_pixel_idx(0),
        .pixel_1(pixel_CS_student),
        .pixel_2(pixel),
        .pixel_3(pixel),
        .pixel_4(pixel),
        .pixel_5(pixel),
        .pixel_6(pixel),
        .pixel_7(pixel),
        .pixel_8(pixel),
        .pixel_9(pixel),
        .pixel_A(pixel),
        .pixel_B(pixel),
        .pixel_C(pixel),
        .pixel_D(pixel),
        .pixel_E(pixel),
        .pixel_F(pixel),
        .now_pixel(pixel_monster_1)
	);
	
	RGB_GEN RGB_GEN_(
	   .valid(valid),
	   .pixel_CY(pixel_CY),
	   .pixel_monster_1(pixel_monster_1),
	   .RGB({vgaRed, vgaGreen, vgaBlue})
	);
	
	//clock
	clk_div #(2) CD0(.clk(clk), .clk_d(clk_d2));
	clk_div #(19) CD1(.clk(clk), .clk_d(clk_d22));
	
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
		.J_signal(key_down[J_CODE]),
		.K_signal(key_down[K_CODE]),
		.L_signal(key_down[L_CODE]),
		.SPACE_signal(key_down[SPACE_CODE]),
		.pixel_idx_CY(pixel_idx_CY),
		.pos_h_CY(pos_h_CY),
		.pos_v_CY(pos_v_CY),
		.pixel_idx_monster_1(pixel_idx_monster_1),
		.pos_h_monster_1(pos_h_monster_1),
		.pos_v_monster_1(pos_v_monster_1)
	);
	
	mem_addr_gen MAG_CY(
		.h_cnt(h_cnt),
		.v_cnt(v_cnt), 
		.pos_h(pos_h_CY),
		.pos_v(pos_v_CY),
		.pixel_addr(pixel_addr_CY)
	);
	
	mem_addr_gen MAG_monster_1(
		.h_cnt(h_cnt),
		.v_cnt(v_cnt), 
		.pos_h(pos_h_monster_1),
		.pos_v(pos_v_monster_1),
		.pixel_addr(pixel_addr_monster_1)
	);
     
	//display
    BM_CY_front_stand BM_CY_front_stand_(
		.clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_CY),
        .dina(12'd0),
        .douta(pixel_CY_front_stand)
    ); 
    BM_CY_front_walk_L BM_CY_front_walk_L_(
		.clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_CY),
        .dina(12'd0),
        .douta(pixel_CY_front_walk_L)
    ); 
    BM_CY_front_walk_R BM_CY_front_walk_R_(
		.clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_CY),
        .dina(12'd0),
        .douta(pixel_CY_front_walk_R)
    ); 
    BM_CY_back_stand BM_CY_back_stand_(
		.clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_CY),
        .dina(12'd0),
        .douta(pixel_CY_back_stand)
    ); 
    BM_CY_back_walk_L BM_CY_back_walk_L_(
		.clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_CY),
        .dina(12'd0),
        .douta(pixel_CY_back_walk_L)
    ); 
    BM_CY_back_walk_R BM_CY_back_walk_R_(
		.clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_CY),
        .dina(12'd0),
        .douta(pixel_CY_back_walk_R)
    ); 
    BM_CY_left_stand BM_CY_left_stand_(
		.clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_CY),
        .dina(12'd0),
        .douta(pixel_CY_left_stand)
    ); 
    BM_CY_left_walk BM_CY_left_walk_(
		.clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_CY),
        .dina(12'd0),
        .douta(pixel_CY_left_walk)
    ); 
    BM_CY_right_stand BM_CY_right_stand_(
		.clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_CY),
        .dina(12'd0),
        .douta(pixel_CY_right_stand)
    ); 
    BM_CY_right_walk BM_CY_right_walk_(
		.clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_CY),
        .dina(12'd0),
        .douta(pixel_CY_right_walk)
    ); 
    
    BM_CS_student BM_CS_student_(
		.clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_monster_1),
        .dina(12'd0),
        .douta(pixel_CS_student)
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