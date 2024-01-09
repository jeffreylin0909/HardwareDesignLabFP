module monster (
    input clk,
    input rst,
    input [3:0]stagestate,
    input [3:0]wall_collision,
    input enable_weapon_collision,
    input weapon_collision,
    input gameover,
    input [12:0] random_seed,
    output reg [3:0] state,
    output reg [9:0] pos_h,
    output reg [9:0] pos_v,
    output reg is_dead
    );

    reg [3:0] direction;
    reg [7:0] counter;
    reg [7:0] is_dieing;

    wire [12:0] randomNum;
    LFSR randomgen(.clock(clk),.reset(rst),.seed(random_seed),.rnd(randomNum));

    wire dclk;
    clk_div #(3) CD(.clk(clk), .clk_d(dclk));

    always@(posedge dclk)begin
        if (gameover)begin
            state <= 4'hf;
        end else begin
            if (is_dieing != 8'd0)begin
                if (is_dieing <= 8'd50)begin
                    if (state == 1)begin
                        state <= 4'hf;
                    end else begin
                        state <= 1;
                    end
                end else begin
                    state <= 4'hf;
                end
            end else begin
                if (state == 1)begin
                    state <= 0;
                end else begin
                    state <= 1;
                end
            end
        end
    end

    always@(posedge clk)begin
        if (rst)begin
            pos_h <= 20;
            pos_v <= 120;
            direction <= 0;
            is_dieing <= 0;
            counter <= 0;
            is_dead <= 0;
        end else begin
            if (is_dieing > 8'd0)begin
                pos_h <= pos_h;
                pos_v <= pos_v;
                direction <= direction;
                if (is_dieing <= 8'd50)begin
                    is_dieing <= is_dieing+1;
                end else begin
                    is_dieing <= is_dieing;
                end
                is_dead <= 1;
            end else begin
                if (enable_weapon_collision && weapon_collision)begin
                    pos_h <= pos_h;
                    pos_v <= pos_v;
                    direction <= direction;
                    is_dieing <= 8'd1;
                    is_dead <= 1;
                end else begin
                    is_dieing <= 0;
                    is_dead <= 0;
                    if (counter >= 8'd50)begin
                        counter <= 0;
                        direction <= (randomNum%4);
                    end else begin
                        counter <= counter+1;
                        if ((wall_collision[1] || pos_h >= 300)&&direction==0)begin
                            direction <= (randomNum%3)+1;
                        end else begin
                            if ((wall_collision[0] || pos_h <= 20)&&direction==1)begin
                                direction <= (randomNum%3 >= 1)? (randomNum%3)+1: (randomNum%3);
                            end else begin
                                if ((wall_collision[2] || pos_v >= 220)&&direction==2)begin
                                    direction <= (randomNum%3 >= 2)? (randomNum%3)+1: (randomNum%3);
                                end else begin
                                    if ((wall_collision[3] || pos_v <= 20)&&direction==3)begin
                                        direction <= (randomNum%3);
                                    end else begin
                                        direction <= direction;
                                    end
                                end
                            end
                        end
                    end
                end

                case (direction)
                    0:begin
                        if (wall_collision[1] || pos_h >= 300)begin
                            pos_h <= pos_h;
                        end else begin
                            pos_h <= pos_h+1;//
                        end
                        pos_v <= pos_v;
                    end
                    1:begin
                        if (wall_collision[0] || pos_h <= 20)begin
                            pos_h <= pos_h;
                        end else begin
                            pos_h <= pos_h-1;//
                        end
                        pos_v <= pos_v;
                    end
                    2:begin
                        if (wall_collision[2] || pos_v >= 220)begin
                            pos_v <= pos_v;
                        end else begin
                            pos_v <= pos_v+1;//
                        end
                        pos_h <= pos_h;
                    end
                    3:begin
                        if (wall_collision[3] || pos_v <= 20)begin
                            pos_v <= pos_v;
                        end else begin
                            pos_v <= pos_v-1;//
                        end
                        pos_h <= pos_h;
                    end
                endcase
            end
        end
    end
endmodule