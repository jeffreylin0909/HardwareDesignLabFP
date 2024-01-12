//define behavior of monster
module monster (
    input clk,
    input rst,
    input [3:0]stage,
    input [3:0]wall_collision,
    input enable_weapon_collision,
    input weapon_collision,
    input [12:0] random_seed,

    output reg [3:0] state,
    output reg [9:0] pos_h,
    output reg [9:0] pos_v,
    output reg is_dead
    );

    reg [3:0] direction;
    reg [7:0] change_direction_counter;
    reg [2:0] change_state_counter;
    reg [7:0] is_dieing;

    reg [3:0] n_state;
    reg [9:0] n_pos_h;
    reg [9:0] n_pos_v;
    reg n_is_dead;
    reg [3:0] n_direction;
    reg [7:0] n_change_direction_counter;
    reg [2:0] n_change_state_counter;
    reg [7:0] n_is_dieing;

    wire [12:0] randomNum;
    LFSR randomgen(.clock(clk),.reset(rst),.seed(random_seed+stage),.rnd(randomNum));

    parameter CS_student_L = 4'h0, CS_student_R = 4'h1, 
            EECS_student_L = 4'h2, EECS_student_R = 4'h3, 
            NTHU_student_L = 4'h4, NTHU_student_R = 4'h5, 
            BOSS_student_L = 4'h6, BOSS_student_R = 4'h7,
            EMPTY = 4'hf;

    //for state
    reg [3:0] now_img_L, now_img_R;
    always@(posedge clk)begin
        if (rst)begin
            state <= EMPTY;
        end else begin
            state <= n_state;
        end
    end
    always@(*)begin
        case (stage)
            4'h1:begin
                now_img_L = CS_student_L;
                now_img_R = CS_student_R;
            end
            4'h2:begin
                now_img_L = EECS_student_L;
                now_img_R = EECS_student_R;
            end
            4'h3:begin
                now_img_L = NTHU_student_L;
                now_img_R = NTHU_student_R;
            end
            4'h4:begin
                now_img_L = BOSS_student_L;
                now_img_R = BOSS_student_R;
            end
        endcase

        if (stage==4'h0 || stage==4'he || stage==4'hf)begin
            n_state = EMPTY;
        end else begin
            if (change_state_counter == 4'h0)begin
                if (is_dead)begin
                    if (is_dieing == 0)begin
                        n_state = EMPTY;
                    end else begin
                        if (state == now_img_R)begin
                            n_state = EMPTY;
                        end else begin
                            n_state = now_img_R;
                        end
                    end
                end else begin
                    if (state == now_img_R)begin
                        n_state = now_img_L;
                    end else begin
                        n_state = now_img_R;
                    end
                end
            end else begin
                n_state = state;
            end
        end
    end

    //for pos
    reg [3:0] speed;
    always@(posedge clk)begin
        if (rst)begin
            pos_h <= 20;
            pos_v <= 120;
        end else begin
            pos_h <= n_pos_h;
            pos_v <= n_pos_v;
        end
    end
    always@(*)begin
        case (stage)
            4'h1: speed = 1;
            4'h2: speed = 2;
            4'h3: speed = 2;
            4'h4: speed = 4;
        endcase
        if (stage==4'h0 || stage==4'he || stage==4'hf)begin
            n_pos_h = 20;
            n_pos_v = 120;
        end else begin
            if (is_dead)begin
                n_pos_h = pos_h;
                n_pos_v = pos_v;
            end else begin
                case (direction)
                    0:begin
                        if (wall_collision[1])begin
                            n_pos_h = pos_h;
                        end else begin
                            n_pos_h = pos_h+speed;//
                        end
                        n_pos_v = pos_v;
                    end
                    1:begin
                        if (wall_collision[0] || pos_h <= 20)begin
                            n_pos_h = pos_h;
                        end else begin
                            n_pos_h = pos_h-speed;//
                        end
                        n_pos_v = pos_v;
                    end
                    2:begin
                        if (wall_collision[2])begin
                            n_pos_v = pos_v;
                        end else begin
                            n_pos_v = pos_v+speed;//
                        end
                        n_pos_h = pos_h;
                    end
                    3:begin
                        if (wall_collision[3])begin
                            n_pos_v = pos_v;
                        end else begin
                            n_pos_v = pos_v-speed;//
                        end
                        n_pos_h = pos_h;
                    end
                    4:begin
                        n_pos_h = pos_h;
                        n_pos_v = pos_v;
                    end
                endcase
            end
        end
    end

    //for is_dead
    always@(posedge clk)begin
        if (rst)begin
            is_dead <= 0;
        end else begin
            is_dead <= n_is_dead;
        end
    end
    always@(*)begin
        if (stage==4'h0 || stage==4'he || stage==4'hf)begin
            n_is_dead = 0;
        end else begin
            if (is_dead ||(enable_weapon_collision && weapon_collision))begin
                n_is_dead = 1;
            end else begin
                n_is_dead = 0;
            end
        end
    end

    //for direction
    always@(posedge clk)begin
        if (rst)begin
            direction <= 0;
        end else begin
            direction <= n_direction;
        end
    end
    always@(*)begin
        if (stage==4'h0 || stage==4'he || stage==4'hf)begin
            n_direction = 0;
        end else begin
            if (change_direction_counter >= 8'd50)begin
                n_direction = (randomNum%5);
            end else begin
                if ((wall_collision[1])&&direction==0)begin
                    n_direction = (randomNum%4)+1;
                end else begin
                    if ((wall_collision[0] || pos_h <= 20)&&direction==1)begin
                        n_direction = (randomNum%4 >= 1)? (randomNum%3)+1: (randomNum%3);
                    end else if ((wall_collision[2])&&direction==2)begin
                        n_direction = (randomNum%4 >= 2)? (randomNum%3)+1: (randomNum%3);
                    end else if ((wall_collision[3])&&direction==3)begin
                        n_direction = (randomNum%4);
                    end else begin
                        n_direction = direction;
                    end
                end
            end
        end
    end

    //for change_direction_counter
    always@(posedge clk)begin
        if (rst)begin
            change_direction_counter <= 0;
        end else begin
            change_direction_counter <= n_change_direction_counter;
        end
    end
    always@(*)begin
        if (stage==4'h0 || stage==4'he || stage==4'hf)begin
            n_change_direction_counter = 0;
        end else begin
            if (change_direction_counter >= 8'd50)begin
                n_change_direction_counter = 0;
            end else begin
                n_change_direction_counter = change_direction_counter+1;
            end
        end
    end

    //for change_state_counter
    always@(posedge clk)begin
        if (rst)begin
            change_state_counter <= 3'h0;
        end else begin
            change_state_counter <= n_change_state_counter;
        end
    end
    always@(*)begin
        if (stage==4'h0 || stage==4'he || stage==4'hf)begin
            n_change_state_counter = 3'h0;
        end else begin
            n_change_state_counter = change_state_counter+1;
        end
    end

    //for is_dieing
    always@(posedge clk)begin
        if (rst)begin
            is_dieing <= 0;
        end else begin
            is_dieing <= n_is_dieing;
        end
    end
    always@(*)begin
        if (stage==4'h0 || stage==4'he || stage==4'hf)begin
            n_is_dieing = 0;
        end else begin
            if (is_dead)begin
                if (is_dieing == 0)begin
                    n_is_dieing = 0;
                end else begin
                    n_is_dieing = is_dieing-1;
                end
            end else begin
                if (enable_weapon_collision && weapon_collision)begin
                    n_is_dieing = 8'd50;
                end else begin
                    n_is_dieing = 0;
                end
            end
        end
    end

endmodule