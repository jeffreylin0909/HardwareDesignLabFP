//beat counter for non-boss stage music
module PlayerCtrlZelda (
	input clk,
	input reset,
	output reg [12:0] ibeat
);
parameter BEATLENGTH = 1519; //total number of beats

always @(posedge clk, posedge reset) begin
	if (reset)
		ibeat <= 0;
	else if (ibeat < BEATLENGTH) 
		ibeat <= ibeat + 1;
	else 
		ibeat <= 256;//repeat from 256-th beat
end

endmodule