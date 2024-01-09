module RGB_GEN(
    input valid,
    input [9:0] v_cnt,
	input [11:0] pixel_CY,
	input [11:0] pixel_monster_1,
	input [11:0] pixel_computer_room_entrance_ins,
    input [11:0] pixel_heart_ins_0,
    input [11:0] pixel_heart_ins_1,
    input [11:0] pixel_heart_ins_2,
    input [11:0] pixel_G,
    input [11:0] pixel_A,
    input [11:0] pixel_M,
    input [11:0] pixel_E_1,
    input [11:0] pixel_O,
    input [11:0] pixel_V,
    input [11:0] pixel_E_2,
    input [11:0] pixel_R,
    input [11:0] pixel_weapon,
	input [11:0] pixel_wall_0,
    input [11:0] pixel_wall_1,
    input [11:0] pixel_wall_2,
    input [11:0] pixel_wall_3,
    input [11:0] pixel_wall_4,
    input [11:0] pixel_wall_5,
    input [11:0] pixel_wall_6,
    input [11:0] pixel_wall_7,
    input [11:0] pixel_wall_8,
    input [11:0] pixel_wall_9,
    input [11:0] pixel_wall_10,
    input [11:0] pixel_wall_11,
    input [11:0] pixel_wall_12,
    input [11:0] pixel_wall_13,
    input [11:0] pixel_wall_14,
    input [11:0] pixel_wall_15,
    input [11:0] pixel_wall_16,
    input [11:0] pixel_wall_17,
    input [11:0] pixel_wall_18,
    input [11:0] pixel_wall_19,
    input [11:0] pixel_wall_20,
    input [11:0] pixel_wall_21,
    input [11:0] pixel_wall_22,
    input [11:0] pixel_wall_23,
    input [11:0] pixel_wall_24,
    input [11:0] pixel_wall_25,
    input [11:0] pixel_wall_26,
    input [11:0] pixel_wall_27,
    input [11:0] pixel_wall_28,
    input [11:0] pixel_wall_29,
    input [11:0] pixel_wall_30,
    input [11:0] pixel_wall_31,
    input [11:0] pixel_wall_32,
    input [11:0] pixel_wall_33,
    input [11:0] pixel_wall_34,
    input [11:0] pixel_wall_35,
    input [11:0] pixel_wall_36,
    input [11:0] pixel_wall_37,
    input [11:0] pixel_wall_38,
    input [11:0] pixel_wall_39,
    input [11:0] pixel_wall_40,
    input [11:0] pixel_wall_41,
    input [11:0] pixel_wall_42,
    input [11:0] pixel_wall_43,
    input [11:0] pixel_wall_44,
    input [11:0] pixel_wall_45,
    input [11:0] pixel_wall_46,
    input [11:0] pixel_wall_47,
    input [11:0] pixel_wall_48,
    input [11:0] pixel_wall_49,
    input [11:0] pixel_wall_50,
    input [11:0] pixel_wall_51,
    input [11:0] pixel_wall_52,
    input [11:0] pixel_wall_53,
    input [11:0] pixel_wall_54,
    input [11:0] pixel_wall_55,
    input [11:0] pixel_wall_56,
    input [11:0] pixel_wall_57,
    input [11:0] pixel_wall_58,
    input [11:0] pixel_wall_59,
    
	output reg [11:0] RGB
	);

    always @(*) begin
        if (valid == 1'b1)begin
            if (pixel_CY+pixel_monster_1+pixel_computer_room_entrance_ins+pixel_heart_ins_0+pixel_heart_ins_1+pixel_heart_ins_2+pixel_weapon
                +pixel_G+pixel_A+pixel_M+pixel_E_1+pixel_O+pixel_V+pixel_E_2+pixel_R
                +pixel_wall_0
                +pixel_wall_1
                +pixel_wall_2
                +pixel_wall_3
                +pixel_wall_4
                +pixel_wall_5
                +pixel_wall_6
                +pixel_wall_7
                +pixel_wall_8
                +pixel_wall_9
                +pixel_wall_10
                +pixel_wall_11
                +pixel_wall_12
                +pixel_wall_13
                +pixel_wall_14
                +pixel_wall_15
                +pixel_wall_16
                +pixel_wall_17
                +pixel_wall_18
                +pixel_wall_19
                +pixel_wall_20
                +pixel_wall_21
                +pixel_wall_22
                +pixel_wall_23
                +pixel_wall_24
                +pixel_wall_25
                +pixel_wall_26
                +pixel_wall_27
                +pixel_wall_28
                +pixel_wall_29
                +pixel_wall_30
                +pixel_wall_31
                +pixel_wall_32
                +pixel_wall_33
                +pixel_wall_34
                +pixel_wall_35
                +pixel_wall_36
                +pixel_wall_37
                +pixel_wall_38
                +pixel_wall_39
                +pixel_wall_40
                +pixel_wall_41
                +pixel_wall_42
                +pixel_wall_43
                +pixel_wall_44
                +pixel_wall_45
                +pixel_wall_46
                +pixel_wall_47
                +pixel_wall_48
                +pixel_wall_49
                +pixel_wall_50
                +pixel_wall_51
                +pixel_wall_52
                +pixel_wall_53
                +pixel_wall_54
                +pixel_wall_55
                +pixel_wall_56
                +pixel_wall_57
                +pixel_wall_58
                +pixel_wall_59
                != 12'h0)begin
                if (pixel_computer_room_entrance_ins) begin
                    RGB = pixel_computer_room_entrance_ins;
                end else begin
                    if (pixel_CY+pixel_monster_1+pixel_heart_ins_0+pixel_heart_ins_1+pixel_heart_ins_2+pixel_weapon
                        +pixel_G+pixel_A+pixel_M+pixel_E_1+pixel_O+pixel_V+pixel_E_2+pixel_R)begin
                        RGB = pixel_CY+pixel_monster_1+pixel_heart_ins_0+pixel_heart_ins_1+pixel_heart_ins_2+pixel_weapon
                        +pixel_G+pixel_A+pixel_M+pixel_E_1+pixel_O+pixel_V+pixel_E_2+pixel_R;
                    end else begin
                        RGB = pixel_wall_0
                            +pixel_wall_1
                            +pixel_wall_2
                            +pixel_wall_3
                            +pixel_wall_4
                            +pixel_wall_5
                            +pixel_wall_6
                            +pixel_wall_7
                            +pixel_wall_8
                            +pixel_wall_9
                            +pixel_wall_10
                            +pixel_wall_11
                            +pixel_wall_12
                            +pixel_wall_13
                            +pixel_wall_14
                            +pixel_wall_15
                            +pixel_wall_16
                            +pixel_wall_17
                            +pixel_wall_18
                            +pixel_wall_19
                            +pixel_wall_20
                            +pixel_wall_21
                            +pixel_wall_22
                            +pixel_wall_23
                            +pixel_wall_24
                            +pixel_wall_25
                            +pixel_wall_26
                            +pixel_wall_27
                            +pixel_wall_28
                            +pixel_wall_29
                            +pixel_wall_30
                            +pixel_wall_31
                            +pixel_wall_32
                            +pixel_wall_33
                            +pixel_wall_34
                            +pixel_wall_35
                            +pixel_wall_36
                            +pixel_wall_37
                            +pixel_wall_38
                            +pixel_wall_39
                            +pixel_wall_40
                            +pixel_wall_41
                            +pixel_wall_42
                            +pixel_wall_43
                            +pixel_wall_44
                            +pixel_wall_45
                            +pixel_wall_46
                            +pixel_wall_47
                            +pixel_wall_48
                            +pixel_wall_49
                            +pixel_wall_50
                            +pixel_wall_51
                            +pixel_wall_52
                            +pixel_wall_53
                            +pixel_wall_54
                            +pixel_wall_55
                            +pixel_wall_56
                            +pixel_wall_57
                            +pixel_wall_58
                            +pixel_wall_59;
                    end
                end
            end else begin
                if (v_cnt < 20) begin
                    RGB = 12'h0;
                end else begin
                    RGB = 12'hFDA;
                end
            end
        end else begin
            RGB = 12'h0;
        end
    end

endmodule
