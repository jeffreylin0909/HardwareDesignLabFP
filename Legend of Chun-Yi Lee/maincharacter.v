module maincharacter (
    input clk,
    input rst,
    input A_signal, D_signal, W_signal, S_signal, J_signal, K_signal, L_signal, SPACE_signal,
    input [3:0] stagestate,
    input is_attacking,
    input is_attacked,
    input [3:0] wall_collision,
    input gameover,
    output reg  [9:0] pos_h, pos_v,
    output reg [3:0] state,
    output reg backstage, nextstage,
    output reg [3:0] lives
    );

    reg [7:0] hurt;
    reg [9:0] npos_v, npos_h;
    reg [2:0] signals; 
    reg [3:0] nstate;
    wire dclk;
    clk_div #(3) CD(.clk(clk), .clk_d(dclk));

    parameter FACE_FRONT_STAND = 4'd0, FACE_FRONT_WALK_L = 4'd1, FACE_FRONT_WALK_R = 4'd2, 
    FACE_RIGHT_STAND = 4'd3, FACE_RIGHT_WALK = 4'd4, FACE_LEFT_STAND = 4'd5, FACE_LEFT_WALK = 4'd6, 
    FACE_BACK_STAND = 4'd7, FACE_BACK_WALK_L = 4'd8, FACE_BACK_WALK_R = 4'd9, 
    FACE_FRONT_ATTACK = 4'hA, FACE_BACK_ATTACK = 4'hB, FACE_LEFT_ATTACK = 4'hC, FACE_RIGHT_ATTACK = 4'hD, EMPTY = 4'hf;

    always @(*) begin //combine WASD signals into one reg for ease of coding
        if (W_signal) signals = 3'd1; //W = go up
        else if (S_signal) signals = 3'd2; //S = go down
        else if (A_signal) signals = 3'd3; //A = go left
        else if (D_signal) signals = 3'd4; //D = go right
        else signals = 3'd0;
    end
    
    always@(posedge clk)begin
        if (rst)begin
            lives <= 4'd3;
        end else begin
            if (!gameover && is_attacked && hurt == 8'd0)begin
                lives <= lives-1;
            end else begin
                lives <= lives;
            end
        end
    end

    always@(posedge clk)begin
        if (rst)begin
            hurt <= 8'd0;
        end else begin
            if (hurt != 8'd0)begin
                hurt <= hurt-1;
            end else begin
                if (is_attacked)begin
                    hurt <= 8'd100;
                end else begin
                    hurt <= 8'd0;
                end
            end
        end
    end

    always @(posedge dclk) begin //state always block
        if (hurt == 8'd0)begin
            state <= nstate;
        end else begin
            if (state == EMPTY)begin
                state <= nstate;
            end else begin
                state <= EMPTY;
            end
        end
    end

    always @(*) begin //state always block 2
        if (gameover)begin
            nstate = EMPTY;
        end else begin
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
                if (state == FACE_FRONT_WALK_L || state == FACE_FRONT_WALK_R || state == FACE_FRONT_STAND || state == FACE_FRONT_ATTACK ) nstate = FACE_FRONT_STAND;
                if (state == FACE_RIGHT_WALK || state == FACE_RIGHT_STAND || state == FACE_RIGHT_ATTACK) nstate = FACE_RIGHT_STAND;
                if (state == FACE_LEFT_WALK || state == FACE_LEFT_STAND || state == FACE_LEFT_ATTACK) nstate = FACE_LEFT_STAND;
                if (state == FACE_BACK_WALK_L || state == FACE_BACK_WALK_R || state == FACE_BACK_STAND || state == FACE_BACK_ATTACK) nstate = FACE_BACK_STAND;
            end
            if (is_attacking)begin
                case (nstate)
                    FACE_FRONT_STAND: nstate = FACE_FRONT_ATTACK;
                    FACE_FRONT_WALK_L: nstate = FACE_FRONT_ATTACK;
                    FACE_FRONT_WALK_R: nstate = FACE_FRONT_ATTACK;
                    FACE_BACK_STAND: nstate = FACE_BACK_ATTACK;
                    FACE_BACK_WALK_L: nstate = FACE_BACK_ATTACK;
                    FACE_BACK_WALK_R: nstate = FACE_BACK_ATTACK;
                    FACE_RIGHT_STAND: nstate = FACE_RIGHT_ATTACK;
                    FACE_RIGHT_WALK: nstate = FACE_RIGHT_ATTACK;
                    FACE_LEFT_STAND: nstate = FACE_LEFT_ATTACK;
                    FACE_LEFT_WALK: nstate = FACE_LEFT_ATTACK;
                endcase
            end else begin
                nstate = nstate;
            end
        end
    end

    always@(posedge clk) begin //movement always block
        if (rst) begin
            pos_h <= 150;
            pos_v <= 110;
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
                if (wall_collision[2] || is_attacking)begin
                    npos_v = pos_v;
                end else begin
                    npos_v = pos_v + 10'd1; //walk up
                end
            end 
            3'd2:begin
                npos_h = pos_h;
                if (wall_collision[3] || is_attacking)begin
                    npos_v = pos_v;
                end else begin
                    npos_v = pos_v - 10'd1; //walk down
                end
            end 
            3'd3:begin
                if (wall_collision[1] || is_attacking)begin
                    npos_h = pos_h;
                end else begin
                    npos_h = pos_h + 10'd1; //walk left
                end
                npos_v = pos_v;
            end 
            3'd4:begin
                if (wall_collision[0] || is_attacking)begin
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