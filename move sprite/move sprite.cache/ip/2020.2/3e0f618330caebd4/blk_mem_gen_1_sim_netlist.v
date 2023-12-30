// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Sat Dec 30 17:42:20 2023
// Host        : DESKTOP-Q29MBHF running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ blk_mem_gen_1_sim_netlist.v
// Design      : blk_mem_gen_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_1,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [8:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [11:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [11:0]douta;

  wire [8:0]addra;
  wire clka;
  wire [11:0]dina;
  wire [11:0]douta;
  wire ena;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [11:0]NLW_U0_doutb_UNCONNECTED;
  wire [8:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [8:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [11:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "9" *) 
  (* C_ADDRB_WIDTH = "9" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.70645 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "blk_mem_gen_1.mem" *) 
  (* C_INIT_FILE_NAME = "blk_mem_gen_1.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "400" *) 
  (* C_READ_DEPTH_B = "400" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "12" *) 
  (* C_READ_WIDTH_B = "12" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "400" *) 
  (* C_WRITE_DEPTH_B = "400" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "12" *) 
  (* C_WRITE_WIDTH_B = "12" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_4 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[11:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[8:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[8:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[11:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2020.2"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
QGLtnqZzRetDH6gCWT4Js6wuLlZfrNx/VJp3sfR2NF+cxypO5AxN0oDKLJJtmdrtE/ueNDg+Qf7Z
TqBNRojORA==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
B6Ger3hRvfjHkaJ+W8639Kl3TzC9TogLuklOXEiMNdc4Im+DjEUzxb3DKlzu0VW3zxZqjJ3+wsW/
LnRmPCESi5Y9eRJaLFXg79EMfoj4X+nTdHAP6yCfltBADKegZ12gpnB/8ey5yn2KA74LUtPC7jna
iyjqSfsWLGnz6UdXzwk=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BX+DxgMPRyZbYojCUR9Sk8Lq+3ZigBz4yMFHQkmurfdfDzyTPJCE827eGiPyTenK1QPVhEtf9g06
0BFXq/0COPuU1BWJwdkz1c4dE6/exDwhvEh+hPx3vRY6z8fDEf6aGVIXrHDvrmddehe7yMSIpo+k
aXHR06EEdfHCFY4TggYwhcJVXjkE+ApsVuyfmEfPmYjo8hCWyQyBsUWIOY03q1+MvUjjsmTwgs9g
fh5MY9ToaLfoJxPKdCpsqrBX4LJ+VDGFlAqIcqHTE2jCmPiToZAFXB7fzf1wDjFCBlJyFVDBGi0i
m+CouLSb7X1mvVhdDZgNrZDJMV688Bu3o54vew==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
DaIU/Ddc8USbZ2mURzujJDWDH1JbHl5tFVOOQ2aVaUPIA71yyE38OXVLEtF8rNmujYH30nEeQ+FV
LVJ16aaHw+iiuaqorTM3K5KLohVlN+WlcEtSXHuPNHjw8ddqtzpaX7pH1zqZH+YmfCL5oaNLqDH4
rkBnUl0/Gm/hzSwKjYhXGQFYQ+gGP99OjXakzrAqZzp/Iq4gt+Z5902/JV9thd/isHQImJ0QyK8M
EKM579iPAfXGes2mbiNYHcvDmSPYmW1zlhOE++N1EKeea7j/msnKeyhlC+hGE4Xfn4TVvqgQexCT
rp/wS/MosY6WH1aKFQlFH2hEppA7KXUaQlvG+w==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
XmWoAt4X8hrCJ5yTyug4ajJW5UhfkLNibzjihWzZ4Cr9hQSvWZoTc8rjGsLPbz6Le+/9iI5KxecS
eR0wiAO+G2IkwhZgVBeZdKoFnlnTVAyLjk9wMAFXNyJZM6b1NDbfXlPcUsC6JePvPlwwdWknkSsC
r3KvgkWAS+O3xvRmaNw=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Hw3Y+rShKrXiUViyNU1/O2qv6TgheLHBnFMj1i9MUGrHYqh9pLfLYUgWR7S2vj4jv4S+Ks0BpP4p
dKEqVAFmTCfQNEUHaVcFPkOHgig6L4mhLY6HUUKJoRgiQepgLi/W3V+ZZPQSQFkB3CU4MsJzhXvR
yLcpDriZy8cnAHD87Zi5DrNGBzj3kigJeM0du6lCQbxtF5aEdoaNP+YTnIFtcqYhoYnswQlYt0sV
HKgFA8VzqzL5WYnpH7+1IKmFkJBHkyqHCa9wPK0qCKnxkuDj70YzPVqQ+cocdKU+/gNdpCOdZlci
F2HTxrgfrXndJru3TiDqu4UavqAe0MNuFp3t0w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XPVggoWL6aXz+MpODTOZhEUQDa0vfEnUDaYeEHXm2vGyqKJujN2c/FFAFBeBYdJATLsIsQ+BqoPc
pBbcFYXDBfOtFIW2dH6Y1OoD65KyJ/hAq8coa21kFgq4hFat5vzZ2iIfkCpTUr4vDZO7Xne8cZO9
WsHffoTCt5rS59wWm2b8I5R8Eh2TUbQg3RCyrcnD66cvcEnlXe1CNMQ4/loVJpA4IBinBf820Wjc
vw2fZbGI0jXC+ACSHOviH63Xwmn+aRV5Ppkup7IYoon/ieKapRQeASu3TTY37xSBXiInSdtMTzJ6
+4GfO4eSHVriCk/sWbuTBzfRzoSShrnHjzz5LA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2020_08", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
L78XuiswVcgO2gtebzL7SA9BC/jJGAM0v6S9pzmyqL+QYzRneiYeGyDmsW33jEVVSTuNjTXkBLY7
yTOKQruatwe4V0OLi6174saSAmPgerSV1GyLP7KhmusLV/N61avC9TPam+tekhKeE0tds4EnJ3et
4JdLh+SE4Z4pcuqCjB5MFneIYKKWDx7siU6oesAQtoSJOesfMchX63MhOjOHFP/ch+1gHv3T45hg
IGF7V7TrdREVE4f9631tlVJ1o2Dypsmo/76Itz5WCGlTMjAnWXN8IXxKN+PZ3dyt1wjrZm2P/td+
xiGszFnSLrRvw/HferwtSmRx8q0fiHZ88roGTw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kDX5kq2QEe25429T6vQqBCFvV1McKTJRYfK99ymVNK2GGvGLXSzgwJHwB2fj9rM0wme3zYYY0vQR
x+9F4L7KLlOVY6qY3LB59uDzyXBI3mMZaS905HXHJkdZHWtQWpfHhl27LqL+8FSluaD6F+KFfYOV
CwIOVuCIp/XjxFXpNBik7YiPt4kHOlDA97IXNLnYUn/g1csGqeNWce4UTne50ggWvLYGbTFGmTjT
N67TpUiGRVRCSv8Tax72GWFIMFZk3Tlp68ZUSQEybZMWX1U9XdMdtxfvNGhf8mi5jQJ2SupSzKu4
T/+53IN9T8aLePAiGBKKG1ZBj4y1ZyYA7XYvjw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 20800)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
