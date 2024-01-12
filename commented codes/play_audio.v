//play chosen music
module play_audio(
    input clk,
    input rst,
    input change,//0 for non-boss, 1 for boss
    output pmod_1,
	output pmod_2,
	output pmod_4
    );
    
    parameter BEAT_FREQ = 32'd32;	//one beat=0.03125sec
    parameter DUTY_BEST = 10'd512;	//duty cycle=50%

	wire [31:0] freqZelda, freqBoss;
    reg [31:0] freq;
    wire [12:0] ibeatNumZelda;
    wire [12:0] ibeatNumBoss;
    wire beatFreq;
    
    assign pmod_2 = 1'd1;	//no gain(6dB)
    assign pmod_4 = 1'd1;	//turn-on
    
    always @(*) begin
        if (change) begin
            freq = freqBoss;
        end else begin
            freq = freqZelda;    
        end
    end

    //Generate beat speed
    PWM_gen btSpeedGen ( 
         .clk(clk), 
         .reset(rst),
         .freq(BEAT_FREQ),
         .duty(DUTY_BEST), 
         .PWM(beatFreq)
    );
        
    //manipulate beat
    PlayerCtrlZelda playerCtrl_zelda ( 
        .clk(beatFreq),
        .reset(rst),
        .ibeat(ibeatNumZelda)
    );
    PlayerCtrlBoss playerCtrl_boss ( 
        .clk(beatFreq),
        .reset(rst),
        .ibeat(ibeatNumBoss)
    );	
        
    //Generate variant freq. of tones
    MusicZelda musicZelda ( 
        .ibeatNum(ibeatNumZelda),
        .tone(freqZelda)
    );
    MusicBoss musicBoss(
        .ibeatNum(ibeatNumBoss),
        .tone(freqBoss)
    );
    
    // Generate particular freq. signal
    PWM_gen toneGen ( 
          .clk(clk), 
          .reset(rst), 
          .freq(freq),
          .duty(DUTY_BEST), 
          .PWM(pmod_1)
    );
endmodule