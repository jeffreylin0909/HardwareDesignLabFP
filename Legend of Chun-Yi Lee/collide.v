module collide(
    input [9:0] pos_h_1, pos_v_1,
    input [9:0] pos_h_2, pos_v_2,
    output reg collision
    );

    always @(*)begin
        if (pos_h_1 > pos_h_2)begin
            if (pos_v_1 > pos_v_2)begin
                collision = (pos_h_1-pos_h_2 <= 20)&&(pos_v_1-pos_v_2 <= 20);
            end else begin
                collision = (pos_h_1-pos_h_2 <= 20)&&(pos_v_2-pos_v_1 <= 20);
            end
        end else begin
            if (pos_v_1 > pos_v_2)begin
                collision = (pos_h_2-pos_h_1 <= 20)&&(pos_v_1-pos_v_2 <= 20);
            end else begin
                collision = (pos_h_2-pos_h_1 <= 20)&&(pos_v_2-pos_v_1 <= 20);
            end
        end
    end
endmodule