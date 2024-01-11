//
//
//
//

module PlayerCtrlZelda (
	input clk,
	input reset,
	output reg [12:0] ibeat
);
parameter BEATLENGTH = 1519;

always @(posedge clk, posedge reset) begin
	if (reset)
		ibeat <= 0;
	else if (ibeat < BEATLENGTH) 
		ibeat <= ibeat + 1;
	else 
		ibeat <= 256;
end

endmodule