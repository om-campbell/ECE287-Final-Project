module Final_Project(
input clk,
input rst,
input start,
input [3:0]userIn,
output reg [3:0]led,
output reg [6:0]led_fail);

reg [9:0]S;
reg [9:0]NS;

reg [3:0]light_seq0 = 4'b0100;
reg [3:0]light_seq1 = 4'b1000;
reg [3:0]light_seq2 = 4'b0100;
reg [3:0]light_seq3 = 4'b0001;
reg [3:0]light_seq4 = 4'b1000;
reg [3:0]light_seq5 = 4'b0001;
reg [3:0]light_seq6 = 4'b0100;
reg [3:0]light_seq7 = 4'b1000;
reg [3:0]light_seq8 = 4'b0010;
reg [3:0]light_seq9 = 4'b0100;
reg [3:0]light_seq10= 4'b0001;
reg [3:0]light_seq11= 4'b1000;
reg [3:0]light_seq12= 4'b0100;
reg [3:0]light_seq13= 4'b1000;
reg [3:0]light_seq14= 4'b0010;


parameter START = 10'd0,

			 LEVEL_1 = 10'd1,
			 
			 LEVEL_1_CHECK = 10'd2,
			 
			 LEVEL_2_A = 10'd3,
			 LEVEL_2_B = 10'd4,
			 
			 LEVEL_2_CHECK_A = 10'd5,
			 LEVEL_2_CHECK_B = 10'd6,
			 
			 LEVEL_3_A = 10'd7,
			 LEVEL_3_B = 10'd8,
			 LEVEL_3_C = 10'd9,
			 
			 LEVEL_3_CHECK_A = 10'd10,
			 LEVEL_3_CHECK_B = 10'd11,
			 LEVEL_3_CHECK_C = 10'd12,
			 
			 LEVEL_4_A = 10'd13,
			 LEVEL_4_B = 10'd14,
			 LEVEL_4_C = 10'd15,
			 LEVEL_4_D = 10'd16,
			 
			 LEVEL_4_CHECK_A = 10'd17,
			 LEVEL_4_CHECK_B = 10'd18,
			 LEVEL_4_CHECK_C = 10'd19,
			 LEVEL_4_CHECK_D = 10'd20,
			
			 LEVEL_5_A = 10'd21,
			 LEVEL_5_B = 10'd22,
			 LEVEL_5_C = 10'd23,
			 LEVEL_5_D = 10'd24,
			 LEVEL_5_E = 10'd25,
			 
			 LEVEL_5_CHECK_A = 10'd26,
			 LEVEL_5_CHECK_B = 10'd27,
			 LEVEL_5_CHECK_C = 10'd28,
			 LEVEL_5_CHECK_D = 10'd29,
			 LEVEL_5_CHECK_E = 10'd30,
			 
			 LEVEL_6_A = 10'd31,
			 LEVEL_6_B = 10'd32,
			 LEVEL_6_C = 10'd33,
			 LEVEL_6_D = 10'd34,
			 LEVEL_6_E = 10'd35,
			 LEVEL_6_F = 10'd36,
			 
			 LEVEL_6_CHECK_A = 10'd37,
			 LEVEL_6_CHECK_B = 10'd38,
			 LEVEL_6_CHECK_C = 10'd39,
			 LEVEL_6_CHECK_D = 10'd40,
			 LEVEL_6_CHECK_E = 10'd41,
			 LEVEL_6_CHECK_F = 10'd42,
			 
			 LEVEL_7_A = 10'd43,
			 LEVEL_7_B = 10'd44,
			 LEVEL_7_C = 10'd45,
			 LEVEL_7_D = 10'd46,
			 LEVEL_7_E = 10'd47,
			 LEVEL_7_F = 10'd48,
			 LEVEL_7_G = 10'd49,
			 
			 LEVEL_7_CHECK_A = 10'd50,
			 LEVEL_7_CHECK_B = 10'd51,
			 LEVEL_7_CHECK_C = 10'd52,
			 LEVEL_7_CHECK_D = 10'd53,
			 LEVEL_7_CHECK_E = 10'd54,
			 LEVEL_7_CHECK_F = 10'd55,
			 LEVEL_7_CHECK_G = 10'd56,
			 
			 LEVEL_8_A = 10'd57,
			 LEVEL_8_B = 10'd58,
			 LEVEL_8_C = 10'd59,
			 LEVEL_8_D = 10'd60,
			 LEVEL_8_E = 10'd61,
			 LEVEL_8_F = 10'd62,
			 LEVEL_8_G = 10'd63,
			 LEVEL_8_H = 10'd64,
			 
			 LEVEL_8_CHECK_A = 10'd65,
			 LEVEL_8_CHECK_B = 10'd66,
			 LEVEL_8_CHECK_C = 10'd67,
			 LEVEL_8_CHECK_D = 10'd68,
			 LEVEL_8_CHECK_E = 10'd69,
			 LEVEL_8_CHECK_F = 10'd70,
			 LEVEL_8_CHECK_G = 10'd71,
			 LEVEL_8_CHECK_H = 10'd72,
			 
			 LEVEL_9_A = 10'd73,
			 LEVEL_9_B = 10'd74,
			 LEVEL_9_C = 10'd75,
			 LEVEL_9_D = 10'd76,
			 LEVEL_9_E = 10'd77,
			 LEVEL_9_F = 10'd78,
			 LEVEL_9_G = 10'd79,
			 LEVEL_9_H = 10'd80,
			 LEVEL_9_I = 10'd81,
			 
			 LEVEL_9_CHECK_A = 10'd82,
			 LEVEL_9_CHECK_B = 10'd83,
			 LEVEL_9_CHECK_C = 10'd84,
			 LEVEL_9_CHECK_D = 10'd85,
			 LEVEL_9_CHECK_E = 10'd86,
			 LEVEL_9_CHECK_F = 10'd87,
			 LEVEL_9_CHECK_G = 10'd88,
			 LEVEL_9_CHECK_H = 10'd89,
			 LEVEL_9_CHECK_I = 10'd90,
			 
			 LEVEL_10_A = 10'd91,
			 LEVEL_10_B = 10'd92,
			 LEVEL_10_C = 10'd93,
			 LEVEL_10_D = 10'd94,
			 LEVEL_10_E = 10'd95,
			 LEVEL_10_F = 10'd96,
			 LEVEL_10_G = 10'd97,
			 LEVEL_10_H = 10'd98,
			 LEVEL_10_I = 10'd99,
			 LEVEL_10_J = 10'd100,
			 
			 LEVEL_10_CHECK_A = 10'd101,
			 LEVEL_10_CHECK_B = 10'd102,
			 LEVEL_10_CHECK_C = 10'd103,
			 LEVEL_10_CHECK_D = 10'd104,
			 LEVEL_10_CHECK_E = 10'd105,
			 LEVEL_10_CHECK_F = 10'd106,
			 LEVEL_10_CHECK_G = 10'd107,
			 LEVEL_10_CHECK_H = 10'd108,
			 LEVEL_10_CHECK_I = 10'd109,
			 LEVEL_10_CHECK_J = 10'd110,
			 
			 LEVEL_11_A = 10'd111,
			 LEVEL_11_B = 10'd112,
			 LEVEL_11_C = 10'd113,
			 LEVEL_11_D = 10'd114,
			 LEVEL_11_E = 10'd115,
			 LEVEL_11_F = 10'd116,
			 LEVEL_11_G = 10'd117,
			 LEVEL_11_H = 10'd118,
			 LEVEL_11_I = 10'd119,
			 LEVEL_11_J = 10'd120,
			 LEVEL_11_K = 10'd121,
			 
			 LEVEL_11_CHECK_A = 10'd122,
			 LEVEL_11_CHECK_B = 10'd123,
			 LEVEL_11_CHECK_C = 10'd124,
			 LEVEL_11_CHECK_D = 10'd125,
			 LEVEL_11_CHECK_E = 10'd126,
			 LEVEL_11_CHECK_F = 10'd127,
			 LEVEL_11_CHECK_G = 10'd128,
			 LEVEL_11_CHECK_H = 10'd129,
			 LEVEL_11_CHECK_I = 10'd130,
			 LEVEL_11_CHECK_J = 10'd131,
			 LEVEL_11_CHECK_K = 10'd132,
			 
			 LEVEL_12_A = 10'd133,
			 LEVEL_12_B = 10'd134,
			 LEVEL_12_C = 10'd135,
			 LEVEL_12_D = 10'd136,
			 LEVEL_12_E = 10'd137,
			 LEVEL_12_F = 10'd138,
			 LEVEL_12_G = 10'd139,
			 LEVEL_12_H = 10'd140,
			 LEVEL_12_I = 10'd141,
			 LEVEL_12_J = 10'd142,
			 LEVEL_12_K = 10'd143,
			 LEVEL_12_L = 10'd144,
			 
			 LEVEL_12_CHECK_A = 10'd145,
			 LEVEL_12_CHECK_B = 10'd146,
			 LEVEL_12_CHECK_C = 10'd147,
			 LEVEL_12_CHECK_D = 10'd148,
			 LEVEL_12_CHECK_E = 10'd149,
			 LEVEL_12_CHECK_F = 10'd150,
			 LEVEL_12_CHECK_G = 10'd151,
			 LEVEL_12_CHECK_H = 10'd152,
			 LEVEL_12_CHECK_I = 10'd153,
			 LEVEL_12_CHECK_J = 10'd154,
			 LEVEL_12_CHECK_K = 10'd155,
			 LEVEL_12_CHECK_L = 10'd156,
			 
			 LEVEL_13_A = 10'd157,
			 LEVEL_13_B = 10'd158,
			 LEVEL_13_C = 10'd159,
			 LEVEL_13_D = 10'd160,
			 LEVEL_13_E = 10'd161,
			 LEVEL_13_F = 10'd162,
			 LEVEL_13_G = 10'd163,
			 LEVEL_13_H = 10'd164,
			 LEVEL_13_I = 10'd165,
			 LEVEL_13_J = 10'd166,
			 LEVEL_13_K = 10'd167,
			 LEVEL_13_L = 10'd168,
			 LEVEL_13_M = 10'd169,
			 
			 LEVEL_13_CHECK_A = 10'd170,
			 LEVEL_13_CHECK_B = 10'd171,
			 LEVEL_13_CHECK_C = 10'd172,
			 LEVEL_13_CHECK_D = 10'd173,
			 LEVEL_13_CHECK_E = 10'd174,
			 LEVEL_13_CHECK_F = 10'd175,
			 LEVEL_13_CHECK_G = 10'd176,
			 LEVEL_13_CHECK_H = 10'd177,
			 LEVEL_13_CHECK_I = 10'd178,
			 LEVEL_13_CHECK_J = 10'd179,
			 LEVEL_13_CHECK_K = 10'd180,
			 LEVEL_13_CHECK_L = 10'd181,
			 LEVEL_13_CHECK_M = 10'd182,
			 
			 LEVEL_14_A = 10'd183,
			 LEVEL_14_B = 10'd184,
			 LEVEL_14_C = 10'd185,
			 LEVEL_14_D = 10'd186,
			 LEVEL_14_E = 10'd187,
			 LEVEL_14_F = 10'd188,
			 LEVEL_14_G = 10'd189,
			 LEVEL_14_H = 10'd190,
			 LEVEL_14_I = 10'd191,
			 LEVEL_14_J = 10'd192,
			 LEVEL_14_K = 10'd193,
			 LEVEL_14_L = 10'd194,
			 LEVEL_14_M = 10'd195,
			 LEVEL_14_N = 10'd196,
			 
			 LEVEL_14_CHECK_A = 10'd197,
			 LEVEL_14_CHECK_B = 10'd198,
			 LEVEL_14_CHECK_C = 10'd199,
			 LEVEL_14_CHECK_D = 10'd200,
			 LEVEL_14_CHECK_E = 10'd201,
			 LEVEL_14_CHECK_F = 10'd202,
			 LEVEL_14_CHECK_G = 10'd203,
			 LEVEL_14_CHECK_H = 10'd204,
			 LEVEL_14_CHECK_I = 10'd205,
			 LEVEL_14_CHECK_J = 10'd206,
			 LEVEL_14_CHECK_K = 10'd207,
			 LEVEL_14_CHECK_L = 10'd208,
			 LEVEL_14_CHECK_M = 10'd209,
			 LEVEL_14_CHECK_N = 10'd210,
			
			 LEVEL_15_A = 10'd211,
			 LEVEL_15_B = 10'd212,
			 LEVEL_15_C = 10'd213,
			 LEVEL_15_D = 10'd214,
			 LEVEL_15_E = 10'd215,
			 LEVEL_15_F = 10'd216,
			 LEVEL_15_G = 10'd217,
			 LEVEL_15_H = 10'd218,
			 LEVEL_15_I = 10'd219,
			 LEVEL_15_J = 10'd220,
			 LEVEL_15_K = 10'd221,
			 LEVEL_15_L = 10'd222,
			 LEVEL_15_M = 10'd223,
			 LEVEL_15_N = 10'd224,
			 LEVEL_15_O = 10'd225,
			 
			 LEVEL_15_CHECK_A = 10'd226,
			 LEVEL_15_CHECK_B = 10'd227,
			 LEVEL_15_CHECK_C = 10'd228,
			 LEVEL_15_CHECK_D = 10'd229,
			 LEVEL_15_CHECK_E = 10'd230,
			 LEVEL_15_CHECK_F = 10'd231,
			 LEVEL_15_CHECK_G = 10'd232,
			 LEVEL_15_CHECK_H = 10'd233,
			 LEVEL_15_CHECK_I = 10'd234,
			 LEVEL_15_CHECK_J = 10'd235,
			 LEVEL_15_CHECK_K = 10'd236,
			 LEVEL_15_CHECK_L = 10'd237,
			 LEVEL_15_CHECK_M = 10'd238,
			 LEVEL_15_CHECK_N = 10'd239,
			 LEVEL_15_CHECK_O = 10'd240,
			 
			 DONE = 10'd241;

reg clk_out;
reg [26:0]counter;
	
always @ (posedge clk or negedge rst)
	begin
		if (rst == 1'b0) 
			begin
				counter = 0;
				clk_out = 0;
			end
		else
			begin
				counter = counter+1;
				if (counter == 26'd25_000_000) 
					begin
						counter = 0;
						clk_out = ~clk_out;
					end
			end
	end	 
			 
always @(posedge clk_out or negedge rst)
begin
	if (rst == 1'b0)
		S <= START;
	else
		S <= NS;
end

always@(*)
	begin	
	case(S)
		START: begin
					if (start == 1'b0)
						NS = START;
					else
						NS = LEVEL_1;
				end
		LEVEL_1: NS = LEVEL_1_CHECK;
		LEVEL_1_CHECK: begin
								if(userIn[2]==1'b0)
									NS = LEVEL_2_A;
								else if(userIn[3]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
								else
									NS= LEVEL_1_CHECK;
							end
		LEVEL_2_A: NS=LEVEL_2_B;
		LEVEL_2_B: NS=LEVEL_2_CHECK_A;
		LEVEL_2_CHECK_A: begin
								if(userIn[2]==1'b0)
									NS=LEVEL_2_CHECK_B;
								else if(userIn[3]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
								else
									NS=LEVEL_2_CHECK_A;
							  end
		LEVEL_2_CHECK_B: begin
								if(userIn[3]==1'b0)
										NS = LEVEL_3_A;
								else if(userIn[2]^userIn[1]^userIn[0]==1'b0)
										NS=DONE;
									else
										NS=LEVEL_2_CHECK_B;
								end
		LEVEL_3_A: NS=LEVEL_3_B;
		LEVEL_3_B: NS=LEVEL_3_C;
		LEVEL_3_C: NS=LEVEL_3_CHECK_A;
		LEVEL_3_CHECK_A: begin
								if(userIn[2]==1'b0)
									NS=LEVEL_3_CHECK_B;
								else if(userIn[3]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
								else
									NS=LEVEL_3_CHECK_A;
							  end
		LEVEL_3_CHECK_B: begin
									if(userIn[3]==1'b0)
										NS = LEVEL_3_CHECK_C;
									else if(userIn[2]^userIn[1]^userIn[0]==1'b0)
										NS=DONE;
									else
										NS=LEVEL_3_CHECK_B;
								end
		LEVEL_3_CHECK_C: begin
								if(userIn[2]==1'b0)
									NS=LEVEL_4_A;
								else if(userIn[3]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_3_CHECK_C;
								end
		LEVEL_4_A: NS=LEVEL_4_B;
		LEVEL_4_B: NS=LEVEL_4_C;
		LEVEL_4_C: NS=LEVEL_4_D;
		LEVEL_4_D: NS=LEVEL_4_CHECK_A;
		LEVEL_4_CHECK_A: begin
								if(userIn[2]==1'b0)
									NS=LEVEL_4_CHECK_B;
								else if(userIn[3]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
								else
									NS=LEVEL_4_CHECK_A;
							  end
		LEVEL_4_CHECK_B: begin
									if(userIn[3]==1'b0)
										NS = LEVEL_4_CHECK_C;
									else if(userIn[2]^userIn[1]^userIn[0]==1'b0)
										NS=DONE;
									else
										NS=LEVEL_4_CHECK_B;
								end
		LEVEL_4_CHECK_C: begin
								if(userIn[2]==1'b0)
									NS=LEVEL_4_CHECK_D;
								else if(userIn[3]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_4_CHECK_C;
								end
		LEVEL_4_CHECK_D: begin
								if(userIn[0]==1'b0)
									NS=LEVEL_5_A;
								else if(userIn[3]^userIn[2]^userIn[1]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_4_CHECK_D;
								end
		LEVEL_5_A: NS=LEVEL_5_B;
		LEVEL_5_B: NS=LEVEL_5_C;
		LEVEL_5_C: NS=LEVEL_5_D;
		LEVEL_5_D: NS=LEVEL_5_E;
		LEVEL_5_E: NS=LEVEL_5_CHECK_A;
		LEVEL_5_CHECK_A: begin
								if(userIn[2]==1'b0)
									NS=LEVEL_5_CHECK_B;
								else if(userIn[3]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
								else
									NS=LEVEL_5_CHECK_A;
							  end
		LEVEL_5_CHECK_B: begin
									if(userIn[3]==1'b0)
										NS = LEVEL_5_CHECK_C;
									else if(userIn[2]^userIn[1]^userIn[0]==1'b0)
										NS=DONE;
									else
										NS=LEVEL_5_CHECK_B;
								end
		LEVEL_5_CHECK_C: begin
								if(userIn[2]==1'b0)
									NS=LEVEL_5_CHECK_D;
								else if(userIn[3]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_5_CHECK_C;
								end
		LEVEL_5_CHECK_D: begin
								if(userIn[0]==1'b0)
									NS=LEVEL_5_CHECK_E;
								else if(userIn[3]^userIn[2]^userIn[1]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_5_CHECK_D;
								end
		LEVEL_5_CHECK_E: begin
								if(userIn[3]==1'b0)
									NS=LEVEL_6_A;
								else if(userIn[2]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_5_CHECK_E;
								end
		LEVEL_6_A: NS=LEVEL_6_B;
		LEVEL_6_B: NS=LEVEL_6_C;
		LEVEL_6_C: NS=LEVEL_6_D;
		LEVEL_6_D: NS=LEVEL_6_E;
		LEVEL_6_E: NS=LEVEL_6_F;
		LEVEL_6_F: NS=LEVEL_6_CHECK_A;
		LEVEL_6_CHECK_A: begin
								if(userIn[2]==1'b0)
									NS=LEVEL_6_CHECK_B;
								else if(userIn[3]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
								else
									NS=LEVEL_6_CHECK_A;
							  end
		LEVEL_6_CHECK_B: begin
									if(userIn[3]==1'b0)
										NS = LEVEL_6_CHECK_C;
									else if(userIn[2]^userIn[1]^userIn[0]==1'b0)
										NS=DONE;
									else
										NS=LEVEL_6_CHECK_B;
								end
		LEVEL_6_CHECK_C: begin
								if(userIn[2]==1'b0)
									NS=LEVEL_6_CHECK_D;
								else if(userIn[3]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_6_CHECK_C;
								end
		LEVEL_6_CHECK_D: begin
								if(userIn[0]==1'b0)
									NS=LEVEL_6_CHECK_E;
								else if(userIn[3]^userIn[2]^userIn[1]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_6_CHECK_D;
								end
		LEVEL_6_CHECK_E: begin
								if(userIn[3]==1'b0)
									NS=LEVEL_6_CHECK_F;
								else if(userIn[2]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_6_CHECK_E;
								end						
		LEVEL_6_CHECK_F: begin
								if(userIn[0]==1'b0)
									NS=LEVEL_7_A;
								else if(userIn[3]^userIn[2]^userIn[1]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_6_CHECK_F;
								end
		LEVEL_7_A: NS=LEVEL_7_B;
		LEVEL_7_B: NS=LEVEL_7_C;
		LEVEL_7_C: NS=LEVEL_7_D;
		LEVEL_7_D: NS=LEVEL_7_E;
		LEVEL_7_E: NS=LEVEL_7_F;
		LEVEL_7_F: NS=LEVEL_7_G;
		LEVEL_7_G: NS=LEVEL_7_CHECK_A;
		LEVEL_7_CHECK_A: begin
								if(userIn[2]==1'b0)
									NS=LEVEL_7_CHECK_B;
								else if(userIn[3]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
								else
									NS=LEVEL_7_CHECK_A;
							  end
		LEVEL_7_CHECK_B: begin
									if(userIn[3]==1'b0)
										NS = LEVEL_7_CHECK_C;
									else if(userIn[2]^userIn[1]^userIn[0]==1'b0)
										NS=DONE;
									else
										NS=LEVEL_7_CHECK_B;
								end
		LEVEL_7_CHECK_C: begin
								if(userIn[2]==1'b0)
									NS=LEVEL_7_CHECK_D;
								else if(userIn[3]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_7_CHECK_C;
								end
		LEVEL_7_CHECK_D: begin
								if(userIn[0]==1'b0)
									NS=LEVEL_7_CHECK_E;
								else if(userIn[3]^userIn[2]^userIn[1]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_7_CHECK_D;
								end
		LEVEL_7_CHECK_E: begin
								if(userIn[3]==1'b0)
									NS=LEVEL_7_CHECK_F;
								else if(userIn[2]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_7_CHECK_E;
								end						
		LEVEL_7_CHECK_F: begin
								if(userIn[0]==1'b0)
									NS=LEVEL_7_CHECK_G;
								else if(userIn[3]^userIn[2]^userIn[1]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_7_CHECK_F;
								end						
		LEVEL_7_CHECK_G: begin
								if(userIn[2]==1'b0)
									NS=LEVEL_8_A;
								else if(userIn[3]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_7_CHECK_G;
								end						
		LEVEL_8_A: NS=LEVEL_8_B;
		LEVEL_8_B: NS=LEVEL_8_C;
		LEVEL_8_C: NS=LEVEL_8_D;
		LEVEL_8_D: NS=LEVEL_8_E;
		LEVEL_8_E: NS=LEVEL_8_F;
		LEVEL_8_F: NS=LEVEL_8_G;
		LEVEL_8_G: NS=LEVEL_8_H;
		LEVEL_8_H: NS=LEVEL_8_CHECK_A;
		LEVEL_8_CHECK_A: begin
								if(userIn[2]==1'b0)
									NS=LEVEL_8_CHECK_B;
								else if(userIn[3]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
								else
									NS=LEVEL_8_CHECK_A;
							  end
		LEVEL_8_CHECK_B: begin
									if(userIn[3]==1'b0)
										NS = LEVEL_8_CHECK_C;
									else if(userIn[2]^userIn[1]^userIn[0]==1'b0)
										NS=DONE;
									else
										NS=LEVEL_8_CHECK_B;
								end
		LEVEL_8_CHECK_C: begin
								if(userIn[2]==1'b0)
									NS=LEVEL_8_CHECK_D;
								else if(userIn[3]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_8_CHECK_C;
								end
		LEVEL_8_CHECK_D: begin
								if(userIn[0]==1'b0)
									NS=LEVEL_8_CHECK_E;
								else if(userIn[3]^userIn[2]^userIn[1]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_8_CHECK_D;
								end
		LEVEL_8_CHECK_E: begin
								if(userIn[3]==1'b0)
									NS=LEVEL_8_CHECK_F;
								else if(userIn[2]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_8_CHECK_E;
								end						
		LEVEL_8_CHECK_F: begin
								if(userIn[0]==1'b0)
									NS=LEVEL_8_CHECK_G;
								else if(userIn[3]^userIn[2]^userIn[1]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_8_CHECK_F;
								end						
		LEVEL_8_CHECK_G: begin
								if(userIn[2]==1'b0)
									NS=LEVEL_8_CHECK_H;
								else if(userIn[3]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_8_CHECK_G;
								end
		LEVEL_8_CHECK_H: begin
								if(userIn[3]==1'b0)
									NS=LEVEL_9_A;
								else if(userIn[2]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_8_CHECK_H;
								end
		LEVEL_9_A: NS=LEVEL_9_B;
		LEVEL_9_B: NS=LEVEL_9_C;
		LEVEL_9_C: NS=LEVEL_9_D;
		LEVEL_9_D: NS=LEVEL_9_E;
		LEVEL_9_E: NS=LEVEL_9_F;
		LEVEL_9_F: NS=LEVEL_9_G;
		LEVEL_9_G: NS=LEVEL_9_H;
		LEVEL_9_H: NS=LEVEL_9_I;
		LEVEL_9_I: NS=LEVEL_9_CHECK_A;
		LEVEL_9_CHECK_A: begin
								if(userIn[2]==1'b0)
									NS=LEVEL_9_CHECK_B;
								else if(userIn[3]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
								else
									NS=LEVEL_9_CHECK_A;
							  end
		LEVEL_9_CHECK_B: begin
									if(userIn[3]==1'b0)
										NS = LEVEL_9_CHECK_C;
									else if(userIn[2]^userIn[1]^userIn[0]==1'b0)
										NS=DONE;
									else
										NS=LEVEL_9_CHECK_B;
								end
		LEVEL_9_CHECK_C: begin
								if(userIn[2]==1'b0)
									NS=LEVEL_9_CHECK_D;
								else if(userIn[3]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_9_CHECK_C;
								end
		LEVEL_9_CHECK_D: begin
								if(userIn[0]==1'b0)
									NS=LEVEL_9_CHECK_E;
								else if(userIn[3]^userIn[2]^userIn[1]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_9_CHECK_D;
								end
		LEVEL_9_CHECK_E: begin
								if(userIn[3]==1'b0)
									NS=LEVEL_9_CHECK_F;
								else if(userIn[2]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_9_CHECK_E;
								end						
		LEVEL_9_CHECK_F: begin
								if(userIn[0]==1'b0)
									NS=LEVEL_9_CHECK_G;
								else if(userIn[3]^userIn[2]^userIn[1]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_9_CHECK_F;
								end						
		LEVEL_9_CHECK_G: begin
								if(userIn[2]==1'b0)
									NS=LEVEL_9_CHECK_H;
								else if(userIn[3]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_9_CHECK_G;
								end
		LEVEL_9_CHECK_H: begin
								if(userIn[3]==1'b0)
									NS=LEVEL_9_CHECK_I;
								else if(userIn[2]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_9_CHECK_H;
								end
		LEVEL_9_CHECK_I: begin
								if(userIn[1]==1'b0)
									NS=LEVEL_10_A;
								else if(userIn[3]^userIn[2]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_9_CHECK_I;
								end
		LEVEL_10_A: NS=LEVEL_10_B;
		LEVEL_10_B: NS=LEVEL_10_C;
		LEVEL_10_C: NS=LEVEL_10_D;
		LEVEL_10_D: NS=LEVEL_10_E;
		LEVEL_10_E: NS=LEVEL_10_F;
		LEVEL_10_F: NS=LEVEL_10_G;
		LEVEL_10_G: NS=LEVEL_10_H;
		LEVEL_10_H: NS=LEVEL_10_I;
		LEVEL_10_I: NS=LEVEL_10_J;
		LEVEL_10_J: NS=LEVEL_10_CHECK_A;
		LEVEL_10_CHECK_A: begin
								if(userIn[2]==1'b0)
									NS=LEVEL_10_CHECK_B;
								else if(userIn[3]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
								else
									NS=LEVEL_10_CHECK_A;
							  end
		LEVEL_10_CHECK_B: begin
									if(userIn[3]==1'b0)
										NS = LEVEL_10_CHECK_C;
									else if(userIn[2]^userIn[1]^userIn[0]==1'b0)
										NS=DONE;
									else
										NS=LEVEL_10_CHECK_B;
								end
		LEVEL_10_CHECK_C: begin
								if(userIn[2]==1'b0)
									NS=LEVEL_10_CHECK_D;
								else if(userIn[3]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_10_CHECK_C;
								end
		LEVEL_10_CHECK_D: begin
								if(userIn[0]==1'b0)
									NS=LEVEL_10_CHECK_E;
								else if(userIn[3]^userIn[2]^userIn[1]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_10_CHECK_D;
								end
		LEVEL_10_CHECK_E: begin
								if(userIn[3]==1'b0)
									NS=LEVEL_10_CHECK_F;
								else if(userIn[2]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_10_CHECK_E;
								end						
		LEVEL_10_CHECK_F: begin
								if(userIn[0]==1'b0)
									NS=LEVEL_10_CHECK_G;
								else if(userIn[3]^userIn[2]^userIn[1]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_10_CHECK_F;
								end						
		LEVEL_10_CHECK_G: begin
								if(userIn[2]==1'b0)
									NS=LEVEL_10_CHECK_H;
								else if(userIn[3]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_10_CHECK_G;
								end
		LEVEL_10_CHECK_H: begin
								if(userIn[3]==1'b0)
									NS=LEVEL_10_CHECK_I;
								else if(userIn[2]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_10_CHECK_H;
								end
		LEVEL_10_CHECK_I: begin
								if(userIn[1]==1'b0)
									NS=LEVEL_10_CHECK_J;
								else if(userIn[3]^userIn[2]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_10_CHECK_I;
								end
		LEVEL_10_CHECK_J: begin
								if(userIn[2]==1'b0)
									NS=LEVEL_11_A;
								else if(userIn[3]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_10_CHECK_J;
								end
		LEVEL_11_A: NS=LEVEL_11_B;
		LEVEL_11_B: NS=LEVEL_11_C;
		LEVEL_11_C: NS=LEVEL_11_D;
		LEVEL_11_D: NS=LEVEL_11_E;
		LEVEL_11_E: NS=LEVEL_11_F;
		LEVEL_11_F: NS=LEVEL_11_G;
		LEVEL_11_G: NS=LEVEL_11_H;
		LEVEL_11_H: NS=LEVEL_11_I;
		LEVEL_11_I: NS=LEVEL_11_J;
		LEVEL_11_J: NS=LEVEL_11_K;
		LEVEL_11_K: NS=LEVEL_11_CHECK_A;
		LEVEL_11_CHECK_A: begin
								if(userIn[2]==1'b0)
									NS=LEVEL_11_CHECK_B;
								else if(userIn[3]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
								else
									NS=LEVEL_11_CHECK_A;
							  end
		LEVEL_11_CHECK_B: begin
									if(userIn[3]==1'b0)
										NS = LEVEL_11_CHECK_C;
									else if(userIn[2]^userIn[1]^userIn[0]==1'b0)
										NS=DONE;
									else
										NS=LEVEL_11_CHECK_B;
								end
		LEVEL_11_CHECK_C: begin
								if(userIn[2]==1'b0)
									NS=LEVEL_11_CHECK_D;
								else if(userIn[3]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_11_CHECK_C;
								end
		LEVEL_11_CHECK_D: begin
								if(userIn[0]==1'b0)
									NS=LEVEL_11_CHECK_E;
								else if(userIn[3]^userIn[2]^userIn[1]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_11_CHECK_D;
								end
		LEVEL_11_CHECK_E: begin
								if(userIn[3]==1'b0)
									NS=LEVEL_11_CHECK_F;
								else if(userIn[2]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_11_CHECK_E;
								end						
		LEVEL_11_CHECK_F: begin
								if(userIn[0]==1'b0)
									NS=LEVEL_11_CHECK_G;
								else if(userIn[3]^userIn[2]^userIn[1]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_11_CHECK_F;
								end						
		LEVEL_11_CHECK_G: begin
								if(userIn[2]==1'b0)
									NS=LEVEL_11_CHECK_H;
								else if(userIn[3]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_11_CHECK_G;
								end
		LEVEL_11_CHECK_H: begin
								if(userIn[3]==1'b0)
									NS=LEVEL_11_CHECK_I;
								else if(userIn[2]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_11_CHECK_H;
								end
		LEVEL_11_CHECK_I: begin
								if(userIn[1]==1'b0)
									NS=LEVEL_11_CHECK_J;
								else if(userIn[3]^userIn[2]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_11_CHECK_I;
								end
		LEVEL_11_CHECK_J: begin
								if(userIn[2]==1'b0)
									NS=LEVEL_11_CHECK_K;
								else if(userIn[3]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_11_CHECK_J;
								end
		LEVEL_11_CHECK_K: begin
								if(userIn[0]==1'b0)
									NS=LEVEL_12_A;
								else if(userIn[3]^userIn[2]^userIn[1]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_11_CHECK_K;
								end
		LEVEL_12_A: NS=LEVEL_12_B;
		LEVEL_12_B: NS=LEVEL_12_C;
		LEVEL_12_C: NS=LEVEL_12_D;
		LEVEL_12_D: NS=LEVEL_12_E;
		LEVEL_12_E: NS=LEVEL_12_F;
		LEVEL_12_F: NS=LEVEL_12_G;
		LEVEL_12_G: NS=LEVEL_12_H;
		LEVEL_12_H: NS=LEVEL_12_I;
		LEVEL_12_I: NS=LEVEL_12_J;
		LEVEL_12_J: NS=LEVEL_12_K;
		LEVEL_12_K: NS=LEVEL_12_L;
		LEVEL_12_L: NS=LEVEL_12_CHECK_A;
		LEVEL_12_CHECK_A: begin
								if(userIn[2]==1'b0)
									NS=LEVEL_12_CHECK_B;
								else if(userIn[3]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
								else
									NS=LEVEL_12_CHECK_A;
							  end
		LEVEL_12_CHECK_B: begin
									if(userIn[3]==1'b0)
										NS = LEVEL_12_CHECK_C;
									else if(userIn[2]^userIn[1]^userIn[0]==1'b0)
										NS=DONE;
									else
										NS=LEVEL_12_CHECK_B;
								end
		LEVEL_12_CHECK_C: begin
								if(userIn[2]==1'b0)
									NS=LEVEL_12_CHECK_D;
								else if(userIn[3]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_12_CHECK_C;
								end
		LEVEL_12_CHECK_D: begin
								if(userIn[0]==1'b0)
									NS=LEVEL_12_CHECK_E;
								else if(userIn[3]^userIn[2]^userIn[1]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_12_CHECK_D;
								end
		LEVEL_12_CHECK_E: begin
								if(userIn[3]==1'b0)
									NS=LEVEL_12_CHECK_F;
								else if(userIn[2]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_12_CHECK_E;
								end						
		LEVEL_12_CHECK_F: begin
								if(userIn[0]==1'b0)
									NS=LEVEL_12_CHECK_G;
								else if(userIn[3]^userIn[2]^userIn[1]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_12_CHECK_F;
								end						
		LEVEL_12_CHECK_G: begin
								if(userIn[2]==1'b0)
									NS=LEVEL_12_CHECK_H;
								else if(userIn[3]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_12_CHECK_G;
								end
		LEVEL_12_CHECK_H: begin
								if(userIn[3]==1'b0)
									NS=LEVEL_12_CHECK_I;
								else if(userIn[2]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_12_CHECK_H;
								end
		LEVEL_12_CHECK_I: begin
								if(userIn[1]==1'b0)
									NS=LEVEL_12_CHECK_J;
								else if(userIn[3]^userIn[2]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_12_CHECK_I;
								end
		LEVEL_12_CHECK_J: begin
								if(userIn[2]==1'b0)
									NS=LEVEL_12_CHECK_K;
								else if(userIn[3]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_12_CHECK_J;
								end
		LEVEL_12_CHECK_K: begin
								if(userIn[0]==1'b0)
									NS=LEVEL_12_CHECK_L;
								else if(userIn[3]^userIn[2]^userIn[1]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_12_CHECK_K;
								end
		LEVEL_12_CHECK_L: begin
								if(userIn[3]==1'b0)
									NS=LEVEL_13_A;
								else if(userIn[2]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_12_CHECK_L;
								end
		LEVEL_13_A: NS=LEVEL_13_B;
		LEVEL_13_B: NS=LEVEL_13_C;
		LEVEL_13_C: NS=LEVEL_13_D;
		LEVEL_13_D: NS=LEVEL_13_E;
		LEVEL_13_E: NS=LEVEL_13_F;
		LEVEL_13_F: NS=LEVEL_13_G;
		LEVEL_13_G: NS=LEVEL_13_H;
		LEVEL_13_H: NS=LEVEL_13_I;
		LEVEL_13_I: NS=LEVEL_13_J;
		LEVEL_13_J: NS=LEVEL_13_K;
		LEVEL_13_K: NS=LEVEL_13_L;
		LEVEL_13_L: NS=LEVEL_13_M;
		LEVEL_13_M: NS=LEVEL_13_CHECK_A;
		LEVEL_13_CHECK_A: begin
								if(userIn[2]==1'b0)
									NS=LEVEL_13_CHECK_B;
								else if(userIn[3]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
								else
									NS=LEVEL_13_CHECK_A;
							  end
		LEVEL_13_CHECK_B: begin
									if(userIn[3]==1'b0)
										NS = LEVEL_13_CHECK_C;
									else if(userIn[2]^userIn[1]^userIn[0]==1'b0)
										NS=DONE;
									else
										NS=LEVEL_13_CHECK_B;
								end
		LEVEL_13_CHECK_C: begin
								if(userIn[2]==1'b0)
									NS=LEVEL_13_CHECK_D;
								else if(userIn[3]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_13_CHECK_C;
								end
		LEVEL_13_CHECK_D: begin
								if(userIn[0]==1'b0)
									NS=LEVEL_13_CHECK_E;
								else if(userIn[3]^userIn[2]^userIn[1]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_13_CHECK_D;
								end
		LEVEL_13_CHECK_E: begin
								if(userIn[3]==1'b0)
									NS=LEVEL_13_CHECK_F;
								else if(userIn[2]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_13_CHECK_E;
								end						
		LEVEL_13_CHECK_F: begin
								if(userIn[0]==1'b0)
									NS=LEVEL_13_CHECK_G;
								else if(userIn[3]^userIn[2]^userIn[1]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_13_CHECK_F;
								end						
		LEVEL_13_CHECK_G: begin
								if(userIn[2]==1'b0)
									NS=LEVEL_13_CHECK_H;
								else if(userIn[3]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_13_CHECK_G;
								end
		LEVEL_13_CHECK_H: begin
								if(userIn[3]==1'b0)
									NS=LEVEL_13_CHECK_I;
								else if(userIn[2]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_13_CHECK_H;
								end
		LEVEL_13_CHECK_I: begin
								if(userIn[1]==1'b0)
									NS=LEVEL_13_CHECK_J;
								else if(userIn[3]^userIn[2]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_13_CHECK_I;
								end
		LEVEL_13_CHECK_J: begin
								if(userIn[2]==1'b0)
									NS=LEVEL_13_CHECK_K;
								else if(userIn[3]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_13_CHECK_J;
								end
		LEVEL_13_CHECK_K: begin
								if(userIn[0]==1'b0)
									NS=LEVEL_13_CHECK_L;
								else if(userIn[3]^userIn[2]^userIn[1]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_13_CHECK_K;
								end
		LEVEL_13_CHECK_L: begin
								if(userIn[3]==1'b0)
									NS=LEVEL_13_CHECK_M;
								else if(userIn[2]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_13_CHECK_L;
								end
		LEVEL_13_CHECK_M: begin
								if(userIn[2]==1'b0)
									NS=LEVEL_14_A;
								else if(userIn[3]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_13_CHECK_M;
								end
		LEVEL_14_A: NS=LEVEL_14_B;
		LEVEL_14_B: NS=LEVEL_14_C;
		LEVEL_14_C: NS=LEVEL_14_D;
		LEVEL_14_D: NS=LEVEL_14_E;
		LEVEL_14_E: NS=LEVEL_14_F;
		LEVEL_14_F: NS=LEVEL_14_G;
		LEVEL_14_G: NS=LEVEL_14_H;
		LEVEL_14_H: NS=LEVEL_14_I;
		LEVEL_14_I: NS=LEVEL_14_J;
		LEVEL_14_J: NS=LEVEL_14_K;
		LEVEL_14_K: NS=LEVEL_14_L;
		LEVEL_14_L: NS=LEVEL_14_M;
		LEVEL_14_M: NS=LEVEL_14_N;
		LEVEL_14_N: NS=LEVEL_14_CHECK_A;
		LEVEL_14_CHECK_A: begin
								if(userIn[2]==1'b0)
									NS=LEVEL_14_CHECK_B;
								else if(userIn[3]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
								else
									NS=LEVEL_14_CHECK_A;
							  end
		LEVEL_14_CHECK_B: begin
									if(userIn[3]==1'b0)
										NS = LEVEL_14_CHECK_C;
									else if(userIn[2]^userIn[1]^userIn[0]==1'b0)
										NS=DONE;
									else
										NS=LEVEL_14_CHECK_B;
								end
		LEVEL_14_CHECK_C: begin
								if(userIn[2]==1'b0)
									NS=LEVEL_14_CHECK_D;
								else if(userIn[3]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_14_CHECK_C;
								end
		LEVEL_14_CHECK_D: begin
								if(userIn[0]==1'b0)
									NS=LEVEL_14_CHECK_E;
								else if(userIn[3]^userIn[2]^userIn[1]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_14_CHECK_D;
								end
		LEVEL_14_CHECK_E: begin
								if(userIn[3]==1'b0)
									NS=LEVEL_14_CHECK_F;
								else if(userIn[2]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_14_CHECK_E;
								end						
		LEVEL_14_CHECK_F: begin
								if(userIn[0]==1'b0)
									NS=LEVEL_14_CHECK_G;
								else if(userIn[3]^userIn[2]^userIn[1]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_14_CHECK_F;
								end						
		LEVEL_14_CHECK_G: begin
								if(userIn[2]==1'b0)
									NS=LEVEL_14_CHECK_H;
								else if(userIn[3]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_14_CHECK_G;
								end
		LEVEL_14_CHECK_H: begin
								if(userIn[3]==1'b0)
									NS=LEVEL_14_CHECK_I;
								else if(userIn[2]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_14_CHECK_H;
								end
		LEVEL_14_CHECK_I: begin
								if(userIn[1]==1'b0)
									NS=LEVEL_14_CHECK_J;
								else if(userIn[3]^userIn[2]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_14_CHECK_I;
								end
		LEVEL_14_CHECK_J: begin
								if(userIn[2]==1'b0)
									NS=LEVEL_14_CHECK_K;
								else if(userIn[3]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_14_CHECK_J;
								end
		LEVEL_14_CHECK_K: begin
								if(userIn[0]==1'b0)
									NS=LEVEL_14_CHECK_L;
								else if(userIn[3]^userIn[2]^userIn[1]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_14_CHECK_K;
								end
		LEVEL_14_CHECK_L: begin
								if(userIn[3]==1'b0)
									NS=LEVEL_14_CHECK_M;
								else if(userIn[2]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_14_CHECK_L;
								end
		LEVEL_14_CHECK_M: begin
								if(userIn[2]==1'b0)
									NS=LEVEL_14_CHECK_N;
								else if(userIn[3]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_14_CHECK_M;
								end
		LEVEL_14_CHECK_N: begin
								if(userIn[3]==1'b0)
									NS=LEVEL_15_A;
								else if(userIn[2]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_14_CHECK_N;
								end
		LEVEL_15_A: NS=LEVEL_15_B;
		LEVEL_15_B: NS=LEVEL_15_C;
		LEVEL_15_C: NS=LEVEL_15_D;
		LEVEL_15_D: NS=LEVEL_15_E;
		LEVEL_15_E: NS=LEVEL_15_F;
		LEVEL_15_F: NS=LEVEL_15_G;
		LEVEL_15_G: NS=LEVEL_15_H;
		LEVEL_15_H: NS=LEVEL_15_I;
		LEVEL_15_I: NS=LEVEL_15_J;
		LEVEL_15_J: NS=LEVEL_15_K;
		LEVEL_15_K: NS=LEVEL_15_L;
		LEVEL_15_L: NS=LEVEL_15_M;
		LEVEL_15_M: NS=LEVEL_15_N;
		LEVEL_15_N: NS=LEVEL_15_O;
		LEVEL_15_O: NS=LEVEL_15_CHECK_A;
		LEVEL_15_CHECK_A: begin
								if(userIn[2]==1'b0)
									NS=LEVEL_15_CHECK_B;
								else if(userIn[3]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
								else
									NS=LEVEL_15_CHECK_A;
							  end
		LEVEL_15_CHECK_B: begin
									if(userIn[3]==1'b0)
										NS = LEVEL_15_CHECK_C;
									else if(userIn[2]^userIn[1]^userIn[0]==1'b0)
										NS=DONE;
									else
										NS=LEVEL_15_CHECK_B;
								end
		LEVEL_15_CHECK_C: begin
								if(userIn[2]==1'b0)
									NS=LEVEL_15_CHECK_D;
								else if(userIn[3]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_15_CHECK_C;
								end
		LEVEL_15_CHECK_D: begin
								if(userIn[0]==1'b0)
									NS=LEVEL_15_CHECK_E;
								else if(userIn[3]^userIn[2]^userIn[1]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_15_CHECK_D;
								end
		LEVEL_15_CHECK_E: begin
								if(userIn[3]==1'b0)
									NS=LEVEL_15_CHECK_F;
								else if(userIn[2]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_15_CHECK_E;
								end						
		LEVEL_15_CHECK_F: begin
								if(userIn[0]==1'b0)
									NS=LEVEL_15_CHECK_G;
								else if(userIn[3]^userIn[2]^userIn[1]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_15_CHECK_F;
								end						
		LEVEL_15_CHECK_G: begin
								if(userIn[2]==1'b0)
									NS=LEVEL_15_CHECK_H;
								else if(userIn[3]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_15_CHECK_G;
								end
		LEVEL_15_CHECK_H: begin
								if(userIn[3]==1'b0)
									NS=LEVEL_15_CHECK_I;
								else if(userIn[2]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_15_CHECK_H;
								end
		LEVEL_15_CHECK_I: begin
								if(userIn[1]==1'b0)
									NS=LEVEL_15_CHECK_J;
								else if(userIn[3]^userIn[2]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_15_CHECK_I;
								end
		LEVEL_15_CHECK_J: begin
								if(userIn[2]==1'b0)
									NS=LEVEL_15_CHECK_K;
								else if(userIn[3]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_15_CHECK_J;
								end
		LEVEL_15_CHECK_K: begin
								if(userIn[0]==1'b0)
									NS=LEVEL_15_CHECK_L;
								else if(userIn[3]^userIn[2]^userIn[1]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_15_CHECK_K;
								end
		LEVEL_15_CHECK_L: begin
								if(userIn[3]==1'b0)
									NS=LEVEL_15_CHECK_M;
								else if(userIn[2]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_15_CHECK_L;
								end
		LEVEL_15_CHECK_M: begin
								if(userIn[2]==1'b0)
									NS=LEVEL_15_CHECK_N;
								else if(userIn[3]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_15_CHECK_M;
								end
		LEVEL_15_CHECK_N: begin
								if(userIn[3]==1'b0)
									NS=LEVEL_15_CHECK_O;
								else if(userIn[2]^userIn[1]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_15_CHECK_N;
								end
		LEVEL_15_CHECK_O: begin
								if(userIn[1]==1'b0)
									NS=DONE;
								else if(userIn[3]^userIn[2]^userIn[0]==1'b0)
									NS=DONE;
									else
										NS=LEVEL_15_CHECK_O;
								end
		DONE: NS=DONE;
		
		endcase
	end


always @ (posedge clk_out or negedge rst)
	begin
		case (S)
		START: begin
					if(rst==1'b0)
						led<=4'b0000;
						led_fail<=6'b000000;
				 end
				 
		LEVEL_1: led<=light_seq0;
		
		LEVEL_1_CHECK: led<=4'b0000;
		
		LEVEL_2_A: led<=light_seq0;
		LEVEL_2_B: led<=light_seq1;
		
		LEVEL_2_CHECK_A: led<=4'b0000;
		LEVEL_2_CHECK_B: led<=4'b0000;
		
		LEVEL_3_A:led<=light_seq0;
		LEVEL_3_B:led<=light_seq1;
		LEVEL_3_C:led<=light_seq2;
		
		LEVEL_3_CHECK_A: led<=4'b0000;
		LEVEL_3_CHECK_B: led<=4'b0000;
		LEVEL_3_CHECK_C: led<=4'b0000;
		
		LEVEL_4_A: led<=light_seq0;
		LEVEL_4_B: led<=light_seq1;
		LEVEL_4_C: led<=light_seq2;
		LEVEL_4_D: led<=light_seq3;
						
		LEVEL_4_CHECK_A: led<=4'b0000;
		LEVEL_4_CHECK_B: led<=4'b0000;
		LEVEL_4_CHECK_C: led<=4'b0000;					  
		LEVEL_4_CHECK_D: led<=4'b0000;
		
		LEVEL_5_A: led<=light_seq0;
		LEVEL_5_B: led<=light_seq1;
		LEVEL_5_C: led<=light_seq2;
		LEVEL_5_D: led<=light_seq3;
		LEVEL_5_E: led<=light_seq4;
		
		LEVEL_5_CHECK_A: led<=4'b0000;
		LEVEL_5_CHECK_B: led<=4'b0000;
		LEVEL_5_CHECK_C: led<=4'b0000;				  
		LEVEL_5_CHECK_D: led<=4'b0000;
		LEVEL_5_CHECK_E: led<=4'b0000;
							  
		LEVEL_6_A: led<=light_seq0;
		LEVEL_6_B: led<=light_seq1;
		LEVEL_6_C: led<=light_seq2;
		LEVEL_6_D: led<=light_seq3;
		LEVEL_6_E: led<=light_seq4;
		LEVEL_6_F: led<=light_seq5;
		
		LEVEL_6_CHECK_A: led<=4'b0000;
		LEVEL_6_CHECK_B: led<=4'b0000;
		LEVEL_6_CHECK_C: led<=4'b0000;				  
		LEVEL_6_CHECK_D: led<=4'b0000;
		LEVEL_6_CHECK_E: led<=4'b0000;
		LEVEL_6_CHECK_F: led<=4'b0000;
		
		
		LEVEL_7_A: led<=light_seq0;
		LEVEL_7_B: led<=light_seq1;
		LEVEL_7_C: led<=light_seq2;
		LEVEL_7_D: led<=light_seq3;
		LEVEL_7_E: led<=light_seq4;
		LEVEL_7_F: led<=light_seq5;
		LEVEL_7_G: led<=light_seq6;
		
		LEVEL_7_CHECK_A: led<=4'b0000;
		LEVEL_7_CHECK_B: led<=4'b0000;
		LEVEL_7_CHECK_C: led<=4'b0000;
		LEVEL_7_CHECK_D: led<=4'b0000;
		LEVEL_7_CHECK_E: led<=4'b0000;
		LEVEL_7_CHECK_F: led<=4'b0000;
		LEVEL_7_CHECK_G: led<=4'b0000;
		
		LEVEL_8_A: led<=light_seq0;
		LEVEL_8_B: led<=light_seq1;
		LEVEL_8_C: led<=light_seq2;
		LEVEL_8_D: led<=light_seq3;
		LEVEL_8_E: led<=light_seq4;
		LEVEL_8_F: led<=light_seq5;
		LEVEL_8_G: led<=light_seq6;
		LEVEL_8_H: led<=light_seq7;
		
		LEVEL_8_CHECK_A: led<=4'b0000;
		LEVEL_8_CHECK_B: led<=4'b0000;
		LEVEL_8_CHECK_C: led<=4'b0000;
		LEVEL_8_CHECK_D: led<=4'b0000;
		LEVEL_8_CHECK_E: led<=4'b0000;
		LEVEL_8_CHECK_F: led<=4'b0000;
		LEVEL_8_CHECK_G: led<=4'b0000;
		LEVEL_8_CHECK_H: led<=4'b0000;
		
		LEVEL_9_A: led<=light_seq0;
		LEVEL_9_B: led<=light_seq1;
		LEVEL_9_C: led<=light_seq2;
		LEVEL_9_D: led<=light_seq3;
		LEVEL_9_E: led<=light_seq4;
		LEVEL_9_F: led<=light_seq5;
		LEVEL_9_G: led<=light_seq6;
		LEVEL_9_H: led<=light_seq7;
		LEVEL_9_I: led<=light_seq8;
		
		LEVEL_9_CHECK_A: led<=4'b0000;
		LEVEL_9_CHECK_B: led<=4'b0000;
		LEVEL_9_CHECK_C: led<=4'b0000;
		LEVEL_9_CHECK_D: led<=4'b0000;
		LEVEL_9_CHECK_E: led<=4'b0000;
		LEVEL_9_CHECK_F: led<=4'b0000;
		LEVEL_9_CHECK_G: led<=4'b0000;
		LEVEL_9_CHECK_H: led<=4'b0000;
		LEVEL_9_CHECK_I: led<=4'b0000;
		
		LEVEL_10_A: led<=light_seq0;
		LEVEL_10_B: led<=light_seq1;
		LEVEL_10_C: led<=light_seq2;
		LEVEL_10_D: led<=light_seq3;
		LEVEL_10_E: led<=light_seq4;
		LEVEL_10_F: led<=light_seq5;
		LEVEL_10_G: led<=light_seq6;
		LEVEL_10_H: led<=light_seq7;
		LEVEL_10_I: led<=light_seq8;
		LEVEL_10_J: led<=light_seq9;
		
		LEVEL_10_CHECK_A: led<=4'b0000;
		LEVEL_10_CHECK_B: led<=4'b0000;
		LEVEL_10_CHECK_C: led<=4'b0000;
		LEVEL_10_CHECK_D: led<=4'b0000;
		LEVEL_10_CHECK_E: led<=4'b0000;
		LEVEL_10_CHECK_F: led<=4'b0000;
		LEVEL_10_CHECK_G: led<=4'b0000;
		LEVEL_10_CHECK_H: led<=4'b0000;
		LEVEL_10_CHECK_I: led<=4'b0000;
		LEVEL_10_CHECK_J: led<=4'b0000;
		
		LEVEL_11_A: led<=light_seq0;
		LEVEL_11_B: led<=light_seq1;
		LEVEL_11_C: led<=light_seq2;
		LEVEL_11_D: led<=light_seq3;
		LEVEL_11_E: led<=light_seq4;
		LEVEL_11_F: led<=light_seq5;
		LEVEL_11_G: led<=light_seq6;
		LEVEL_11_H: led<=light_seq7;
		LEVEL_11_I: led<=light_seq8;
		LEVEL_11_J: led<=light_seq9;
		LEVEL_11_K: led<=light_seq10;
		
		LEVEL_11_CHECK_A: led<=4'b0000;
		LEVEL_11_CHECK_B: led<=4'b0000;
		LEVEL_11_CHECK_C: led<=4'b0000;
		LEVEL_11_CHECK_D: led<=4'b0000;
		LEVEL_11_CHECK_E: led<=4'b0000;
		LEVEL_11_CHECK_F: led<=4'b0000;
		LEVEL_11_CHECK_G: led<=4'b0000;
		LEVEL_11_CHECK_H: led<=4'b0000;
		LEVEL_11_CHECK_I: led<=4'b0000;
		LEVEL_11_CHECK_J: led<=4'b0000;
		LEVEL_11_CHECK_K: led<=4'b0000;
		
		LEVEL_12_A: led<=light_seq0;
		LEVEL_12_B: led<=light_seq1;
		LEVEL_12_C: led<=light_seq2;
		LEVEL_12_D: led<=light_seq3;
		LEVEL_12_E: led<=light_seq4;
		LEVEL_12_F: led<=light_seq5;
		LEVEL_12_G: led<=light_seq6;
		LEVEL_12_H: led<=light_seq7;
		LEVEL_12_I: led<=light_seq8;
		LEVEL_12_J: led<=light_seq9;
		LEVEL_12_K: led<=light_seq10;
		LEVEL_12_L: led<=light_seq11;
		
		LEVEL_12_CHECK_A: led<=4'b0000;
		LEVEL_12_CHECK_B: led<=4'b0000;
		LEVEL_12_CHECK_C: led<=4'b0000;
		LEVEL_12_CHECK_D: led<=4'b0000;
		LEVEL_12_CHECK_E: led<=4'b0000;
		LEVEL_12_CHECK_F: led<=4'b0000;
		LEVEL_12_CHECK_G: led<=4'b0000;
		LEVEL_12_CHECK_H: led<=4'b0000;
		LEVEL_12_CHECK_I: led<=4'b0000;
		LEVEL_12_CHECK_J: led<=4'b0000;
		LEVEL_12_CHECK_K: led<=4'b0000;
		LEVEL_12_CHECK_L: led<=4'b0000;
		
		LEVEL_13_A: led<=light_seq0;
		LEVEL_13_B: led<=light_seq1;
		LEVEL_13_C: led<=light_seq2;
		LEVEL_13_D: led<=light_seq3;
		LEVEL_13_E: led<=light_seq4;
		LEVEL_13_F: led<=light_seq5;
		LEVEL_13_G: led<=light_seq6;
		LEVEL_13_H: led<=light_seq7;
		LEVEL_13_I: led<=light_seq8;
		LEVEL_13_J: led<=light_seq9;
		LEVEL_13_K: led<=light_seq10;
		LEVEL_13_L: led<=light_seq11;
		LEVEL_13_M: led<=light_seq12;
		
		LEVEL_13_CHECK_A: led<=4'b0000;
		LEVEL_13_CHECK_B: led<=4'b0000;
		LEVEL_13_CHECK_C: led<=4'b0000;
		LEVEL_13_CHECK_D: led<=4'b0000;
		LEVEL_13_CHECK_E: led<=4'b0000;
		LEVEL_13_CHECK_F: led<=4'b0000;
		LEVEL_13_CHECK_G: led<=4'b0000;
		LEVEL_13_CHECK_H: led<=4'b0000;
		LEVEL_13_CHECK_I: led<=4'b0000;
		LEVEL_13_CHECK_J: led<=4'b0000;
		LEVEL_13_CHECK_K: led<=4'b0000;
		LEVEL_13_CHECK_L: led<=4'b0000;
		LEVEL_13_CHECK_M: led<=4'b0000;
		
		LEVEL_14_A: led<=light_seq0;
		LEVEL_14_B: led<=light_seq1;
		LEVEL_14_C: led<=light_seq2;
		LEVEL_14_D: led<=light_seq3;
		LEVEL_14_E: led<=light_seq4;
		LEVEL_14_F: led<=light_seq5;
		LEVEL_14_G: led<=light_seq6;
		LEVEL_14_H: led<=light_seq7;
		LEVEL_14_I: led<=light_seq8;
		LEVEL_14_J: led<=light_seq9;
		LEVEL_14_K: led<=light_seq10;
		LEVEL_14_L: led<=light_seq11;
		LEVEL_14_M: led<=light_seq12;
		LEVEL_14_N: led<=light_seq13;
		
		LEVEL_14_CHECK_A: led<=4'b0000;
		LEVEL_14_CHECK_B: led<=4'b0000;
		LEVEL_14_CHECK_C: led<=4'b0000;
		LEVEL_14_CHECK_D: led<=4'b0000;
		LEVEL_14_CHECK_E: led<=4'b0000;
		LEVEL_14_CHECK_F: led<=4'b0000;
		LEVEL_14_CHECK_G: led<=4'b0000;
		LEVEL_14_CHECK_H: led<=4'b0000;
		LEVEL_14_CHECK_I: led<=4'b0000;
		LEVEL_14_CHECK_J: led<=4'b0000;
		LEVEL_14_CHECK_K: led<=4'b0000;
		LEVEL_14_CHECK_L: led<=4'b0000;
		LEVEL_14_CHECK_M: led<=4'b0000;
		
		LEVEL_15_A: led<=light_seq0;
		LEVEL_15_B: led<=light_seq1;
		LEVEL_15_C: led<=light_seq2;
		LEVEL_15_D: led<=light_seq3;
		LEVEL_15_E: led<=light_seq4;
		LEVEL_15_F: led<=light_seq5;
		LEVEL_15_G: led<=light_seq6;
		LEVEL_15_H: led<=light_seq7;
		LEVEL_15_I: led<=light_seq8;
		LEVEL_15_J: led<=light_seq9;
		LEVEL_15_K: led<=light_seq10;
		LEVEL_15_L: led<=light_seq11;
		LEVEL_15_M: led<=light_seq12;
		LEVEL_15_N: led<=light_seq13;
		LEVEL_15_O: led<=light_seq14;
		
		LEVEL_15_CHECK_A: led<=4'b0000;
		LEVEL_15_CHECK_B: led<=4'b0000;
		LEVEL_15_CHECK_C: led<=4'b0000;
		LEVEL_15_CHECK_D: led<=4'b0000;
		LEVEL_15_CHECK_E: led<=4'b0000;
		LEVEL_15_CHECK_F: led<=4'b0000;
		LEVEL_15_CHECK_G: led<=4'b0000;
		LEVEL_15_CHECK_H: led<=4'b0000;
		LEVEL_15_CHECK_I: led<=4'b0000;
		LEVEL_15_CHECK_J: led<=4'b0000;
		LEVEL_15_CHECK_K: led<=4'b0000;
		LEVEL_15_CHECK_L: led<=4'b0000;
		LEVEL_15_CHECK_M: led<=4'b0000;
		LEVEL_15_CHECK_O: led<=4'b0000;
		
		DONE: begin
					led_fail<=6'b111111;
					led<=4'b1111;
				end
				
		endcase
	end

endmodule 