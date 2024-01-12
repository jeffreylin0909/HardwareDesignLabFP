//beat counter for boss stage music
module PlayerCtrlBoss (
	input clk,
	input reset,
	output reg [12:0] ibeat
);
parameter BEATLENGTH = 3463; //total number of beats

always @(posedge clk, posedge reset) begin
	if (reset)
		ibeat <= 0;
	else if (ibeat < BEATLENGTH) 
		ibeat <= ibeat + 1;
	else 
		ibeat <= 0;
end

endmodule
