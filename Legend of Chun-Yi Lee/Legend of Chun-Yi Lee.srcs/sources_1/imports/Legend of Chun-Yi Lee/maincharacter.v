module maincharacter (
    input clk,
    input rst,
    input A_signal, D_signal, W_signal, S_signal, SPACE_signal,
    input [3:0] stage,
    input is_attacked,
    input [3:0] wall_collision,
    
    output reg  [9:0] pos_h, pos_v,
    output reg [3:0] state,
    output reg [3:0] lives
    );
    reg [7:0] hurt;
    reg [2:0] change_state_counter;
    reg [3:0] facing;

    reg [9:0] n_pos_v, n_pos_h;
    reg [3:0] n_state;
    reg [3:0] n_lives;
    reg [7:0] n_hurt;
    reg [2:0] n_change_state_counter;
    reg [3:0] n_facing;

    parameter FACE_FRONT_STAND = 4'd0, FACE_FRONT_WALK_L = 4'd1, FACE_FRONT_WALK_R = 4'd2, 
    FACE_RIGHT_STAND = 4'd3, FACE_RIGHT_WALK = 4'd4, FACE_LEFT_STAND = 4'd5, FACE_LEFT_WALK = 4'd6, 
    FACE_BACK_STAND = 4'd7, FACE_BACK_WALK_L = 4'd8, FACE_BACK_WALK_R = 4'd9, 
    FACE_FRONT_ATTACK = 4'hA, FACE_BACK_ATTACK = 4'hB, FACE_LEFT_ATTACK = 4'hC, FACE_RIGHT_ATTACK = 4'hD, EMPTY = 4'hf;

    //for facing
    always@(posedge clk)begin
        if (rst)begin
            facing <= 4'h0;
        end else begin
            facing <= n_facing;
        end
    end
    always@(*)begin
        if (stage==4'h0 || stage==4'he || stage==4'hf)begin
            n_facing = 4'h0;
        end else begin
            if (W_signal)begin
                n_facing = 4'h0;
            end else if (S_signal)begin
                n_facing = 4'h1;
            end else if (A_signal)begin
                n_facing = 4'h2;
            end else if (D_signal)begin
                n_facing = 4'h3;
            end else begin
                n_facing = facing;
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

    //for lives
    always@(posedge clk)begin
        if (rst)begin
            lives <= 4'd3;
        end else begin
            lives <= n_lives;
        end
    end
    always@(*)begin
        if (stage==4'hf)begin
            n_lives = 4'd0;
        end else begin
            if (stage==4'h0 || stage==4'he)begin
                n_lives = 4'd3;
            end else begin
                if (is_attacked && hurt == 8'd0)begin
                    n_lives = lives-1;
                end else begin
                    n_lives = lives;
                end
            end
        end
    end

    //for hurt
    always@(posedge clk)begin
        if (rst)begin
            hurt <= 8'd0;
        end else begin
            hurt <= n_hurt;
        end
    end
    always@(*)begin
        if (stage==4'h0 || stage==4'he || stage==4'hf)begin
            n_hurt = 8'd0;
        end else begin
            if (hurt==8'd0)begin
                if (is_attacked)begin
                    n_hurt = 8'd100;
                end else begin
                    n_hurt = 8'd0;
                end
            end else begin
                n_hurt = hurt-1;
            end
        end
    end

    //for state
    always @(posedge clk) begin //state always block
        if (rst)begin
            state <= EMPTY;
        end else begin
            state <= n_state;
        end
    end
    always @(*) begin //state always block 2
        if (stage==4'h0 || stage==4'he || stage==4'hf)begin
            n_state = EMPTY;
        end else begin
            if (change_state_counter == 4'h0)begin
                if (hurt == 8'd0 || state == EMPTY)begin
                    if (W_signal)begin
                        if (state == FACE_BACK_WALK_L) n_state = FACE_BACK_WALK_R;
                        else if (state == FACE_BACK_WALK_R) n_state = FACE_BACK_WALK_L;
                        else n_state = FACE_BACK_WALK_R;
                    end else if(S_signal) begin
                        if (state == FACE_FRONT_WALK_L) n_state = FACE_FRONT_WALK_R;
                        else if (state == FACE_FRONT_WALK_R) n_state = FACE_FRONT_WALK_L;
                        else n_state = FACE_FRONT_WALK_R;
                    end else if(A_signal) begin
                        if (state == FACE_LEFT_WALK) n_state = FACE_LEFT_STAND;
                        else n_state = FACE_LEFT_WALK;
                    end else if(D_signal) begin
                        if (state == FACE_RIGHT_WALK) n_state = FACE_RIGHT_STAND;
                        else n_state = FACE_RIGHT_WALK;
                    end else begin
                        if (facing==4'h0) n_state = FACE_BACK_STAND;
                        if (facing==4'h1) n_state = FACE_FRONT_STAND;
                        if (facing==4'h2) n_state = FACE_LEFT_STAND;
                        if (facing==4'h3) n_state = FACE_RIGHT_STAND;
                    end

                    if (SPACE_signal)begin//to attack
                        case (n_state)
                            FACE_FRONT_STAND: n_state = FACE_FRONT_ATTACK;
                            FACE_FRONT_WALK_L: n_state = FACE_FRONT_ATTACK;
                            FACE_FRONT_WALK_R: n_state = FACE_FRONT_ATTACK;
                            FACE_BACK_STAND: n_state = FACE_BACK_ATTACK;
                            FACE_BACK_WALK_L: n_state = FACE_BACK_ATTACK;
                            FACE_BACK_WALK_R: n_state = FACE_BACK_ATTACK;
                            FACE_RIGHT_STAND: n_state = FACE_RIGHT_ATTACK;
                            FACE_RIGHT_WALK: n_state = FACE_RIGHT_ATTACK;
                            FACE_LEFT_STAND: n_state = FACE_LEFT_ATTACK;
                            FACE_LEFT_WALK: n_state = FACE_LEFT_ATTACK;
                        endcase
                    end
                end else begin
                    n_state = EMPTY;
                end
            end else begin
                n_state = state;
            end
        end
    end

    //for pos
    always@(posedge clk) begin //movement always block
        if (rst) begin
            pos_h <= 150;
            pos_v <= 110;
        end else begin
            pos_h <= n_pos_h;
            pos_v <= n_pos_v;
        end
    end
    always @ (*) begin
        if (stage==4'h0 || stage==4'he || stage==4'hf)begin
            n_pos_h = 150;
            n_pos_v = 110;
        end else begin
            if (W_signal)begin
                n_pos_h = pos_h;
                if (wall_collision[2] || SPACE_signal)begin
                    n_pos_v = pos_v;
                end else begin
                    n_pos_v = pos_v + 10'd1; //walk up
                end
            end else if (S_signal)begin
                n_pos_h = pos_h;
                if (wall_collision[3] || SPACE_signal)begin
                    n_pos_v = pos_v;
                end else begin
                    n_pos_v = pos_v - 10'd1; //walk down
                end
            end else if (A_signal)begin
                if (wall_collision[1] || SPACE_signal)begin
                    n_pos_h = pos_h;
                end else begin
                    n_pos_h = pos_h + 10'd1; //walk left
                end
                n_pos_v = pos_v;
            end else if (D_signal)begin
                if (wall_collision[0] || SPACE_signal || pos_h==20)begin
                    n_pos_h = pos_h;
                end else begin
                    n_pos_h = pos_h - 10'd1; //walk right
                end
                n_pos_v = pos_v;
            end else begin
                n_pos_h = pos_h;
                n_pos_v = pos_v;
            end
        end
    end
endmodule