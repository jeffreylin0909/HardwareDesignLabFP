-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Thu Jan 11 16:29:54 2024
-- Host        : DESKTOP-Q29MBHF running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim {C:/verilog project/Legend of Chun-Yi Lee/Legend of Chun-Yi
--               Lee.srcs/sources_1/ip/BM_CY_back_walk_L/BM_CY_back_walk_L_sim_netlist.vhdl}
-- Design      : BM_CY_back_walk_L
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity BM_CY_back_walk_L_blk_mem_gen_prim_wrapper_init is
  port (
    douta : out STD_LOGIC_VECTOR ( 11 downto 0 );
    clka : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 8 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 11 downto 0 );
    wea : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of BM_CY_back_walk_L_blk_mem_gen_prim_wrapper_init : entity is "blk_mem_gen_prim_wrapper_init";
end BM_CY_back_walk_L_blk_mem_gen_prim_wrapper_init;

architecture STRUCTURE of BM_CY_back_walk_L_blk_mem_gen_prim_wrapper_init is
  signal \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_0\ : STD_LOGIC;
  signal \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_1\ : STD_LOGIC;
  signal \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_10\ : STD_LOGIC;
  signal \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_11\ : STD_LOGIC;
  signal \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_12\ : STD_LOGIC;
  signal \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_16\ : STD_LOGIC;
  signal \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_17\ : STD_LOGIC;
  signal \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_18\ : STD_LOGIC;
  signal \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_19\ : STD_LOGIC;
  signal \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_2\ : STD_LOGIC;
  signal \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_20\ : STD_LOGIC;
  signal \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_24\ : STD_LOGIC;
  signal \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_25\ : STD_LOGIC;
  signal \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_26\ : STD_LOGIC;
  signal \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_27\ : STD_LOGIC;
  signal \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_28\ : STD_LOGIC;
  signal \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_3\ : STD_LOGIC;
  signal \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_32\ : STD_LOGIC;
  signal \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_33\ : STD_LOGIC;
  signal \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_34\ : STD_LOGIC;
  signal \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_35\ : STD_LOGIC;
  signal \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_4\ : STD_LOGIC;
  signal \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_8\ : STD_LOGIC;
  signal \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_9\ : STD_LOGIC;
  attribute box_type : string;
  attribute box_type of \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram\ : label is "PRIMITIVE";
begin
\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram\: unisim.vcomponents.RAMB18E1
    generic map(
      DOA_REG => 1,
      DOB_REG => 1,
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0003000000030000000300000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000030000000300000003000000030000000300000003000000030000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0003000000030000000300000003000000030000000300000003000000030000",
      INIT_04 => X"0000000000000000000000000000000000030000000300000003000000030000",
      INIT_05 => X"0003000000030000000300000003000000030000000000000000000000000000",
      INIT_06 => X"0003000000030000000300000003000000030000000300000003000000030000",
      INIT_07 => X"0004020100000000000000000000000000000000000000000000000000030000",
      INIT_08 => X"0003000000030000000300000003000000030000000300000003000000030000",
      INIT_09 => X"0000000000000000000000000004020100030000000300000003000000030000",
      INIT_0A => X"0003000000030000000402010004020100040201070204030702040300000000",
      INIT_0B => X"0004020100040201000300000003000000030000000300000003000000030000",
      INIT_0C => X"0702040307020403070204030000000000000000070204030702040300040201",
      INIT_0D => X"0003000000030000000300000003000000040201000402010004020100040201",
      INIT_0E => X"0000000007020403070204030702040300040201000402010004020100040201",
      INIT_0F => X"0004020100040201000402010702040307020403070204030000000000000000",
      INIT_10 => X"0702040300040201000402010004020100040201000300000003000000040201",
      INIT_11 => X"0003000000000000000000000000000000000000000000000702040307020403",
      INIT_12 => X"0004020100040201000402010004020100040201000300000003000000030000",
      INIT_13 => X"0000000000000000000000000003000000030000000300000003000000040201",
      INIT_14 => X"0003000000030000000300000003000000030000000000000000000000000000",
      INIT_15 => X"0003000000030000000300000003000000030000000300000003000000030000",
      INIT_16 => X"0003000000000000000000000000000000000000000000000000000000030000",
      INIT_17 => X"0405020004050200040502000405020000030000000300000003000004050200",
      INIT_18 => X"0405020004050200040502000405020000030000000300000003000000030000",
      INIT_19 => X"0405020000030000040502000405020004050200000000000000000000000000",
      INIT_1A => X"0405020000030000000300000405020004050200000300000003000004050200",
      INIT_1B => X"0405020004050200000000000000000004050200040502000405020004050200",
      INIT_1C => X"0003000000030000000300000003000000030000000300000405020004050200",
      INIT_1D => X"0405020007070200040502000405020004050200000300000003000000030000",
      INIT_1E => X"0003000004050200000300000405020004050200040502000000000000000000",
      INIT_1F => X"0405020004050200040502000003000000030000000300000003000000030000",
      INIT_20 => X"0702040300000000000000000000000004050200040502000702040304050200",
      INIT_21 => X"0405020004050200040502000405020004050200040502000003000004050200",
      INIT_22 => X"0405020004050200040502000702040304050200000300000405020004050200",
      INIT_23 => X"0003000000030000000300000003000000000000000000000000000000000000",
      INIT_24 => X"0003000000030000000300000003000004050200040502000405020004050200",
      INIT_25 => X"0000000000000000000000000000000000000000040502000405020004050200",
      INIT_26 => X"0003000000030000000300000003000000030000000300000003000000030000",
      INIT_27 => X"0000000000000000000000000000000000030000000300000003000000030000",
      INIT_28 => X"0003000000030000040502000405020000000000000000000000000000000000",
      INIT_29 => X"0405020004050200000300000003000000030000000300000003000000030000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000405020004050200040502000405020004050200",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0405020004050200040502000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000004050200",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"00000",
      INIT_B => X"00000",
      INIT_FILE => "NONE",
      IS_CLKARDCLK_INVERTED => '0',
      IS_CLKBWRCLK_INVERTED => '0',
      IS_ENARDEN_INVERTED => '0',
      IS_ENBWREN_INVERTED => '0',
      IS_RSTRAMARSTRAM_INVERTED => '0',
      IS_RSTRAMB_INVERTED => '0',
      IS_RSTREGARSTREG_INVERTED => '0',
      IS_RSTREGB_INVERTED => '0',
      RAM_MODE => "TDP",
      RDADDR_COLLISION_HWCONFIG => "PERFORMANCE",
      READ_WIDTH_A => 18,
      READ_WIDTH_B => 18,
      RSTREG_PRIORITY_A => "REGCE",
      RSTREG_PRIORITY_B => "REGCE",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "7SERIES",
      SRVAL_A => X"00000",
      SRVAL_B => X"00000",
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 18,
      WRITE_WIDTH_B => 18
    )
        port map (
      ADDRARDADDR(13 downto 5) => addra(8 downto 0),
      ADDRARDADDR(4 downto 0) => B"00000",
      ADDRBWRADDR(13 downto 5) => addra(8 downto 0),
      ADDRBWRADDR(4 downto 0) => B"10000",
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DIADI(15 downto 11) => B"00000",
      DIADI(10 downto 8) => dina(5 downto 3),
      DIADI(7 downto 3) => B"00000",
      DIADI(2 downto 0) => dina(2 downto 0),
      DIBDI(15 downto 11) => B"00000",
      DIBDI(10 downto 8) => dina(11 downto 9),
      DIBDI(7 downto 3) => B"00000",
      DIBDI(2 downto 0) => dina(8 downto 6),
      DIPADIP(1 downto 0) => B"00",
      DIPBDIP(1 downto 0) => B"00",
      DOADO(15) => \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_0\,
      DOADO(14) => \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_1\,
      DOADO(13) => \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_2\,
      DOADO(12) => \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_3\,
      DOADO(11) => \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_4\,
      DOADO(10 downto 8) => douta(5 downto 3),
      DOADO(7) => \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_8\,
      DOADO(6) => \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_9\,
      DOADO(5) => \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_10\,
      DOADO(4) => \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_11\,
      DOADO(3) => \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_12\,
      DOADO(2 downto 0) => douta(2 downto 0),
      DOBDO(15) => \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_16\,
      DOBDO(14) => \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_17\,
      DOBDO(13) => \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_18\,
      DOBDO(12) => \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_19\,
      DOBDO(11) => \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_20\,
      DOBDO(10 downto 8) => douta(11 downto 9),
      DOBDO(7) => \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_24\,
      DOBDO(6) => \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_25\,
      DOBDO(5) => \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_26\,
      DOBDO(4) => \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_27\,
      DOBDO(3) => \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_28\,
      DOBDO(2 downto 0) => douta(8 downto 6),
      DOPADOP(1) => \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_32\,
      DOPADOP(0) => \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_33\,
      DOPBDOP(1) => \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_34\,
      DOPBDOP(0) => \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_35\,
      ENARDEN => '1',
      ENBWREN => '1',
      REGCEAREGCE => '1',
      REGCEB => '1',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      WEA(1) => wea(0),
      WEA(0) => wea(0),
      WEBWE(3 downto 2) => B"00",
      WEBWE(1) => wea(0),
      WEBWE(0) => wea(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity BM_CY_back_walk_L_blk_mem_gen_prim_width is
  port (
    douta : out STD_LOGIC_VECTOR ( 11 downto 0 );
    clka : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 8 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 11 downto 0 );
    wea : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of BM_CY_back_walk_L_blk_mem_gen_prim_width : entity is "blk_mem_gen_prim_width";
end BM_CY_back_walk_L_blk_mem_gen_prim_width;

architecture STRUCTURE of BM_CY_back_walk_L_blk_mem_gen_prim_width is
begin
\prim_init.ram\: entity work.BM_CY_back_walk_L_blk_mem_gen_prim_wrapper_init
     port map (
      addra(8 downto 0) => addra(8 downto 0),
      clka => clka,
      dina(11 downto 0) => dina(11 downto 0),
      douta(11 downto 0) => douta(11 downto 0),
      wea(0) => wea(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity BM_CY_back_walk_L_blk_mem_gen_generic_cstr is
  port (
    douta : out STD_LOGIC_VECTOR ( 11 downto 0 );
    clka : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 8 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 11 downto 0 );
    wea : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of BM_CY_back_walk_L_blk_mem_gen_generic_cstr : entity is "blk_mem_gen_generic_cstr";
end BM_CY_back_walk_L_blk_mem_gen_generic_cstr;

architecture STRUCTURE of BM_CY_back_walk_L_blk_mem_gen_generic_cstr is
begin
\ramloop[0].ram.r\: entity work.BM_CY_back_walk_L_blk_mem_gen_prim_width
     port map (
      addra(8 downto 0) => addra(8 downto 0),
      clka => clka,
      dina(11 downto 0) => dina(11 downto 0),
      douta(11 downto 0) => douta(11 downto 0),
      wea(0) => wea(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity BM_CY_back_walk_L_blk_mem_gen_top is
  port (
    douta : out STD_LOGIC_VECTOR ( 11 downto 0 );
    clka : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 8 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 11 downto 0 );
    wea : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of BM_CY_back_walk_L_blk_mem_gen_top : entity is "blk_mem_gen_top";
end BM_CY_back_walk_L_blk_mem_gen_top;

architecture STRUCTURE of BM_CY_back_walk_L_blk_mem_gen_top is
begin
\valid.cstr\: entity work.BM_CY_back_walk_L_blk_mem_gen_generic_cstr
     port map (
      addra(8 downto 0) => addra(8 downto 0),
      clka => clka,
      dina(11 downto 0) => dina(11 downto 0),
      douta(11 downto 0) => douta(11 downto 0),
      wea(0) => wea(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity BM_CY_back_walk_L_blk_mem_gen_v8_4_4_synth is
  port (
    douta : out STD_LOGIC_VECTOR ( 11 downto 0 );
    clka : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 8 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 11 downto 0 );
    wea : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of BM_CY_back_walk_L_blk_mem_gen_v8_4_4_synth : entity is "blk_mem_gen_v8_4_4_synth";
end BM_CY_back_walk_L_blk_mem_gen_v8_4_4_synth;

architecture STRUCTURE of BM_CY_back_walk_L_blk_mem_gen_v8_4_4_synth is
begin
\gnbram.gnativebmg.native_blk_mem_gen\: entity work.BM_CY_back_walk_L_blk_mem_gen_top
     port map (
      addra(8 downto 0) => addra(8 downto 0),
      clka => clka,
      dina(11 downto 0) => dina(11 downto 0),
      douta(11 downto 0) => douta(11 downto 0),
      wea(0) => wea(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity BM_CY_back_walk_L_blk_mem_gen_v8_4_4 is
  port (
    clka : in STD_LOGIC;
    rsta : in STD_LOGIC;
    ena : in STD_LOGIC;
    regcea : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 8 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 11 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 11 downto 0 );
    clkb : in STD_LOGIC;
    rstb : in STD_LOGIC;
    enb : in STD_LOGIC;
    regceb : in STD_LOGIC;
    web : in STD_LOGIC_VECTOR ( 0 to 0 );
    addrb : in STD_LOGIC_VECTOR ( 8 downto 0 );
    dinb : in STD_LOGIC_VECTOR ( 11 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 11 downto 0 );
    injectsbiterr : in STD_LOGIC;
    injectdbiterr : in STD_LOGIC;
    eccpipece : in STD_LOGIC;
    sbiterr : out STD_LOGIC;
    dbiterr : out STD_LOGIC;
    rdaddrecc : out STD_LOGIC_VECTOR ( 8 downto 0 );
    sleep : in STD_LOGIC;
    deepsleep : in STD_LOGIC;
    shutdown : in STD_LOGIC;
    rsta_busy : out STD_LOGIC;
    rstb_busy : out STD_LOGIC;
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    s_axi_injectsbiterr : in STD_LOGIC;
    s_axi_injectdbiterr : in STD_LOGIC;
    s_axi_sbiterr : out STD_LOGIC;
    s_axi_dbiterr : out STD_LOGIC;
    s_axi_rdaddrecc : out STD_LOGIC_VECTOR ( 8 downto 0 )
  );
  attribute C_ADDRA_WIDTH : integer;
  attribute C_ADDRA_WIDTH of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 9;
  attribute C_ADDRB_WIDTH : integer;
  attribute C_ADDRB_WIDTH of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 9;
  attribute C_ALGORITHM : integer;
  attribute C_ALGORITHM of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 1;
  attribute C_AXI_ID_WIDTH : integer;
  attribute C_AXI_ID_WIDTH of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 4;
  attribute C_AXI_SLAVE_TYPE : integer;
  attribute C_AXI_SLAVE_TYPE of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 0;
  attribute C_AXI_TYPE : integer;
  attribute C_AXI_TYPE of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 1;
  attribute C_BYTE_SIZE : integer;
  attribute C_BYTE_SIZE of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 9;
  attribute C_COMMON_CLK : integer;
  attribute C_COMMON_CLK of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 0;
  attribute C_COUNT_18K_BRAM : string;
  attribute C_COUNT_18K_BRAM of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is "1";
  attribute C_COUNT_36K_BRAM : string;
  attribute C_COUNT_36K_BRAM of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is "0";
  attribute C_CTRL_ECC_ALGO : string;
  attribute C_CTRL_ECC_ALGO of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is "NONE";
  attribute C_DEFAULT_DATA : string;
  attribute C_DEFAULT_DATA of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is "0";
  attribute C_DISABLE_WARN_BHV_COLL : integer;
  attribute C_DISABLE_WARN_BHV_COLL of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 0;
  attribute C_DISABLE_WARN_BHV_RANGE : integer;
  attribute C_DISABLE_WARN_BHV_RANGE of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 0;
  attribute C_ELABORATION_DIR : string;
  attribute C_ELABORATION_DIR of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is "./";
  attribute C_ENABLE_32BIT_ADDRESS : integer;
  attribute C_ENABLE_32BIT_ADDRESS of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 0;
  attribute C_EN_DEEPSLEEP_PIN : integer;
  attribute C_EN_DEEPSLEEP_PIN of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 0;
  attribute C_EN_ECC_PIPE : integer;
  attribute C_EN_ECC_PIPE of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 0;
  attribute C_EN_RDADDRA_CHG : integer;
  attribute C_EN_RDADDRA_CHG of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 0;
  attribute C_EN_RDADDRB_CHG : integer;
  attribute C_EN_RDADDRB_CHG of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 0;
  attribute C_EN_SAFETY_CKT : integer;
  attribute C_EN_SAFETY_CKT of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 0;
  attribute C_EN_SHUTDOWN_PIN : integer;
  attribute C_EN_SHUTDOWN_PIN of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 0;
  attribute C_EN_SLEEP_PIN : integer;
  attribute C_EN_SLEEP_PIN of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 0;
  attribute C_EST_POWER_SUMMARY : string;
  attribute C_EST_POWER_SUMMARY of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is "Estimated Power for IP     :     2.70645 mW";
  attribute C_FAMILY : string;
  attribute C_FAMILY of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is "artix7";
  attribute C_HAS_AXI_ID : integer;
  attribute C_HAS_AXI_ID of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 0;
  attribute C_HAS_ENA : integer;
  attribute C_HAS_ENA of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 0;
  attribute C_HAS_ENB : integer;
  attribute C_HAS_ENB of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 0;
  attribute C_HAS_INJECTERR : integer;
  attribute C_HAS_INJECTERR of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 0;
  attribute C_HAS_MEM_OUTPUT_REGS_A : integer;
  attribute C_HAS_MEM_OUTPUT_REGS_A of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 1;
  attribute C_HAS_MEM_OUTPUT_REGS_B : integer;
  attribute C_HAS_MEM_OUTPUT_REGS_B of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 0;
  attribute C_HAS_MUX_OUTPUT_REGS_A : integer;
  attribute C_HAS_MUX_OUTPUT_REGS_A of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 0;
  attribute C_HAS_MUX_OUTPUT_REGS_B : integer;
  attribute C_HAS_MUX_OUTPUT_REGS_B of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 0;
  attribute C_HAS_REGCEA : integer;
  attribute C_HAS_REGCEA of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 0;
  attribute C_HAS_REGCEB : integer;
  attribute C_HAS_REGCEB of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 0;
  attribute C_HAS_RSTA : integer;
  attribute C_HAS_RSTA of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 0;
  attribute C_HAS_RSTB : integer;
  attribute C_HAS_RSTB of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 0;
  attribute C_HAS_SOFTECC_INPUT_REGS_A : integer;
  attribute C_HAS_SOFTECC_INPUT_REGS_A of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 0;
  attribute C_HAS_SOFTECC_OUTPUT_REGS_B : integer;
  attribute C_HAS_SOFTECC_OUTPUT_REGS_B of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 0;
  attribute C_INITA_VAL : string;
  attribute C_INITA_VAL of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is "0";
  attribute C_INITB_VAL : string;
  attribute C_INITB_VAL of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is "0";
  attribute C_INIT_FILE : string;
  attribute C_INIT_FILE of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is "BM_CY_back_walk_L.mem";
  attribute C_INIT_FILE_NAME : string;
  attribute C_INIT_FILE_NAME of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is "BM_CY_back_walk_L.mif";
  attribute C_INTERFACE_TYPE : integer;
  attribute C_INTERFACE_TYPE of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 0;
  attribute C_LOAD_INIT_FILE : integer;
  attribute C_LOAD_INIT_FILE of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 1;
  attribute C_MEM_TYPE : integer;
  attribute C_MEM_TYPE of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 0;
  attribute C_MUX_PIPELINE_STAGES : integer;
  attribute C_MUX_PIPELINE_STAGES of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 0;
  attribute C_PRIM_TYPE : integer;
  attribute C_PRIM_TYPE of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 1;
  attribute C_READ_DEPTH_A : integer;
  attribute C_READ_DEPTH_A of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 400;
  attribute C_READ_DEPTH_B : integer;
  attribute C_READ_DEPTH_B of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 400;
  attribute C_READ_LATENCY_A : integer;
  attribute C_READ_LATENCY_A of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 1;
  attribute C_READ_LATENCY_B : integer;
  attribute C_READ_LATENCY_B of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 1;
  attribute C_READ_WIDTH_A : integer;
  attribute C_READ_WIDTH_A of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 12;
  attribute C_READ_WIDTH_B : integer;
  attribute C_READ_WIDTH_B of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 12;
  attribute C_RSTRAM_A : integer;
  attribute C_RSTRAM_A of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 0;
  attribute C_RSTRAM_B : integer;
  attribute C_RSTRAM_B of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 0;
  attribute C_RST_PRIORITY_A : string;
  attribute C_RST_PRIORITY_A of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is "CE";
  attribute C_RST_PRIORITY_B : string;
  attribute C_RST_PRIORITY_B of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is "CE";
  attribute C_SIM_COLLISION_CHECK : string;
  attribute C_SIM_COLLISION_CHECK of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is "ALL";
  attribute C_USE_BRAM_BLOCK : integer;
  attribute C_USE_BRAM_BLOCK of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 0;
  attribute C_USE_BYTE_WEA : integer;
  attribute C_USE_BYTE_WEA of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 0;
  attribute C_USE_BYTE_WEB : integer;
  attribute C_USE_BYTE_WEB of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 0;
  attribute C_USE_DEFAULT_DATA : integer;
  attribute C_USE_DEFAULT_DATA of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 0;
  attribute C_USE_ECC : integer;
  attribute C_USE_ECC of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 0;
  attribute C_USE_SOFTECC : integer;
  attribute C_USE_SOFTECC of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 0;
  attribute C_USE_URAM : integer;
  attribute C_USE_URAM of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 0;
  attribute C_WEA_WIDTH : integer;
  attribute C_WEA_WIDTH of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 1;
  attribute C_WEB_WIDTH : integer;
  attribute C_WEB_WIDTH of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 1;
  attribute C_WRITE_DEPTH_A : integer;
  attribute C_WRITE_DEPTH_A of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 400;
  attribute C_WRITE_DEPTH_B : integer;
  attribute C_WRITE_DEPTH_B of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 400;
  attribute C_WRITE_MODE_A : string;
  attribute C_WRITE_MODE_A of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is "WRITE_FIRST";
  attribute C_WRITE_MODE_B : string;
  attribute C_WRITE_MODE_B of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is "WRITE_FIRST";
  attribute C_WRITE_WIDTH_A : integer;
  attribute C_WRITE_WIDTH_A of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 12;
  attribute C_WRITE_WIDTH_B : integer;
  attribute C_WRITE_WIDTH_B of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is 12;
  attribute C_XDEVICEFAMILY : string;
  attribute C_XDEVICEFAMILY of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is "artix7";
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is "blk_mem_gen_v8_4_4";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 : entity is "yes";
end BM_CY_back_walk_L_blk_mem_gen_v8_4_4;

architecture STRUCTURE of BM_CY_back_walk_L_blk_mem_gen_v8_4_4 is
  signal \<const0>\ : STD_LOGIC;
begin
  dbiterr <= \<const0>\;
  doutb(11) <= \<const0>\;
  doutb(10) <= \<const0>\;
  doutb(9) <= \<const0>\;
  doutb(8) <= \<const0>\;
  doutb(7) <= \<const0>\;
  doutb(6) <= \<const0>\;
  doutb(5) <= \<const0>\;
  doutb(4) <= \<const0>\;
  doutb(3) <= \<const0>\;
  doutb(2) <= \<const0>\;
  doutb(1) <= \<const0>\;
  doutb(0) <= \<const0>\;
  rdaddrecc(8) <= \<const0>\;
  rdaddrecc(7) <= \<const0>\;
  rdaddrecc(6) <= \<const0>\;
  rdaddrecc(5) <= \<const0>\;
  rdaddrecc(4) <= \<const0>\;
  rdaddrecc(3) <= \<const0>\;
  rdaddrecc(2) <= \<const0>\;
  rdaddrecc(1) <= \<const0>\;
  rdaddrecc(0) <= \<const0>\;
  rsta_busy <= \<const0>\;
  rstb_busy <= \<const0>\;
  s_axi_arready <= \<const0>\;
  s_axi_awready <= \<const0>\;
  s_axi_bid(3) <= \<const0>\;
  s_axi_bid(2) <= \<const0>\;
  s_axi_bid(1) <= \<const0>\;
  s_axi_bid(0) <= \<const0>\;
  s_axi_bresp(1) <= \<const0>\;
  s_axi_bresp(0) <= \<const0>\;
  s_axi_bvalid <= \<const0>\;
  s_axi_dbiterr <= \<const0>\;
  s_axi_rdaddrecc(8) <= \<const0>\;
  s_axi_rdaddrecc(7) <= \<const0>\;
  s_axi_rdaddrecc(6) <= \<const0>\;
  s_axi_rdaddrecc(5) <= \<const0>\;
  s_axi_rdaddrecc(4) <= \<const0>\;
  s_axi_rdaddrecc(3) <= \<const0>\;
  s_axi_rdaddrecc(2) <= \<const0>\;
  s_axi_rdaddrecc(1) <= \<const0>\;
  s_axi_rdaddrecc(0) <= \<const0>\;
  s_axi_rdata(11) <= \<const0>\;
  s_axi_rdata(10) <= \<const0>\;
  s_axi_rdata(9) <= \<const0>\;
  s_axi_rdata(8) <= \<const0>\;
  s_axi_rdata(7) <= \<const0>\;
  s_axi_rdata(6) <= \<const0>\;
  s_axi_rdata(5) <= \<const0>\;
  s_axi_rdata(4) <= \<const0>\;
  s_axi_rdata(3) <= \<const0>\;
  s_axi_rdata(2) <= \<const0>\;
  s_axi_rdata(1) <= \<const0>\;
  s_axi_rdata(0) <= \<const0>\;
  s_axi_rid(3) <= \<const0>\;
  s_axi_rid(2) <= \<const0>\;
  s_axi_rid(1) <= \<const0>\;
  s_axi_rid(0) <= \<const0>\;
  s_axi_rlast <= \<const0>\;
  s_axi_rresp(1) <= \<const0>\;
  s_axi_rresp(0) <= \<const0>\;
  s_axi_rvalid <= \<const0>\;
  s_axi_sbiterr <= \<const0>\;
  s_axi_wready <= \<const0>\;
  sbiterr <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst_blk_mem_gen: entity work.BM_CY_back_walk_L_blk_mem_gen_v8_4_4_synth
     port map (
      addra(8 downto 0) => addra(8 downto 0),
      clka => clka,
      dina(11 downto 0) => dina(11 downto 0),
      douta(11 downto 0) => douta(11 downto 0),
      wea(0) => wea(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity BM_CY_back_walk_L is
  port (
    clka : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 8 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 11 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of BM_CY_back_walk_L : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of BM_CY_back_walk_L : entity is "BM_CY_back_walk_L,blk_mem_gen_v8_4_4,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of BM_CY_back_walk_L : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of BM_CY_back_walk_L : entity is "blk_mem_gen_v8_4_4,Vivado 2019.2";
end BM_CY_back_walk_L;

architecture STRUCTURE of BM_CY_back_walk_L is
  signal NLW_U0_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_rsta_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_rstb_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_arready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_awready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_bvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_rlast_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_rvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_wready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_doutb_UNCONNECTED : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal NLW_U0_rdaddrecc_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal NLW_U0_s_axi_bid_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_s_axi_bresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_s_axi_rdaddrecc_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal NLW_U0_s_axi_rdata_UNCONNECTED : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal NLW_U0_s_axi_rid_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_s_axi_rresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute C_ADDRA_WIDTH : integer;
  attribute C_ADDRA_WIDTH of U0 : label is 9;
  attribute C_ADDRB_WIDTH : integer;
  attribute C_ADDRB_WIDTH of U0 : label is 9;
  attribute C_ALGORITHM : integer;
  attribute C_ALGORITHM of U0 : label is 1;
  attribute C_AXI_ID_WIDTH : integer;
  attribute C_AXI_ID_WIDTH of U0 : label is 4;
  attribute C_AXI_SLAVE_TYPE : integer;
  attribute C_AXI_SLAVE_TYPE of U0 : label is 0;
  attribute C_AXI_TYPE : integer;
  attribute C_AXI_TYPE of U0 : label is 1;
  attribute C_BYTE_SIZE : integer;
  attribute C_BYTE_SIZE of U0 : label is 9;
  attribute C_COMMON_CLK : integer;
  attribute C_COMMON_CLK of U0 : label is 0;
  attribute C_COUNT_18K_BRAM : string;
  attribute C_COUNT_18K_BRAM of U0 : label is "1";
  attribute C_COUNT_36K_BRAM : string;
  attribute C_COUNT_36K_BRAM of U0 : label is "0";
  attribute C_CTRL_ECC_ALGO : string;
  attribute C_CTRL_ECC_ALGO of U0 : label is "NONE";
  attribute C_DEFAULT_DATA : string;
  attribute C_DEFAULT_DATA of U0 : label is "0";
  attribute C_DISABLE_WARN_BHV_COLL : integer;
  attribute C_DISABLE_WARN_BHV_COLL of U0 : label is 0;
  attribute C_DISABLE_WARN_BHV_RANGE : integer;
  attribute C_DISABLE_WARN_BHV_RANGE of U0 : label is 0;
  attribute C_ELABORATION_DIR : string;
  attribute C_ELABORATION_DIR of U0 : label is "./";
  attribute C_ENABLE_32BIT_ADDRESS : integer;
  attribute C_ENABLE_32BIT_ADDRESS of U0 : label is 0;
  attribute C_EN_DEEPSLEEP_PIN : integer;
  attribute C_EN_DEEPSLEEP_PIN of U0 : label is 0;
  attribute C_EN_ECC_PIPE : integer;
  attribute C_EN_ECC_PIPE of U0 : label is 0;
  attribute C_EN_RDADDRA_CHG : integer;
  attribute C_EN_RDADDRA_CHG of U0 : label is 0;
  attribute C_EN_RDADDRB_CHG : integer;
  attribute C_EN_RDADDRB_CHG of U0 : label is 0;
  attribute C_EN_SAFETY_CKT : integer;
  attribute C_EN_SAFETY_CKT of U0 : label is 0;
  attribute C_EN_SHUTDOWN_PIN : integer;
  attribute C_EN_SHUTDOWN_PIN of U0 : label is 0;
  attribute C_EN_SLEEP_PIN : integer;
  attribute C_EN_SLEEP_PIN of U0 : label is 0;
  attribute C_EST_POWER_SUMMARY : string;
  attribute C_EST_POWER_SUMMARY of U0 : label is "Estimated Power for IP     :     2.70645 mW";
  attribute C_FAMILY : string;
  attribute C_FAMILY of U0 : label is "artix7";
  attribute C_HAS_AXI_ID : integer;
  attribute C_HAS_AXI_ID of U0 : label is 0;
  attribute C_HAS_ENA : integer;
  attribute C_HAS_ENA of U0 : label is 0;
  attribute C_HAS_ENB : integer;
  attribute C_HAS_ENB of U0 : label is 0;
  attribute C_HAS_INJECTERR : integer;
  attribute C_HAS_INJECTERR of U0 : label is 0;
  attribute C_HAS_MEM_OUTPUT_REGS_A : integer;
  attribute C_HAS_MEM_OUTPUT_REGS_A of U0 : label is 1;
  attribute C_HAS_MEM_OUTPUT_REGS_B : integer;
  attribute C_HAS_MEM_OUTPUT_REGS_B of U0 : label is 0;
  attribute C_HAS_MUX_OUTPUT_REGS_A : integer;
  attribute C_HAS_MUX_OUTPUT_REGS_A of U0 : label is 0;
  attribute C_HAS_MUX_OUTPUT_REGS_B : integer;
  attribute C_HAS_MUX_OUTPUT_REGS_B of U0 : label is 0;
  attribute C_HAS_REGCEA : integer;
  attribute C_HAS_REGCEA of U0 : label is 0;
  attribute C_HAS_REGCEB : integer;
  attribute C_HAS_REGCEB of U0 : label is 0;
  attribute C_HAS_RSTA : integer;
  attribute C_HAS_RSTA of U0 : label is 0;
  attribute C_HAS_RSTB : integer;
  attribute C_HAS_RSTB of U0 : label is 0;
  attribute C_HAS_SOFTECC_INPUT_REGS_A : integer;
  attribute C_HAS_SOFTECC_INPUT_REGS_A of U0 : label is 0;
  attribute C_HAS_SOFTECC_OUTPUT_REGS_B : integer;
  attribute C_HAS_SOFTECC_OUTPUT_REGS_B of U0 : label is 0;
  attribute C_INITA_VAL : string;
  attribute C_INITA_VAL of U0 : label is "0";
  attribute C_INITB_VAL : string;
  attribute C_INITB_VAL of U0 : label is "0";
  attribute C_INIT_FILE : string;
  attribute C_INIT_FILE of U0 : label is "BM_CY_back_walk_L.mem";
  attribute C_INIT_FILE_NAME : string;
  attribute C_INIT_FILE_NAME of U0 : label is "BM_CY_back_walk_L.mif";
  attribute C_INTERFACE_TYPE : integer;
  attribute C_INTERFACE_TYPE of U0 : label is 0;
  attribute C_LOAD_INIT_FILE : integer;
  attribute C_LOAD_INIT_FILE of U0 : label is 1;
  attribute C_MEM_TYPE : integer;
  attribute C_MEM_TYPE of U0 : label is 0;
  attribute C_MUX_PIPELINE_STAGES : integer;
  attribute C_MUX_PIPELINE_STAGES of U0 : label is 0;
  attribute C_PRIM_TYPE : integer;
  attribute C_PRIM_TYPE of U0 : label is 1;
  attribute C_READ_DEPTH_A : integer;
  attribute C_READ_DEPTH_A of U0 : label is 400;
  attribute C_READ_DEPTH_B : integer;
  attribute C_READ_DEPTH_B of U0 : label is 400;
  attribute C_READ_LATENCY_A : integer;
  attribute C_READ_LATENCY_A of U0 : label is 1;
  attribute C_READ_LATENCY_B : integer;
  attribute C_READ_LATENCY_B of U0 : label is 1;
  attribute C_READ_WIDTH_A : integer;
  attribute C_READ_WIDTH_A of U0 : label is 12;
  attribute C_READ_WIDTH_B : integer;
  attribute C_READ_WIDTH_B of U0 : label is 12;
  attribute C_RSTRAM_A : integer;
  attribute C_RSTRAM_A of U0 : label is 0;
  attribute C_RSTRAM_B : integer;
  attribute C_RSTRAM_B of U0 : label is 0;
  attribute C_RST_PRIORITY_A : string;
  attribute C_RST_PRIORITY_A of U0 : label is "CE";
  attribute C_RST_PRIORITY_B : string;
  attribute C_RST_PRIORITY_B of U0 : label is "CE";
  attribute C_SIM_COLLISION_CHECK : string;
  attribute C_SIM_COLLISION_CHECK of U0 : label is "ALL";
  attribute C_USE_BRAM_BLOCK : integer;
  attribute C_USE_BRAM_BLOCK of U0 : label is 0;
  attribute C_USE_BYTE_WEA : integer;
  attribute C_USE_BYTE_WEA of U0 : label is 0;
  attribute C_USE_BYTE_WEB : integer;
  attribute C_USE_BYTE_WEB of U0 : label is 0;
  attribute C_USE_DEFAULT_DATA : integer;
  attribute C_USE_DEFAULT_DATA of U0 : label is 0;
  attribute C_USE_ECC : integer;
  attribute C_USE_ECC of U0 : label is 0;
  attribute C_USE_SOFTECC : integer;
  attribute C_USE_SOFTECC of U0 : label is 0;
  attribute C_USE_URAM : integer;
  attribute C_USE_URAM of U0 : label is 0;
  attribute C_WEA_WIDTH : integer;
  attribute C_WEA_WIDTH of U0 : label is 1;
  attribute C_WEB_WIDTH : integer;
  attribute C_WEB_WIDTH of U0 : label is 1;
  attribute C_WRITE_DEPTH_A : integer;
  attribute C_WRITE_DEPTH_A of U0 : label is 400;
  attribute C_WRITE_DEPTH_B : integer;
  attribute C_WRITE_DEPTH_B of U0 : label is 400;
  attribute C_WRITE_MODE_A : string;
  attribute C_WRITE_MODE_A of U0 : label is "WRITE_FIRST";
  attribute C_WRITE_MODE_B : string;
  attribute C_WRITE_MODE_B of U0 : label is "WRITE_FIRST";
  attribute C_WRITE_WIDTH_A : integer;
  attribute C_WRITE_WIDTH_A of U0 : label is 12;
  attribute C_WRITE_WIDTH_B : integer;
  attribute C_WRITE_WIDTH_B of U0 : label is 12;
  attribute C_XDEVICEFAMILY : string;
  attribute C_XDEVICEFAMILY of U0 : label is "artix7";
  attribute downgradeipidentifiedwarnings of U0 : label is "yes";
  attribute x_interface_info : string;
  attribute x_interface_info of clka : signal is "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clka : signal is "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1";
  attribute x_interface_info of addra : signal is "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR";
  attribute x_interface_info of dina : signal is "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN";
  attribute x_interface_info of douta : signal is "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT";
  attribute x_interface_info of wea : signal is "xilinx.com:interface:bram:1.0 BRAM_PORTA WE";
begin
U0: entity work.BM_CY_back_walk_L_blk_mem_gen_v8_4_4
     port map (
      addra(8 downto 0) => addra(8 downto 0),
      addrb(8 downto 0) => B"000000000",
      clka => clka,
      clkb => '0',
      dbiterr => NLW_U0_dbiterr_UNCONNECTED,
      deepsleep => '0',
      dina(11 downto 0) => dina(11 downto 0),
      dinb(11 downto 0) => B"000000000000",
      douta(11 downto 0) => douta(11 downto 0),
      doutb(11 downto 0) => NLW_U0_doutb_UNCONNECTED(11 downto 0),
      eccpipece => '0',
      ena => '0',
      enb => '0',
      injectdbiterr => '0',
      injectsbiterr => '0',
      rdaddrecc(8 downto 0) => NLW_U0_rdaddrecc_UNCONNECTED(8 downto 0),
      regcea => '0',
      regceb => '0',
      rsta => '0',
      rsta_busy => NLW_U0_rsta_busy_UNCONNECTED,
      rstb => '0',
      rstb_busy => NLW_U0_rstb_busy_UNCONNECTED,
      s_aclk => '0',
      s_aresetn => '0',
      s_axi_araddr(31 downto 0) => B"00000000000000000000000000000000",
      s_axi_arburst(1 downto 0) => B"00",
      s_axi_arid(3 downto 0) => B"0000",
      s_axi_arlen(7 downto 0) => B"00000000",
      s_axi_arready => NLW_U0_s_axi_arready_UNCONNECTED,
      s_axi_arsize(2 downto 0) => B"000",
      s_axi_arvalid => '0',
      s_axi_awaddr(31 downto 0) => B"00000000000000000000000000000000",
      s_axi_awburst(1 downto 0) => B"00",
      s_axi_awid(3 downto 0) => B"0000",
      s_axi_awlen(7 downto 0) => B"00000000",
      s_axi_awready => NLW_U0_s_axi_awready_UNCONNECTED,
      s_axi_awsize(2 downto 0) => B"000",
      s_axi_awvalid => '0',
      s_axi_bid(3 downto 0) => NLW_U0_s_axi_bid_UNCONNECTED(3 downto 0),
      s_axi_bready => '0',
      s_axi_bresp(1 downto 0) => NLW_U0_s_axi_bresp_UNCONNECTED(1 downto 0),
      s_axi_bvalid => NLW_U0_s_axi_bvalid_UNCONNECTED,
      s_axi_dbiterr => NLW_U0_s_axi_dbiterr_UNCONNECTED,
      s_axi_injectdbiterr => '0',
      s_axi_injectsbiterr => '0',
      s_axi_rdaddrecc(8 downto 0) => NLW_U0_s_axi_rdaddrecc_UNCONNECTED(8 downto 0),
      s_axi_rdata(11 downto 0) => NLW_U0_s_axi_rdata_UNCONNECTED(11 downto 0),
      s_axi_rid(3 downto 0) => NLW_U0_s_axi_rid_UNCONNECTED(3 downto 0),
      s_axi_rlast => NLW_U0_s_axi_rlast_UNCONNECTED,
      s_axi_rready => '0',
      s_axi_rresp(1 downto 0) => NLW_U0_s_axi_rresp_UNCONNECTED(1 downto 0),
      s_axi_rvalid => NLW_U0_s_axi_rvalid_UNCONNECTED,
      s_axi_sbiterr => NLW_U0_s_axi_sbiterr_UNCONNECTED,
      s_axi_wdata(11 downto 0) => B"000000000000",
      s_axi_wlast => '0',
      s_axi_wready => NLW_U0_s_axi_wready_UNCONNECTED,
      s_axi_wstrb(0) => '0',
      s_axi_wvalid => '0',
      sbiterr => NLW_U0_sbiterr_UNCONNECTED,
      shutdown => '0',
      sleep => '0',
      wea(0) => wea(0),
      web(0) => '0'
    );
end STRUCTURE;
