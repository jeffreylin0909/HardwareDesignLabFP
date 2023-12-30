// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Sat Dec 30 17:49:40 2023
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
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [8:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [11:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [11:0]douta;

  wire [8:0]addra;
  wire clka;
  wire [11:0]dina;
  wire [11:0]douta;
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
  (* C_HAS_ENA = "0" *) 
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
        .ena(1'b0),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 20528)
`pragma protect data_block
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
98NwFrHhTSU=
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
