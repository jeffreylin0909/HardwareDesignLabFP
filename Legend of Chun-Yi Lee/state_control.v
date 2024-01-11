module state_control(
    input clk, rst, 
    input A_signal, D_signal, W_signal, S_signal, J_signal, K_signal, L_signal, SPACE_signal, 

    output [3:0] pixel_idx_CY,
    output [9:0] pos_h_CY, pos_v_CY,

    output [3:0] pixel_idx_monster_0,
    output [9:0] pos_h_monster_0, pos_v_monster_0,
    output [3:0] pixel_idx_monster_1,
    output [9:0] pos_h_monster_1, pos_v_monster_1,

    output [3:0] pixel_idx_computer_room_entrance,
    output [9:0] pos_h_computer_room_entrance, pos_v_computer_room_entrance,

    output [3:0] pixel_idx_weapon,
	output [9:0] pos_h_weapon, pos_v_weapon,

    output [9:0] pos_h_Lv, pos_v_Lv,

    output [9:0] pos_h_rupee, pos_v_rupee,

    output [9:0] pos_h_colon_0, pos_v_colon_0,
    output [9:0] pos_h_colon_1, pos_v_colon_1,

    output [3:0] pixel_idx_kill_counter,
    output [9:0] pos_h_kill_counter, pos_v_kill_counter,
    output [3:0] pixel_idx_levl_counter,
    output [9:0] pos_h_levl_counter, pos_v_levl_counter,

    output [3:0] pixel_idx_heart_0,
	output [9:0] pos_h_heart_0, pos_v_heart_0,
    output [3:0] pixel_idx_heart_1,
	output [9:0] pos_h_heart_1, pos_v_heart_1,
    output [3:0] pixel_idx_heart_2,
	output [9:0] pos_h_heart_2, pos_v_heart_2,

    output [3:0] pixel_idx_gameover,
    output [9:0] pos_h_gameover_0, pos_v_gameover_0,
    output [9:0] pos_h_gameover_1, pos_v_gameover_1,
    output [9:0] pos_h_gameover_2, pos_v_gameover_2,
    output [9:0] pos_h_gameover_3, pos_v_gameover_3,
    output [9:0] pos_h_gameover_4, pos_v_gameover_4,
    output [9:0] pos_h_gameover_5, pos_v_gameover_5,
    output [9:0] pos_h_gameover_6, pos_v_gameover_6,
    output [9:0] pos_h_gameover_7, pos_v_gameover_7,

    output [3:0] pixel_idx_walls,
    output [9:0] pos_h_wall_0, pos_v_wall_0,
    output [9:0] pos_h_wall_1, pos_v_wall_1,
    output [9:0] pos_h_wall_2, pos_v_wall_2,
    output [9:0] pos_h_wall_3, pos_v_wall_3,
    output [9:0] pos_h_wall_4, pos_v_wall_4,
    output [9:0] pos_h_wall_5, pos_v_wall_5,
    output [9:0] pos_h_wall_6, pos_v_wall_6,
    output [9:0] pos_h_wall_7, pos_v_wall_7,
    output [9:0] pos_h_wall_8, pos_v_wall_8,
    output [9:0] pos_h_wall_9, pos_v_wall_9,
    output [9:0] pos_h_wall_10, pos_v_wall_10,
    output [9:0] pos_h_wall_11, pos_v_wall_11,
    output [9:0] pos_h_wall_12, pos_v_wall_12,
    output [9:0] pos_h_wall_13, pos_v_wall_13,
    output [9:0] pos_h_wall_14, pos_v_wall_14,
    output [9:0] pos_h_wall_15, pos_v_wall_15,
    output [9:0] pos_h_wall_16, pos_v_wall_16,
    output [9:0] pos_h_wall_17, pos_v_wall_17,
    output [9:0] pos_h_wall_18, pos_v_wall_18,
    output [9:0] pos_h_wall_19, pos_v_wall_19,
    output [9:0] pos_h_wall_20, pos_v_wall_20,
    output [9:0] pos_h_wall_21, pos_v_wall_21,
    output [9:0] pos_h_wall_22, pos_v_wall_22,
    output [9:0] pos_h_wall_23, pos_v_wall_23,
    output [9:0] pos_h_wall_24, pos_v_wall_24,
    output [9:0] pos_h_wall_25, pos_v_wall_25,
    output [9:0] pos_h_wall_26, pos_v_wall_26,
    output [9:0] pos_h_wall_27, pos_v_wall_27,
    output [9:0] pos_h_wall_28, pos_v_wall_28,
    output [9:0] pos_h_wall_29, pos_v_wall_29,
    output [9:0] pos_h_wall_30, pos_v_wall_30,
    output [9:0] pos_h_wall_31, pos_v_wall_31,
    output [9:0] pos_h_wall_32, pos_v_wall_32,
    output [9:0] pos_h_wall_33, pos_v_wall_33,
    output [9:0] pos_h_wall_34, pos_v_wall_34,
    output [9:0] pos_h_wall_35, pos_v_wall_35,
    output [9:0] pos_h_wall_36, pos_v_wall_36,
    output [9:0] pos_h_wall_37, pos_v_wall_37,
    output [9:0] pos_h_wall_38, pos_v_wall_38,
    output [9:0] pos_h_wall_39, pos_v_wall_39,
    output [9:0] pos_h_wall_40, pos_v_wall_40,
    output [9:0] pos_h_wall_41, pos_v_wall_41,
    output [9:0] pos_h_wall_42, pos_v_wall_42,
    output [9:0] pos_h_wall_43, pos_v_wall_43,
    output [9:0] pos_h_wall_44, pos_v_wall_44,
    output [9:0] pos_h_wall_45, pos_v_wall_45,
    output [9:0] pos_h_wall_46, pos_v_wall_46,
    output [9:0] pos_h_wall_47, pos_v_wall_47,
    output [9:0] pos_h_wall_48, pos_v_wall_48,
    output [9:0] pos_h_wall_49, pos_v_wall_49,
    output [9:0] pos_h_wall_50, pos_v_wall_50,
    output [9:0] pos_h_wall_51, pos_v_wall_51,
    output [9:0] pos_h_wall_52, pos_v_wall_52,
    output [9:0] pos_h_wall_53, pos_v_wall_53,
    output [9:0] pos_h_wall_54, pos_v_wall_54,
    output [9:0] pos_h_wall_55, pos_v_wall_55,
    output [9:0] pos_h_wall_56, pos_v_wall_56,
    output [9:0] pos_h_wall_57, pos_v_wall_57,
    output [9:0] pos_h_wall_58, pos_v_wall_58,
    output [9:0] pos_h_wall_59, pos_v_wall_59,
    output [9:0] pos_h_wall_60, pos_v_wall_60,
    output [9:0] pos_h_wall_61, pos_v_wall_61,
    output [9:0] pos_h_wall_62, pos_v_wall_62,
    output [9:0] pos_h_wall_63, pos_v_wall_63
    );

    wire [3:0] stage;
    wire [3:0] lives;
    wire [3:0] kills;

    count_kill CK(
        .clk(clk),
        .rst(rst),
        .monster_dead_0(monster_dead[0]),
        .monster_dead_1(monster_dead[1]),
        .monster_dead_2(monster_dead[2]),
        .monster_dead_3(monster_dead[3]),
        .kills(kills)
    );
    
	wire gameover;

    wire monster_dead[3:0];
    wire CY_monster_collision[3:0];
    wire CY_is_attacked;
    assign CY_is_attacked = (CY_monster_collision[0]&~monster_dead[0])|(CY_monster_collision[1]&~monster_dead[1])
                            |(CY_monster_collision[2]&~monster_dead[2])|(CY_monster_collision[3]&~monster_dead[3]);

    wire [3:0] wall_CY_collisions[63:0];
    wire [3:0] wall_CY_collision_total;
    assign wall_CY_collision_total = wall_CY_collisions[0]|wall_CY_collisions[1]|wall_CY_collisions[2]|wall_CY_collisions[3]|wall_CY_collisions[4]|wall_CY_collisions[5]|wall_CY_collisions[6]|wall_CY_collisions[7]|wall_CY_collisions[8]|wall_CY_collisions[9]|
                                  wall_CY_collisions[10]|wall_CY_collisions[11]|wall_CY_collisions[12]|wall_CY_collisions[13]|wall_CY_collisions[14]|wall_CY_collisions[15]|wall_CY_collisions[16]|wall_CY_collisions[17]|wall_CY_collisions[18]|wall_CY_collisions[19]|
                                  wall_CY_collisions[20]|wall_CY_collisions[21]|wall_CY_collisions[22]|wall_CY_collisions[23]|wall_CY_collisions[24]|wall_CY_collisions[25]|wall_CY_collisions[26]|wall_CY_collisions[27]|wall_CY_collisions[28]|wall_CY_collisions[29]|
                                  wall_CY_collisions[30]|wall_CY_collisions[31]|wall_CY_collisions[32]|wall_CY_collisions[33]|wall_CY_collisions[34]|wall_CY_collisions[35]|wall_CY_collisions[36]|wall_CY_collisions[37]|wall_CY_collisions[38]|wall_CY_collisions[39]|
                                  wall_CY_collisions[40]|wall_CY_collisions[41]|wall_CY_collisions[42]|wall_CY_collisions[43]|wall_CY_collisions[44]|wall_CY_collisions[45]|wall_CY_collisions[46]|wall_CY_collisions[47]|wall_CY_collisions[48]|wall_CY_collisions[49]|
                                  wall_CY_collisions[50]|wall_CY_collisions[51]|wall_CY_collisions[52]|wall_CY_collisions[53]|wall_CY_collisions[54]|wall_CY_collisions[55]|wall_CY_collisions[56]|wall_CY_collisions[57]|wall_CY_collisions[58]|wall_CY_collisions[59]|
                                  wall_CY_collisions[60]|wall_CY_collisions[61]|wall_CY_collisions[62]|wall_CY_collisions[63];
    
    wire [3:0] wall_monster_collisions[3:0][63:0];
    wire [3:0] wall_monster_collision_total[3:0];

    assign wall_monster_collision_total[0] = wall_monster_collisions[0][0]|wall_monster_collisions[0][1]|wall_monster_collisions[0][2]|wall_monster_collisions[0][3]|wall_monster_collisions[0][4]|wall_monster_collisions[0][5]|wall_monster_collisions[0][6]|wall_monster_collisions[0][7]|wall_monster_collisions[0][8]|wall_monster_collisions[0][9]|
                                  wall_monster_collisions[0][10]|wall_monster_collisions[0][11]|wall_monster_collisions[0][12]|wall_monster_collisions[0][13]|wall_monster_collisions[0][14]|wall_monster_collisions[0][15]|wall_monster_collisions[0][16]|wall_monster_collisions[0][17]|wall_monster_collisions[0][18]|wall_monster_collisions[0][19]|
                                  wall_monster_collisions[0][20]|wall_monster_collisions[0][21]|wall_monster_collisions[0][22]|wall_monster_collisions[0][23]|wall_monster_collisions[0][24]|wall_monster_collisions[0][25]|wall_monster_collisions[0][26]|wall_monster_collisions[0][27]|wall_monster_collisions[0][28]|wall_monster_collisions[0][29]|
                                  wall_monster_collisions[0][30]|wall_monster_collisions[0][31]|wall_monster_collisions[0][32]|wall_monster_collisions[0][33]|wall_monster_collisions[0][34]|wall_monster_collisions[0][35]|wall_monster_collisions[0][36]|wall_monster_collisions[0][37]|wall_monster_collisions[0][38]|wall_monster_collisions[0][39]|
                                  wall_monster_collisions[0][40]|wall_monster_collisions[0][41]|wall_monster_collisions[0][42]|wall_monster_collisions[0][43]|wall_monster_collisions[0][44]|wall_monster_collisions[0][45]|wall_monster_collisions[0][46]|wall_monster_collisions[0][47]|wall_monster_collisions[0][48]|wall_monster_collisions[0][49]|
                                  wall_monster_collisions[0][50]|wall_monster_collisions[0][51]|wall_monster_collisions[0][52]|wall_monster_collisions[0][53]|wall_monster_collisions[0][54]|wall_monster_collisions[0][55]|wall_monster_collisions[0][56]|wall_monster_collisions[0][57]|wall_monster_collisions[0][58]|wall_monster_collisions[0][59]|
                                  wall_monster_collisions[0][60]|wall_monster_collisions[0][61]|wall_monster_collisions[0][62]|wall_monster_collisions[0][63];

    assign wall_monster_collision_total[1] = wall_monster_collisions[1][0]|wall_monster_collisions[1][1]|wall_monster_collisions[1][2]|wall_monster_collisions[1][3]|wall_monster_collisions[1][4]|wall_monster_collisions[1][5]|wall_monster_collisions[1][6]|wall_monster_collisions[1][7]|wall_monster_collisions[1][8]|wall_monster_collisions[1][9]|
                                  wall_monster_collisions[1][10]|wall_monster_collisions[1][11]|wall_monster_collisions[1][12]|wall_monster_collisions[1][13]|wall_monster_collisions[1][14]|wall_monster_collisions[1][15]|wall_monster_collisions[1][16]|wall_monster_collisions[1][17]|wall_monster_collisions[1][18]|wall_monster_collisions[1][19]|
                                  wall_monster_collisions[1][20]|wall_monster_collisions[1][21]|wall_monster_collisions[1][22]|wall_monster_collisions[1][23]|wall_monster_collisions[1][24]|wall_monster_collisions[1][25]|wall_monster_collisions[1][26]|wall_monster_collisions[1][27]|wall_monster_collisions[1][28]|wall_monster_collisions[1][29]|
                                  wall_monster_collisions[1][30]|wall_monster_collisions[1][31]|wall_monster_collisions[1][32]|wall_monster_collisions[1][33]|wall_monster_collisions[1][34]|wall_monster_collisions[1][35]|wall_monster_collisions[1][36]|wall_monster_collisions[1][37]|wall_monster_collisions[1][38]|wall_monster_collisions[1][39]|
                                  wall_monster_collisions[1][40]|wall_monster_collisions[1][41]|wall_monster_collisions[1][42]|wall_monster_collisions[1][43]|wall_monster_collisions[1][44]|wall_monster_collisions[1][45]|wall_monster_collisions[1][46]|wall_monster_collisions[1][47]|wall_monster_collisions[1][48]|wall_monster_collisions[1][49]|
                                  wall_monster_collisions[1][50]|wall_monster_collisions[1][51]|wall_monster_collisions[1][52]|wall_monster_collisions[1][53]|wall_monster_collisions[1][54]|wall_monster_collisions[1][55]|wall_monster_collisions[1][56]|wall_monster_collisions[1][57]|wall_monster_collisions[1][58]|wall_monster_collisions[1][59]|
                                  wall_monster_collisions[1][60]|wall_monster_collisions[1][61]|wall_monster_collisions[1][62]|wall_monster_collisions[1][63];

    wire weapon_monster_collision[3:0];

    stage_control SC(
        .clk(clk), .rst(rst),
        .kills(kills),
        .gameover(gameover),
        .SPACE_signal(SPACE_signal),
        .stage(stage)
    );

    lives_gameover_hearts LDH(
        .clk(clk),
        .lives(lives), .gameover(gameover),
        .pixel_idx_heart_0(pixel_idx_heart_0),
        .pixel_idx_heart_1(pixel_idx_heart_1),
        .pixel_idx_heart_2(pixel_idx_heart_2)
    );

	//CY
	maincharacter MC(
	   .clk(clk),
	   .rst(rst), 
	   .A_signal(A_signal), 
	   .D_signal(D_signal), 
	   .W_signal(W_signal), 
	   .S_signal(S_signal), 
       .SPACE_signal(SPACE_signal),
	   .stage(stage), 
	   .pos_h(pos_h_CY), 
	   .pos_v(pos_v_CY), 
	   .state(pixel_idx_CY),
	   .wall_collision(wall_CY_collision_total),
       .is_attacked(CY_is_attacked),
       .lives(lives)
	);

    //monster_0
    monster m0(
	    .clk(clk), 
	    .rst(rst), 
	    .stage(stage), 
        .state(pixel_idx_monster_0),
	    .pos_h(pos_h_monster_0), 
	    .pos_v(pos_v_monster_0),
        .wall_collision(wall_monster_collision_total[0]),
        .enable_weapon_collision(SPACE_signal),
        .weapon_collision(weapon_monster_collision[0]),
        .random_seed(13'hA),
        .is_dead(monster_dead[0])
	 );

    //monster_1
    monster m1(
	    .clk(clk), 
	    .rst(rst), 
	    .stage(stage), 
        .state(pixel_idx_monster_1),
	    .pos_h(pos_h_monster_1), 
	    .pos_v(pos_v_monster_1),
        .wall_collision(wall_monster_collision_total[1]),
        .enable_weapon_collision(SPACE_signal),
        .weapon_collision(weapon_monster_collision[1]),
        .random_seed(13'hf),
        .is_dead(monster_dead[1])
	 );

    //weapon
    weapon weapon_(
        .clk(clk), 
	    .rst(rst), 
        .type(0),
        .stage(stage), 
        .state_CY(pixel_idx_CY),
        .pos_h_CY(pos_h_CY),
        .pos_v_CY(pos_v_CY),
        .state(pixel_idx_weapon),
        .pos_h(pos_h_weapon),
        .pos_v(pos_v_weapon)
    );
	
    assign pos_h_colon_0 = 310;
    assign pos_v_colon_0 = 240;

    assign pos_h_colon_1 = 250;
    assign pos_v_colon_1 = 240;

    assign pos_h_Lv = 320;
    assign pos_v_Lv = 240;

    assign pos_h_rupee = 260;
    assign pos_v_rupee = 240;

    assign pixel_idx_kill_counter = kills;
    assign pos_h_kill_counter = 220;
    assign pos_v_kill_counter = 240;

    assign pixel_idx_levl_counter = 0;
    assign pos_h_levl_counter = 280;
    assign pos_v_levl_counter = 240;

    assign pixel_idx_gameover = (stage == 4'hf)? 0: 4'hf;
    assign pos_h_gameover_0 = 240;
    assign pos_v_gameover_0 = 120;
    assign pos_h_gameover_1 = 220;
    assign pos_v_gameover_1 = 120;
    assign pos_h_gameover_2 = 200;
    assign pos_v_gameover_2 = 120;
    assign pos_h_gameover_3 = 180;
    assign pos_v_gameover_3 = 120;
    assign pos_h_gameover_4 = 160;
    assign pos_v_gameover_4 = 120;
    assign pos_h_gameover_5 = 140;
    assign pos_v_gameover_5 = 120;
    assign pos_h_gameover_6 = 120;
    assign pos_v_gameover_6 = 120;
    assign pos_h_gameover_7 = 100;
    assign pos_v_gameover_7 = 120;

    assign pos_h_heart_0 = 60;
    assign pos_v_heart_0 = 240;
    assign pos_h_heart_1 = 40;
    assign pos_v_heart_1 = 240;
    assign pos_h_heart_2 = 20;
    assign pos_v_heart_2 = 240;

	assign pos_h_computer_room_entrance = 20;
	assign pos_v_computer_room_entrance = 120;
	
    //wall image
    assign pos_h_wall_0 = 20;
    assign pos_v_wall_0 = 20;//
    assign pos_h_wall_1 = 40;
    assign pos_v_wall_1 = 20;//
    assign pos_h_wall_2 = 60;
    assign pos_v_wall_2 = 20;//
    assign pos_h_wall_3 = 80;
    assign pos_v_wall_3 = 20;//
    assign pos_h_wall_4 = 100;
    assign pos_v_wall_4 = 20;//
    assign pos_h_wall_5 = 120;
    assign pos_v_wall_5 = 20;//
    assign pos_h_wall_6 = 140;
    assign pos_v_wall_6 = 20;//
    assign pos_h_wall_7 = 160;
    assign pos_v_wall_7 = 20;//
    assign pos_h_wall_8 = 180;
    assign pos_v_wall_8 = 20;//
    assign pos_h_wall_9 = 200;
    assign pos_v_wall_9 = 20;//
    assign pos_h_wall_10 = 220;
    assign pos_v_wall_10 = 20;//
    assign pos_h_wall_11 = 240;
    assign pos_v_wall_11 = 20;//
    assign pos_h_wall_12 = 260;
    assign pos_v_wall_12 = 20;//
    assign pos_h_wall_13 = 280;
    assign pos_v_wall_13 = 20;//
    assign pos_h_wall_14 = 300;
    assign pos_v_wall_14 = 20;//
    assign pos_h_wall_15 = 320;
    assign pos_v_wall_15 = 20;////

    assign pos_h_wall_16 = 20;
    assign pos_v_wall_16 = 220;//
    assign pos_h_wall_17 = 40;
    assign pos_v_wall_17 = 220;//
    assign pos_h_wall_18 = 60;
    assign pos_v_wall_18 = 220;//
    assign pos_h_wall_19 = 80;
    assign pos_v_wall_19 = 220;//
    assign pos_h_wall_20 = 100;
    assign pos_v_wall_20 = 220;//
    assign pos_h_wall_21 = 120;
    assign pos_v_wall_21 = 220;//
    assign pos_h_wall_22 = 140;
    assign pos_v_wall_22 = 220;//
    assign pos_h_wall_23 = 160;
    assign pos_v_wall_23 = 220;//
    assign pos_h_wall_24 = 180;
    assign pos_v_wall_24 = 220;//
    assign pos_h_wall_25 = 200;
    assign pos_v_wall_25 = 220;//
    assign pos_h_wall_26 = 220;
    assign pos_v_wall_26 = 220;//
    assign pos_h_wall_27 = 240;
    assign pos_v_wall_27 = 220;//
    assign pos_h_wall_28 = 260;
    assign pos_v_wall_28 = 220;//
    assign pos_h_wall_29 = 280;
    assign pos_v_wall_29 = 220;//
    assign pos_h_wall_30 = 300;
    assign pos_v_wall_30 = 220;//
    assign pos_h_wall_31 = 320;
    assign pos_v_wall_31 = 220;////

    assign pos_h_wall_32 = 20;
    assign pos_v_wall_32 = 40;//
    assign pos_h_wall_33 = 20;
    assign pos_v_wall_33 = 60;//
    assign pos_h_wall_34 = 20;
    assign pos_v_wall_34 = 80;//
    assign pos_h_wall_35 = 20;
    assign pos_v_wall_35 = 100;//
    //door
    assign pos_h_wall_36 = 20;
    assign pos_v_wall_36 = 140;//
    assign pos_h_wall_37 = 20;
    assign pos_v_wall_37 = 160;//
    assign pos_h_wall_38 = 20;
    assign pos_v_wall_38 = 180;//
    assign pos_h_wall_39 = 20;
    assign pos_v_wall_39 = 200;////

    assign pos_h_wall_40 = 320;
    assign pos_v_wall_40 = 40;//
    assign pos_h_wall_41 = 320;
    assign pos_v_wall_41 = 60;//
    assign pos_h_wall_42 = 320;
    assign pos_v_wall_42 = 80;//
    assign pos_h_wall_43 = 320;
    assign pos_v_wall_43 = 100;//
    assign pos_h_wall_44 = 320;
    assign pos_v_wall_44 = 120;//
    assign pos_h_wall_45 = 320;
    assign pos_v_wall_45 = 140;//
    assign pos_h_wall_46 = 320;
    assign pos_v_wall_46 = 160;//
    assign pos_h_wall_47 = 320;
    assign pos_v_wall_47 = 180;//
    assign pos_h_wall_48 = 320;
    assign pos_v_wall_48 = 200;////

    assign pos_h_wall_49 = 280;
    assign pos_v_wall_49 = 80;//
    assign pos_h_wall_50 = 260;
    assign pos_v_wall_50 = 80;//
    assign pos_h_wall_51 = 260;
    assign pos_v_wall_51 = 100;//
    assign pos_h_wall_52 = 260;
    assign pos_v_wall_52 = 60;//
    assign pos_h_wall_53 = 240;
    assign pos_v_wall_53 = 80;////

    assign pos_h_wall_54 = 160;
    assign pos_v_wall_54 = 160;//
    assign pos_h_wall_55 = 180;
    assign pos_v_wall_55 = 160;//
    assign pos_h_wall_56 = 200;
    assign pos_v_wall_56 = 160;//
    assign pos_h_wall_57 = 180;
    assign pos_v_wall_57 = 140;////

    assign pos_h_wall_58 = 120;
    assign pos_v_wall_58 = 120;//
    assign pos_h_wall_59 = 100;
    assign pos_v_wall_59 = 120;////
    assign pos_h_wall_60 = 100;
    assign pos_v_wall_60 = 100;////
    assign pos_h_wall_61 = 80;
    assign pos_v_wall_61 = 100;////
    assign pos_h_wall_62 = 180;
    assign pos_v_wall_62 = 60;////
    assign pos_h_wall_63 = 160;
    assign pos_v_wall_63 = 60;////

    collide CY_monster_1(
        .pos_h_1(pos_h_monster_1),.pos_v_1(pos_v_monster_1),
        .pos_h_2(pos_h_CY),.pos_v_2(pos_v_CY),
        .collision(CY_monster_collision[1])
    );

    collide CY_monster_0(
        .pos_h_1(pos_h_monster_0),.pos_v_1(pos_v_monster_0),
        .pos_h_2(pos_h_CY),.pos_v_2(pos_v_CY),
        .collision(CY_monster_collision[0])
    );

    collide weapon_monster_1(
        .pos_h_1(pos_h_monster_1),.pos_v_1(pos_v_monster_1),
        .pos_h_2(pos_h_weapon),.pos_v_2(pos_v_weapon),
        .collision(weapon_monster_collision[1])
    );

    collide weapon_monster_0(
        .pos_h_1(pos_h_monster_0),.pos_v_1(pos_v_monster_0),
        .pos_h_2(pos_h_weapon),.pos_v_2(pos_v_weapon),
        .collision(weapon_monster_collision[0])
    );

    //wall CY collision
    wall wall_0(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_0),.pos_v(pos_v_wall_0),
        .collision(wall_CY_collisions[0])
    );
    wall wall_1(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_1),.pos_v(pos_v_wall_1),
        .collision(wall_CY_collisions[1])
    );
    wall wall_2(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_2),.pos_v(pos_v_wall_2),
        .collision(wall_CY_collisions[2])
    );
    wall wall_3(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_3),.pos_v(pos_v_wall_3),
        .collision(wall_CY_collisions[3])
    );
    wall wall_4(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_4),.pos_v(pos_v_wall_4),
        .collision(wall_CY_collisions[4])
    );
    wall wall_5(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_5),.pos_v(pos_v_wall_5),
        .collision(wall_CY_collisions[5])
    );
    wall wall_6(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_6),.pos_v(pos_v_wall_6),
        .collision(wall_CY_collisions[6])
    );
    wall wall_7(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_7),.pos_v(pos_v_wall_7),
        .collision(wall_CY_collisions[7])
    );
    wall wall_8(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_8),.pos_v(pos_v_wall_8),
        .collision(wall_CY_collisions[8])
    );
    wall wall_9(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_9),.pos_v(pos_v_wall_9),
        .collision(wall_CY_collisions[9])
    );
    wall wall_10(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_10),.pos_v(pos_v_wall_10),
        .collision(wall_CY_collisions[10])
    );
    wall wall_11(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_11),.pos_v(pos_v_wall_11),
        .collision(wall_CY_collisions[11])
    );
    wall wall_12(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_12),.pos_v(pos_v_wall_12),
        .collision(wall_CY_collisions[12])
    );
    wall wall_13(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_13),.pos_v(pos_v_wall_13),
        .collision(wall_CY_collisions[13])
    );
    wall wall_14(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_14),.pos_v(pos_v_wall_14),
        .collision(wall_CY_collisions[14])
    );
    wall wall_15(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_15),.pos_v(pos_v_wall_15),
        .collision(wall_CY_collisions[15])
    );
    wall wall_16(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_16),.pos_v(pos_v_wall_16),
        .collision(wall_CY_collisions[16])
    );
    wall wall_17(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_17),.pos_v(pos_v_wall_17),
        .collision(wall_CY_collisions[17])
    );
    wall wall_18(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_18),.pos_v(pos_v_wall_18),
        .collision(wall_CY_collisions[18])
    );
    wall wall_19(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_19),.pos_v(pos_v_wall_19),
        .collision(wall_CY_collisions[19])
    );
    wall wall_20(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_20),.pos_v(pos_v_wall_20),
        .collision(wall_CY_collisions[20])
    );
    wall wall_21(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_21),.pos_v(pos_v_wall_21),
        .collision(wall_CY_collisions[21])
    );
    wall wall_22(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_22),.pos_v(pos_v_wall_22),
        .collision(wall_CY_collisions[22])
    );
    wall wall_23(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_23),.pos_v(pos_v_wall_23),
        .collision(wall_CY_collisions[23])
    );
    wall wall_24(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_24),.pos_v(pos_v_wall_24),
        .collision(wall_CY_collisions[24])
    );
    wall wall_25(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_25),.pos_v(pos_v_wall_25),
        .collision(wall_CY_collisions[25])
    );
    wall wall_26(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_26),.pos_v(pos_v_wall_26),
        .collision(wall_CY_collisions[26])
    );
    wall wall_27(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_27),.pos_v(pos_v_wall_27),
        .collision(wall_CY_collisions[27])
    );
    wall wall_28(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_28),.pos_v(pos_v_wall_28),
        .collision(wall_CY_collisions[28])
    );
    wall wall_29(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_29),.pos_v(pos_v_wall_29),
        .collision(wall_CY_collisions[29])
    );
    wall wall_30(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_30),.pos_v(pos_v_wall_30),
        .collision(wall_CY_collisions[30])
    );
    wall wall_31(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_31),.pos_v(pos_v_wall_31),
        .collision(wall_CY_collisions[31])
    );
    wall wall_32(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_32),.pos_v(pos_v_wall_32),
        .collision(wall_CY_collisions[32])
    );
    wall wall_33(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_33),.pos_v(pos_v_wall_33),
        .collision(wall_CY_collisions[33])
    );
    wall wall_34(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_34),.pos_v(pos_v_wall_34),
        .collision(wall_CY_collisions[34])
    );
    wall wall_35(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_35),.pos_v(pos_v_wall_35),
        .collision(wall_CY_collisions[35])
    );
    wall wall_36(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_36),.pos_v(pos_v_wall_36),
        .collision(wall_CY_collisions[36])
    );
    wall wall_37(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_37),.pos_v(pos_v_wall_37),
        .collision(wall_CY_collisions[37])
    );
    wall wall_38(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_38),.pos_v(pos_v_wall_38),
        .collision(wall_CY_collisions[38])
    );
    wall wall_39(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_39),.pos_v(pos_v_wall_39),
        .collision(wall_CY_collisions[39])
    );
    wall wall_40(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_40),.pos_v(pos_v_wall_40),
        .collision(wall_CY_collisions[40])
    );
    wall wall_41(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_41),.pos_v(pos_v_wall_41),
        .collision(wall_CY_collisions[41])
    );
    wall wall_42(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_42),.pos_v(pos_v_wall_42),
        .collision(wall_CY_collisions[42])
    );
    wall wall_43(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_43),.pos_v(pos_v_wall_43),
        .collision(wall_CY_collisions[43])
    );
    wall wall_44(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_44),.pos_v(pos_v_wall_44),
        .collision(wall_CY_collisions[44])
    );
    wall wall_45(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_45),.pos_v(pos_v_wall_45),
        .collision(wall_CY_collisions[45])
    );
    wall wall_46(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_46),.pos_v(pos_v_wall_46),
        .collision(wall_CY_collisions[46])
    );
    wall wall_47(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_47),.pos_v(pos_v_wall_47),
        .collision(wall_CY_collisions[47])
    );
    wall wall_48(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_48),.pos_v(pos_v_wall_48),
        .collision(wall_CY_collisions[48])
    );
    wall wall_49(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_49),.pos_v(pos_v_wall_49),
        .collision(wall_CY_collisions[49])
    );
    wall wall_50(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_50),.pos_v(pos_v_wall_50),
        .collision(wall_CY_collisions[50])
    );
    wall wall_51(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_51),.pos_v(pos_v_wall_51),
        .collision(wall_CY_collisions[51])
    );
    wall wall_52(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_52),.pos_v(pos_v_wall_52),
        .collision(wall_CY_collisions[52])
    );
    wall wall_53(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_53),.pos_v(pos_v_wall_53),
        .collision(wall_CY_collisions[53])
    );
    wall wall_54(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_54),.pos_v(pos_v_wall_54),
        .collision(wall_CY_collisions[54])
    );
    wall wall_55(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_55),.pos_v(pos_v_wall_55),
        .collision(wall_CY_collisions[55])
    );
    wall wall_56(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_56),.pos_v(pos_v_wall_56),
        .collision(wall_CY_collisions[56])
    );
    wall wall_57(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_57),.pos_v(pos_v_wall_57),
        .collision(wall_CY_collisions[57])
    );
    wall wall_58(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_58),.pos_v(pos_v_wall_58),
        .collision(wall_CY_collisions[58])
    );
    wall wall_59(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_59),.pos_v(pos_v_wall_59),
        .collision(wall_CY_collisions[59])
    );
    wall wall_60(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_60),.pos_v(pos_v_wall_60),
        .collision(wall_CY_collisions[60])
    );
    wall wall_61(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_61),.pos_v(pos_v_wall_61),
        .collision(wall_CY_collisions[61])
    );
    wall wall_62(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_62),.pos_v(pos_v_wall_62),
        .collision(wall_CY_collisions[62])
    );
    wall wall_63(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_63),.pos_v(pos_v_wall_63),
        .collision(wall_CY_collisions[63])
    );
    

    //wall monster_0 collision
    wall wall_0_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_0),.pos_v(pos_v_wall_0),
        .collision(wall_monster_collisions[0][0])
    );
    wall wall_1_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_1),.pos_v(pos_v_wall_1),
        .collision(wall_monster_collisions[0][1])
    );
    wall wall_2_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_2),.pos_v(pos_v_wall_2),
        .collision(wall_monster_collisions[0][2])
    );
    wall wall_3_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_3),.pos_v(pos_v_wall_3),
        .collision(wall_monster_collisions[0][3])
    );
    wall wall_4_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_4),.pos_v(pos_v_wall_4),
        .collision(wall_monster_collisions[0][4])
    );
    wall wall_5_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_5),.pos_v(pos_v_wall_5),
        .collision(wall_monster_collisions[0][5])
    );
    wall wall_6_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_6),.pos_v(pos_v_wall_6),
        .collision(wall_monster_collisions[0][6])
    );
    wall wall_7_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_7),.pos_v(pos_v_wall_7),
        .collision(wall_monster_collisions[0][7])
    );
    wall wall_8_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_8),.pos_v(pos_v_wall_8),
        .collision(wall_monster_collisions[0][8])
    );
    wall wall_9_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_9),.pos_v(pos_v_wall_9),
        .collision(wall_monster_collisions[0][9])
    );
    wall wall_10_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_10),.pos_v(pos_v_wall_10),
        .collision(wall_monster_collisions[0][10])
    );
    wall wall_11_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_11),.pos_v(pos_v_wall_11),
        .collision(wall_monster_collisions[0][11])
    );
    wall wall_12_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_12),.pos_v(pos_v_wall_12),
        .collision(wall_monster_collisions[0][12])
    );
    wall wall_13_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_13),.pos_v(pos_v_wall_13),
        .collision(wall_monster_collisions[0][13])
    );
    wall wall_14_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_14),.pos_v(pos_v_wall_14),
        .collision(wall_monster_collisions[0][14])
    );
    wall wall_15_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_15),.pos_v(pos_v_wall_15),
        .collision(wall_monster_collisions[0][15])
    );
    wall wall_16_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_16),.pos_v(pos_v_wall_16),
        .collision(wall_monster_collisions[0][16])
    );
    wall wall_17_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_17),.pos_v(pos_v_wall_17),
        .collision(wall_monster_collisions[0][17])
    );
    wall wall_18_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_18),.pos_v(pos_v_wall_18),
        .collision(wall_monster_collisions[0][18])
    );
    wall wall_19_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_19),.pos_v(pos_v_wall_19),
        .collision(wall_monster_collisions[0][19])
    );
    wall wall_20_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_20),.pos_v(pos_v_wall_20),
        .collision(wall_monster_collisions[0][20])
    );
    wall wall_21_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_21),.pos_v(pos_v_wall_21),
        .collision(wall_monster_collisions[0][21])
    );
    wall wall_22_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_22),.pos_v(pos_v_wall_22),
        .collision(wall_monster_collisions[0][22])
    );
    wall wall_23_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_23),.pos_v(pos_v_wall_23),
        .collision(wall_monster_collisions[0][23])
    );
    wall wall_24_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_24),.pos_v(pos_v_wall_24),
        .collision(wall_monster_collisions[0][24])
    );
    wall wall_25_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_25),.pos_v(pos_v_wall_25),
        .collision(wall_monster_collisions[0][25])
    );
    wall wall_26_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_26),.pos_v(pos_v_wall_26),
        .collision(wall_monster_collisions[0][26])
    );
    wall wall_27_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_27),.pos_v(pos_v_wall_27),
        .collision(wall_monster_collisions[0][27])
    );
    wall wall_28_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_28),.pos_v(pos_v_wall_28),
        .collision(wall_monster_collisions[0][28])
    );
    wall wall_29_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_29),.pos_v(pos_v_wall_29),
        .collision(wall_monster_collisions[0][29])
    );
    wall wall_30_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_30),.pos_v(pos_v_wall_30),
        .collision(wall_monster_collisions[0][30])
    );
    wall wall_31_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_31),.pos_v(pos_v_wall_31),
        .collision(wall_monster_collisions[0][31])
    );
    wall wall_32_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_32),.pos_v(pos_v_wall_32),
        .collision(wall_monster_collisions[0][32])
    );
    wall wall_33_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_33),.pos_v(pos_v_wall_33),
        .collision(wall_monster_collisions[0][33])
    );
    wall wall_34_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_34),.pos_v(pos_v_wall_34),
        .collision(wall_monster_collisions[0][34])
    );
    wall wall_35_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_35),.pos_v(pos_v_wall_35),
        .collision(wall_monster_collisions[0][35])
    );
    wall wall_36_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_36),.pos_v(pos_v_wall_36),
        .collision(wall_monster_collisions[0][36])
    );
    wall wall_37_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_37),.pos_v(pos_v_wall_37),
        .collision(wall_monster_collisions[0][37])
    );
    wall wall_38_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_38),.pos_v(pos_v_wall_38),
        .collision(wall_monster_collisions[0][38])
    );
    wall wall_39_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_39),.pos_v(pos_v_wall_39),
        .collision(wall_monster_collisions[0][39])
    );
    wall wall_40_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_40),.pos_v(pos_v_wall_40),
        .collision(wall_monster_collisions[0][40])
    );
    wall wall_41_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_41),.pos_v(pos_v_wall_41),
        .collision(wall_monster_collisions[0][41])
    );
    wall wall_42_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_42),.pos_v(pos_v_wall_42),
        .collision(wall_monster_collisions[0][42])
    );
    wall wall_43_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_43),.pos_v(pos_v_wall_43),
        .collision(wall_monster_collisions[0][43])
    );
    wall wall_44_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_44),.pos_v(pos_v_wall_44),
        .collision(wall_monster_collisions[0][44])
    );
    wall wall_45_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_45),.pos_v(pos_v_wall_45),
        .collision(wall_monster_collisions[0][45])
    );
    wall wall_46_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_46),.pos_v(pos_v_wall_46),
        .collision(wall_monster_collisions[0][46])
    );
    wall wall_47_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_47),.pos_v(pos_v_wall_47),
        .collision(wall_monster_collisions[0][47])
    );
    wall wall_48_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_48),.pos_v(pos_v_wall_48),
        .collision(wall_monster_collisions[0][48])
    );
    wall wall_49_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_49),.pos_v(pos_v_wall_49),
        .collision(wall_monster_collisions[0][49])
    );
    wall wall_50_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_50),.pos_v(pos_v_wall_50),
        .collision(wall_monster_collisions[0][50])
    );
    wall wall_51_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_51),.pos_v(pos_v_wall_51),
        .collision(wall_monster_collisions[0][51])
    );
    wall wall_52_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_52),.pos_v(pos_v_wall_52),
        .collision(wall_monster_collisions[0][52])
    );
    wall wall_53_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_53),.pos_v(pos_v_wall_53),
        .collision(wall_monster_collisions[0][53])
    );
    wall wall_54_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_54),.pos_v(pos_v_wall_54),
        .collision(wall_monster_collisions[0][54])
    );
    wall wall_55_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_55),.pos_v(pos_v_wall_55),
        .collision(wall_monster_collisions[0][55])
    );
    wall wall_56_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_56),.pos_v(pos_v_wall_56),
        .collision(wall_monster_collisions[0][56])
    );
    wall wall_57_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_57),.pos_v(pos_v_wall_57),
        .collision(wall_monster_collisions[0][57])
    );
    wall wall_58_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_58),.pos_v(pos_v_wall_58),
        .collision(wall_monster_collisions[0][58])
    );
    wall wall_59_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_59),.pos_v(pos_v_wall_59),
        .collision(wall_monster_collisions[0][59])
    );
    wall wall_60_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_60),.pos_v(pos_v_wall_60),
        .collision(wall_monster_collisions[0][60])
    );
    wall wall_61_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_61),.pos_v(pos_v_wall_61),
        .collision(wall_monster_collisions[0][61])
    );
    wall wall_62_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_62),.pos_v(pos_v_wall_62),
        .collision(wall_monster_collisions[0][62])
    );
    wall wall_63_monster_0(
        .pos_h_CY(pos_h_monster_0),.pos_v_CY(pos_v_monster_0),
        .pos_h(pos_h_wall_63),.pos_v(pos_v_wall_63),
        .collision(wall_monster_collisions[0][63])
    );



    //wall monster_1 collision
    wall wall_0_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_0),.pos_v(pos_v_wall_0),
        .collision(wall_monster_collisions[1][0])
    );
    wall wall_1_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_1),.pos_v(pos_v_wall_1),
        .collision(wall_monster_collisions[1][1])
    );
    wall wall_2_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_2),.pos_v(pos_v_wall_2),
        .collision(wall_monster_collisions[1][2])
    );
    wall wall_3_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_3),.pos_v(pos_v_wall_3),
        .collision(wall_monster_collisions[1][3])
    );
    wall wall_4_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_4),.pos_v(pos_v_wall_4),
        .collision(wall_monster_collisions[1][4])
    );
    wall wall_5_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_5),.pos_v(pos_v_wall_5),
        .collision(wall_monster_collisions[1][5])
    );
    wall wall_6_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_6),.pos_v(pos_v_wall_6),
        .collision(wall_monster_collisions[1][6])
    );
    wall wall_7_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_7),.pos_v(pos_v_wall_7),
        .collision(wall_monster_collisions[1][7])
    );
    wall wall_8_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_8),.pos_v(pos_v_wall_8),
        .collision(wall_monster_collisions[1][8])
    );
    wall wall_9_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_9),.pos_v(pos_v_wall_9),
        .collision(wall_monster_collisions[1][9])
    );
    wall wall_10_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_10),.pos_v(pos_v_wall_10),
        .collision(wall_monster_collisions[1][10])
    );
    wall wall_11_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_11),.pos_v(pos_v_wall_11),
        .collision(wall_monster_collisions[1][11])
    );
    wall wall_12_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_12),.pos_v(pos_v_wall_12),
        .collision(wall_monster_collisions[1][12])
    );
    wall wall_13_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_13),.pos_v(pos_v_wall_13),
        .collision(wall_monster_collisions[1][13])
    );
    wall wall_14_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_14),.pos_v(pos_v_wall_14),
        .collision(wall_monster_collisions[1][14])
    );
    wall wall_15_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_15),.pos_v(pos_v_wall_15),
        .collision(wall_monster_collisions[1][15])
    );
    wall wall_16_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_16),.pos_v(pos_v_wall_16),
        .collision(wall_monster_collisions[1][16])
    );
    wall wall_17_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_17),.pos_v(pos_v_wall_17),
        .collision(wall_monster_collisions[1][17])
    );
    wall wall_18_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_18),.pos_v(pos_v_wall_18),
        .collision(wall_monster_collisions[1][18])
    );
    wall wall_19_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_19),.pos_v(pos_v_wall_19),
        .collision(wall_monster_collisions[1][19])
    );
    wall wall_20_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_20),.pos_v(pos_v_wall_20),
        .collision(wall_monster_collisions[1][20])
    );
    wall wall_21_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_21),.pos_v(pos_v_wall_21),
        .collision(wall_monster_collisions[1][21])
    );
    wall wall_22_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_22),.pos_v(pos_v_wall_22),
        .collision(wall_monster_collisions[1][22])
    );
    wall wall_23_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_23),.pos_v(pos_v_wall_23),
        .collision(wall_monster_collisions[1][23])
    );
    wall wall_24_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_24),.pos_v(pos_v_wall_24),
        .collision(wall_monster_collisions[1][24])
    );
    wall wall_25_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_25),.pos_v(pos_v_wall_25),
        .collision(wall_monster_collisions[1][25])
    );
    wall wall_26_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_26),.pos_v(pos_v_wall_26),
        .collision(wall_monster_collisions[1][26])
    );
    wall wall_27_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_27),.pos_v(pos_v_wall_27),
        .collision(wall_monster_collisions[1][27])
    );
    wall wall_28_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_28),.pos_v(pos_v_wall_28),
        .collision(wall_monster_collisions[1][28])
    );
    wall wall_29_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_29),.pos_v(pos_v_wall_29),
        .collision(wall_monster_collisions[1][29])
    );
    wall wall_30_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_30),.pos_v(pos_v_wall_30),
        .collision(wall_monster_collisions[1][30])
    );
    wall wall_31_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_31),.pos_v(pos_v_wall_31),
        .collision(wall_monster_collisions[1][31])
    );
    wall wall_32_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_32),.pos_v(pos_v_wall_32),
        .collision(wall_monster_collisions[1][32])
    );
    wall wall_33_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_33),.pos_v(pos_v_wall_33),
        .collision(wall_monster_collisions[1][33])
    );
    wall wall_34_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_34),.pos_v(pos_v_wall_34),
        .collision(wall_monster_collisions[1][34])
    );
    wall wall_35_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_35),.pos_v(pos_v_wall_35),
        .collision(wall_monster_collisions[1][35])
    );
    wall wall_36_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_36),.pos_v(pos_v_wall_36),
        .collision(wall_monster_collisions[1][36])
    );
    wall wall_37_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_37),.pos_v(pos_v_wall_37),
        .collision(wall_monster_collisions[1][37])
    );
    wall wall_38_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_38),.pos_v(pos_v_wall_38),
        .collision(wall_monster_collisions[1][38])
    );
    wall wall_39_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_39),.pos_v(pos_v_wall_39),
        .collision(wall_monster_collisions[1][39])
    );
    wall wall_40_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_40),.pos_v(pos_v_wall_40),
        .collision(wall_monster_collisions[1][40])
    );
    wall wall_41_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_41),.pos_v(pos_v_wall_41),
        .collision(wall_monster_collisions[1][41])
    );
    wall wall_42_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_42),.pos_v(pos_v_wall_42),
        .collision(wall_monster_collisions[1][42])
    );
    wall wall_43_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_43),.pos_v(pos_v_wall_43),
        .collision(wall_monster_collisions[1][43])
    );
    wall wall_44_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_44),.pos_v(pos_v_wall_44),
        .collision(wall_monster_collisions[1][44])
    );
    wall wall_45_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_45),.pos_v(pos_v_wall_45),
        .collision(wall_monster_collisions[1][45])
    );
    wall wall_46_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_46),.pos_v(pos_v_wall_46),
        .collision(wall_monster_collisions[1][46])
    );
    wall wall_47_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_47),.pos_v(pos_v_wall_47),
        .collision(wall_monster_collisions[1][47])
    );
    wall wall_48_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_48),.pos_v(pos_v_wall_48),
        .collision(wall_monster_collisions[1][48])
    );
    wall wall_49_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_49),.pos_v(pos_v_wall_49),
        .collision(wall_monster_collisions[1][49])
    );
    wall wall_50_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_50),.pos_v(pos_v_wall_50),
        .collision(wall_monster_collisions[1][50])
    );
    wall wall_51_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_51),.pos_v(pos_v_wall_51),
        .collision(wall_monster_collisions[1][51])
    );
    wall wall_52_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_52),.pos_v(pos_v_wall_52),
        .collision(wall_monster_collisions[1][52])
    );
    wall wall_53_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_53),.pos_v(pos_v_wall_53),
        .collision(wall_monster_collisions[1][53])
    );
    wall wall_54_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_54),.pos_v(pos_v_wall_54),
        .collision(wall_monster_collisions[1][54])
    );
    wall wall_55_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_55),.pos_v(pos_v_wall_55),
        .collision(wall_monster_collisions[1][55])
    );
    wall wall_56_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_56),.pos_v(pos_v_wall_56),
        .collision(wall_monster_collisions[1][56])
    );
    wall wall_57_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_57),.pos_v(pos_v_wall_57),
        .collision(wall_monster_collisions[1][57])
    );
    wall wall_58_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_58),.pos_v(pos_v_wall_58),
        .collision(wall_monster_collisions[1][58])
    );
    wall wall_59_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_59),.pos_v(pos_v_wall_59),
        .collision(wall_monster_collisions[1][59])
    );
    wall wall_60_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_60),.pos_v(pos_v_wall_60),
        .collision(wall_monster_collisions[1][60])
    );
    wall wall_61_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_61),.pos_v(pos_v_wall_61),
        .collision(wall_monster_collisions[1][61])
    );
    wall wall_62_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_62),.pos_v(pos_v_wall_62),
        .collision(wall_monster_collisions[1][62])
    );
    wall wall_63_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_63),.pos_v(pos_v_wall_63),
        .collision(wall_monster_collisions[1][63])
    );



endmodule
