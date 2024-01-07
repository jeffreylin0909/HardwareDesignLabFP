module state_control(
    input clk, rst, 
    input A_signal, D_signal, W_signal, S_signal, J_signal, K_signal, L_signal, SPACE_signal, 
    output [3:0] pixel_idx_CY,
    output [9:0] pos_h_CY, pos_v_CY,
    output [3:0] pixel_idx_monster_1,
    output [9:0] pos_h_monster_1, pos_v_monster_1,
    output [3:0] pixel_idx_computer_room_entrance,
    output [9:0] pos_h_computer_room_entrance, pos_v_computer_room_entrance,
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
    output [9:0] pos_h_wall_59, pos_v_wall_59
    
    );
	wire backstage, nextstage, cave;
	reg [3:0] stage, next_stage;
	wire changing_stage;
	assign changing_stage = backstage || nextstage || rst;

    wire [3:0] wall_collisions_CY[63:0];
    wire [3:0] wall_collision_total_CY;

    assign wall_collision_total_CY = wall_collisions_CY[0]|wall_collisions_CY[1]|wall_collisions_CY[2]|wall_collisions_CY[3]|wall_collisions_CY[4]|wall_collisions_CY[5]|wall_collisions_CY[6]|wall_collisions_CY[7]|wall_collisions_CY[8]|wall_collisions_CY[9]|
                                  wall_collisions_CY[10]|wall_collisions_CY[11]|wall_collisions_CY[12]|wall_collisions_CY[13]|wall_collisions_CY[14]|wall_collisions_CY[15]|wall_collisions_CY[16]|wall_collisions_CY[17]|wall_collisions_CY[18]|wall_collisions_CY[19]|
                                  wall_collisions_CY[20]|wall_collisions_CY[21]|wall_collisions_CY[22]|wall_collisions_CY[23]|wall_collisions_CY[24]|wall_collisions_CY[25]|wall_collisions_CY[26]|wall_collisions_CY[27]|wall_collisions_CY[28]|wall_collisions_CY[29]|
                                  wall_collisions_CY[30]|wall_collisions_CY[31]|wall_collisions_CY[32]|wall_collisions_CY[33]|wall_collisions_CY[34]|wall_collisions_CY[35]|wall_collisions_CY[36]|wall_collisions_CY[37]|wall_collisions_CY[38]|wall_collisions_CY[39];
    
    wire [3:0] wall_collisions_monster_1[63:0];
    wire [3:0] wall_collision_total_monster_1;

    assign wall_collision_total_monster_1 = wall_collisions_monster_1[0]|wall_collisions_monster_1[1]|wall_collisions_monster_1[2]|wall_collisions_monster_1[3]|wall_collisions_monster_1[4]|wall_collisions_monster_1[5]|wall_collisions_monster_1[6]|wall_collisions_monster_1[7]|wall_collisions_monster_1[8]|wall_collisions_monster_1[9]|
                                  wall_collisions_monster_1[10]|wall_collisions_monster_1[11]|wall_collisions_monster_1[12]|wall_collisions_monster_1[13]|wall_collisions_monster_1[14]|wall_collisions_monster_1[15]|wall_collisions_monster_1[16]|wall_collisions_monster_1[17]|wall_collisions_monster_1[18]|wall_collisions_monster_1[19]|
                                  wall_collisions_monster_1[20]|wall_collisions_monster_1[21]|wall_collisions_monster_1[22]|wall_collisions_monster_1[23]|wall_collisions_monster_1[24]|wall_collisions_monster_1[25]|wall_collisions_monster_1[26]|wall_collisions_monster_1[27]|wall_collisions_monster_1[28]|wall_collisions_monster_1[29]|
                                  wall_collisions_monster_1[30]|wall_collisions_monster_1[31]|wall_collisions_monster_1[32]|wall_collisions_monster_1[33]|wall_collisions_monster_1[34]|wall_collisions_monster_1[35]|wall_collisions_monster_1[36]|wall_collisions_monster_1[37]|wall_collisions_monster_1[38]|wall_collisions_monster_1[39];
    

	assign pos_h_computer_room_entrance = 240;
	assign pos_v_computer_room_entrance = 160;
	
    assign pos_h_wall_0 = 320;
    assign pos_v_wall_0 = 120;//
    assign pos_h_wall_1 = 300;
    assign pos_v_wall_1 = 120;//
    assign pos_h_wall_2 = 280;
    assign pos_v_wall_2 = 120;//
    assign pos_h_wall_3 = 260;
    assign pos_v_wall_3 = 160;//
    assign pos_h_wall_4 = 240;
    assign pos_v_wall_4 = 180;//
    assign pos_h_wall_5 = 220;
    assign pos_v_wall_5 = 160;//
    assign pos_h_wall_6 = 200;
    assign pos_v_wall_6 = 180;//
    assign pos_h_wall_7 = 180;
    assign pos_v_wall_7 = 180;//
    assign pos_h_wall_8 = 160;
    assign pos_v_wall_8 = 180;//
    assign pos_h_wall_9 = 140;
    assign pos_v_wall_9 = 180;//
    assign pos_h_wall_10 = 120;
    assign pos_v_wall_10 = 180;//
    assign pos_h_wall_11 = 100;
    assign pos_v_wall_11 = 140;//
    assign pos_h_wall_12 = 80;
    assign pos_v_wall_12 = 140;//
    assign pos_h_wall_13 = 60;
    assign pos_v_wall_13 = 140;//
    assign pos_h_wall_14 = 40;
    assign pos_v_wall_14 = 140;//
    assign pos_h_wall_15 = 20;
    assign pos_v_wall_15 = 140;////
    assign pos_h_wall_16 = 320;
    assign pos_v_wall_16 = 60;//
    assign pos_h_wall_17 = 300;
    assign pos_v_wall_17 = 60;//
    assign pos_h_wall_18 = 280;
    assign pos_v_wall_18 = 60;//
    assign pos_h_wall_19 = 260;
    assign pos_v_wall_19 = 60;//
    assign pos_h_wall_20 = 240;
    assign pos_v_wall_20 = 60;//
    assign pos_h_wall_21 = 220;
    assign pos_v_wall_21 = 60;//
    assign pos_h_wall_22 = 200;
    assign pos_v_wall_22 = 60;//
    assign pos_h_wall_23 = 180;
    assign pos_v_wall_23 = 60;//
    assign pos_h_wall_24 = 160;
    assign pos_v_wall_24 = 60;//
    assign pos_h_wall_25 = 140;
    assign pos_v_wall_25 = 60;//
    assign pos_h_wall_26 = 120;
    assign pos_v_wall_26 = 60;//
    assign pos_h_wall_27 = 100;
    assign pos_v_wall_27 = 60;//
    assign pos_h_wall_28 = 80;
    assign pos_v_wall_28 = 60;//
    assign pos_h_wall_29 = 60;
    assign pos_v_wall_29 = 60;//
    assign pos_h_wall_30 = 40;
    assign pos_v_wall_30 = 60;//
    assign pos_h_wall_31 = 20;
    assign pos_v_wall_31 = 60;////
    assign pos_h_wall_32 = 280;
    assign pos_v_wall_32 = 140;//
    assign pos_h_wall_33 = 100;
    assign pos_v_wall_33 = 160;//
    assign pos_h_wall_34 = 320;
    assign pos_v_wall_34 = 140;//
    assign pos_h_wall_35 = 300;
    assign pos_v_wall_35 = 140;//
    assign pos_h_wall_36 = 80;
    assign pos_v_wall_36 = 160;//
    assign pos_h_wall_37 = 60;
    assign pos_v_wall_37 = 160;//
    assign pos_h_wall_38 = 40;
    assign pos_v_wall_38 = 160;//
    assign pos_h_wall_39 = 20;
    assign pos_v_wall_39 = 160;//
    assign pos_h_wall_40 = 320;
    assign pos_v_wall_40 = 160;//
    assign pos_h_wall_41 = 300;
    assign pos_v_wall_41 = 160;//
    assign pos_h_wall_42 = 280;
    assign pos_v_wall_42 = 160;//
    assign pos_h_wall_43 = 320;
    assign pos_v_wall_43 = 180;//
    assign pos_h_wall_44 = 300;
    assign pos_v_wall_44 = 180;//
    assign pos_h_wall_45 = 280;
    assign pos_v_wall_45 = 180;//
    assign pos_h_wall_46 = 260;
    assign pos_v_wall_46 = 180;//
    assign pos_h_wall_47 = 220;
    assign pos_v_wall_47 = 180;//
    assign pos_h_wall_48 = 20;
    assign pos_v_wall_48 = 180;//
    assign pos_h_wall_49 = 40;
    assign pos_v_wall_49 = 180;//
    assign pos_h_wall_50 = 60;
    assign pos_v_wall_50 = 180;//
    assign pos_h_wall_51 = 80;
    assign pos_v_wall_51 = 180;//
    assign pos_h_wall_52 = 100;
    assign pos_v_wall_52 = 180;//
    assign pos_h_wall_53 = 20;
    assign pos_v_wall_53 = 20;//
    assign pos_h_wall_54 = 20;
    assign pos_v_wall_54 = 20;//
    assign pos_h_wall_55 = 20;
    assign pos_v_wall_55 = 20;//
    assign pos_h_wall_56 = 20;
    assign pos_v_wall_56 = 20;//
    assign pos_h_wall_57 = 20;
    assign pos_v_wall_57 = 200;//
    assign pos_h_wall_58 = 20;
    assign pos_v_wall_58 = 40;//
    assign pos_h_wall_59 = 20;
    assign pos_v_wall_59 = 20;//

	//stage change
	always@(posedge clk) begin
	   if (rst)begin
	       stage <= 4'd0;
	   end else begin
	       stage <= next_stage;
	   end
	end
	//determine state change
	always@(*)begin
	   if (nextstage)begin
	       next_stage = stage+1;
	   end else begin
           if (backstage)begin
                if (stage == 4'h0)begin
                    next_stage = stage;
                end else begin
                    next_stage = stage-1;
                end
           end 
           else if (cave) begin
               next_stage = 4'd11;
           end
           else begin
               next_stage = stage;
           end
	   end
	end
	//CY
	maincharacter MC(
	   .clk(clk),
	   .rst(changing_stage), 
	   .A_signal(A_signal), 
	   .D_signal(D_signal), 
	   .W_signal(W_signal), 
	   .S_signal(S_signal), 
	   .stagestate(stage), 
	   .pos_h(pos_h_CY), 
	   .pos_v(pos_v_CY), 
	   .state(pixel_idx_CY),
	   .backstage(backstage), 
	   .nextstage(nextstage),
	   .wall_collision(wall_collision_total_CY)
	);
	
    wall wall_0(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_0),.pos_v(pos_v_wall_0),
        .collision(wall_collisions_CY[0])
    );
    wall wall_1(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_1),.pos_v(pos_v_wall_1),
        .collision(wall_collisions_CY[1])
    );
    wall wall_2(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_2),.pos_v(pos_v_wall_2),
        .collision(wall_collisions_CY[2])
    );
    wall wall_3(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_3),.pos_v(pos_v_wall_3),
        .collision(wall_collisions_CY[3])
    );
    wall wall_4(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_4),.pos_v(pos_v_wall_4),
        .collision(wall_collisions_CY[4])
    );
    wall wall_5(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_5),.pos_v(pos_v_wall_5),
        .collision(wall_collisions_CY[5])
    );
    wall wall_6(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_6),.pos_v(pos_v_wall_6),
        .collision(wall_collisions_CY[6])
    );
    wall wall_7(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_7),.pos_v(pos_v_wall_7),
        .collision(wall_collisions_CY[7])
    );
    wall wall_8(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_8),.pos_v(pos_v_wall_8),
        .collision(wall_collisions_CY[8])
    );
    wall wall_9(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_9),.pos_v(pos_v_wall_9),
        .collision(wall_collisions_CY[9])
    );
    wall wall_10(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_10),.pos_v(pos_v_wall_10),
        .collision(wall_collisions_CY[10])
    );
    wall wall_11(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_11),.pos_v(pos_v_wall_11),
        .collision(wall_collisions_CY[11])
    );
    wall wall_12(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_12),.pos_v(pos_v_wall_12),
        .collision(wall_collisions_CY[12])
    );
    wall wall_13(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_13),.pos_v(pos_v_wall_13),
        .collision(wall_collisions_CY[13])
    );
    wall wall_14(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_14),.pos_v(pos_v_wall_14),
        .collision(wall_collisions_CY[14])
    );
    wall wall_15(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_15),.pos_v(pos_v_wall_15),
        .collision(wall_collisions_CY[15])
    );
    wall wall_16(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_16),.pos_v(pos_v_wall_16),
        .collision(wall_collisions_CY[16])
    );
    wall wall_17(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_17),.pos_v(pos_v_wall_17),
        .collision(wall_collisions_CY[17])
    );
    wall wall_18(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_18),.pos_v(pos_v_wall_18),
        .collision(wall_collisions_CY[18])
    );
    wall wall_19(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_19),.pos_v(pos_v_wall_19),
        .collision(wall_collisions_CY[19])
    );
    wall wall_20(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_20),.pos_v(pos_v_wall_20),
        .collision(wall_collisions_CY[20])
    );
    wall wall_21(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_21),.pos_v(pos_v_wall_21),
        .collision(wall_collisions_CY[21])
    );
    wall wall_22(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_22),.pos_v(pos_v_wall_22),
        .collision(wall_collisions_CY[22])
    );
    wall wall_23(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_23),.pos_v(pos_v_wall_23),
        .collision(wall_collisions_CY[23])
    );
    wall wall_24(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_24),.pos_v(pos_v_wall_24),
        .collision(wall_collisions_CY[24])
    );
    wall wall_25(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_25),.pos_v(pos_v_wall_25),
        .collision(wall_collisions_CY[25])
    );
    wall wall_26(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_26),.pos_v(pos_v_wall_26),
        .collision(wall_collisions_CY[26])
    );
    wall wall_27(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_27),.pos_v(pos_v_wall_27),
        .collision(wall_collisions_CY[27])
    );
    wall wall_28(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_28),.pos_v(pos_v_wall_28),
        .collision(wall_collisions_CY[28])
    );
    wall wall_29(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_29),.pos_v(pos_v_wall_29),
        .collision(wall_collisions_CY[29])
    );
    wall wall_30(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_30),.pos_v(pos_v_wall_30),
        .collision(wall_collisions_CY[30])
    );
    wall wall_31(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_31),.pos_v(pos_v_wall_31),
        .collision(wall_collisions_CY[31])
    );
    wall wall_32(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_32),.pos_v(pos_v_wall_32),
        .collision(wall_collisions_CY[32])
    );
    wall wall_33(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_33),.pos_v(pos_v_wall_33),
        .collision(wall_collisions_CY[33])
    );
    wall wall_34(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_34),.pos_v(pos_v_wall_34),
        .collision(wall_collisions_CY[34])
    );
    wall wall_35(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_35),.pos_v(pos_v_wall_35),
        .collision(wall_collisions_CY[35])
    );
    wall wall_36(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_36),.pos_v(pos_v_wall_36),
        .collision(wall_collisions_CY[36])
    );
    wall wall_37(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_37),.pos_v(pos_v_wall_37),
        .collision(wall_collisions_CY[37])
    );
    wall wall_38(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_38),.pos_v(pos_v_wall_38),
        .collision(wall_collisions_CY[38])
    );
    wall wall_39(
        .pos_h_CY(pos_h_CY),.pos_v_CY(pos_v_CY),
        .pos_h(pos_h_wall_39),.pos_v(pos_v_wall_39),
        .collision(wall_collisions_CY[39])
    );



    wall wall_0_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_0),.pos_v(pos_v_wall_0),
        .collision(wall_collisions_monster_1[0])
    );
    wall wall_1_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_1),.pos_v(pos_v_wall_1),
        .collision(wall_collisions_monster_1[1])
    );
    wall wall_2_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_2),.pos_v(pos_v_wall_2),
        .collision(wall_collisions_monster_1[2])
    );
    wall wall_3_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_3),.pos_v(pos_v_wall_3),
        .collision(wall_collisions_monster_1[3])
    );
    wall wall_4_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_4),.pos_v(pos_v_wall_4),
        .collision(wall_collisions_monster_1[4])
    );
    wall wall_5_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_5),.pos_v(pos_v_wall_5),
        .collision(wall_collisions_monster_1[5])
    );
    wall wall_6_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_6),.pos_v(pos_v_wall_6),
        .collision(wall_collisions_monster_1[6])
    );
    wall wall_7_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_7),.pos_v(pos_v_wall_7),
        .collision(wall_collisions_monster_1[7])
    );
    wall wall_8_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_8),.pos_v(pos_v_wall_8),
        .collision(wall_collisions_monster_1[8])
    );
    wall wall_9_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_9),.pos_v(pos_v_wall_9),
        .collision(wall_collisions_monster_1[9])
    );
    wall wall_10_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_10),.pos_v(pos_v_wall_10),
        .collision(wall_collisions_monster_1[10])
    );
    wall wall_11_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_11),.pos_v(pos_v_wall_11),
        .collision(wall_collisions_monster_1[11])
    );
    wall wall_12_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_12),.pos_v(pos_v_wall_12),
        .collision(wall_collisions_monster_1[12])
    );
    wall wall_13_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_13),.pos_v(pos_v_wall_13),
        .collision(wall_collisions_monster_1[13])
    );
    wall wall_14_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_14),.pos_v(pos_v_wall_14),
        .collision(wall_collisions_monster_1[14])
    );
    wall wall_15_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_15),.pos_v(pos_v_wall_15),
        .collision(wall_collisions_monster_1[15])
    );
    wall wall_16_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_16),.pos_v(pos_v_wall_16),
        .collision(wall_collisions_monster_1[16])
    );
    wall wall_17_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_17),.pos_v(pos_v_wall_17),
        .collision(wall_collisions_monster_1[17])
    );
    wall wall_18_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_18),.pos_v(pos_v_wall_18),
        .collision(wall_collisions_monster_1[18])
    );
    wall wall_19_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_19),.pos_v(pos_v_wall_19),
        .collision(wall_collisions_monster_1[19])
    );
    wall wall_20_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_20),.pos_v(pos_v_wall_20),
        .collision(wall_collisions_monster_1[20])
    );
    wall wall_21_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_21),.pos_v(pos_v_wall_21),
        .collision(wall_collisions_monster_1[21])
    );
    wall wall_22_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_22),.pos_v(pos_v_wall_22),
        .collision(wall_collisions_monster_1[22])
    );
    wall wall_23_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_23),.pos_v(pos_v_wall_23),
        .collision(wall_collisions_monster_1[23])
    );
    wall wall_24_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_24),.pos_v(pos_v_wall_24),
        .collision(wall_collisions_monster_1[24])
    );
    wall wall_25_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_25),.pos_v(pos_v_wall_25),
        .collision(wall_collisions_monster_1[25])
    );
    wall wall_26_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_26),.pos_v(pos_v_wall_26),
        .collision(wall_collisions_monster_1[26])
    );
    wall wall_27_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_27),.pos_v(pos_v_wall_27),
        .collision(wall_collisions_monster_1[27])
    );
    wall wall_28_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_28),.pos_v(pos_v_wall_28),
        .collision(wall_collisions_monster_1[28])
    );
    wall wall_29_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_29),.pos_v(pos_v_wall_29),
        .collision(wall_collisions_monster_1[29])
    );
    wall wall_30_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_30),.pos_v(pos_v_wall_30),
        .collision(wall_collisions_monster_1[30])
    );
    wall wall_31_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_31),.pos_v(pos_v_wall_31),
        .collision(wall_collisions_monster_1[31])
    );
    wall wall_32_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_32),.pos_v(pos_v_wall_32),
        .collision(wall_collisions_monster_1[32])
    );
    wall wall_33_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_33),.pos_v(pos_v_wall_33),
        .collision(wall_collisions_monster_1[33])
    );
    wall wall_34_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_34),.pos_v(pos_v_wall_34),
        .collision(wall_collisions_monster_1[34])
    );
    wall wall_35_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_35),.pos_v(pos_v_wall_35),
        .collision(wall_collisions_monster_1[35])
    );
    wall wall_36_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_36),.pos_v(pos_v_wall_36),
        .collision(wall_collisions_monster_1[36])
    );
    wall wall_37_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_37),.pos_v(pos_v_wall_37),
        .collision(wall_collisions_monster_1[37])
    );
    wall wall_38_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_38),.pos_v(pos_v_wall_38),
        .collision(wall_collisions_monster_1[38])
    );
    wall wall_39_monster_1(
        .pos_h_CY(pos_h_monster_1),.pos_v_CY(pos_v_monster_1),
        .pos_h(pos_h_wall_39),.pos_v(pos_v_wall_39),
        .collision(wall_collisions_monster_1[39])
    );

//	monster_1
	 monster_one m1(
	    .clk(clk), 
	    .rst(changing_stage), 
	    .stagestate(stage), 
	    .pos_h(pos_h_monster_1), 
	    .pos_v(pos_v_monster_1),
        .wall_collision(wall_collision_total_monster_1)
	 );
	
endmodule

module wall(
    input [9:0] pos_h_CY, pos_v_CY,
    input [9:0] pos_h, pos_v,
    output reg [3:0] collision
    );

    always @(*)begin
        if (pos_v_CY < pos_v+20 && pos_v_CY > pos_v-20)begin
            if (pos_h_CY == pos_h+20) begin
                collision = 4'b0001;//*->|
            end else begin
                if (pos_h_CY+20 == pos_h) begin
                    collision = 4'b0010;//|<-*
                end else begin
                    collision = 4'b0000;
                end
            end
        end else begin
            if (pos_h_CY < pos_h+20 && pos_h_CY > pos_h-20)begin
                if (pos_v_CY+20 == pos_v) begin
                    collision = 4'b0100;//^
                end else begin
                    if (pos_v_CY == pos_v+20) begin
                        collision = 4'b1000;//U
                    end else begin
                        collision = 4'b0000;
                    end
                end
            end else begin
                collision = 4'b0000;
            end
        end
    end

endmodule

module maincharacter (clk, rst, A_signal, D_signal, W_signal, S_signal, J_signal, K_signal, L_signal, SPACE_signal, stagestate, pos_h, pos_v, state, backstage, nextstage,wall_collision);
input clk;
input rst;
input A_signal, D_signal, W_signal, S_signal, J_signal, K_signal, L_signal, SPACE_signal;
input [3:0] stagestate;
input [3:0] wall_collision;
output reg  [9:0] pos_h = 10'd150, pos_v = 10'd110;
output reg [3:0] state;
output reg backstage, nextstage;

wire dclk;
reg [9:0] npos_v, npos_h;
reg [2:0] signals; 
reg [3:0] nstate;

parameter FACE_FRONT_STAND = 4'd0, FACE_FRONT_WALK_L = 4'd1, FACE_FRONT_WALK_R = 4'd2, 
FACE_RIGHT_STAND = 4'd3, FACE_RIGHT_WALK = 4'd4, FACE_LEFT_STAND = 4'd5, FACE_LEFT_WALK = 4'd6, 
FACE_BACK_STAND = 4'd7, FACE_BACK_WALK_L = 4'd8, FACE_BACK_WALK_R = 4'd9;
    
always @(*) begin //combine WASD signals into one reg for ease of coding
    if (W_signal) signals = 3'd1; //W = go up
    else if (S_signal) signals = 3'd2; //S = go down
    else if (A_signal) signals = 3'd3; //A = go left
    else if (D_signal) signals = 3'd4; //D = go right
    else signals = 3'd0;
end

clk_div #(3) CD0(.clk(clk), .clk_d(dclk));

always @(posedge dclk) begin //state always block
    if (rst) begin
        state <= FACE_FRONT_STAND;
    end else begin
        state <= nstate;
    end
end

always @(*) begin //state always block 2
    case (signals)
        3'd0: begin
            nstate = FACE_FRONT_STAND;
        end
        3'd1: begin
            if (state == FACE_BACK_WALK_L) nstate = FACE_BACK_WALK_R;
            else if (state == FACE_BACK_WALK_R) nstate = FACE_BACK_WALK_L;
            else nstate = FACE_BACK_WALK_R;
        end
        3'd2: begin
            if (state == FACE_FRONT_WALK_L) nstate = FACE_FRONT_WALK_R;
            else if (state == FACE_FRONT_WALK_R) nstate = FACE_FRONT_WALK_L;
            else nstate = FACE_FRONT_WALK_R;
        end
        3'd3: begin
            if (state == FACE_LEFT_WALK) nstate = FACE_LEFT_STAND;
            else nstate = FACE_LEFT_WALK;        
        end
        3'd4: begin
            if (state == FACE_RIGHT_WALK) nstate = FACE_RIGHT_STAND;
            else nstate = FACE_RIGHT_WALK;
        end
    endcase
    if (!W_signal && !S_signal && !A_signal && !D_signal) begin
        if (state == FACE_FRONT_WALK_L || state == FACE_FRONT_WALK_R || state == FACE_FRONT_STAND) nstate = FACE_FRONT_STAND;
        if (state == FACE_RIGHT_WALK || state == FACE_RIGHT_STAND) nstate = FACE_RIGHT_STAND;
        if (state == FACE_LEFT_WALK || state == FACE_LEFT_STAND) nstate = FACE_LEFT_STAND;
        if (state == FACE_BACK_WALK_L || state == FACE_BACK_WALK_R || state == FACE_BACK_STAND) nstate = FACE_BACK_STAND;
    end
end

always@(posedge clk) begin //movement always block
    if (rst) begin
        case (stagestate)
            4'd0: begin //stage 1
                pos_h <= 150;
                pos_v <= 110;
            end
            4'd1: begin //stage 2
                pos_h <= 25;
                pos_v <= 25;
            end
            4'd2: begin //stage 3
                pos_h <= 25;
                pos_v <= 25;
            end
            4'd3: begin //stage 4
                pos_h <= 25;
                pos_v <= 25;
            end
            4'd4: begin //stage 5
                pos_h <= 25;
                pos_v <= 25;
            end
            4'd5: begin //stage 6
                pos_h <= 25;
                pos_v <= 25;
            end
            4'd6: begin //stage 7
                pos_h <= 25;
                pos_v <= 25;
            end
            4'd7: begin //stage 8
                pos_h <= 25;
                pos_v <= 25;
            end
            4'd8: begin //stage 9
                pos_h <= 25;
                pos_v <= 25;
            end
            4'd9: begin //stage 10
                pos_h <= 25;
                pos_v <= 25;
            end
            4'd10: begin //end stage
                pos_h <= 25;
                pos_v <= 25;
            end
            4'd11: begin //cave
                pos_h <= 25;
                pos_v <= 25;
            end
            default: begin
                pos_h <= 25;
                pos_v <= 25;   
            end
        endcase
    end else begin
        pos_h <= npos_h;
        pos_v <= npos_v;
    end
end
// 
always @ (*) begin
    case (signals)
        3'd1:begin
            npos_h = pos_h;
            if (wall_collision[2])begin
                npos_v = pos_v;
            end else begin
                npos_v = pos_v + 10'd1; //walk up
            end
        end 
        3'd2:begin
            npos_h = pos_h;
            if (wall_collision[3])begin
                npos_v = pos_v;
            end else begin
                npos_v = pos_v - 10'd1; //walk down
            end
        end 
        3'd3:begin
            if (wall_collision[1])begin
                npos_h = pos_h;
            end else begin
                npos_h = pos_h + 10'd1; //walk left
            end
            npos_v = pos_v;
        end 
        3'd4:begin
            if (wall_collision[0])begin
                npos_h = pos_h;
            end else begin
                npos_h = pos_h - 10'd1; //walk right
            end
            npos_v = pos_v;
        end 
        default: begin
            npos_h = pos_h;
            npos_v = pos_v;
        end
    endcase
end

always @ (posedge clk) begin
    if (pos_h >= 319)begin
        backstage <= 1;
        nextstage <= 0;
    end else begin
        if (pos_h <= 20)begin
            backstage <= 0;
            nextstage <= 1;
        end else begin
            backstage <= 0;
            nextstage <= 0;
        end
    end
end

endmodule

module monster_one (clk, rst, stagestate, pos_h, pos_v, wall_collision);
input clk;
input rst;
input [3:0]stagestate;
input [3:0]wall_collision;

output reg [9:0] pos_h;
output reg [9:0] pos_v;

reg [9:0] next_pos_h, next_pos_v;

reg [3:0] direction, next_direction;
wire [12:0] randomNum;

LFSR randomgen(
    .clock(clk),
    .reset(rst),
    .rnd(randomNum)
);

always@(posedge clk)begin
    pos_h <= next_pos_h;
    pos_v <= next_pos_v;
    direction <= next_direction;
end

always @(*) begin
    if (rst) begin
        case (stagestate)
            4'd0: begin
                next_pos_h = 160;
                next_pos_v = 120;
                next_direction = 0;
            end
            4'd1: begin
                next_pos_h = 160;
                next_pos_v = 120;
                next_direction = 0;
            end
            4'd2: begin
                next_pos_h = 160;
                next_pos_v = 120;
                next_direction = 0;
            end
            4'd3: begin
                next_pos_h = 160;
                next_pos_v = 120;
                next_direction = 0;
            end
            4'd4: begin
                next_pos_h = 160;
                next_pos_v = 120;
                next_direction = 0;
            end
            4'd5: begin
                next_pos_h = 160;
                next_pos_v = 120;
                next_direction = 0;
            end
            4'd6: begin
                next_pos_h = 160;
                next_pos_v = 120;
                next_direction = 0;
            end
            4'd7: begin
                next_pos_h = 160;
                next_pos_v = 120;
                next_direction = 0;
            end
            4'd8: begin
                next_pos_h = 160;
                next_pos_v = 120;
                next_direction = 0;
            end
            4'd9: begin
                next_pos_h = 160;
                next_pos_v = 120;
                next_direction = 0;
            end
            4'd10: begin
                next_pos_h = 160;
                next_pos_v = 120;
                next_direction = 0;
            end
            4'd11: begin
                next_pos_h = 160;
                next_pos_v = 120;
                next_direction = 0;
            end
        endcase 
    end 
    else begin
        if ((wall_collision[1] || pos_h >= 300)&&direction==0)begin
            next_direction = randomNum%3;
            next_direction = next_direction+1;
        end else begin
            if ((wall_collision[0] || pos_h <= 20)&&direction==1)begin
                next_direction = randomNum%3;
                if (next_direction >= 1)begin
                    next_direction = next_direction+1;
                end else begin
                    next_direction = next_direction;
                end
            end else begin
                if ((wall_collision[2] || pos_v >= 220)&&direction==2)begin
                    next_direction = randomNum%3;
                    if (next_direction >= 2)begin
                        next_direction = next_direction+1;
                    end else begin
                        next_direction = next_direction;
                    end
                end else begin
                    if ((wall_collision[3] || pos_v <= 20)&&direction==3)begin
                        next_direction = randomNum%3;
                    end else begin
                        next_direction = direction;
                    end
                end
            end
        end

        case (direction)
            0:begin
                if (wall_collision[1] || pos_h >= 300)begin
                    next_pos_h = pos_h;
                end else begin
                    next_pos_h = pos_h+1;
                end
                next_pos_v = pos_v;
            end
            1:begin
                if (wall_collision[0] || pos_h <= 20)begin
                    next_pos_h = pos_h;
                end else begin
                    next_pos_h = pos_h-1;
                end
                next_pos_v = pos_v;
            end
            2:begin
                if (wall_collision[2] || pos_v >= 220)begin
                    next_pos_v = pos_v;
                end else begin
                    next_pos_v = pos_v+1;
                end
                next_pos_h = pos_h;
            end
            3:begin
                if (wall_collision[3] || pos_v <= 20)begin
                    next_pos_v = pos_v;
                end else begin
                    next_pos_v = pos_v-1;
                end
                next_pos_h = pos_h;
            end
        endcase
    end
end
endmodule

module LFSR (
    input clock,
    input reset,
    output [12:0] rnd 
    );

reg [12:0] random, random_next, random_done;
reg [3:0] count, count_next; //to keep track of the shifts

wire feedback = random[12] ^ random[3] ^ random[2] ^ random[0]; 

always @ (posedge clock) begin
    if (reset) begin
        random <= 13'hF; //An LFSR cannot have an all 0 state, thus reset to FF
        count <= 0;
    end else begin
        random <= random_next;
        count <= count_next;
    end
end

always @ (*) begin
    random_next = random; //default state stays the same
    count_next = count;
  
    random_next = {random[11:0], feedback}; //shift left the xor'd every posedge clock
    count_next = count + 1;

    if (count == 13) begin
        count_next = 0;
        random_done = random; //assign the random number to output after 13 shifts
    end
 
end


assign rnd = random_done;

endmodule


