module Top(clk, rst, PS2_DATA, PS2_CLK, vgaRed, vgaBlue, vgaGreen, hsync, vsync, pmod_1, pmod_2, pmod_4);
    
    parameter [8:0] A_CODE  = {1'b0, 8'h1C};
    parameter [8:0] D_CODE  = {1'b0, 8'h23};
    parameter [8:0] W_CODE  = {1'b0, 8'h1D};
    parameter [8:0] S_CODE  = {1'b0, 8'h1B};
    parameter [8:0] J_CODE  = {1'b0, 8'h3B};
    parameter [8:0] K_CODE  = {1'b0, 8'h42};
    parameter [8:0] L_CODE  = {1'b0, 8'h4B};
    parameter [8:0] SPACE_CODE  = {1'b0, 8'h29};
    parameter BEAT_FREQ = 32'd32;	//one beat=0.03125sec
    parameter DUTY_BEST = 10'd512;	//duty cycle=50%

    //speaker
	output pmod_1;
	output pmod_2;
	output pmod_4;
	
	wire [31:0] freqZelda, freqBoss;
    reg [31:0] freq;
    wire [12:0] ibeatNumZelda;
    wire [12:0] ibeatNumBoss;
    wire beatFreq;
    wire change; // change to boss music
    
    assign pmod_2 = 1'd1;	//no gain(6dB)
    assign pmod_4 = 1'd1;	//turn-on
    
    always @(*) begin
        if (change) begin
            freq = freqBoss;
        end else begin
            freq = freqZelda;    
        end
    end
    //Generate beat speed
    PWM_gen btSpeedGen ( 
         .clk(clk), 
         .reset(rst),
         .freq(BEAT_FREQ),
         .duty(DUTY_BEST), 
         .PWM(beatFreq)
    );
        
    //manipulate beat
    PlayerCtrlZelda playerCtrl_zelda ( 
        .clk(beatFreq),
        .reset(rst),
        .ibeat(ibeatNumZelda)
    );	
    
    PlayerCtrlBoss playerCtrl_boss ( 
        .clk(beatFreq),
        .reset(rst),
        .ibeat(ibeatNumBoss)
    );	
        
    //Generate variant freq. of tones
    MusicZelda musicZelda ( 
        .ibeatNum(ibeatNumZelda),
        .tone(freqZelda)
    );
    
    MusicBoss musicBoss(
        .ibeatNum(ibeatNumBoss),
        .tone(freqBoss)
    );
    
    // Generate particular freq. signal
    PWM_gen toneGen ( 
          .clk(clk), 
          .reset(rst), 
          .freq(freq),
          .duty(DUTY_BEST), 
          .PWM(pmod_1)
    );
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
    wire [11:0] pixel_BOSS_student_L[3:0];
    wire [11:0] pixel_BOSS_student_R[3:0];
    wire [11:0] pixel_CS_student_L[3:0];
    wire [11:0] pixel_CS_student_R[3:0];
    wire [11:0] pixel_EECS_student_L[3:0];
    wire [11:0] pixel_EECS_student_R[3:0];
    wire [11:0] pixel_NTHU_student_L[3:0];
    wire [11:0] pixel_NTHU_student_R[3:0];
    wire [11:0] pixel_CR;
    wire [11:0] pixel_EM;
    wire [11:0] pixel_JX;
    wire [11:0] pixel_YC;
    wire [11:0] pixel_ZY;
    wire [11:0] pixel_key;
    wire [11:0] pixel_Lv;
    wire [11:0] pixel_rupee;
    wire [11:0] pixel_kill_counter_num[9:0];
    wire [11:0] pixel_levl_counter_num[9:0];
    wire [11:0] pixel_heart[3:0];
    wire [11:0] pixel_colon[1:0];
    wire [11:0] pixel_gameover[7:0];
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
    wire [11:0] pixel_overwall_wall;
    //for sprites
    //for CY
    wire [16:0] pixel_addr_CY;
    wire [11:0] pixel_CY;
    wire [3:0] pixel_idx_CY;
    wire [9:0] pos_h_CY, pos_v_CY;
    //for monsters
    wire [16:0] pixel_addr_monster[3:0];
    wire [11:0] pixel_monster[3:0];
    wire [3:0] pixel_idx_monster[3:0];
    wire [9:0] pos_h_monster[3:0], pos_v_monster[3:0];

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
    
    //for Lv
    wire [16:0] pixel_addr_Lv;
    wire [11:0] pixel_Lv_ins;
    wire [9:0] pos_h_Lv, pos_v_Lv;

    //for rupee
    wire [16:0] pixel_addr_rupee;
    wire [11:0] pixel_rupee_ins;
    wire [9:0] pos_h_rupee, pos_v_rupee;

    //for kill_counter
    wire [16:0] pixel_addr_kill_counter;
    wire [11:0] pixel_kill_counter;
    wire [3:0] pixel_idx_kill_counter;
    wire [9:0] pos_h_kill_counter, pos_v_kill_counter;
    
    //for levl_counter
    wire [16:0] pixel_addr_levl_counter;
    wire [11:0] pixel_levl_counter;
    wire [3:0] pixel_idx_levl_counter;
    wire [9:0] pos_h_levl_counter, pos_v_levl_counter;

    //for hearts
    wire [16:0] pixel_addr_heart[3:0];
    wire [11:0] pixel_heart_ins[3:0];
    wire [3:0] pixel_idx_heart[3:0];
    wire [9:0] pos_h_heart[3:0], pos_v_heart[3:0];

    //for colons
    wire [16:0] pixel_addr_colon[1:0];
    wire [11:0] pixel_colon_ins[1:0];
    wire [9:0] pos_h_colon[1:0], pos_v_colon[1:0];

    //for game_over
    wire [16:0] pixel_addr_gameover[7:0];
    wire [11:0] pixel_gameover_ins[7:0];
    wire [3:0] pixel_idx_gameover;
    wire [9:0] pos_h_gameover[7:0], pos_v_gameover[7:0];
    
    //for walls
    wire [16:0] pixel_addr_wall;
    wire [11:0] pixel_wall[63:0];
    wire [3:0] pixel_idx_wall;
    wire [9:0] pos_h_wall[63:0], pos_v_wall[63:0];
    
    //clock
	clk_div #(2) CD0(.clk(clk), .clk_d(clk_d2));
	clk_div #(20) CD1(.clk(clk), .clk_d(clk_d22));
	
	//signals
	debounce DB1(.s(rst), .s_db(rst_db), .clk(clk));
	onepulse OP1(.s(rst_db), .s_op(rst_op), .clk(clk_d22));

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
	
    select_pixel SP_monster_0(
        .h_cnt(h_cnt), .v_cnt(v_cnt),
        .pos_h(pos_h_monster[0]),.pos_v(pos_v_monster[0]),
        .size_h(20),.size_v(20),
        .now_pixel_idx(pixel_idx_monster[0]),
        .pixel_0(pixel_CS_student_L[0]),
        .pixel_1(pixel_CS_student_R[0]),
        .pixel_2(pixel_EECS_student_L[0]),
        .pixel_3(pixel_EECS_student_R[0]),
        .pixel_4(pixel_NTHU_student_L[0]),
        .pixel_5(pixel_NTHU_student_R[0]),
        .pixel_6(pixel_BOSS_student_L[0]),
        .pixel_7(pixel_BOSS_student_R[0]),
        .now_pixel(pixel_monster[0])
	);

	select_pixel SP_monster_1(
        .h_cnt(h_cnt), .v_cnt(v_cnt),
        .pos_h(pos_h_monster[1]),.pos_v(pos_v_monster[1]),
        .size_h(20),.size_v(20),
        .now_pixel_idx(pixel_idx_monster[1]),
        .pixel_0(pixel_CS_student_L[1]),
        .pixel_1(pixel_CS_student_R[1]),
        .pixel_2(pixel_EECS_student_L[1]),
        .pixel_3(pixel_EECS_student_R[1]),
        .pixel_4(pixel_NTHU_student_L[1]),
        .pixel_5(pixel_NTHU_student_R[1]),
        .pixel_6(pixel_BOSS_student_L[1]),
        .pixel_7(pixel_BOSS_student_R[1]),
        .now_pixel(pixel_monster[1])
	);
	
	select_pixel SP_computer_room_entrance(
        .h_cnt(h_cnt), .v_cnt(v_cnt),
        .pos_h(pos_h_computer_room_entrance),.pos_v(pos_v_computer_room_entrance),
        .size_h(20),.size_v(20),
        .now_pixel_idx(0),
        .pixel_0(pixel_computer_room_entrance),
        .now_pixel(pixel_computer_room_entrance_ins)
	);
	
    select_pixel SP_Lv(
        .h_cnt(h_cnt), .v_cnt(v_cnt),
        .pos_h(pos_h_Lv),.pos_v(pos_v_Lv),
        .size_h(20),.size_v(20),
        .now_pixel_idx(0),
        .pixel_0(pixel_Lv),
        .now_pixel(pixel_Lv_ins)
	);

    select_pixel SP_rupee(
        .h_cnt(h_cnt), .v_cnt(v_cnt),
        .pos_h(pos_h_rupee),.pos_v(pos_v_rupee),
        .size_h(20),.size_v(20),
        .now_pixel_idx(0),
        .pixel_0(pixel_rupee),
        .now_pixel(pixel_rupee_ins)
	);

    select_pixel SP_colon_0(
        .h_cnt(h_cnt), .v_cnt(v_cnt),
        .pos_h(pos_h_colon[0]),.pos_v(pos_v_colon[0]),
        .size_h(20),.size_v(20),
        .now_pixel_idx(0),
        .pixel_0(pixel_colon[0]),
        .now_pixel(pixel_colon_ins[0])
	);
	
	select_pixel SP_colon_1(
        .h_cnt(h_cnt), .v_cnt(v_cnt),
        .pos_h(pos_h_colon[1]),.pos_v(pos_v_colon[1]),
        .size_h(20),.size_v(20),
        .now_pixel_idx(0),
        .pixel_0(pixel_colon[1]),
        .now_pixel(pixel_colon_ins[1])
	);

    select_pixel SP_levl_counter(
        .h_cnt(h_cnt), .v_cnt(v_cnt),
        .pos_h(pos_h_levl_counter),.pos_v(pos_v_levl_counter),
        .size_h(20),.size_v(20),
        .now_pixel_idx(pixel_idx_levl_counter),
        .pixel_0(pixel_levl_counter_num[0]),
        .pixel_1(pixel_levl_counter_num[1]),
        .pixel_2(pixel_levl_counter_num[2]),
        .pixel_3(pixel_levl_counter_num[3]),
        .pixel_4(pixel_levl_counter_num[4]),
        .pixel_5(pixel_levl_counter_num[5]),
        .pixel_6(pixel_levl_counter_num[6]),
        .pixel_7(pixel_levl_counter_num[7]),
        .pixel_8(pixel_levl_counter_num[8]),
        .pixel_9(pixel_levl_counter_num[9]),
        .now_pixel(pixel_levl_counter)
	);
    
    select_pixel SP_kill_counter(
        .h_cnt(h_cnt), .v_cnt(v_cnt),
        .pos_h(pos_h_kill_counter),.pos_v(pos_v_kill_counter),
        .size_h(20),.size_v(20),
        .now_pixel_idx(pixel_idx_kill_counter),
        .pixel_0(pixel_kill_counter_num[0]),
        .pixel_1(pixel_kill_counter_num[1]),
        .pixel_2(pixel_kill_counter_num[2]),
        .pixel_3(pixel_kill_counter_num[3]),
        .pixel_4(pixel_kill_counter_num[4]),
        .pixel_5(pixel_kill_counter_num[5]),
        .pixel_6(pixel_kill_counter_num[6]),
        .pixel_7(pixel_kill_counter_num[7]),
        .pixel_8(pixel_kill_counter_num[8]),
        .pixel_9(pixel_kill_counter_num[9]),
        .now_pixel(pixel_kill_counter)
	);

	select_pixel SP_heart_0(
        .h_cnt(h_cnt), .v_cnt(v_cnt),
        .pos_h(pos_h_heart[0]),.pos_v(pos_v_heart[0]),
        .size_h(20),.size_v(20),
        .now_pixel_idx(pixel_idx_heart[0]),
        .pixel_0(pixel_heart[0]),
        .now_pixel(pixel_heart_ins[0])
	);
	
	select_pixel SP_heart_1(
        .h_cnt(h_cnt), .v_cnt(v_cnt),
        .pos_h(pos_h_heart[1]),.pos_v(pos_v_heart[1]),
        .size_h(20),.size_v(20),
        .now_pixel_idx(pixel_idx_heart[1]),
        .pixel_0(pixel_heart[1]),
        .now_pixel(pixel_heart_ins[1])
	);
	
	select_pixel SP_heart_2(
        .h_cnt(h_cnt), .v_cnt(v_cnt),
        .pos_h(pos_h_heart[2]),.pos_v(pos_v_heart[2]),
        .size_h(20),.size_v(20),
        .now_pixel_idx(pixel_idx_heart[2]),
        .pixel_0(pixel_heart[2]),
        .now_pixel(pixel_heart_ins[2])
	);

    select_pixel SP_G(
        .h_cnt(h_cnt), .v_cnt(v_cnt),
        .pos_h(pos_h_gameover[0]),.pos_v(pos_v_gameover[0]),
        .size_h(20),.size_v(20),
        .now_pixel_idx(pixel_idx_gameover),
        .pixel_0(pixel_gameover[0]),
        .now_pixel(pixel_gameover_ins[0])
    );
    select_pixel SP_A(
        .h_cnt(h_cnt), .v_cnt(v_cnt),
        .pos_h(pos_h_gameover[1]),.pos_v(pos_v_gameover[1]),
        .size_h(20),.size_v(20),
        .now_pixel_idx(pixel_idx_gameover),
        .pixel_0(pixel_gameover[1]),
        .now_pixel(pixel_gameover_ins[1])
    );
    select_pixel SP_M(
        .h_cnt(h_cnt), .v_cnt(v_cnt),
        .pos_h(pos_h_gameover[2]),.pos_v(pos_v_gameover[2]),
        .size_h(20),.size_v(20),
        .now_pixel_idx(pixel_idx_gameover),
        .pixel_0(pixel_gameover[2]),
        .now_pixel(pixel_gameover_ins[2])
    );
    select_pixel SP_E_1(
        .h_cnt(h_cnt), .v_cnt(v_cnt),
        .pos_h(pos_h_gameover[3]),.pos_v(pos_v_gameover[3]),
        .size_h(20),.size_v(20),
        .now_pixel_idx(pixel_idx_gameover),
        .pixel_0(pixel_gameover[3]),
        .now_pixel(pixel_gameover_ins[3])
    );
    select_pixel SP_O(
        .h_cnt(h_cnt), .v_cnt(v_cnt),
        .pos_h(pos_h_gameover[4]),.pos_v(pos_v_gameover[4]),
        .size_h(20),.size_v(20),
        .now_pixel_idx(pixel_idx_gameover),
        .pixel_0(pixel_gameover[4]),
        .now_pixel(pixel_gameover_ins[4])
    );
    select_pixel SP_V(
        .h_cnt(h_cnt), .v_cnt(v_cnt),
        .pos_h(pos_h_gameover[5]),.pos_v(pos_v_gameover[5]),
        .size_h(20),.size_v(20),
        .now_pixel_idx(pixel_idx_gameover),
        .pixel_0(pixel_gameover[5]),
        .now_pixel(pixel_gameover_ins[5])
    );
    select_pixel SP_E_2(
        .h_cnt(h_cnt), .v_cnt(v_cnt),
        .pos_h(pos_h_gameover[6]),.pos_v(pos_v_gameover[6]),
        .size_h(20),.size_v(20),
        .now_pixel_idx(pixel_idx_gameover),
        .pixel_0(pixel_gameover[6]),
        .now_pixel(pixel_gameover_ins[6])
    );
    select_pixel SP_R(
        .h_cnt(h_cnt), .v_cnt(v_cnt),
        .pos_h(pos_h_gameover[7]),.pos_v(pos_v_gameover[7]),
        .size_h(20),.size_v(20),
        .now_pixel_idx(pixel_idx_gameover),
        .pixel_0(pixel_gameover[7]),
        .now_pixel(pixel_gameover_ins[7])
    );
	
	select_pixel SP_w0(
        .h_cnt(h_cnt), .v_cnt(v_cnt),
        .pos_h(pos_h_wall[0]),.pos_v(pos_v_wall[0]),
        .size_h(20),.size_v(20),
        .now_pixel_idx(0),
        .pixel_0(pixel_overwall_wall),
        .now_pixel(pixel_wall[0])
    );
    select_pixel SP_w1(
        .h_cnt(h_cnt), .v_cnt(v_cnt),
        .pos_h(pos_h_wall[1]),.pos_v(pos_v_wall[1]),
        .size_h(20),.size_v(20),
        .now_pixel_idx(0),
        .pixel_0(pixel_overwall_wall),
        .now_pixel(pixel_wall[1])
    );
    select_pixel SP_w2(
        .h_cnt(h_cnt), .v_cnt(v_cnt),
        .pos_h(pos_h_wall[2]),.pos_v(pos_v_wall[2]),
        .size_h(20),.size_v(20),
        .now_pixel_idx(0),
        .pixel_0(pixel_overwall_wall),
        .now_pixel(pixel_wall[2])
    );
    select_pixel SP_w3(
        .h_cnt(h_cnt), .v_cnt(v_cnt),
        .pos_h(pos_h_wall[3]),.pos_v(pos_v_wall[3]),
        .size_h(20),.size_v(20),
        .now_pixel_idx(0),
        .pixel_0(pixel_overwall_wall),
        .now_pixel(pixel_wall[3])
    );
    select_pixel SP_w4(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[4]),.pos_v(pos_v_wall[4]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[4])
    );
    select_pixel SP_w5(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[5]),.pos_v(pos_v_wall[5]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[5])
    );
    select_pixel SP_w6(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[6]),.pos_v(pos_v_wall[6]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[6])
    );
    select_pixel SP_w7(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[7]),.pos_v(pos_v_wall[7]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[7])
    );
    select_pixel SP_w8(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[8]),.pos_v(pos_v_wall[8]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[8])
    );
    select_pixel SP_w9(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[9]),.pos_v(pos_v_wall[9]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[9])
    );
    select_pixel SP_w10(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[10]),.pos_v(pos_v_wall[10]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[10])
    );
    select_pixel SP_w11(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[11]),.pos_v(pos_v_wall[11]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[11])
    );
    select_pixel SP_w12(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[12]),.pos_v(pos_v_wall[12]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[12])
    );
    select_pixel SP_w13(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[13]),.pos_v(pos_v_wall[13]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[13])
    );
    select_pixel SP_w14(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[14]),.pos_v(pos_v_wall[14]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[14])
    );
    select_pixel SP_w15(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[15]),.pos_v(pos_v_wall[15]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[15])
    );
    select_pixel SP_w16(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[16]),.pos_v(pos_v_wall[16]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[16])
    );
    select_pixel SP_w17(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[17]),.pos_v(pos_v_wall[17]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[17])
    );
    select_pixel SP_w18(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[18]),.pos_v(pos_v_wall[18]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[18])
    );
    select_pixel SP_w19(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[19]),.pos_v(pos_v_wall[19]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[19])
    );
    select_pixel SP_w20(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[20]),.pos_v(pos_v_wall[20]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[20])
    );
    select_pixel SP_w21(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[21]),.pos_v(pos_v_wall[21]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[21])
    );
    select_pixel SP_w22(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[22]),.pos_v(pos_v_wall[22]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[22])
    );
    select_pixel SP_w23(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[23]),.pos_v(pos_v_wall[23]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[23])
    );
    select_pixel SP_w24(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[24]),.pos_v(pos_v_wall[24]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[24])
    );
    select_pixel SP_w25(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[25]),.pos_v(pos_v_wall[25]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[25])
    );
    select_pixel SP_w26(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[26]),.pos_v(pos_v_wall[26]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[26])
    );
    select_pixel SP_w27(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[27]),.pos_v(pos_v_wall[27]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[27])
    );
    select_pixel SP_w28(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[28]),.pos_v(pos_v_wall[28]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[28])
    );
    select_pixel SP_w29(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[29]),.pos_v(pos_v_wall[29]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[29])
    );
    select_pixel SP_w30(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[30]),.pos_v(pos_v_wall[30]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[30])
    );
    select_pixel SP_w31(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[31]),.pos_v(pos_v_wall[31]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[31])
    );
    select_pixel SP_w32(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[32]),.pos_v(pos_v_wall[32]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[32])
    );
    select_pixel SP_w33(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[33]),.pos_v(pos_v_wall[33]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[33])
    );
    select_pixel SP_w34(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[34]),.pos_v(pos_v_wall[34]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[34])
    );
    select_pixel SP_w35(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[35]),.pos_v(pos_v_wall[35]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[35])
    );
    select_pixel SP_w36(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[36]),.pos_v(pos_v_wall[36]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[36])
    );
    select_pixel SP_w37(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[37]),.pos_v(pos_v_wall[37]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[37])
    );
    select_pixel SP_w38(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[38]),.pos_v(pos_v_wall[38]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[38])
    );
    select_pixel SP_w39(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[39]),.pos_v(pos_v_wall[39]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[39])
    );
    select_pixel SP_w40(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[40]),.pos_v(pos_v_wall[40]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[40])
    );
    select_pixel SP_w41(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[41]),.pos_v(pos_v_wall[41]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[41])
    );
    select_pixel SP_w42(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[42]),.pos_v(pos_v_wall[42]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[42])
    );
    select_pixel SP_w43(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[43]),.pos_v(pos_v_wall[43]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[43])
    );
    select_pixel SP_w44(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[44]),.pos_v(pos_v_wall[44]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[44])
    );
    select_pixel SP_w45(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[45]),.pos_v(pos_v_wall[45]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[45])
    );
    select_pixel SP_w46(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[46]),.pos_v(pos_v_wall[46]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[46])
    );
    select_pixel SP_w47(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[47]),.pos_v(pos_v_wall[47]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[47])
    );
    select_pixel SP_w48(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[48]),.pos_v(pos_v_wall[48]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[48])
    );
    select_pixel SP_w49(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[49]),.pos_v(pos_v_wall[49]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[49])
    );
    select_pixel SP_w50(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[50]),.pos_v(pos_v_wall[50]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[50])
    );
    select_pixel SP_w51(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[51]),.pos_v(pos_v_wall[51]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[51])
    );
    select_pixel SP_w52(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[52]),.pos_v(pos_v_wall[52]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[52])
    );
    select_pixel SP_w53(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[53]),.pos_v(pos_v_wall[53]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[53])
    );
    select_pixel SP_w54(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[54]),.pos_v(pos_v_wall[54]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[54])
    );
    select_pixel SP_w55(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[55]),.pos_v(pos_v_wall[55]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[55])
    );
    select_pixel SP_w56(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[56]),.pos_v(pos_v_wall[56]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[56])
    );
    select_pixel SP_w57(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[57]),.pos_v(pos_v_wall[57]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[57])
    );
    select_pixel SP_w58(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[58]),.pos_v(pos_v_wall[58]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[58])
    );
    select_pixel SP_w59(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[59]),.pos_v(pos_v_wall[59]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[59])
    );
    select_pixel SP_w60(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[60]),.pos_v(pos_v_wall[60]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[60])
    );
    select_pixel SP_w61(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[61]),.pos_v(pos_v_wall[61]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[61])
    );
    select_pixel SP_w62(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[62]),.pos_v(pos_v_wall[62]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[62])
    );
    select_pixel SP_w63(
            .h_cnt(h_cnt), .v_cnt(v_cnt),
            .pos_h(pos_h_wall[63]),.pos_v(pos_v_wall[63]),
            .size_h(20),.size_v(20),
            .now_pixel_idx(0),
            .pixel_0(pixel_overwall_wall),
            .now_pixel(pixel_wall[63])
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
        .pixel_monster_0(pixel_monster[0]),
        .pixel_monster_1(pixel_monster[1]),
        .pixel_computer_room_entrance_ins(pixel_computer_room_entrance_ins),
        .pixel_Lv_ins(pixel_Lv_ins),
        .pixel_rupee_ins(pixel_rupee_ins),
        .pixel_colon_ins_0(pixel_colon_ins[0]),
        .pixel_colon_ins_1(pixel_colon_ins[1]),
        .pixel_kill_counter(pixel_kill_counter),
        .pixel_levl_counter(pixel_levl_counter),
        .pixel_heart_ins_0(pixel_heart_ins[0]),
        .pixel_heart_ins_1(pixel_heart_ins[1]),
        .pixel_heart_ins_2(pixel_heart_ins[2]),
        .pixel_G(pixel_gameover_ins[0]),
        .pixel_A(pixel_gameover_ins[1]),
        .pixel_M(pixel_gameover_ins[2]),
        .pixel_E_1(pixel_gameover_ins[3]),
        .pixel_O(pixel_gameover_ins[4]),
        .pixel_V(pixel_gameover_ins[5]),
        .pixel_E_2(pixel_gameover_ins[6]),
        .pixel_R(pixel_gameover_ins[7]),
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
        .pixel_wall_60(pixel_wall[60]),
        .pixel_wall_61(pixel_wall[61]),
        .pixel_wall_62(pixel_wall[62]),
        .pixel_wall_63(pixel_wall[63]),
        .RGB({vgaRed, vgaGreen, vgaBlue})
	);
	
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
        .pixel_idx_monster_0(pixel_idx_monster[0]),
		.pos_h_monster_0(pos_h_monster[0]),
		.pos_v_monster_0(pos_v_monster[0]),
		.pixel_idx_monster_1(pixel_idx_monster[1]),
		.pos_h_monster_1(pos_h_monster[1]),
		.pos_v_monster_1(pos_v_monster[1]),
		.pixel_idx_computer_room_entrance(pixel_idx_computer_room_entrance),
		.pos_h_computer_room_entrance(pos_h_computer_room_entrance),
		.pos_v_computer_room_entrance(pos_v_computer_room_entrance),
        .pos_h_Lv(pos_h_Lv),
		.pos_v_Lv(pos_v_Lv),
        .pos_h_rupee(pos_h_rupee),
		.pos_v_rupee(pos_v_rupee),
        .pos_h_colon_0(pos_h_colon[0]),
		.pos_v_colon_0(pos_v_colon[0]),
        .pos_h_colon_1(pos_h_colon[1]),
		.pos_v_colon_1(pos_v_colon[1]),
        .pixel_idx_levl_counter(pixel_idx_levl_counter),
        .pos_h_levl_counter(pos_h_levl_counter),
        .pos_v_levl_counter(pos_v_levl_counter),
        .pixel_idx_kill_counter(pixel_idx_kill_counter),
        .pos_h_kill_counter(pos_h_kill_counter),
        .pos_v_kill_counter(pos_v_kill_counter),
        .pixel_idx_heart_0(pixel_idx_heart[0]),
		.pos_h_heart_0(pos_h_heart[0]),
		.pos_v_heart_0(pos_v_heart[0]),
        .pixel_idx_heart_1(pixel_idx_heart[1]),
		.pos_h_heart_1(pos_h_heart[1]),
		.pos_v_heart_1(pos_v_heart[1]),
        .pixel_idx_heart_2(pixel_idx_heart[2]),
		.pos_h_heart_2(pos_h_heart[2]),
		.pos_v_heart_2(pos_v_heart[2]),
        .pixel_idx_gameover(pixel_idx_gameover),
        .pos_h_gameover_0(pos_h_gameover[0]),
        .pos_v_gameover_0(pos_v_gameover[0]),
        .pos_h_gameover_1(pos_h_gameover[1]),
        .pos_v_gameover_1(pos_v_gameover[1]),
        .pos_h_gameover_2(pos_h_gameover[2]),
        .pos_v_gameover_2(pos_v_gameover[2]),
        .pos_h_gameover_3(pos_h_gameover[3]),
        .pos_v_gameover_3(pos_v_gameover[3]),
        .pos_h_gameover_4(pos_h_gameover[4]),
        .pos_v_gameover_4(pos_v_gameover[4]),
        .pos_h_gameover_5(pos_h_gameover[5]),
        .pos_v_gameover_5(pos_v_gameover[5]),
        .pos_h_gameover_6(pos_h_gameover[6]),
        .pos_v_gameover_6(pos_v_gameover[6]),
        .pos_h_gameover_7(pos_h_gameover[7]),
        .pos_v_gameover_7(pos_v_gameover[7]),
		.pixel_idx_weapon(pixel_idx_weapon),
		.pos_h_weapon(pos_h_weapon),
		.pos_v_weapon(pos_v_weapon),
		.pixel_idx_walls(pixel_idx_wall),
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
        .pos_h_wall_59(pos_h_wall[59]),.pos_v_wall_59(pos_v_wall[59]),
        .pos_h_wall_60(pos_h_wall[60]),.pos_v_wall_60(pos_v_wall[60]),
        .pos_h_wall_61(pos_h_wall[61]),.pos_v_wall_61(pos_v_wall[61]),
        .pos_h_wall_62(pos_h_wall[62]),.pos_v_wall_62(pos_v_wall[62]),
        .pos_h_wall_63(pos_h_wall[63]),.pos_v_wall_63(pos_v_wall[63]),
        .change(change)        
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
		.pos_h(pos_h_monster[1]),
		.pos_v(pos_v_monster[1]),
		.pixel_addr(pixel_addr_monster[1])
	);

    mem_addr_gen MAG_monster_0(
		.h_cnt(h_cnt),
		.v_cnt(v_cnt), 
		.pos_h(pos_h_monster[0]),
		.pos_v(pos_v_monster[0]),
		.pixel_addr(pixel_addr_monster[0])
	);
	
	mem_addr_gen MAG_computer_room_entrance(
		.h_cnt(h_cnt),
		.v_cnt(v_cnt), 
		.pos_h(pos_h_computer_room_entrance),
		.pos_v(pos_v_computer_room_entrance),
		.pixel_addr(pixel_addr_computer_room_entrance)
	);
	
    mem_addr_gen MAG_Lv(
		.h_cnt(h_cnt),
		.v_cnt(v_cnt), 
		.pos_h(pos_h_Lv),
		.pos_v(pos_v_Lv),
		.pixel_addr(pixel_addr_Lv)
	);

    mem_addr_gen MAG_rupee(
		.h_cnt(h_cnt),
		.v_cnt(v_cnt), 
		.pos_h(pos_h_rupee),
		.pos_v(pos_v_rupee),
		.pixel_addr(pixel_addr_rupee)
	);

    mem_addr_gen MAG_colon_0(
		.h_cnt(h_cnt),
		.v_cnt(v_cnt), 
		.pos_h(pos_h_colon[0]),
		.pos_v(pos_v_colon[0]),
		.pixel_addr(pixel_addr_colon[0])
	);

    mem_addr_gen MAG_colon_1(
		.h_cnt(h_cnt),
		.v_cnt(v_cnt), 
		.pos_h(pos_h_colon[1]),
		.pos_v(pos_v_colon[1]),
		.pixel_addr(pixel_addr_colon[1])
	);

    mem_addr_gen MAG_levl_counter(
		.h_cnt(h_cnt),
		.v_cnt(v_cnt), 
		.pos_h(pos_h_levl_counter),
		.pos_v(pos_v_levl_counter),
		.pixel_addr(pixel_addr_levl_counter)
	);

    mem_addr_gen MAG_kill_counter(
		.h_cnt(h_cnt),
		.v_cnt(v_cnt), 
		.pos_h(pos_h_kill_counter),
		.pos_v(pos_v_kill_counter),
		.pixel_addr(pixel_addr_kill_counter)
	);

	mem_addr_gen MAG_heart_0(
		.h_cnt(h_cnt),
		.v_cnt(v_cnt), 
		.pos_h(pos_h_heart[0]),
		.pos_v(pos_v_heart[0]),
		.pixel_addr(pixel_addr_heart[0])
	);

    mem_addr_gen MAG_heart_1(
		.h_cnt(h_cnt),
		.v_cnt(v_cnt), 
		.pos_h(pos_h_heart[1]),
		.pos_v(pos_v_heart[1]),
		.pixel_addr(pixel_addr_heart[1])
	);

    mem_addr_gen MAG_heart_2(
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

    mem_addr_gen MAG_G(
            .h_cnt(h_cnt),
            .v_cnt(v_cnt),
            .pos_h(pos_h_gameover[0]),
            .pos_v(pos_v_gameover[0]),
            .pixel_addr(pixel_addr_gameover[0])
    );
    mem_addr_gen MAG_A(
            .h_cnt(h_cnt),
            .v_cnt(v_cnt),
            .pos_h(pos_h_gameover[1]),
            .pos_v(pos_v_gameover[1]),
            .pixel_addr(pixel_addr_gameover[1])
    );
    mem_addr_gen MAG_M(
            .h_cnt(h_cnt),
            .v_cnt(v_cnt),
            .pos_h(pos_h_gameover[2]),
            .pos_v(pos_v_gameover[2]),
            .pixel_addr(pixel_addr_gameover[2])
    );
    mem_addr_gen MAG_E_1(
            .h_cnt(h_cnt),
            .v_cnt(v_cnt),
            .pos_h(pos_h_gameover[3]),
            .pos_v(pos_v_gameover[3]),
            .pixel_addr(pixel_addr_gameover[3])
    );
    mem_addr_gen MAG_O(
            .h_cnt(h_cnt),
            .v_cnt(v_cnt),
            .pos_h(pos_h_gameover[4]),
            .pos_v(pos_v_gameover[4]),
            .pixel_addr(pixel_addr_gameover[4])
    );
    mem_addr_gen MAG_V(
            .h_cnt(h_cnt),
            .v_cnt(v_cnt),
            .pos_h(pos_h_gameover[5]),
            .pos_v(pos_v_gameover[5]),
            .pixel_addr(pixel_addr_gameover[5])
    );
    mem_addr_gen MAG_E_2(
            .h_cnt(h_cnt),
            .v_cnt(v_cnt),
            .pos_h(pos_h_gameover[6]),
            .pos_v(pos_v_gameover[6]),
            .pixel_addr(pixel_addr_gameover[6])
    );
    mem_addr_gen MAG_R(
            .h_cnt(h_cnt),
            .v_cnt(v_cnt),
            .pos_h(pos_h_gameover[7]),
            .pos_v(pos_v_gameover[7]),
            .pixel_addr(pixel_addr_gameover[7])
    );
	
    mem_addr_gen MAG_wall(
            .h_cnt(h_cnt),.v_cnt(v_cnt),
            .pos_h(pos_h_wall[0]),.pos_v(pos_v_wall[0]),
            .pixel_addr(pixel_addr_wall)
    );

	//display
    BM_Lv BM_Lv_(
		.clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_Lv),
        .dina(12'd0),
        .douta(pixel_Lv)
    ); 

    BM_rupee BM_rupee_(
		.clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_rupee),
        .dina(12'd0),
        .douta(pixel_rupee)
    ); 

    BM_colon BM_colon_0(
        .clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_colon[0]),
        .dina(12'd0),
        .douta(pixel_colon[0])
    ); 

    BM_colon BM_colon_1(
        .clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_colon[1]),
        .dina(12'd0),
        .douta(pixel_colon[1])
    ); 

    BM_G BM_G_(
		.clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_gameover[0]),
        .dina(12'd0),
        .douta(pixel_gameover[0])
    ); 

    BM_A BM_A_(
		.clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_gameover[1]),
        .dina(12'd0),
        .douta(pixel_gameover[1])
    ); 

    BM_M BM_M_(
		.clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_gameover[2]),
        .dina(12'd0),
        .douta(pixel_gameover[2])
    ); 

    BM_E BM_E_1(
		.clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_gameover[3]),
        .dina(12'd0),
        .douta(pixel_gameover[3])
    ); 

    BM_O BM_O_(
		.clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_gameover[4]),
        .dina(12'd0),
        .douta(pixel_gameover[4])
    ); 

    BM_V BM_V_(
		.clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_gameover[5]),
        .dina(12'd0),
        .douta(pixel_gameover[5])
    ); 

    BM_E BM_E_2(
		.clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_gameover[6]),
        .dina(12'd0),
        .douta(pixel_gameover[6])
    ); 

    BM_R BM_R_2(
		.clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_gameover[7]),
        .dina(12'd0),
        .douta(pixel_gameover[7])
    ); 

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
    
    BM_CS_student_L BM_CS_student_L_0(
		.clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_monster[0]),
        .dina(12'd0),
        .douta(pixel_CS_student_L[0])
    ); 

    BM_CS_student_L BM_CS_student_L_1(
		.clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_monster[1]),
        .dina(12'd0),
        .douta(pixel_CS_student_L[1])
    ); 
    
    BM_CS_student_R BM_CS_student_R_0(
		.clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_monster[0]),
        .dina(12'd0),
        .douta(pixel_CS_student_R[0])
    ); 

    BM_CS_student_R BM_CS_student_R_1(
		.clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_monster[1]),
        .dina(12'd0),
        .douta(pixel_CS_student_R[1])
    ); 

    ///
    BM_EECS_student_L BM_EECS_student_L_0(
		.clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_monster[0]),
        .dina(12'd0),
        .douta(pixel_EECS_student_L[0])
    ); 

    BM_EECS_student_L BM_EECS_student_L_1(
		.clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_monster[1]),
        .dina(12'd0),
        .douta(pixel_EECS_student_L[1])
    ); 
    
    BM_EECS_student_R BM_EECS_student_R_0(
		.clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_monster[0]),
        .dina(12'd0),
        .douta(pixel_EECS_student_R[0])
    ); 

    BM_EECS_student_R BM_EECS_student_R_1(
		.clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_monster[1]),
        .dina(12'd0),
        .douta(pixel_EECS_student_R[1])
    ); 

    //
    BM_NTHU_student_L BM_NTHU_student_L_0(
		.clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_monster[0]),
        .dina(12'd0),
        .douta(pixel_NTHU_student_L[0])
    ); 

    BM_NTHU_student_L BM_NTHU_student_L_1(
		.clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_monster[1]),
        .dina(12'd0),
        .douta(pixel_NTHU_student_L[1])
    ); 
    
    BM_NTHU_student_R BM_NTHU_student_R_0(
		.clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_monster[0]),
        .dina(12'd0),
        .douta(pixel_NTHU_student_R[0])
    ); 

    BM_NTHU_student_R BM_NTHU_student_R_1(
		.clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_monster[1]),
        .dina(12'd0),
        .douta(pixel_NTHU_student_R[1])
    ); 
    
    BM_computer_room_entrance BM_computer_room_entrance_(
        .clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_computer_room_entrance),
        .dina(12'd0),
        .douta(pixel_computer_room_entrance)
    );
    //
    BM_BOSS_student_L BM_BOSS_student_L_0(
		.clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_monster[0]),
        .dina(12'd0),
        .douta(pixel_BOSS_student_L[0])
    ); 

    BM_BOSS_student_L BM_BOSS_student_L_1(
		.clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_monster[1]),
        .dina(12'd0),
        .douta(pixel_BOSS_student_L[1])
    ); 
    
    BM_BOSS_student_R BM_BOSS_student_R_0(
		.clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_monster[0]),
        .dina(12'd0),
        .douta(pixel_BOSS_student_R[0])
    ); 

    BM_BOSS_student_R BM_BOSS_student_R_1(
		.clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_monster[1]),
        .dina(12'd0),
        .douta(pixel_BOSS_student_R[1])
    ); 
    
    
    BM_0 BM_levl_counter_num_0(
        .clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_levl_counter),
        .dina(12'd0),
        .douta(pixel_levl_counter_num[0])
    );
    BM_1 BM_levl_counter_num_1(
        .clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_levl_counter),
        .dina(12'd0),
        .douta(pixel_levl_counter_num[1])
    );
    BM_2 BM_levl_counter_num_2(
        .clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_levl_counter),
        .dina(12'd0),
        .douta(pixel_levl_counter_num[2])
    );
    BM_3 BM_levl_counter_num_3(
        .clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_levl_counter),
        .dina(12'd0),
        .douta(pixel_levl_counter_num[3])
    );
    BM_4 BM_levl_counter_num_4(
        .clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_levl_counter),
        .dina(12'd0),
        .douta(pixel_levl_counter_num[4])
    );
    BM_5 BM_levl_counter_num_5(
        .clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_levl_counter),
        .dina(12'd0),
        .douta(pixel_levl_counter_num[5])
    );
    BM_6 BM_levl_counter_num_6(
        .clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_levl_counter),
        .dina(12'd0),
        .douta(pixel_levl_counter_num[6])
    );
    BM_7 BM_levl_counter_num_7(
        .clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_levl_counter),
        .dina(12'd0),
        .douta(pixel_levl_counter_num[7])
    );
    BM_8 BM_levl_counter_num_8(
        .clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_levl_counter),
        .dina(12'd0),
        .douta(pixel_levl_counter_num[8])
    );
    BM_9 BM_levl_counter_num_9(
        .clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_levl_counter),
        .dina(12'd0),
        .douta(pixel_levl_counter_num[9])
    );

    BM_0 BM_kill_counter_num_0(
        .clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_kill_counter),
        .dina(12'd0),
        .douta(pixel_kill_counter_num[0])
    );
    BM_1 BM_kill_counter_num_1(
        .clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_kill_counter),
        .dina(12'd0),
        .douta(pixel_kill_counter_num[1])
    );
    BM_2 BM_kill_counter_num_2(
        .clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_kill_counter),
        .dina(12'd0),
        .douta(pixel_kill_counter_num[2])
    );
    BM_3 BM_kill_counter_num_3(
        .clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_kill_counter),
        .dina(12'd0),
        .douta(pixel_kill_counter_num[3])
    );
    BM_4 BM_kill_counter_num_4(
        .clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_kill_counter),
        .dina(12'd0),
        .douta(pixel_kill_counter_num[4])
    );
    BM_5 BM_kill_counter_num_5(
        .clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_kill_counter),
        .dina(12'd0),
        .douta(pixel_kill_counter_num[5])
    );
    BM_6 BM_kill_counter_num_6(
        .clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_kill_counter),
        .dina(12'd0),
        .douta(pixel_kill_counter_num[6])
    );
    BM_7 BM_kill_counter_num_7(
        .clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_kill_counter),
        .dina(12'd0),
        .douta(pixel_kill_counter_num[7])
    );
    BM_8 BM_kill_counter_num_8(
        .clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_kill_counter),
        .dina(12'd0),
        .douta(pixel_kill_counter_num[8])
    );
    BM_9 BM_kill_counter_num_9(
        .clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_kill_counter),
        .dina(12'd0),
        .douta(pixel_kill_counter_num[9])
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
    
    BM_overwall_wall BM_overwall_wall(
        .clka(clk_d2),
        .wea(0),
        .addra(pixel_addr_wall),
        .dina(12'd0),
        .douta(pixel_overwall_wall)
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