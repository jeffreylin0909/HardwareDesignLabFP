// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Sat Dec 30 17:49:40 2023
// Host        : DESKTOP-Q29MBHF running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {c:/verilog project/move sprite/move
//               sprite.gen/sources_1/ip/blk_mem_gen_1/blk_mem_gen_1_sim_netlist.v}
// Design      : blk_mem_gen_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_1,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module blk_mem_gen_1
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
  blk_mem_gen_1_blk_mem_gen_v8_4_4 U0
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
