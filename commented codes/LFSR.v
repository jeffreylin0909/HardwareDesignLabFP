//to mimic random behavior
module LFSR (
    input clock,
    input reset,
    input [12:0] seed,
    output [12:0] rnd 
    );

    reg [12:0] random, random_next, random_done;
    reg [3:0] count, count_next; //to keep track of the shifts

    wire feedback = random[12] ^ random[3] ^ random[2] ^ random[0]; 

    always @ (posedge clock) begin
        if (reset) begin
            random <= seed; //An LFSR cannot have an all 0 state, thus reset to FF
            count <= 0;
        end else begin
            random <= random_next;
            count <= count_next;
        end
    end

    always @ (*) begin
        random_next = random; //default state stays the same
        count_next = count;
    
        random_next = {random[11:0], feedback}; //shift left the xor'd every posedge clock
        count_next = count + 1;

        if (count == 13) begin
            count_next = 0;
            random_done = random; //assign the random number to output after 13 shifts
        end
    
    end


    assign rnd = random_done;
    
endmodule