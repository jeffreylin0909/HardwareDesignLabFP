// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Sat Dec 30 11:11:59 2023
// Host        : DESKTOP-Q29MBHF running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {c:/verilog project/move sprite/move
//               sprite.gen/sources_1/ip/blk_mem_gen_0_1/blk_mem_gen_0_sim_netlist.v}
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module blk_mem_gen_0
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
  blk_mem_gen_0_blk_mem_gen_v8_4_4 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 20512)
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
