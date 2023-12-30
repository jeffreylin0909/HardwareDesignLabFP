// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Sat Dec 30 11:11:59 2023
// Host        : DESKTOP-Q29MBHF running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
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
  (* C_INIT_FILE = "blk_mem_gen_0.mem" *) 
  (* C_INIT_FILE_NAME = "blk_mem_gen_0.mif" *) 
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
hTD2OOJo2Ag=
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
