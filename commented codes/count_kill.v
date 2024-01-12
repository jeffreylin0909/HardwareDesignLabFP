//for setting kills signal in state control
module count_kill(
    input clk,
    input rst,
    input [3:0] stage,//now stage
    input monster_dead_0,//if monsters is dead
    input monster_dead_1,
    input monster_dead_2,
    input monster_dead_3,
    output reg [3:0] kills//output kill number
    );

    wire monster_dead_0_op,monster_dead_1_op,monster_dead_2_op,monster_dead_3_op;
    //onepluse of die signal, means output onepluse 1 if the monster is killed in this clk cycle

    onepulse OP0(monster_dead_0, monster_dead_0_op, clk);
    onepulse OP1(monster_dead_1, monster_dead_1_op, clk);
    onepulse OP2(monster_dead_2, monster_dead_2_op, clk);
    onepulse OP3(monster_dead_3, monster_dead_3_op, clk);

    always@(posedge clk)begin
        if (rst)begin
            kills <= 0;
        end else begin
            if (stage == 4'h0 || stage == 4'hf)begin//if in initail stage or gameover stage, set to 0
                kills <= 0;
            end else begin//sum of killed signal
                kills <= kills+monster_dead_0_op+monster_dead_1_op+monster_dead_2_op+monster_dead_3_op;
            end
        end
    end

endmodule