//detect if collide with wall
module wall(
    input [9:0] pos_h_CY, pos_v_CY,//detected sprite
    input [9:0] pos_h, pos_v,//wall coord
    output reg [3:0] collision//collision signal form 4 directions
    );

    always @(*)begin
        if (pos_v_CY < pos_v+20 && pos_v_CY > pos_v-20)begin
            if (pos_h_CY == pos_h+20 || pos_h_CY == pos_h+19 || pos_h_CY == pos_h+18 || pos_h_CY == pos_h+17) begin
                collision = 4'b0001;//>
            end else begin
                if (pos_h_CY+20 == pos_h || pos_h_CY+19 == pos_h || pos_h_CY+18 == pos_h || pos_h_CY+17 == pos_h) begin
                    collision = 4'b0010;//<
                end else begin
                    collision = 4'b0000;
                end
            end
        end else begin
            if (pos_h_CY < pos_h+20 && pos_h_CY > pos_h-20)begin
                if (pos_v_CY+20 == pos_v || pos_v_CY+19 == pos_v || pos_v_CY+18 == pos_v || pos_v_CY+17 == pos_v) begin
                    collision = 4'b0100;//^
                end else begin
                    if (pos_v_CY == pos_v+20 || pos_v_CY == pos_v+19 || pos_v_CY == pos_v+18 || pos_v_CY == pos_v+17) begin
                        collision = 4'b1000;//v
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