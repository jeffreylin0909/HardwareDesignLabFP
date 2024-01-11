module count_kill(
    input clk,
    input rst,
    input monster_dead_0,
    input monster_dead_1,
    input monster_dead_2,
    input monster_dead_3,
    output reg [3:0] kills
    );

    wire monster_dead_0_op,monster_dead_1_op,monster_dead_2_op,monster_dead_3_op;

    onepulse OP0(monster_dead_0, monster_dead_0_op, clk);
    onepulse OP1(monster_dead_1, monster_dead_1_op, clk);
    onepulse OP2(monster_dead_2, monster_dead_2_op, clk);
    onepulse OP3(monster_dead_3, monster_dead_3_op, clk);

    always@(posedge clk)begin
        if (rst)begin
            kills <= 0;
        end else begin
            kills <= kills+monster_dead_0_op+monster_dead_1_op+monster_dead_2_op+monster_dead_3_op;
        end
    end

endmodule