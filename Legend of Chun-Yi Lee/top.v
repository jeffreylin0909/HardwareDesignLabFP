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
        wire clk_d22;//~95Hz, used  in state control
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
        wire [11:0] pixel_CY_front_attack;
        wire [11:0] pixel_CY_back_attack;
        wire [11:0] pixel_CY_right_attack;
        wire [11:0] pixel_CY_left_attack;
        wire [11:0] pixel_BOSS_student_L;
        wire [11:0] pixel_BOSS_student_R;
        wire [11:0] pixel_CS_student_L;
        wire [11:0] pixel_CS_student_R;
        wire [11:0] pixel_EECS_student_L;
        wire [11:0] pixel_EECS_student_R;
        wire [11:0] pixel_NTHU_student_L;
        wire [11:0] pixel_NTHU_student_R;
        wire [11:0] pixel_CR;
        wire [11:0] pixel_EM;
        wire [11:0] pixel_JX;
        wire [11:0] pixel_YC;
        wire [11:0] pixel_ZY;
        wire [11:0] pixel_key;
        wire [11:0] pixel_heart[3:0];
        wire [11:0] pixel_potion;
        wire [11:0] pixel_yoshi;
        wire [11:0] pixel_car;
        wire [11:0] pixel_wooden_fpga_up;
        wire [11:0] pixel_wooden_fpga_down;
        wire [11:0] pixel_wooden_fpga_left;
        wire [11:0] pixel_wooden_fpga_right;
        wire [11:0] pixel_golden_fpga;
        wire [11:0] pixel_basys_3_fpga;
        wire [11:0] pixel_computer_room_walls;
        wire [11:0] pixel_computer_room_entrance;
        wire [11:0] pixel_overwall_wall[63:0];
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

        //for weapon
        wire [16:0] pixel_addr_weapon;
        wire [11:0] pixel_weapon;
        wire [3:0] pixel_idx_weapon;
        wire [9:0] pos_h_weapon, pos_v_weapon;

        //for cave entrance
        wire [16:0] pixel_addr_computer_room_entrance;
        wire [11:0] pixel_computer_room_entrance_ins;
        wire [3:0] pixel_idx_computer_room_entrance;
        wire [9:0] pos_h_computer_room_entrance, pos_v_computer_room_entrance;
        
        //for hearts
        wire [16:0] pixel_addr_heart[3:0];
        wire [11:0] pixel_heart_ins[3:0];
        wire [3:0] pixel_idx_heart[3:0];
        wire [9:0] pos_h_heart[3:0], pos_v_heart[3:0];
        
        //for walls
        wire [16:0] pixel_addr_wall[63:0];
        wire [11:0] pixel_wall[63:0];
        wire [3:0] pixel_idx_wall[63:0];
        wire [9:0] pos_h_wall[63:0], pos_v_wall[63:0];
                
	select_pixel SP_CY(
        .h_cnt(h_cnt), .v_cnt(v_cnt),
        .pos_h(pos_h_CY),.pos_v(pos_v_CY),
        .size_h(20),.size_v(20),
        .now_pixel_idx(pixel_idx_CY),
        .pixel_0(pixel_CY_front_stand),
        .pixel_1(pixel_CY_front_walk_L),
        .pixel_2(pixel_CY_front_walk_R),
        .pixel_3(pixel_CY_right_stand),
        .pixel_4(pixel_CY_right_walk),
        .pixel_5(pixel_CY_left_stand),
        .pixel_6(pixel_CY_left_walk),
        .pixel_7(pixel_CY_back_stand),
        .pixel_8(pixel_CY_back_walk_L),
        .pixel_9(pixel_CY_back_walk_R),
        .pixel_A(pixel_CY_front_attack),
        .pixel_B(pixel_CY_back_attack),
        .pixel_C(pixel_CY_left_attack),
        .pixel_D(pixel_CY_right_attack),
        .now_pixel(pixel_CY)
	);
	
	select_pixel SP_monster_1(
        .h_cnt(h_cnt), .v_cnt(v_cnt),
        .pos_h(pos_h_monster_1),.pos_v(pos_v_monster_1),
        .size_h(20),.size_v(20),
        .now_pixel_idx(pixel_idx_monster_1),
        .pixel_0(pixel_CS_student_L),
        .pixel_1(pixel_CS_student_R),
        .now_pixel(pixel_monster_1)
	);
	
	select_pixel SP_computer_room_entrance(
        .h_cnt(h_cnt), .v_cnt(v_cnt),
        .pos_h(pos_h_computer_room_entrance),.pos_v(pos_v_computer_room_entrance),
        .size_h(20),.size_v(20),
        .now_pixel_idx(0),
        .pixel_0(pixel_computer_room_entrance),
        .now_pixel(pixel_computer_room_entrance_ins)
	);
	
	select_pixel SP_heart_0(
        .h_cnt(h_cnt), .v_cnt(v_cnt),
        .pos_h(pos_h_heart[0]),.pos_v(pos_v_heart[0]),
        .size_h(20),.size_v(20),
        .now_pixel_idx(0),
        .pixel_0(pixel_heart[0]),
        .now_pixel(pixel_heart_ins[0])
	);
	
	select_pixel SP_heart_1(
        .h_cnt(h_cnt), .v_cnt(v_cnt),
        .pos_h(pos_h_heart[1]),.pos_v(pos_v_heart[1]),
        .size_h(20),.size_v(20),
        .now_pixel_idx(0),
        .pixel_0(pixel_heart[1]),
        .now_pixel(pixel_heart_ins[1])
	);
	
	select_pixel SP_heart_2(
        .h_cnt(h_cnt), .v_cnt(v_cnt),
        .pos_h(pos_h_heart[2]),.pos_v(pos_v_heart[2]),
        .size_h(20),.size_v(20),
        .now_pixel_idx(0),
        .pixel_0(pixel_heart[2]),
        .now_pixel(pixel_heart_ins[2])
	);
	
	select_pixel SP_w0(
        .h_cnt(h_cnt), .v_cnt(v_cnt),
        .pos_h(pos_h_wall[0]),.pos_v(pos_v_wall[0]),
        .size_h(20),.size_v(20),
        .now_pixel_idx(0),
        .pixel_0(pixel_overwall_wall[1]),
        .now_pixel(pixel_wall[0])
    );
    select_pixel SP_w1(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[1]),.pos_v(pos_v_wall[1]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[1])
    );
    select_pixel SP_w2(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[2]),.pos_v(pos_v_wall[2]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[2])
    );
    select_pixel SP_w3(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[3]),.pos_v(pos_v_wall[3]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[3])
    );
    select_pixel SP_w4(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[4]),.pos_v(pos_v_wall[4]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[4])
    );
    select_pixel SP_w5(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[5]),.pos_v(pos_v_wall[5]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[5])
    );
    select_pixel SP_w6(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[6]),.pos_v(pos_v_wall[6]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[6])
    );
    select_pixel SP_w7(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[7]),.pos_v(pos_v_wall[7]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[7])
    );
    select_pixel SP_w8(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[8]),.pos_v(pos_v_wall[8]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[8])
    );
    select_pixel SP_w9(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[9]),.pos_v(pos_v_wall[9]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[9])
    );
    select_pixel SP_w10(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[10]),.pos_v(pos_v_wall[10]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[10])
    );
    select_pixel SP_w11(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[11]),.pos_v(pos_v_wall[11]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[11])
    );
    select_pixel SP_w12(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[12]),.pos_v(pos_v_wall[12]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[12])
    );
    select_pixel SP_w13(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[13]),.pos_v(pos_v_wall[13]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[13])
    );
    select_pixel SP_w14(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[14]),.pos_v(pos_v_wall[14]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[14])
    );
    select_pixel SP_w15(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[15]),.pos_v(pos_v_wall[15]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[15])
    );
    select_pixel SP_w16(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[16]),.pos_v(pos_v_wall[16]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[16])
    );
    select_pixel SP_w17(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[17]),.pos_v(pos_v_wall[17]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[17])
    );
    select_pixel SP_w18(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[18]),.pos_v(pos_v_wall[18]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[18])
    );
    select_pixel SP_w19(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[19]),.pos_v(pos_v_wall[19]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[19])
    );
    select_pixel SP_w20(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[20]),.pos_v(pos_v_wall[20]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[20])
    );
    select_pixel SP_w21(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[21]),.pos_v(pos_v_wall[21]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[21])
    );
    select_pixel SP_w22(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[22]),.pos_v(pos_v_wall[22]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[22])
    );
    select_pixel SP_w23(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[23]),.pos_v(pos_v_wall[23]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[23])
    );
    select_pixel SP_w24(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[24]),.pos_v(pos_v_wall[24]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[24])
    );
    select_pixel SP_w25(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[25]),.pos_v(pos_v_wall[25]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[25])
    );
    select_pixel SP_w26(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[26]),.pos_v(pos_v_wall[26]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[26])
    );
    select_pixel SP_w27(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[27]),.pos_v(pos_v_wall[27]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[27])
    );
    select_pixel SP_w28(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[28]),.pos_v(pos_v_wall[28]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[28])
    );
    select_pixel SP_w29(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[29]),.pos_v(pos_v_wall[29]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[29])
    );
    select_pixel SP_w30(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[30]),.pos_v(pos_v_wall[30]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[30])
    );
    select_pixel SP_w31(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[31]),.pos_v(pos_v_wall[31]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[31])
    );
    select_pixel SP_w32(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[32]),.pos_v(pos_v_wall[32]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[32])
    );
    select_pixel SP_w33(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[33]),.pos_v(pos_v_wall[33]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[33])
    );
    select_pixel SP_w34(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[34]),.pos_v(pos_v_wall[34]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[34])
    );
    select_pixel SP_w35(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[35]),.pos_v(pos_v_wall[35]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[35])
    );
    select_pixel SP_w36(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[36]),.pos_v(pos_v_wall[36]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[36])
    );
    select_pixel SP_w37(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[37]),.pos_v(pos_v_wall[37]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[37])
    );
    select_pixel SP_w38(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[38]),.pos_v(pos_v_wall[38]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[38])
    );
    select_pixel SP_w39(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[39]),.pos_v(pos_v_wall[39]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[39])
    );
    select_pixel SP_w40(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[40]),.pos_v(pos_v_wall[40]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[40])
    );
    select_pixel SP_w41(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[41]),.pos_v(pos_v_wall[41]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[41])
    );
    select_pixel SP_w42(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[42]),.pos_v(pos_v_wall[42]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[42])
    );
    select_pixel SP_w43(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[43]),.pos_v(pos_v_wall[43]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[43])
    );
    select_pixel SP_w44(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[44]),.pos_v(pos_v_wall[44]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[44])
    );
    select_pixel SP_w45(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[45]),.pos_v(pos_v_wall[45]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[45])
    );
    select_pixel SP_w46(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[46]),.pos_v(pos_v_wall[46]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[46])
    );
    select_pixel SP_w47(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[47]),.pos_v(pos_v_wall[47]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[47])
    );
    select_pixel SP_w48(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[48]),.pos_v(pos_v_wall[48]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[48])
    );
    select_pixel SP_w49(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[49]),.pos_v(pos_v_wall[49]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[49])
    );
    select_pixel SP_w50(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[50]),.pos_v(pos_v_wall[50]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[50])
    );
    select_pixel SP_w51(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[51]),.pos_v(pos_v_wall[51]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[51])
    );
    select_pixel SP_w52(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[52]),.pos_v(pos_v_wall[52]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[52])
    );
    select_pixel SP_w53(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[53]),.pos_v(pos_v_wall[53]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[53])
    );
    select_pixel SP_w54(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[54]),.pos_v(pos_v_wall[54]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[54])
    );
    select_pixel SP_w55(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[55]),.pos_v(pos_v_wall[55]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[55])
    );
    select_pixel SP_w56(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[56]),.pos_v(pos_v_wall[56]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[56])
    );
    select_pixel SP_w57(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[57]),.pos_v(pos_v_wall[57]),
            .size_h(320),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[57])
    );
    select_pixel SP_w58(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[58]),.pos_v(pos_v_wall[58]),
            .size_h(320),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[58])
    );
    select_pixel SP_w59(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[59]),.pos_v(pos_v_wall[59]),
            .size_h(320),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall[1]),
            .now_pixel(pixel_wall[59])
    );
    
    select_pixel SP_weapon(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_weapon),.pos_v(pos_v_weapon),
            .size_h(20),.size_v(20),
            .now_pixel_idx(pixel_idx_weapon),
            .pixel_0(pixel_wooden_fpga_up),
            .pixel_1(pixel_wooden_fpga_down),
            .pixel_2(pixel_wooden_fpga_left),
            .pixel_3(pixel_wooden_fpga_right),
            .now_pixel(pixel_weapon)
    );


	RGB_GEN RGB_GEN_(
	   .valid(valid),
       .v_cnt(v_cnt),
	   .pixel_CY(pixel_CY),
	   .pixel_monster_1(pixel_monster_1),
	   .pixel_computer_room_entrance_ins(pixel_computer_room_entrance_ins),
	   .pixel_heart_ins_0(pixel_heart_ins[0]),
	   .pixel_heart_ins_1(pixel_heart_ins[1]),
	   .pixel_heart_ins_2(pixel_heart_ins[2]),
	   .pixel_weapon(pixel_weapon),
	   .pixel_wall_0(pixel_wall[0]),
       .pixel_wall_1(pixel_wall[1]),
       .pixel_wall_2(pixel_wall[2]),
       .pixel_wall_3(pixel_wall[3]),
       .pixel_wall_4(pixel_wall[4]),
       .pixel_wall_5(pixel_wall[5]),   
       .pixel_wall_6(pixel_wall[6]),
       .pixel_wall_7(pixel_wall[7]),
       .pixel_wall_8(pixel_wall[8]),
       .pixel_wall_9(pixel_wall[9]),
       .pixel_wall_10(pixel_wall[10]),
       .pixel_wall_11(pixel_wall[11]),
       .pixel_wall_12(pixel_wall[12]),
       .pixel_wall_13(pixel_wall[13]),
       .pixel_wall_14(pixel_wall[14]),
       .pixel_wall_15(pixel_wall[15]),
       .pixel_wall_16(pixel_wall[16]),
       .pixel_wall_17(pixel_wall[17]),
       .pixel_wall_18(pixel_wall[18]),
       .pixel_wall_19(pixel_wall[19]),
       .pixel_wall_20(pixel_wall[20]),
       .pixel_wall_21(pixel_wall[21]),
       .pixel_wall_22(pixel_wall[22]),
       .pixel_wall_23(pixel_wall[23]),
       .pixel_wall_24(pixel_wall[24]),
       .pixel_wall_25(pixel_wall[25]),
       .pixel_wall_26(pixel_wall[26]),
       .pixel_wall_27(pixel_wall[27]),
       .pixel_wall_28(pixel_wall[28]),
       .pixel_wall_29(pixel_wall[29]),
       .pixel_wall_30(pixel_wall[30]),
       .pixel_wall_31(pixel_wall[31]),
       .pixel_wall_32(pixel_wall[32]),
       .pixel_wall_33(pixel_wall[33]),
       .pixel_wall_34(pixel_wall[34]),
       .pixel_wall_35(pixel_wall[35]),
       .pixel_wall_36(pixel_wall[36]),
       .pixel_wall_37(pixel_wall[37]),
       .pixel_wall_38(pixel_wall[38]),
       .pixel_wall_39(pixel_wall[39]),
       .pixel_wall_40(pixel_wall[40]),
       .pixel_wall_41(pixel_wall[41]),
       .pixel_wall_42(pixel_wall[42]),
       .pixel_wall_43(pixel_wall[43]),
       .pixel_wall_44(pixel_wall[44]),
       .pixel_wall_45(pixel_wall[45]),
       .pixel_wall_46(pixel_wall[46]),
       .pixel_wall_47(pixel_wall[47]),
       .pixel_wall_48(pixel_wall[48]),
       .pixel_wall_49(pixel_wall[49]),
       .pixel_wall_50(pixel_wall[50]),
       .pixel_wall_51(pixel_wall[51]),
       .pixel_wall_52(pixel_wall[52]),
       .pixel_wall_53(pixel_wall[53]),
       .pixel_wall_54(pixel_wall[54]),
       .pixel_wall_55(pixel_wall[55]),
       .pixel_wall_56(pixel_wall[56]),
       .pixel_wall_57(pixel_wall[57]),
       .pixel_wall_58(pixel_wall[58]),
       .pixel_wall_59(pixel_wall[59]),
	   .RGB({vgaRed, vgaGreen, vgaBlue})
	);
	
	//clock
	clk_div #(2) CD0(.clk(clk), .clk_d(clk_d2));
	clk_div #(20) CD1(.clk(clk), .clk_d(clk_d22));
	
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
		.pos_v_monster_1(pos_v_monster_1),
		.pixel_idx_computer_room_entrance(pixel_idx_computer_room_entrance),
		.pos_h_computer_room_entrance(pos_h_computer_room_entrance),
		.pos_v_computer_room_entrance(pos_v_computer_room_entrance),
                .pixel_idx_heart_0(pixel_idx_heart[0]),
		.pos_h_heart_0(pos_h_heart[0]),
		.pos_v_heart_0(pos_v_heart[0]),
                .pixel_idx_heart_1(pixel_idx_heart[1]),
		.pos_h_heart_1(pos_h_heart[1]),
		.pos_v_heart_1(pos_v_heart[1]),
                .pixel_idx_heart_2(pixel_idx_heart[2]),
		.pos_h_heart_2(pos_h_heart[2]),
		.pos_v_heart_2(pos_v_heart[2]),
		.pixel_idx_weapon(pixel_idx_weapon),
		.pos_h_weapon(pos_h_weapon),
		.pos_v_weapon(pos_v_weapon),
		.pixel_idx_walls(pixel_idx_wall[0]),
		.pos_h_wall_0(pos_h_wall[0]),.pos_v_wall_0(pos_v_wall[0]),
                .pos_h_wall_1(pos_h_wall[1]),.pos_v_wall_1(pos_v_wall[1]),
                .pos_h_wall_2(pos_h_wall[2]),.pos_v_wall_2(pos_v_wall[2]),
                .pos_h_wall_3(pos_h_wall[3]),.pos_v_wall_3(pos_v_wall[3]),
                .pos_h_wall_4(pos_h_wall[4]),.pos_v_wall_4(pos_v_wall[4]),
                .pos_h_wall_5(pos_h_wall[5]),.pos_v_wall_5(pos_v_wall[5]),
                .pos_h_wall_6(pos_h_wall[6]),.pos_v_wall_6(pos_v_wall[6]),
                .pos_h_wall_7(pos_h_wall[7]),.pos_v_wall_7(pos_v_wall[7]),
                .pos_h_wall_8(pos_h_wall[8]),.pos_v_wall_8(pos_v_wall[8]),
                .pos_h_wall_9(pos_h_wall[9]),.pos_v_wall_9(pos_v_wall[9]),
                .pos_h_wall_10(pos_h_wall[10]),.pos_v_wall_10(pos_v_wall[10]),
                .pos_h_wall_11(pos_h_wall[11]),.pos_v_wall_11(pos_v_wall[11]),
                .pos_h_wall_12(pos_h_wall[12]),.pos_v_wall_12(pos_v_wall[12]),
                .pos_h_wall_13(pos_h_wall[13]),.pos_v_wall_13(pos_v_wall[13]),
                .pos_h_wall_14(pos_h_wall[14]),.pos_v_wall_14(pos_v_wall[14]),
                .pos_h_wall_15(pos_h_wall[15]),.pos_v_wall_15(pos_v_wall[15]),
                .pos_h_wall_16(pos_h_wall[16]),.pos_v_wall_16(pos_v_wall[16]),
                .pos_h_wall_17(pos_h_wall[17]),.pos_v_wall_17(pos_v_wall[17]),
                .pos_h_wall_18(pos_h_wall[18]),.pos_v_wall_18(pos_v_wall[18]),
                .pos_h_wall_19(pos_h_wall[19]),.pos_v_wall_19(pos_v_wall[19]),
                .pos_h_wall_20(pos_h_wall[20]),.pos_v_wall_20(pos_v_wall[20]),
                .pos_h_wall_21(pos_h_wall[21]),.pos_v_wall_21(pos_v_wall[21]),
                .pos_h_wall_22(pos_h_wall[22]),.pos_v_wall_22(pos_v_wall[22]),
                .pos_h_wall_23(pos_h_wall[23]),.pos_v_wall_23(pos_v_wall[23]),
                .pos_h_wall_24(pos_h_wall[24]),.pos_v_wall_24(pos_v_wall[24]),
                .pos_h_wall_25(pos_h_wall[25]),.pos_v_wall_25(pos_v_wall[25]),
                .pos_h_wall_26(pos_h_wall[26]),.pos_v_wall_26(pos_v_wall[26]),
                .pos_h_wall_27(pos_h_wall[27]),.pos_v_wall_27(pos_v_wall[27]),
                .pos_h_wall_28(pos_h_wall[28]),.pos_v_wall_28(pos_v_wall[28]),
                .pos_h_wall_29(pos_h_wall[29]),.pos_v_wall_29(pos_v_wall[29]),
                .pos_h_wall_30(pos_h_wall[30]),.pos_v_wall_30(pos_v_wall[30]),
                .pos_h_wall_31(pos_h_wall[31]),.pos_v_wall_31(pos_v_wall[31]),
                .pos_h_wall_32(pos_h_wall[32]),.pos_v_wall_32(pos_v_wall[32]),
                .pos_h_wall_33(pos_h_wall[33]),.pos_v_wall_33(pos_v_wall[33]),
                .pos_h_wall_34(pos_h_wall[34]),.pos_v_wall_34(pos_v_wall[34]),
                .pos_h_wall_35(pos_h_wall[35]),.pos_v_wall_35(pos_v_wall[35]),
                .pos_h_wall_36(pos_h_wall[36]),.pos_v_wall_36(pos_v_wall[36]),
                .pos_h_wall_37(pos_h_wall[37]),.pos_v_wall_37(pos_v_wall[37]),
                .pos_h_wall_38(pos_h_wall[38]),.pos_v_wall_38(pos_v_wall[38]),
                .pos_h_wall_39(pos_h_wall[39]),.pos_v_wall_39(pos_v_wall[39]),
                .pos_h_wall_40(pos_h_wall[40]),.pos_v_wall_40(pos_v_wall[40]),
                .pos_h_wall_41(pos_h_wall[41]),.pos_v_wall_41(pos_v_wall[41]),
                .pos_h_wall_42(pos_h_wall[42]),.pos_v_wall_42(pos_v_wall[42]),
                .pos_h_wall_43(pos_h_wall[43]),.pos_v_wall_43(pos_v_wall[43]),
                .pos_h_wall_44(pos_h_wall[44]),.pos_v_wall_44(pos_v_wall[44]),
                .pos_h_wall_45(pos_h_wall[45]),.pos_v_wall_45(pos_v_wall[45]),
                .pos_h_wall_46(pos_h_wall[46]),.pos_v_wall_46(pos_v_wall[46]),
                .pos_h_wall_47(pos_h_wall[47]),.pos_v_wall_47(pos_v_wall[47]),
                .pos_h_wall_48(pos_h_wall[48]),.pos_v_wall_48(pos_v_wall[48]),
                .pos_h_wall_49(pos_h_wall[49]),.pos_v_wall_49(pos_v_wall[49]),
                .pos_h_wall_50(pos_h_wall[50]),.pos_v_wall_50(pos_v_wall[50]),
                .pos_h_wall_51(pos_h_wall[51]),.pos_v_wall_51(pos_v_wall[51]),
                .pos_h_wall_52(pos_h_wall[52]),.pos_v_wall_52(pos_v_wall[52]),
                .pos_h_wall_53(pos_h_wall[53]),.pos_v_wall_53(pos_v_wall[53]),
                .pos_h_wall_54(pos_h_wall[54]),.pos_v_wall_54(pos_v_wall[54]),
                .pos_h_wall_55(pos_h_wall[55]),.pos_v_wall_55(pos_v_wall[55]),
                .pos_h_wall_56(pos_h_wall[56]),.pos_v_wall_56(pos_v_wall[56]),
                .pos_h_wall_57(pos_h_wall[57]),.pos_v_wall_57(pos_v_wall[57]),
                .pos_h_wall_58(pos_h_wall[58]),.pos_v_wall_58(pos_v_wall[58]),
                .pos_h_wall_59(pos_h_wall[59]),.pos_v_wall_59(pos_v_wall[59])
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
	
	mem_addr_gen MAG_computer_room_entrance(
		.h_cnt(h_cnt),
		.v_cnt(v_cnt), 
		.pos_h(pos_h_computer_room_entrance),
		.pos_v(pos_v_computer_room_entrance),
		.pixel_addr(pixel_addr_computer_room_entrance)
	);
	
	mem_addr_gen MAG_heart_ins_0(
		.h_cnt(h_cnt),
		.v_cnt(v_cnt), 
		.pos_h(pos_h_heart[0]),
		.pos_v(pos_v_heart[0]),
		.pixel_addr(pixel_addr_heart[0])
	);
	
	mem_addr_gen MAG_heart_ins_1(
		.h_cnt(h_cnt),
		.v_cnt(v_cnt), 
		.pos_h(pos_h_heart[1]),
		.pos_v(pos_v_heart[1]),
		.pixel_addr(pixel_addr_heart[1])
	);
	
	mem_addr_gen MAG_heart_ins_2(
		.h_cnt(h_cnt),
		.v_cnt(v_cnt), 
		.pos_h(pos_h_heart[2]),
		.pos_v(pos_v_heart[2]),
		.pixel_addr(pixel_addr_heart[2])
	);
	
	mem_addr_gen MAG_wooden_fpga_down(
		.h_cnt(h_cnt),
		.v_cnt(v_cnt), 
		.pos_h(pos_h_weapon),
		.pos_v(pos_v_weapon),
		.pixel_addr(pixel_addr_weapon)
	);
	
	  mem_addr_gen MAG_wall_0(.h_cnt(h_cnt),.v_cnt(v_cnt), 
		  .pos_h(pos_h_wall[0]),
		  .pos_v(pos_v_wall[0]),
.pixel_addr(pixel_addr_wall[0]));
      mem_addr_gen MAG_wall_1(.h_cnt(h_cnt),.v_cnt(v_cnt), 
		  .pos_h(pos_h_wall[1]),
		  .pos_v(pos_v_wall[1]),
.pixel_addr(pixel_addr_wall[1]));
      mem_addr_gen MAG_wall_2(.h_cnt(h_cnt),.v_cnt(v_cnt), 
		  .pos_h(pos_h_wall[2]),
		  .pos_v(pos_v_wall[2]),
.pixel_addr(pixel_addr_wall[2]));
      mem_addr_gen MAG_wall_3(.h_cnt(h_cnt),.v_cnt(v_cnt), 
	      .pos_h(pos_h_wall[3]),
	      .pos_v(pos_v_wall[3]),
.pixel_addr(pixel_addr_wall[3]));
	  mem_addr_gen MAG_wall_4(.h_cnt(h_cnt),.v_cnt(v_cnt), 
		  .pos_h(pos_h_wall[4]),
		  .pos_v(pos_v_wall[4]),
.pixel_addr(pixel_addr_wall[4]));
      mem_addr_gen MAG_wall_5(.h_cnt(h_cnt),.v_cnt(v_cnt), 
		  .pos_h(pos_h_wall[5]),
		  .pos_v(pos_v_wall[5]),
.pixel_addr(pixel_addr_wall[5]));
      mem_addr_gen MAG_wall_6(.h_cnt(h_cnt),.v_cnt(v_cnt), 
		  .pos_h(pos_h_wall[6]),
		  .pos_v(pos_v_wall[6]),
.pixel_addr(pixel_addr_wall[6]));
      mem_addr_gen MAG_wall_7(.h_cnt(h_cnt),.v_cnt(v_cnt), 
	      .pos_h(pos_h_wall[7]),
	      .pos_v(pos_v_wall[7]),
.pixel_addr(pixel_addr_wall[7]));
	  mem_addr_gen MAG_wall_8(.h_cnt(h_cnt),.v_cnt(v_cnt), 
		  .pos_h(pos_h_wall[8]),
		  .pos_v(pos_v_wall[8]),
.pixel_addr(pixel_addr_wall[8]));
      mem_addr_gen MAG_wall_9(.h_cnt(h_cnt),.v_cnt(v_cnt), 
		  .pos_h(pos_h_wall[9]),
		  .pos_v(pos_v_wall[9]),
.pixel_addr(pixel_addr_wall[9]));
	  mem_addr_gen MAG_wall_10(.h_cnt(h_cnt),.v_cnt(v_cnt), 
		  .pos_h(pos_h_wall[10]),
		  .pos_v(pos_v_wall[10]),
.pixel_addr(pixel_addr_wall[10]));
      mem_addr_gen MAG_wall_11(.h_cnt(h_cnt),.v_cnt(v_cnt), 
		  .pos_h(pos_h_wall[11]),
		  .pos_v(pos_v_wall[11]),
.pixel_addr(pixel_addr_wall[11]));
      mem_addr_gen MAG_wall_12(.h_cnt(h_cnt),.v_cnt(v_cnt), 
		  .pos_h(pos_h_wall[12]),
		  .pos_v(pos_v_wall[12]),
.pixel_addr(pixel_addr_wall[12]));
      mem_addr_gen MAG_wall_13(.h_cnt(h_cnt),.v_cnt(v_cnt), 
	      .pos_h(pos_h_wall[13]),
	      .pos_v(pos_v_wall[13]),
.pixel_addr(pixel_addr_wall[13]));
	  mem_addr_gen MAG_wall_14(.h_cnt(h_cnt),.v_cnt(v_cnt), 
		  .pos_h(pos_h_wall[14]),
		  .pos_v(pos_v_wall[14]),
.pixel_addr(pixel_addr_wall[14]));
      mem_addr_gen MAG_wall_15(.h_cnt(h_cnt),.v_cnt(v_cnt), 
		  .pos_h(pos_h_wall[15]),
		  .pos_v(pos_v_wall[15]),
.pixel_addr(pixel_addr_wall[15]));
      mem_addr_gen MAG_wall_16(.h_cnt(h_cnt),.v_cnt(v_cnt), 
		  .pos_h(pos_h_wall[16]),
		  .pos_v(pos_v_wall[16]),
.pixel_addr(pixel_addr_wall[16]));
      mem_addr_gen MAG_wall_17(.h_cnt(h_cnt),.v_cnt(v_cnt), 
	      .pos_h(pos_h_wall[17]),
	      .pos_v(pos_v_wall[17]),
.pixel_addr(pixel_addr_wall[17]));
	  mem_addr_gen MAG_wall_18(.h_cnt(h_cnt),.v_cnt(v_cnt), 
		  .pos_h(pos_h_wall[18]),
		  .pos_v(pos_v_wall[18]),
.pixel_addr(pixel_addr_wall[18]));
      mem_addr_gen MAG_wall_19(.h_cnt(h_cnt),.v_cnt(v_cnt), 
		  .pos_h(pos_h_wall[19]),
		  .pos_v(pos_v_wall[19]),
.pixel_addr(pixel_addr_wall[19]));
	  mem_addr_gen MAG_wall_20(.h_cnt(h_cnt),.v_cnt(v_cnt), 
		  .pos_h(pos_h_wall[20]),
		  .pos_v(pos_v_wall[20]),
.pixel_addr(pixel_addr_wall[20]));
      mem_addr_gen MAG_wall_21(.h_cnt(h_cnt),.v_cnt(v_cnt), 
		  .pos_h(pos_h_wall[21]),
		  .pos_v(pos_v_wall[21]),
.pixel_addr(pixel_addr_wall[21]));
      mem_addr_gen MAG_wall_22(.h_cnt(h_cnt),.v_cnt(v_cnt), 
		  .pos_h(pos_h_wall[22]),
		  .pos_v(pos_v_wall[22]),
.pixel_addr(pixel_addr_wall[22]));
      mem_addr_gen MAG_wall_23(.h_cnt(h_cnt),.v_cnt(v_cnt), 
	      .pos_h(pos_h_wall[23]),
	      .pos_v(pos_v_wall[23]),
.pixel_addr(pixel_addr_wall[23]));
	  mem_addr_gen MAG_wall_24(.h_cnt(h_cnt),.v_cnt(v_cnt), 
		  .pos_h(pos_h_wall[24]),
		  .pos_v(pos_v_wall[24]),
.pixel_addr(pixel_addr_wall[24]));
      mem_addr_gen MAG_wall_25(.h_cnt(h_cnt),.v_cnt(v_cnt), 
		  .pos_h(pos_h_wall[25]),
		  .pos_v(pos_v_wall[25]),
.pixel_addr(pixel_addr_wall[25]));
      mem_addr_gen MAG_wall_26(.h_cnt(h_cnt),.v_cnt(v_cnt), 
		  .pos_h(pos_h_wall[26]),
		  .pos_v(pos_v_wall[26]),
.pixel_addr(pixel_addr_wall[26]));
      mem_addr_gen MAG_wall_27(.h_cnt(h_cnt),.v_cnt(v_cnt), 
	      .pos_h(pos_h_wall[27]),
	      .pos_v(pos_v_wall[27]),
.pixel_addr(pixel_addr_wall[27]));
	  mem_addr_gen MAG_wall_28(.h_cnt(h_cnt),.v_cnt(v_cnt), 
		  .pos_h(pos_h_wall[28]),
		  .pos_v(pos_v_wall[28]),
.pixel_addr(pixel_addr_wall[28]));
      mem_addr_gen MAG_wall_29(.h_cnt(h_cnt),.v_cnt(v_cnt), 
		  .pos_h(pos_h_wall[29]),
		  .pos_v(pos_v_wall[29]),
.pixel_addr(pixel_addr_wall[29]));
	  mem_addr_gen MAG_wall_30(.h_cnt(h_cnt),.v_cnt(v_cnt), 
		  .pos_h(pos_h_wall[30]),
		  .pos_v(pos_v_wall[30]),
.pixel_addr(pixel_addr_wall[30]));
      mem_addr_gen MAG_wall_31(.h_cnt(h_cnt),.v_cnt(v_cnt), 
		  .pos_h(pos_h_wall[31]),
		  .pos_v(pos_v_wall[31]),
.pixel_addr(pixel_addr_wall[31]));
      mem_addr_gen MAG_wall_32(.h_cnt(h_cnt),.v_cnt(v_cnt), 
		  .pos_h(pos_h_wall[32]),
		  .pos_v(pos_v_wall[32]),
.pixel_addr(pixel_addr_wall[32]));
      mem_addr_gen MAG_wall_33(.h_cnt(h_cnt),.v_cnt(v_cnt), 
	      .pos_h(pos_h_wall[33]),
	      .pos_v(pos_v_wall[33]),
.pixel_addr(pixel_addr_wall[33]));
	  mem_addr_gen MAG_wall_34(.h_cnt(h_cnt),.v_cnt(v_cnt), 
		  .pos_h(pos_h_wall[34]),
		  .pos_v(pos_v_wall[34]),
.pixel_addr(pixel_addr_wall[34]));
      mem_addr_gen MAG_wall_35(.h_cnt(h_cnt),.v_cnt(v_cnt), 
		  .pos_h(pos_h_wall[35]),
		  .pos_v(pos_v_wall[35]),
.pixel_addr(pixel_addr_wall[35]));
      mem_addr_gen MAG_wall_36(.h_cnt(h_cnt),.v_cnt(v_cnt), 
		  .pos_h(pos_h_wall[36]),
		  .pos_v(pos_v_wall[36]),
.pixel_addr(pixel_addr_wall[36]));
      mem_addr_gen MAG_wall_37(.h_cnt(h_cnt),.v_cnt(v_cnt), 
	      .pos_h(pos_h_wall[37]),
	      .pos_v(pos_v_wall[37]),
.pixel_addr(pixel_addr_wall[37]));
	  mem_addr_gen MAG_wall_38(.h_cnt(h_cnt),.v_cnt(v_cnt), 
		  .pos_h(pos_h_wall[38]),
		  .pos_v(pos_v_wall[38]),
.pixel_addr(pixel_addr_wall[38]));
      mem_addr_gen MAG_wall_39(.h_cnt(h_cnt),.v_cnt(v_cnt), 
		  .pos_h(pos_h_wall[39]),
		  .pos_v(pos_v_wall[39]),
.pixel_addr(pixel_addr_wall[39]));
	  mem_addr_gen MAG_wall_40(.h_cnt(h_cnt),.v_cnt(v_cnt), 
		  .pos_h(pos_h_wall[40]),
		  .pos_v(pos_v_wall[40]),
.pixel_addr(pixel_addr_wall[40]));
      mem_addr_gen MAG_wall_41(.h_cnt(h_cnt),.v_cnt(v_cnt), 
		  .pos_h(pos_h_wall[41]),
		  .pos_v(pos_v_wall[41]),
.pixel_addr(pixel_addr_wall[41]));
      mem_addr_gen MAG_wall_42(.h_cnt(h_cnt),.v_cnt(v_cnt), 
		  .pos_h(pos_h_wall[42]),
		  .pos_v(pos_v_wall[42]),
.pixel_addr(pixel_addr_wall[42]));
      mem_addr_gen MAG_wall_43(.h_cnt(h_cnt),.v_cnt(v_cnt), 
	      .pos_h(pos_h_wall[43]),
	      .pos_v(pos_v_wall[43]),
.pixel_addr(pixel_addr_wall[43]));
	  mem_addr_gen MAG_wall_44(.h_cnt(h_cnt),.v_cnt(v_cnt), 
		  .pos_h(pos_h_wall[44]),
		  .pos_v(pos_v_wall[44]),
.pixel_addr(pixel_addr_wall[44]));
      mem_addr_gen MAG_wall_45(.h_cnt(h_cnt),.v_cnt(v_cnt), 
		  .pos_h(pos_h_wall[45]),
		  .pos_v(pos_v_wall[45]),
.pixel_addr(pixel_addr_wall[45]));
      mem_addr_gen MAG_wall_46(.h_cnt(h_cnt),.v_cnt(v_cnt), 
		  .pos_h(pos_h_wall[46]),
		  .pos_v(pos_v_wall[46]),
.pixel_addr(pixel_addr_wall[46]));
      mem_addr_gen MAG_wall_47(.h_cnt(h_cnt),.v_cnt(v_cnt), 
	      .pos_h(pos_h_wall[47]),
	      .pos_v(pos_v_wall[47]),
.pixel_addr(pixel_addr_wall[47]));
	  mem_addr_gen MAG_wall_48(.h_cnt(h_cnt),.v_cnt(v_cnt), 
		  .pos_h(pos_h_wall[48]),
		  .pos_v(pos_v_wall[48]),
.pixel_addr(pixel_addr_wall[48]));
      mem_addr_gen MAG_wall_49(.h_cnt(h_cnt),.v_cnt(v_cnt), 
		  .pos_h(pos_h_wall[49]),
		  .pos_v(pos_v_wall[49]),
.pixel_addr(pixel_addr_wall[49]));
	  mem_addr_gen MAG_wall_50(.h_cnt(h_cnt),.v_cnt(v_cnt), 
		  .pos_h(pos_h_wall[50]),
		  .pos_v(pos_v_wall[50]),
.pixel_addr(pixel_addr_wall[50]));
      mem_addr_gen MAG_wall_51(.h_cnt(h_cnt),.v_cnt(v_cnt), 
		  .pos_h(pos_h_wall[51]),
		  .pos_v(pos_v_wall[51]),
.pixel_addr(pixel_addr_wall[51]));
      mem_addr_gen MAG_wall_52(.h_cnt(h_cnt),.v_cnt(v_cnt), 
		  .pos_h(pos_h_wall[52]),
		  .pos_v(pos_v_wall[52]),
.pixel_addr(pixel_addr_wall[52]));
      mem_addr_gen MAG_wall_53(.h_cnt(h_cnt),.v_cnt(v_cnt), 
	      .pos_h(pos_h_wall[53]),
	      .pos_v(pos_v_wall[53]),
.pixel_addr(pixel_addr_wall[53]));
	  mem_addr_gen MAG_wall_54(.h_cnt(h_cnt),.v_cnt(v_cnt), 
		  .pos_h(pos_h_wall[54]),
		  .pos_v(pos_v_wall[54]),
.pixel_addr(pixel_addr_wall[54]));
      mem_addr_gen MAG_wall_55(.h_cnt(h_cnt),.v_cnt(v_cnt), 
		  .pos_h(pos_h_wall[55]),
		  .pos_v(pos_v_wall[55]),
.pixel_addr(pixel_addr_wall[55]));
      mem_addr_gen MAG_wall_56(.h_cnt(h_cnt),.v_cnt(v_cnt), 
		  .pos_h(pos_h_wall[56]),
		  .pos_v(pos_v_wall[56]),
.pixel_addr(pixel_addr_wall[56]));
      mem_addr_gen MAG_wall_57(.h_cnt(h_cnt),.v_cnt(v_cnt), 
	      .pos_h(pos_h_wall[57]),
	      .pos_v(pos_v_wall[57]),
.pixel_addr(pixel_addr_wall[57]));
	  mem_addr_gen MAG_wall_58(.h_cnt(h_cnt),.v_cnt(v_cnt), 
		  .pos_h(pos_h_wall[58]),
		  .pos_v(pos_v_wall[58]),
.pixel_addr(pixel_addr_wall[58]));
      mem_addr_gen MAG_wall_59(.h_cnt(h_cnt),.v_cnt(v_cnt), 
		  .pos_h(pos_h_wall[59]),
		  .pos_v(pos_v_wall[59]),
.pixel_addr(pixel_addr_wall[59]));


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

    BM_CY_back_attack BM_CY_back_attack_(
		.clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_CY),
        .dina(12'd0),
        .douta(pixel_CY_back_attack)
    ); 

    BM_CY_front_attack BM_CY_front_attack_(
		.clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_CY),
        .dina(12'd0),
        .douta(pixel_CY_front_attack)
    ); 

    BM_CY_right_attack BM_CY_right_attack_(
		.clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_CY),
        .dina(12'd0),
        .douta(pixel_CY_right_attack)
    ); 

    BM_CY_left_attack BM_CY_left_attack_(
		.clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_CY),
        .dina(12'd0),
        .douta(pixel_CY_left_attack)
    ); 
    
    BM_CS_student_L BM_CS_student_L_(
		.clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_monster_1),
        .dina(12'd0),
        .douta(pixel_CS_student_L)
    ); 
    
    BM_CS_student_R BM_CS_student_R_(
		.clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_monster_1),
        .dina(12'd0),
        .douta(pixel_CS_student_R)
    ); 
    
    BM_computer_room_entrance BM_computer_room_entrance_(
        .clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_computer_room_entrance),
        .dina(12'd0),
        .douta(pixel_computer_room_entrance)
    );
    
    BM_heart BM_heart_0(
        .clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_heart[0]),
        .dina(12'd0),
        .douta(pixel_heart[0])
    );
    
    BM_heart BM_heart_1(
        .clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_heart[1]),
        .dina(12'd0),
        .douta(pixel_heart[1])
    );
    
    BM_heart BM_heart_2(
        .clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_heart[2]),
        .dina(12'd0),
        .douta(pixel_heart[2])
    );
    
    BM_wooden_fpga_down BM_wooden_fpga_down_(
        .clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_weapon),
        .dina(12'd0),
        .douta(pixel_wooden_fpga_down)
    );
    
    BM_wooden_fpga_up BM_wooden_fpga_up_(
        .clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_weapon),
        .dina(12'd0),
        .douta(pixel_wooden_fpga_up)
    );
    
    BM_wooden_fpga_left BM_wooden_fpga_left_(
        .clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_weapon),
        .dina(12'd0),
        .douta(pixel_wooden_fpga_left)
    );
    
    BM_wooden_fpga_right BM_wooden_fpga_right_(
        .clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_weapon),
        .dina(12'd0),
        .douta(pixel_wooden_fpga_right)
    );
    
BM_overwall_wall BM_overwall_wall_0(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[0]),.dina(12'd0),.douta(pixel_overwall_wall[0])); 
BM_overwall_wall BM_overwall_wall_1(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[1]),.dina(12'd0),.douta(pixel_overwall_wall[1])); 
BM_overwall_wall BM_overwall_wall_2(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[2]),.dina(12'd0),.douta(pixel_overwall_wall[2])); 
BM_overwall_wall BM_overwall_wall_3(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[3]),.dina(12'd0),.douta(pixel_overwall_wall[3])); 
BM_overwall_wall BM_overwall_wall_4(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[4]),.dina(12'd0),.douta(pixel_overwall_wall[4])); 
BM_overwall_wall BM_overwall_wall_5(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[5]),.dina(12'd0),.douta(pixel_overwall_wall[5])); 
BM_overwall_wall BM_overwall_wall_6(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[6]),.dina(12'd0),.douta(pixel_overwall_wall[6])); 
BM_overwall_wall BM_overwall_wall_7(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[7]),.dina(12'd0),.douta(pixel_overwall_wall[7])); 
BM_overwall_wall BM_overwall_wall_8(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[8]),.dina(12'd0),.douta(pixel_overwall_wall[8])); 
BM_overwall_wall BM_overwall_wall_9(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[9]),.dina(12'd0),.douta(pixel_overwall_wall[9]));
BM_overwall_wall BM_overwall_wall_10(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[10]),.dina(12'd0),.douta(pixel_overwall_wall[10])); 
BM_overwall_wall BM_overwall_wall_11(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[11]),.dina(12'd0),.douta(pixel_overwall_wall[11])); 
BM_overwall_wall BM_overwall_wall_12(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[12]),.dina(12'd0),.douta(pixel_overwall_wall[12])); 
BM_overwall_wall BM_overwall_wall_13(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[13]),.dina(12'd0),.douta(pixel_overwall_wall[13])); 
BM_overwall_wall BM_overwall_wall_14(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[14]),.dina(12'd0),.douta(pixel_overwall_wall[14])); 
BM_overwall_wall BM_overwall_wall_15(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[15]),.dina(12'd0),.douta(pixel_overwall_wall[15])); 
BM_overwall_wall BM_overwall_wall_16(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[16]),.dina(12'd0),.douta(pixel_overwall_wall[16])); 
BM_overwall_wall BM_overwall_wall_17(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[17]),.dina(12'd0),.douta(pixel_overwall_wall[17])); 
BM_overwall_wall BM_overwall_wall_18(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[18]),.dina(12'd0),.douta(pixel_overwall_wall[18])); 
BM_overwall_wall BM_overwall_wall_19(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[19]),.dina(12'd0),.douta(pixel_overwall_wall[19]));
BM_overwall_wall BM_overwall_wall_20(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[20]),.dina(12'd0),.douta(pixel_overwall_wall[20])); 
BM_overwall_wall BM_overwall_wall_21(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[21]),.dina(12'd0),.douta(pixel_overwall_wall[21])); 
BM_overwall_wall BM_overwall_wall_22(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[22]),.dina(12'd0),.douta(pixel_overwall_wall[22])); 
BM_overwall_wall BM_overwall_wall_23(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[23]),.dina(12'd0),.douta(pixel_overwall_wall[23])); 
BM_overwall_wall BM_overwall_wall_24(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[24]),.dina(12'd0),.douta(pixel_overwall_wall[24])); 
BM_overwall_wall BM_overwall_wall_25(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[25]),.dina(12'd0),.douta(pixel_overwall_wall[25])); 
BM_overwall_wall BM_overwall_wall_26(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[26]),.dina(12'd0),.douta(pixel_overwall_wall[26])); 
BM_overwall_wall BM_overwall_wall_27(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[27]),.dina(12'd0),.douta(pixel_overwall_wall[27])); 
BM_overwall_wall BM_overwall_wall_28(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[28]),.dina(12'd0),.douta(pixel_overwall_wall[28])); 
BM_overwall_wall BM_overwall_wall_29(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[29]),.dina(12'd0),.douta(pixel_overwall_wall[29]));
BM_overwall_wall BM_overwall_wall_30(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[30]),.dina(12'd0),.douta(pixel_overwall_wall[30])); 
BM_overwall_wall BM_overwall_wall_31(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[31]),.dina(12'd0),.douta(pixel_overwall_wall[31])); 
BM_overwall_wall BM_overwall_wall_32(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[32]),.dina(12'd0),.douta(pixel_overwall_wall[32])); 
BM_overwall_wall BM_overwall_wall_33(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[33]),.dina(12'd0),.douta(pixel_overwall_wall[33])); 
BM_overwall_wall BM_overwall_wall_34(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[34]),.dina(12'd0),.douta(pixel_overwall_wall[34])); 
BM_overwall_wall BM_overwall_wall_35(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[35]),.dina(12'd0),.douta(pixel_overwall_wall[35])); 
BM_overwall_wall BM_overwall_wall_36(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[36]),.dina(12'd0),.douta(pixel_overwall_wall[36])); 
BM_overwall_wall BM_overwall_wall_37(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[37]),.dina(12'd0),.douta(pixel_overwall_wall[37])); 
BM_overwall_wall BM_overwall_wall_38(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[38]),.dina(12'd0),.douta(pixel_overwall_wall[38])); 
BM_overwall_wall BM_overwall_wall_39(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[39]),.dina(12'd0),.douta(pixel_overwall_wall[39]));
BM_overwall_wall BM_overwall_wall_40(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[40]),.dina(12'd0),.douta(pixel_overwall_wall[40]));
BM_overwall_wall BM_overwall_wall_41(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[41]),.dina(12'd0),.douta(pixel_overwall_wall[41]));
BM_overwall_wall BM_overwall_wall_42(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[42]),.dina(12'd0),.douta(pixel_overwall_wall[42]));
BM_overwall_wall BM_overwall_wall_43(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[43]),.dina(12'd0),.douta(pixel_overwall_wall[43]));
BM_overwall_wall BM_overwall_wall_44(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[44]),.dina(12'd0),.douta(pixel_overwall_wall[44]));
BM_overwall_wall BM_overwall_wall_45(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[45]),.dina(12'd0),.douta(pixel_overwall_wall[45]));
BM_overwall_wall BM_overwall_wall_46(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[46]),.dina(12'd0),.douta(pixel_overwall_wall[46]));
BM_overwall_wall BM_overwall_wall_47(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[47]),.dina(12'd0),.douta(pixel_overwall_wall[47]));
BM_overwall_wall BM_overwall_wall_48(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[48]),.dina(12'd0),.douta(pixel_overwall_wall[48]));
BM_overwall_wall BM_overwall_wall_49(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[49]),.dina(12'd0),.douta(pixel_overwall_wall[49]));
BM_overwall_wall BM_overwall_wall_50(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[50]),.dina(12'd0),.douta(pixel_overwall_wall[50]));
BM_overwall_wall BM_overwall_wall_51(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[51]),.dina(12'd0),.douta(pixel_overwall_wall[51]));
BM_overwall_wall BM_overwall_wall_52(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[52]),.dina(12'd0),.douta(pixel_overwall_wall[52]));
BM_overwall_wall BM_overwall_wall_53(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[53]),.dina(12'd0),.douta(pixel_overwall_wall[53]));
BM_overwall_wall BM_overwall_wall_54(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[54]),.dina(12'd0),.douta(pixel_overwall_wall[54]));
BM_overwall_wall BM_overwall_wall_55(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[55]),.dina(12'd0),.douta(pixel_overwall_wall[55]));
BM_overwall_wall BM_overwall_wall_56(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[56]),.dina(12'd0),.douta(pixel_overwall_wall[56]));
BM_overwall_wall BM_overwall_wall_57(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[57]),.dina(12'd0),.douta(pixel_overwall_wall[57]));
BM_overwall_wall BM_overwall_wall_58(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[58]),.dina(12'd0),.douta(pixel_overwall_wall[58]));
BM_overwall_wall BM_overwall_wall_59(.clka(clk_d2),.wea(0),
           .addra(pixel_addr_wall[59]),.dina(12'd0),.douta(pixel_overwall_wall[59]));

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