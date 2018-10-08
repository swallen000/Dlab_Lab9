`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:03:10 12/24/2016 
// Design Name: 
// Module Name:    Xmas 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Xmas(
	output VGA_RED,
	output VGA_GREEN,
	output VGA_BLUE,
	output VGA_HSYNC,
	output VGA_VSYNC,
	input clk,
	input rst
    );

reg [2:0]color;
reg [10:0]col,row;
reg [25:0]count;
reg flag;
wire visible;
assign {VGA_RED,VGA_GREEN,VGA_BLUE}=color;

//moon x1(.clk(clk),.reset(rst),.VGA_RED(VGA_RED),.VGA_GREEN(VGA_GREEN),.VGA_BLUE(VGA_BLUE),.VGA_HSYNC(VGA_HSYNC),.VGA_VSYNC(VGA_VSYNC));

always@(posedge clk or posedge rst) begin
	if(rst)
		count<=0;
	else if(count==25000000)
		count<=0;
	else 
		count<=count+1;
end

always@(posedge clk or posedge rst) begin
	if(rst)
		flag<=0;
	else if(count==0)
		flag<=!(flag);
	else
		flag<=flag;
end

always@(posedge clk or posedge rst) begin
	if(rst)	col<=0;
	else if(col==1039)	col<=0;
	else	col<=col+1;
end

always@(posedge clk  or posedge rst) begin
	if(rst)	row<=0;
	else if(row==665)	row<=0;
	else if(col==1039)	row<=row+1;
	else	row<=row;
end

assign VGA_HSYNC = ~((col>=919)&(col<1039));
assign VGA_VSYNC = ~((row>=659)&row<665);
assign visible	= ((col>=104)&(col<904)&(row>=23)&(row<623));

reg [2:0]x;
reg [11:0]y5,y6;
always@(posedge flag or posedge rst) begin
	if(rst)
		x<=1;
	else begin
		if(x==5)
			x<=1;
		else
			x<=x+1;
	end
end

always@(posedge flag or posedge rst) begin
	if(rst) 
		y5<=123;
	else begin
		case(x)
			1:	y5<=y5-5;
			2:	y5<=y5+5;
			3:	y5<=y5+5;
			4: y5<=y5-5;
			5: y5<=y5-5;
			default:
				y5<=y5;
		endcase
	end
end

always@(posedge flag or posedge rst) begin
	if(rst) 
		y6<=767;
	else begin
		case(x)
			1:	y6<=y6-5;
			2:	y6<=y6+5;
			3:	y6<=y6+5;
			4: y6<=y6-5;
			5: y6<=y6-5;
			default:
				y6<=y6;
		endcase
	end
end


wire btri1,btri2,btri3,btri4;
assign btri1=((row>=y5-33&row<y5+27)&(col<=240+(row-y5+33)/2)&(col>=240-(row-y5+33)/2));
assign btri2=((row>=y5-13&row<y5+47)&(col<=240+(y5+47-row)/2)&(col>=240-(y5+47-row)/2));
assign btri3=((row>=90&row<150)&(col<=y6+(row-90)/2)&(col>=y6-(row-90)/2));
assign btri4=((row>=110&row<170)&(col<=y6+(170-row)/2)&(col>=y6-(170-row)/2));

wire triangle1,triangle2,triangle3,rectangle;
assign triangle1=((row>=93&&row<173)&(col<=504+(row-93))&(col>=504-(row-93)));
assign triangle2=((row<298&row>=173)&(col<=504+(row-173))&(col>=504-(row-173)));
assign triangle3=((row<473&row>=298)&(col<=504+(row-298))&(col>=504-(row-298)));
assign rectangle=((row>=473&row<623)&(col>=469&col<=539));

reg star_1,star_2,star_3,star_4,star_5,star_6,star_7;
wire [20:0]star1,star2,star3,star4,star5,star6,star7,star8,star9,star10,star11;
assign star1=21'b000000000010000000000;
assign star2=21'b000000000111000000000;
assign star3=21'b000000001111100000000;
assign star4=21'b000000011111110000000;
assign star5=21'b111111111111111111111;
assign star6=21'b001111111111111111100;
assign star7=21'b000001111111111100000;
assign star8=21'b000000111111111000000;
assign star9=21'b000001111101111100000;
assign star10=21'b000111100000001111000;
assign star11=21'b001110000000000011100;
reg test;

/*always@(posedge clk or posedge rst) begin
    if(rst)
        test<=0;
    else begin
        case(row)
          11'd150: begin
            if(col<500&col>=400)begin
              case(col)
                11'd500
            end
    end
end
*/
always@(posedge clk or posedge rst) begin
	if(rst)
		star_1<=0;
	else begin
		case(row)
			11'd87: begin
				case(col)
					11'd494: star_1<=star1[20];
					11'd495: star_1<=star1[19];
					11'd496: star_1<=star1[18];
					11'd497: star_1<=star1[17];
					11'd498: star_1<=star1[16];
					11'd499: star_1<=star1[15];
					11'd500: star_1<=star1[14];
					11'd501: star_1<=star1[13];
					11'd502: star_1<=star1[12];
					11'd503: star_1<=star1[11];
					11'd504: star_1<=star1[10];
					11'd505: star_1<=star1[9];
					11'd506: star_1<=star1[8];
					11'd507: star_1<=star1[7];
					11'd508: star_1<=star1[6];
					11'd509: star_1<=star1[5];
					11'd510: star_1<=star1[4];
					11'd511: star_1<=star1[3];
					11'd512: star_1<=star1[2];
					11'd513: star_1<=star1[1];
					11'd514: star_1<=star1[0];
					default star_1<=0;
				endcase
			end
			11'd88: begin
				case(col)
					11'd494: star_1<=star2[20];
					11'd495: star_1<=star2[19];
					11'd496: star_1<=star2[18];
					11'd497: star_1<=star2[17];
					11'd498: star_1<=star2[16];
					11'd499: star_1<=star2[15];
					11'd500: star_1<=star2[14];
					11'd501: star_1<=star2[13];
					11'd502: star_1<=star2[12];
					11'd503: star_1<=star2[11];
					11'd504: star_1<=star2[10];
					11'd505: star_1<=star2[9];
					11'd506: star_1<=star2[8];
					11'd507: star_1<=star2[7];
					11'd508: star_1<=star2[6];
					11'd509: star_1<=star2[5];
					11'd510: star_1<=star2[4];
					11'd511: star_1<=star2[3];
					11'd512: star_1<=star2[2];
					11'd513: star_1<=star2[1];
					11'd514: star_1<=star2[0];
					default star_1<=0;
				endcase
			end
			11'd89: begin
				case(col)
					11'd494: star_1<=star3[20];
					11'd495: star_1<=star3[19];
					11'd496: star_1<=star3[18];
					11'd497: star_1<=star3[17];
					11'd498: star_1<=star3[16];
					11'd499: star_1<=star3[15];
					11'd500: star_1<=star3[14];
					11'd501: star_1<=star3[13];
					11'd502: star_1<=star3[12];
					11'd503: star_1<=star3[11];
					11'd504: star_1<=star3[10];
					11'd505: star_1<=star3[9];
					11'd506: star_1<=star3[8];
					11'd507: star_1<=star3[7];
					11'd508: star_1<=star3[6];
					11'd509: star_1<=star3[5];
					11'd510: star_1<=star3[4];
					11'd511: star_1<=star3[3];
					11'd512: star_1<=star3[2];
					11'd513: star_1<=star3[1];
					11'd514: star_1<=star3[0];
					default star_1<=0;
				endcase
			end
			11'd90: begin
				case(col)
					11'd494: star_1<=star4[20];
					11'd495: star_1<=star4[19];
					11'd496: star_1<=star4[18];
					11'd497: star_1<=star4[17];
					11'd498: star_1<=star4[16];
					11'd499: star_1<=star4[15];
					11'd500: star_1<=star4[14];
					11'd501: star_1<=star4[13];
					11'd502: star_1<=star4[12];
					11'd503: star_1<=star4[11];
					11'd504: star_1<=star4[10];
					11'd505: star_1<=star4[9];
					11'd506: star_1<=star4[8];
					11'd507: star_1<=star4[7];
					11'd508: star_1<=star4[6];
					11'd509: star_1<=star4[5];
					11'd510: star_1<=star4[4];
					11'd511: star_1<=star4[3];
					11'd512: star_1<=star4[2];
					11'd513: star_1<=star4[1];
					11'd514: star_1<=star4[0];
					default star_1<=0;
				endcase
			end
			11'd91: begin
				case(col)
					11'd494: star_1<=star5[20];
					11'd495: star_1<=star5[19];
					11'd496: star_1<=star5[18];
					11'd497: star_1<=star5[17];
					11'd498: star_1<=star5[16];
					11'd499: star_1<=star5[15];
					11'd500: star_1<=star5[14];
					11'd501: star_1<=star5[13];
					11'd502: star_1<=star5[12];
					11'd503: star_1<=star5[11];
					11'd504: star_1<=star5[10];
					11'd505: star_1<=star5[9];
					11'd506: star_1<=star5[8];
					11'd507: star_1<=star5[7];
					11'd508: star_1<=star5[6];
					11'd509: star_1<=star5[5];
					11'd510: star_1<=star5[4];
					11'd511: star_1<=star5[3];
					11'd512: star_1<=star5[2];
					11'd513: star_1<=star5[1];
					11'd514: star_1<=star5[0];
					default star_1<=0;
				endcase
			end
			11'd92: begin
				case(col)
					11'd494: star_1<=star1[20];
					11'd495: star_1<=star6[19];
					11'd496: star_1<=star6[18];
					11'd497: star_1<=star6[17];
					11'd498: star_1<=star6[16];
					11'd499: star_1<=star6[15];
					11'd500: star_1<=star6[14];
					11'd501: star_1<=star6[13];
					11'd502: star_1<=star6[12];
					11'd503: star_1<=star6[11];
					11'd504: star_1<=star6[10];
					11'd505: star_1<=star6[9];
					11'd506: star_1<=star6[8];
					11'd507: star_1<=star6[7];
					11'd508: star_1<=star6[6];
					11'd509: star_1<=star6[5];
					11'd510: star_1<=star6[4];
					11'd511: star_1<=star6[3];
					11'd512: star_1<=star6[2];
					11'd513: star_1<=star6[1];
					11'd514: star_1<=star6[0];
					default star_1<=0;
				endcase
			end
			11'd93: begin
				case(col)
					11'd494: star_1<=star7[20];
					11'd495: star_1<=star7[19];
					11'd496: star_1<=star7[18];
					11'd497: star_1<=star7[17];
					11'd498: star_1<=star7[16];
					11'd499: star_1<=star7[15];
					11'd500: star_1<=star7[14];
					11'd501: star_1<=star7[13];
					11'd502: star_1<=star7[12];
					11'd503: star_1<=star7[11];
					11'd504: star_1<=star7[10];
					11'd505: star_1<=star7[9];
					11'd506: star_1<=star7[8];
					11'd507: star_1<=star7[7];
					11'd508: star_1<=star7[6];
					11'd509: star_1<=star7[5];
					11'd510: star_1<=star7[4];
					11'd511: star_1<=star7[3];
					11'd512: star_1<=star7[2];
					11'd513: star_1<=star7[1];
					11'd514: star_1<=star7[0];
					default star_1<=0;
				endcase
			end
			11'd94: begin
				case(col)
					11'd494: star_1<=star8[20];
					11'd495: star_1<=star8[19];
					11'd496: star_1<=star8[18];
					11'd497: star_1<=star8[17];
					11'd498: star_1<=star8[16];
					11'd499: star_1<=star8[15];
					11'd500: star_1<=star8[14];
					11'd501: star_1<=star8[13];
					11'd502: star_1<=star8[12];
					11'd503: star_1<=star8[11];
					11'd504: star_1<=star8[10];
					11'd505: star_1<=star8[9];
					11'd506: star_1<=star8[8];
					11'd507: star_1<=star8[7];
					11'd508: star_1<=star8[6];
					11'd509: star_1<=star8[5];
					11'd510: star_1<=star8[4];
					11'd511: star_1<=star8[3];
					11'd512: star_1<=star8[2];
					11'd513: star_1<=star8[1];
					11'd514: star_1<=star8[0];
					default star_1<=0;
				endcase
			end
			11'd95: begin
				case(col)
					11'd494: star_1<=star9[20];
					11'd495: star_1<=star9[19];
					11'd496: star_1<=star9[18];
					11'd497: star_1<=star9[17];
					11'd498: star_1<=star9[16];
					11'd499: star_1<=star9[15];
					11'd500: star_1<=star9[14];
					11'd501: star_1<=star9[13];
					11'd502: star_1<=star9[12];
					11'd503: star_1<=star9[11];
					11'd504: star_1<=star9[10];
					11'd505: star_1<=star9[9];
					11'd506: star_1<=star9[8];
					11'd507: star_1<=star9[7];
					11'd508: star_1<=star9[6];
					11'd509: star_1<=star9[5];
					11'd510: star_1<=star9[4];
					11'd511: star_1<=star9[3];
					11'd512: star_1<=star9[2];
					11'd513: star_1<=star9[1];
					11'd514: star_1<=star9[0];
					default star_1<=0;
				endcase
			end
			11'd96: begin
				case(col)
					11'd494: star_1<=star10[20];
					11'd495: star_1<=star10[19];
					11'd496: star_1<=star10[18];
					11'd497: star_1<=star10[17];
					11'd498: star_1<=star10[16];
					11'd499: star_1<=star10[15];
					11'd500: star_1<=star10[14];
					11'd501: star_1<=star10[13];
					11'd502: star_1<=star10[12];
					11'd503: star_1<=star10[11];
					11'd504: star_1<=star10[10];
					11'd505: star_1<=star10[9];
					11'd506: star_1<=star10[8];
					11'd507: star_1<=star10[7];
					11'd508: star_1<=star10[6];
					11'd509: star_1<=star10[5];
					11'd510: star_1<=star10[4];
					11'd511: star_1<=star10[3];
					11'd512: star_1<=star10[2];
					11'd513: star_1<=star10[1];
					11'd514: star_1<=star10[0];
					default star_1<=0;
				endcase
			end
			11'd97: begin
				case(col)
					11'd494: star_1<=star11[20];
					11'd495: star_1<=star11[19];
					11'd496: star_1<=star11[18];
					11'd497: star_1<=star11[17];
					11'd498: star_1<=star11[16];
					11'd499: star_1<=star11[15];
					11'd500: star_1<=star11[14];
					11'd501: star_1<=star11[13];
					11'd502: star_1<=star11[12];
					11'd503: star_1<=star11[11];
					11'd504: star_1<=star11[10];
					11'd505: star_1<=star11[9];
					11'd506: star_1<=star11[8];
					11'd507: star_1<=star11[7];
					11'd508: star_1<=star11[6];
					11'd509: star_1<=star11[5];
					11'd510: star_1<=star11[4];
					11'd511: star_1<=star11[3];
					11'd512: star_1<=star11[2];
					11'd513: star_1<=star11[1];
					11'd514: star_1<=star11[0];
					default star_1<=0;
				endcase
			end
			default star_1<=0;
		endcase
	end
end

always@(posedge clk or posedge rst) begin
	if(rst)
		star_2<=0;
	else begin
		case(row)
			11'd167: begin
				case(col)
					11'd414: star_2<=star1[20];
					11'd415: star_2<=star1[19];
					11'd416: star_2<=star1[18];
					11'd417: star_2<=star1[17];
					11'd418: star_2<=star1[16];
					11'd419: star_2<=star1[15];
					11'd420: star_2<=star1[14];
					11'd421: star_2<=star1[13];
					11'd422: star_2<=star1[12];
					11'd423: star_2<=star1[11];
					11'd424: star_2<=star1[10];
					11'd425: star_2<=star1[9];
					11'd426: star_2<=star1[8];
					11'd427: star_2<=star1[7];
					11'd428: star_2<=star1[6];
					11'd429: star_2<=star1[5];
					11'd430: star_2<=star1[4];
					11'd431: star_2<=star1[3];
					11'd432: star_2<=star1[2];
					11'd433: star_2<=star1[1];
					11'd434: star_2<=star1[0];
					default star_2<=0;
				endcase
			end
			11'd168: begin
				case(col)
					11'd414: star_2<=star2[20];
					11'd415: star_2<=star2[19];
					11'd416: star_2<=star2[18];
					11'd417: star_2<=star2[17];
					11'd418: star_2<=star2[16];
					11'd419: star_2<=star2[15];
					11'd420: star_2<=star2[14];
					11'd421: star_2<=star2[13];
					11'd422: star_2<=star2[12];
					11'd423: star_2<=star2[11];
					11'd424: star_2<=star2[10];
					11'd425: star_2<=star2[9];
					11'd426: star_2<=star2[8];
					11'd427: star_2<=star2[7];
					11'd428: star_2<=star2[6];
					11'd429: star_2<=star2[5];
					11'd430: star_2<=star2[4];
					11'd431: star_2<=star2[3];
					11'd432: star_2<=star2[2];
					11'd433: star_2<=star2[1];
					11'd434: star_2<=star2[0];
					default star_2<=0;
				endcase
			end
			11'd169: begin
				case(col)
					11'd414: star_2<=star3[20];
					11'd415: star_2<=star3[19];
					11'd416: star_2<=star3[18];
					11'd417: star_2<=star3[17];
					11'd418: star_2<=star3[16];
					11'd419: star_2<=star3[15];
					11'd420: star_2<=star3[14];
					11'd421: star_2<=star3[13];
					11'd422: star_2<=star3[12];
					11'd423: star_2<=star3[11];
					11'd424: star_2<=star3[10];
					11'd425: star_2<=star3[9];
					11'd426: star_2<=star3[8];
					11'd427: star_2<=star3[7];
					11'd428: star_2<=star3[6];
					11'd429: star_2<=star3[5];
					11'd430: star_2<=star3[4];
					11'd431: star_2<=star3[3];
					11'd432: star_2<=star3[2];
					11'd433: star_2<=star3[1];
					11'd434: star_2<=star3[0];
					default star_2<=0;
				endcase
			end
			11'd170: begin
				case(col)
					11'd414: star_2<=star4[20];
					11'd415: star_2<=star4[19];
					11'd416: star_2<=star4[18];
					11'd417: star_2<=star4[17];
					11'd418: star_2<=star4[16];
					11'd419: star_2<=star4[15];
					11'd420: star_2<=star4[14];
					11'd421: star_2<=star4[13];
					11'd422: star_2<=star4[12];
					11'd423: star_2<=star4[11];
					11'd424: star_2<=star4[10];
					11'd425: star_2<=star4[9];
					11'd426: star_2<=star4[8];
					11'd427: star_2<=star4[7];
					11'd428: star_2<=star4[6];
					11'd429: star_2<=star4[5];
					11'd430: star_2<=star4[4];
					11'd431: star_2<=star4[3];
					11'd432: star_2<=star4[2];
					11'd433: star_2<=star4[1];
					11'd434: star_2<=star4[0];
					default star_2<=0;
				endcase
			end
			11'd171: begin
				case(col)
					11'd414: star_2<=star5[20];
					11'd415: star_2<=star5[19];
					11'd416: star_2<=star5[18];
					11'd417: star_2<=star5[17];
					11'd418: star_2<=star5[16];
					11'd419: star_2<=star5[15];
					11'd420: star_2<=star5[14];
					11'd421: star_2<=star5[13];
					11'd422: star_2<=star5[12];
					11'd423: star_2<=star5[11];
					11'd424: star_2<=star5[10];
					11'd425: star_2<=star5[9];
					11'd426: star_2<=star5[8];
					11'd427: star_2<=star5[7];
					11'd428: star_2<=star5[6];
					11'd429: star_2<=star5[5];
					11'd430: star_2<=star5[4];
					11'd431: star_2<=star5[3];
					11'd432: star_2<=star5[2];
					11'd433: star_2<=star5[1];
					11'd434: star_2<=star5[0];
					default star_2<=0;
				endcase
			end
			11'd172: begin
				case(col)
					11'd414: star_2<=star1[20];
					11'd415: star_2<=star6[19];
					11'd416: star_2<=star6[18];
					11'd417: star_2<=star6[17];
					11'd418: star_2<=star6[16];
					11'd419: star_2<=star6[15];
					11'd420: star_2<=star6[14];
					11'd421: star_2<=star6[13];
					11'd422: star_2<=star6[12];
					11'd423: star_2<=star6[11];
					11'd424: star_2<=star6[10];
					11'd425: star_2<=star6[9];
					11'd426: star_2<=star6[8];
					11'd427: star_2<=star6[7];
					11'd428: star_2<=star6[6];
					11'd429: star_2<=star6[5];
					11'd430: star_2<=star6[4];
					11'd431: star_2<=star6[3];
					11'd432: star_2<=star6[2];
					11'd433: star_2<=star6[1];
					11'd434: star_2<=star6[0];
					default star_2<=0;
				endcase
			end
			11'd173: begin
				case(col)
					11'd414: star_2<=star7[20];
					11'd415: star_2<=star7[19];
					11'd416: star_2<=star7[18];
					11'd417: star_2<=star7[17];
					11'd418: star_2<=star7[16];
					11'd419: star_2<=star7[15];
					11'd420: star_2<=star7[14];
					11'd421: star_2<=star7[13];
					11'd422: star_2<=star7[12];
					11'd423: star_2<=star7[11];
					11'd424: star_2<=star7[10];
					11'd425: star_2<=star7[9];
					11'd426: star_2<=star7[8];
					11'd427: star_2<=star7[7];
					11'd428: star_2<=star7[6];
					11'd429: star_2<=star7[5];
					11'd430: star_2<=star7[4];
					11'd431: star_2<=star7[3];
					11'd432: star_2<=star7[2];
					11'd433: star_2<=star7[1];
					11'd434: star_2<=star7[0];
					default star_2<=0;
				endcase
			end
			11'd174: begin
				case(col)
					11'd414: star_2<=star8[20];
					11'd415: star_2<=star8[19];
					11'd416: star_2<=star8[18];
					11'd417: star_2<=star8[17];
					11'd418: star_2<=star8[16];
					11'd419: star_2<=star8[15];
					11'd420: star_2<=star8[14];
					11'd421: star_2<=star8[13];
					11'd422: star_2<=star8[12];
					11'd423: star_2<=star8[11];
					11'd424: star_2<=star8[10];
					11'd425: star_2<=star8[9];
					11'd426: star_2<=star8[8];
					11'd427: star_2<=star8[7];
					11'd428: star_2<=star8[6];
					11'd429: star_2<=star8[5];
					11'd430: star_2<=star8[4];
					11'd431: star_2<=star8[3];
					11'd432: star_2<=star8[2];
					11'd433: star_2<=star8[1];
					11'd434: star_2<=star8[0];
					default star_2<=0;
				endcase
			end
			11'd175: begin
				case(col)
					11'd414: star_2<=star9[20];
					11'd415: star_2<=star9[19];
					11'd416: star_2<=star9[18];
					11'd417: star_2<=star9[17];
					11'd418: star_2<=star9[16];
					11'd419: star_2<=star9[15];
					11'd420: star_2<=star9[14];
					11'd421: star_2<=star9[13];
					11'd422: star_2<=star9[12];
					11'd423: star_2<=star9[11];
					11'd424: star_2<=star9[10];
					11'd425: star_2<=star9[9];
					11'd426: star_2<=star9[8];
					11'd427: star_2<=star9[7];
					11'd428: star_2<=star9[6];
					11'd429: star_2<=star9[5];
					11'd430: star_2<=star9[4];
					11'd431: star_2<=star9[3];
					11'd432: star_2<=star9[2];
					11'd433: star_2<=star9[1];
					11'd434: star_2<=star9[0];
					default star_2<=0;
				endcase
			end
			11'd176: begin
				case(col)
					11'd414: star_2<=star10[20];
					11'd415: star_2<=star10[19];
					11'd416: star_2<=star10[18];
					11'd417: star_2<=star10[17];
					11'd418: star_2<=star10[16];
					11'd419: star_2<=star10[15];
					11'd420: star_2<=star10[14];
					11'd421: star_2<=star10[13];
					11'd422: star_2<=star10[12];
					11'd423: star_2<=star10[11];
					11'd424: star_2<=star10[10];
					11'd425: star_2<=star10[9];
					11'd426: star_2<=star10[8];
					11'd427: star_2<=star10[7];
					11'd428: star_2<=star10[6];
					11'd429: star_2<=star10[5];
					11'd430: star_2<=star10[4];
					11'd431: star_2<=star10[3];
					11'd432: star_2<=star10[2];
					11'd433: star_2<=star10[1];
					11'd434: star_2<=star10[0];
					default star_2<=0;
				endcase
			end
			11'd177: begin
				case(col)
					11'd414: star_2<=star11[20];
					11'd415: star_2<=star11[19];
					11'd416: star_2<=star11[18];
					11'd417: star_2<=star11[17];
					11'd418: star_2<=star11[16];
					11'd419: star_2<=star11[15];
					11'd420: star_2<=star11[14];
					11'd421: star_2<=star11[13];
					11'd422: star_2<=star11[12];
					11'd423: star_2<=star11[11];
					11'd424: star_2<=star11[10];
					11'd425: star_2<=star11[9];
					11'd426: star_2<=star11[8];
					11'd427: star_2<=star11[7];
					11'd428: star_2<=star11[6];
					11'd429: star_2<=star11[5];
					11'd430: star_2<=star11[4];
					11'd431: star_2<=star11[3];
					11'd432: star_2<=star11[2];
					11'd433: star_2<=star11[1];
					11'd434: star_2<=star11[0];
					default star_2<=0;
				endcase
			end
			default star_2<=0;
		endcase
	end
end

always@(posedge clk or posedge rst) begin
	if(rst)
		star_3<=0;
	else begin
		case(row)
			11'd167: begin
				case(col)
					11'd574: star_3<=star1[20];
					11'd575: star_3<=star1[19];
					11'd576: star_3<=star1[18];
					11'd577: star_3<=star1[17];
					11'd578: star_3<=star1[16];
					11'd579: star_3<=star1[15];
					11'd580: star_3<=star1[14];
					11'd581: star_3<=star1[13];
					11'd582: star_3<=star1[12];
					11'd583: star_3<=star1[11];
					11'd584: star_3<=star1[10];
					11'd585: star_3<=star1[9];
					11'd586: star_3<=star1[8];
					11'd587: star_3<=star1[7];
					11'd588: star_3<=star1[6];
					11'd589: star_3<=star1[5];
					11'd590: star_3<=star1[4];
					11'd591: star_3<=star1[3];
					11'd592: star_3<=star1[2];
					11'd593: star_3<=star1[1];
					11'd594: star_3<=star1[0];
					default star_3<=0;
				endcase
			end
			11'd168: begin
				case(col)
					11'd574: star_3<=star2[20];
					11'd575: star_3<=star2[19];
					11'd576: star_3<=star2[18];
					11'd577: star_3<=star2[17];
					11'd578: star_3<=star2[16];
					11'd579: star_3<=star2[15];
					11'd580: star_3<=star2[14];
					11'd581: star_3<=star2[13];
					11'd582: star_3<=star2[12];
					11'd583: star_3<=star2[11];
					11'd584: star_3<=star2[10];
					11'd585: star_3<=star2[9];
					11'd586: star_3<=star2[8];
					11'd587: star_3<=star2[7];
					11'd588: star_3<=star2[6];
					11'd589: star_3<=star2[5];
					11'd590: star_3<=star2[4];
					11'd591: star_3<=star2[3];
					11'd592: star_3<=star2[2];
					11'd593: star_3<=star2[1];
					11'd594: star_3<=star2[0];
					default star_3<=0;
				endcase
			end
			11'd169: begin
				case(col)
					11'd574: star_3<=star3[20];
					11'd575: star_3<=star3[19];
					11'd576: star_3<=star3[18];
					11'd577: star_3<=star3[17];
					11'd578: star_3<=star3[16];
					11'd579: star_3<=star3[15];
					11'd580: star_3<=star3[14];
					11'd581: star_3<=star3[13];
					11'd582: star_3<=star3[12];
					11'd583: star_3<=star3[11];
					11'd584: star_3<=star3[10];
					11'd585: star_3<=star3[9];
					11'd586: star_3<=star3[8];
					11'd587: star_3<=star3[7];
					11'd588: star_3<=star3[6];
					11'd589: star_3<=star3[5];
					11'd590: star_3<=star3[4];
					11'd591: star_3<=star3[3];
					11'd592: star_3<=star3[2];
					11'd593: star_3<=star3[1];
					11'd594: star_3<=star3[0];
					default star_3<=0;
				endcase
			end
			11'd170: begin
				case(col)
					11'd574: star_3<=star4[20];
					11'd575: star_3<=star4[19];
					11'd576: star_3<=star4[18];
					11'd577: star_3<=star4[17];
					11'd578: star_3<=star4[16];
					11'd579: star_3<=star4[15];
					11'd580: star_3<=star4[14];
					11'd581: star_3<=star4[13];
					11'd582: star_3<=star4[12];
					11'd583: star_3<=star4[11];
					11'd584: star_3<=star4[10];
					11'd585: star_3<=star4[9];
					11'd586: star_3<=star4[8];
					11'd587: star_3<=star4[7];
					11'd588: star_3<=star4[6];
					11'd589: star_3<=star4[5];
					11'd590: star_3<=star4[4];
					11'd591: star_3<=star4[3];
					11'd592: star_3<=star4[2];
					11'd593: star_3<=star4[1];
					11'd594: star_3<=star4[0];
					default star_3<=0;
				endcase
			end
			11'd171: begin
				case(col)
					11'd574: star_3<=star5[20];
					11'd575: star_3<=star5[19];
					11'd576: star_3<=star5[18];
					11'd577: star_3<=star5[17];
					11'd578: star_3<=star5[16];
					11'd579: star_3<=star5[15];
					11'd580: star_3<=star5[14];
					11'd581: star_3<=star5[13];
					11'd582: star_3<=star5[12];
					11'd583: star_3<=star5[11];
					11'd584: star_3<=star5[10];
					11'd585: star_3<=star5[9];
					11'd586: star_3<=star5[8];
					11'd587: star_3<=star5[7];
					11'd588: star_3<=star5[6];
					11'd589: star_3<=star5[5];
					11'd590: star_3<=star5[4];
					11'd591: star_3<=star5[3];
					11'd592: star_3<=star5[2];
					11'd593: star_3<=star5[1];
					11'd594: star_3<=star5[0];
					default star_3<=0;
				endcase
			end
			11'd172: begin
				case(col)
					11'd574: star_3<=star1[20];
					11'd575: star_3<=star6[19];
					11'd576: star_3<=star6[18];
					11'd577: star_3<=star6[17];
					11'd578: star_3<=star6[16];
					11'd579: star_3<=star6[15];
					11'd580: star_3<=star6[14];
					11'd581: star_3<=star6[13];
					11'd582: star_3<=star6[12];
					11'd583: star_3<=star6[11];
					11'd584: star_3<=star6[10];
					11'd585: star_3<=star6[9];
					11'd586: star_3<=star6[8];
					11'd587: star_3<=star6[7];
					11'd588: star_3<=star6[6];
					11'd589: star_3<=star6[5];
					11'd590: star_3<=star6[4];
					11'd591: star_3<=star6[3];
					11'd592: star_3<=star6[2];
					11'd593: star_3<=star6[1];
					11'd594: star_3<=star6[0];
					default star_3<=0;
				endcase
			end
			11'd173: begin
				case(col)
					11'd574: star_3<=star7[20];
					11'd575: star_3<=star7[19];
					11'd576: star_3<=star7[18];
					11'd577: star_3<=star7[17];
					11'd578: star_3<=star7[16];
					11'd579: star_3<=star7[15];
					11'd580: star_3<=star7[14];
					11'd581: star_3<=star7[13];
					11'd582: star_3<=star7[12];
					11'd583: star_3<=star7[11];
					11'd584: star_3<=star7[10];
					11'd585: star_3<=star7[9];
					11'd586: star_3<=star7[8];
					11'd587: star_3<=star7[7];
					11'd588: star_3<=star7[6];
					11'd589: star_3<=star7[5];
					11'd590: star_3<=star7[4];
					11'd591: star_3<=star7[3];
					11'd592: star_3<=star7[2];
					11'd593: star_3<=star7[1];
					11'd594: star_3<=star7[0];
					default star_3<=0;
				endcase
			end
			11'd174: begin
				case(col)
					11'd574: star_3<=star8[20];
					11'd575: star_3<=star8[19];
					11'd576: star_3<=star8[18];
					11'd577: star_3<=star8[17];
					11'd578: star_3<=star8[16];
					11'd579: star_3<=star8[15];
					11'd580: star_3<=star8[14];
					11'd581: star_3<=star8[13];
					11'd582: star_3<=star8[12];
					11'd583: star_3<=star8[11];
					11'd584: star_3<=star8[10];
					11'd585: star_3<=star8[9];
					11'd586: star_3<=star8[8];
					11'd587: star_3<=star8[7];
					11'd588: star_3<=star8[6];
					11'd589: star_3<=star8[5];
					11'd590: star_3<=star8[4];
					11'd591: star_3<=star8[3];
					11'd592: star_3<=star8[2];
					11'd593: star_3<=star8[1];
					11'd594: star_3<=star8[0];
					default star_3<=0;
				endcase
			end
			11'd175: begin
				case(col)
					11'd574: star_3<=star9[20];
					11'd575: star_3<=star9[19];
					11'd576: star_3<=star9[18];
					11'd577: star_3<=star9[17];
					11'd578: star_3<=star9[16];
					11'd579: star_3<=star9[15];
					11'd580: star_3<=star9[14];
					11'd581: star_3<=star9[13];
					11'd582: star_3<=star9[12];
					11'd583: star_3<=star9[11];
					11'd584: star_3<=star9[10];
					11'd585: star_3<=star9[9];
					11'd586: star_3<=star9[8];
					11'd587: star_3<=star9[7];
					11'd588: star_3<=star9[6];
					11'd589: star_3<=star9[5];
					11'd590: star_3<=star9[4];
					11'd591: star_3<=star9[3];
					11'd592: star_3<=star9[2];
					11'd593: star_3<=star9[1];
					11'd594: star_3<=star9[0];
					default star_3<=0;
				endcase
			end
			11'd176: begin
				case(col)
					11'd574: star_3<=star10[20];
					11'd575: star_3<=star10[19];
					11'd576: star_3<=star10[18];
					11'd577: star_3<=star10[17];
					11'd578: star_3<=star10[16];
					11'd579: star_3<=star10[15];
					11'd580: star_3<=star10[14];
					11'd581: star_3<=star10[13];
					11'd582: star_3<=star10[12];
					11'd583: star_3<=star10[11];
					11'd584: star_3<=star10[10];
					11'd585: star_3<=star10[9];
					11'd586: star_3<=star10[8];
					11'd587: star_3<=star10[7];
					11'd588: star_3<=star10[6];
					11'd589: star_3<=star10[5];
					11'd590: star_3<=star10[4];
					11'd591: star_3<=star10[3];
					11'd592: star_3<=star10[2];
					11'd593: star_3<=star10[1];
					11'd594: star_3<=star10[0];
					default star_3<=0;
				endcase
			end
			11'd177: begin
				case(col)
					11'd574: star_3<=star11[20];
					11'd575: star_3<=star11[19];
					11'd576: star_3<=star11[18];
					11'd577: star_3<=star11[17];
					11'd578: star_3<=star11[16];
					11'd579: star_3<=star11[15];
					11'd580: star_3<=star11[14];
					11'd581: star_3<=star11[13];
					11'd582: star_3<=star11[12];
					11'd583: star_3<=star11[11];
					11'd584: star_3<=star11[10];
					11'd585: star_3<=star11[9];
					11'd586: star_3<=star11[8];
					11'd587: star_3<=star11[7];
					11'd588: star_3<=star11[6];
					11'd589: star_3<=star11[5];
					11'd590: star_3<=star11[4];
					11'd591: star_3<=star11[3];
					11'd592: star_3<=star11[2];
					11'd593: star_3<=star11[1];
					11'd594: star_3<=star11[0];
					default star_3<=0;
				endcase
			end
			default star_3<=0;
		endcase
	end
end

always@(posedge clk or posedge rst) begin
	if(rst)
		star_4<=0;
	else begin
		case(row)
			11'd292: begin
				case(col)
					11'd369: star_4<=star1[20];
					11'd370: star_4<=star1[19];
					11'd371: star_4<=star1[18];
					11'd372: star_4<=star1[17];
					11'd373: star_4<=star1[16];
					11'd374: star_4<=star1[15];
					11'd375: star_4<=star1[14];
					11'd376: star_4<=star1[13];
					11'd377: star_4<=star1[12];
					11'd378: star_4<=star1[11];
					11'd379: star_4<=star1[10];
					11'd380: star_4<=star1[9];
					11'd381: star_4<=star1[8];
					11'd382: star_4<=star1[7];
					11'd383: star_4<=star1[6];
					11'd384: star_4<=star1[5];
					11'd385: star_4<=star1[4];
					11'd386: star_4<=star1[3];
					11'd387: star_4<=star1[2];
					11'd388: star_4<=star1[1];
					11'd389: star_4<=star1[0];
					default star_4<=0;
				endcase
			end
			11'd293: begin
				case(col)
					11'd369: star_4<=star2[20];
					11'd370: star_4<=star2[19];
					11'd371: star_4<=star2[18];
					11'd372: star_4<=star2[17];
					11'd373: star_4<=star2[16];
					11'd374: star_4<=star2[15];
					11'd375: star_4<=star2[14];
					11'd376: star_4<=star2[13];
					11'd377: star_4<=star2[12];
					11'd378: star_4<=star2[11];
					11'd379: star_4<=star2[10];
					11'd380: star_4<=star2[9];
					11'd381: star_4<=star2[8];
					11'd382: star_4<=star2[7];
					11'd383: star_4<=star2[6];
					11'd384: star_4<=star2[5];
					11'd385: star_4<=star2[4];
					11'd386: star_4<=star2[3];
					11'd387: star_4<=star2[2];
					11'd388: star_4<=star2[1];
					11'd389: star_4<=star2[0];
					default star_4<=0;
				endcase
			end
			11'd294: begin
				case(col)
					11'd369: star_4<=star3[20];
					11'd370: star_4<=star3[19];
					11'd371: star_4<=star3[18];
					11'd372: star_4<=star3[17];
					11'd373: star_4<=star3[16];
					11'd374: star_4<=star3[15];
					11'd375: star_4<=star3[14];
					11'd376: star_4<=star3[13];
					11'd377: star_4<=star3[12];
					11'd378: star_4<=star3[11];
					11'd379: star_4<=star3[10];
					11'd380: star_4<=star3[9];
					11'd381: star_4<=star3[8];
					11'd382: star_4<=star3[7];
					11'd383: star_4<=star3[6];
					11'd384: star_4<=star3[5];
					11'd385: star_4<=star3[4];
					11'd386: star_4<=star3[3];
					11'd387: star_4<=star3[2];
					11'd388: star_4<=star3[1];
					11'd389: star_4<=star3[0];
					default star_4<=0;
				endcase
			end
			11'd295: begin
				case(col)
					11'd369: star_4<=star4[20];
					11'd370: star_4<=star4[19];
					11'd371: star_4<=star4[18];
					11'd372: star_4<=star4[17];
					11'd373: star_4<=star4[16];
					11'd374: star_4<=star4[15];
					11'd375: star_4<=star4[14];
					11'd376: star_4<=star4[13];
					11'd377: star_4<=star4[12];
					11'd378: star_4<=star4[11];
					11'd379: star_4<=star4[10];
					11'd380: star_4<=star4[9];
					11'd381: star_4<=star4[8];
					11'd382: star_4<=star4[7];
					11'd383: star_4<=star4[6];
					11'd384: star_4<=star4[5];
					11'd385: star_4<=star4[4];
					11'd386: star_4<=star4[3];
					11'd387: star_4<=star4[2];
					11'd388: star_4<=star4[1];
					11'd389: star_4<=star4[0];
					default star_4<=0;
				endcase
			end
			11'd296: begin
				case(col)
					11'd369: star_4<=star5[20];
					11'd370: star_4<=star5[19];
					11'd371: star_4<=star5[18];
					11'd372: star_4<=star5[17];
					11'd373: star_4<=star5[16];
					11'd374: star_4<=star5[15];
					11'd375: star_4<=star5[14];
					11'd376: star_4<=star5[13];
					11'd377: star_4<=star5[12];
					11'd378: star_4<=star5[11];
					11'd379: star_4<=star5[10];
					11'd380: star_4<=star5[9];
					11'd381: star_4<=star5[8];
					11'd382: star_4<=star5[7];
					11'd383: star_4<=star5[6];
					11'd384: star_4<=star5[5];
					11'd385: star_4<=star5[4];
					11'd386: star_4<=star5[3];
					11'd387: star_4<=star5[2];
					11'd388: star_4<=star5[1];
					11'd389: star_4<=star5[0];
					default star_4<=0;
				endcase
			end
			11'd297: begin
				case(col)
					11'd369: star_4<=star1[20];
					11'd370: star_4<=star6[19];
					11'd371: star_4<=star6[18];
					11'd372: star_4<=star6[17];
					11'd373: star_4<=star6[16];
					11'd374: star_4<=star6[15];
					11'd375: star_4<=star6[14];
					11'd376: star_4<=star6[13];
					11'd377: star_4<=star6[12];
					11'd378: star_4<=star6[11];
					11'd379: star_4<=star6[10];
					11'd380: star_4<=star6[9];
					11'd381: star_4<=star6[8];
					11'd382: star_4<=star6[7];
					11'd383: star_4<=star6[6];
					11'd384: star_4<=star6[5];
					11'd385: star_4<=star6[4];
					11'd386: star_4<=star6[3];
					11'd387: star_4<=star6[2];
					11'd388: star_4<=star6[1];
					11'd389: star_4<=star6[0];
					default star_4<=0;
				endcase
			end
			11'd298: begin
				case(col)
					11'd369: star_4<=star7[20];
					11'd370: star_4<=star7[19];
					11'd371: star_4<=star7[18];
					11'd372: star_4<=star7[17];
					11'd373: star_4<=star7[16];
					11'd374: star_4<=star7[15];
					11'd375: star_4<=star7[14];
					11'd376: star_4<=star7[13];
					11'd377: star_4<=star7[12];
					11'd378: star_4<=star7[11];
					11'd379: star_4<=star7[10];
					11'd380: star_4<=star7[9];
					11'd381: star_4<=star7[8];
					11'd382: star_4<=star7[7];
					11'd383: star_4<=star7[6];
					11'd384: star_4<=star7[5];
					11'd385: star_4<=star7[4];
					11'd386: star_4<=star7[3];
					11'd387: star_4<=star7[2];
					11'd388: star_4<=star7[1];
					11'd389: star_4<=star7[0];
					default star_4<=0;
				endcase
			end
			11'd299: begin
				case(col)
					11'd369: star_4<=star8[20];
					11'd370: star_4<=star8[19];
					11'd371: star_4<=star8[18];
					11'd372: star_4<=star8[17];
					11'd373: star_4<=star8[16];
					11'd374: star_4<=star8[15];
					11'd375: star_4<=star8[14];
					11'd376: star_4<=star8[13];
					11'd377: star_4<=star8[12];
					11'd378: star_4<=star8[11];
					11'd379: star_4<=star8[10];
					11'd380: star_4<=star8[9];
					11'd381: star_4<=star8[8];
					11'd382: star_4<=star8[7];
					11'd383: star_4<=star8[6];
					11'd384: star_4<=star8[5];
					11'd385: star_4<=star8[4];
					11'd386: star_4<=star8[3];
					11'd387: star_4<=star8[2];
					11'd388: star_4<=star8[1];
					11'd389: star_4<=star8[0];
					default star_4<=0;
				endcase
			end
			11'd300: begin
				case(col)
					11'd369: star_4<=star9[20];
					11'd370: star_4<=star9[19];
					11'd371: star_4<=star9[18];
					11'd372: star_4<=star9[17];
					11'd373: star_4<=star9[16];
					11'd374: star_4<=star9[15];
					11'd375: star_4<=star9[14];
					11'd376: star_4<=star9[13];
					11'd377: star_4<=star9[12];
					11'd378: star_4<=star9[11];
					11'd379: star_4<=star9[10];
					11'd380: star_4<=star9[9];
					11'd381: star_4<=star9[8];
					11'd382: star_4<=star9[7];
					11'd383: star_4<=star9[6];
					11'd384: star_4<=star9[5];
					11'd385: star_4<=star9[4];
					11'd386: star_4<=star9[3];
					11'd387: star_4<=star9[2];
					11'd388: star_4<=star9[1];
					11'd389: star_4<=star9[0];
					default star_4<=0;
				endcase
			end
			11'd301: begin
				case(col)
					11'd369: star_4<=star10[20];
					11'd370: star_4<=star10[19];
					11'd371: star_4<=star10[18];
					11'd372: star_4<=star10[17];
					11'd373: star_4<=star10[16];
					11'd374: star_4<=star10[15];
					11'd375: star_4<=star10[14];
					11'd376: star_4<=star10[13];
					11'd377: star_4<=star10[12];
					11'd378: star_4<=star10[11];
					11'd379: star_4<=star10[10];
					11'd380: star_4<=star10[9];
					11'd381: star_4<=star10[8];
					11'd382: star_4<=star10[7];
					11'd383: star_4<=star10[6];
					11'd384: star_4<=star10[5];
					11'd385: star_4<=star10[4];
					11'd386: star_4<=star10[3];
					11'd387: star_4<=star10[2];
					11'd388: star_4<=star10[1];
					11'd389: star_4<=star10[0];
					default star_4<=0;
				endcase
			end
			11'd302: begin
				case(col)
					11'd369: star_4<=star11[20];
					11'd370: star_4<=star11[19];
					11'd371: star_4<=star11[18];
					11'd372: star_4<=star11[17];
					11'd373: star_4<=star11[16];
					11'd374: star_4<=star11[15];
					11'd375: star_4<=star11[14];
					11'd376: star_4<=star11[13];
					11'd377: star_4<=star11[12];
					11'd378: star_4<=star11[11];
					11'd379: star_4<=star11[10];
					11'd380: star_4<=star11[9];
					11'd381: star_4<=star11[8];
					11'd382: star_4<=star11[7];
					11'd383: star_4<=star11[6];
					11'd384: star_4<=star11[5];
					11'd385: star_4<=star11[4];
					11'd386: star_4<=star11[3];
					11'd387: star_4<=star11[2];
					11'd388: star_4<=star11[1];
					11'd389: star_4<=star11[0];
					default star_4<=0;
				endcase
			end
			default star_4<=0;
		endcase
	end
end

always@(posedge clk or posedge rst) begin
	if(rst)
		star_5<=0;
	else begin
		case(row)
			11'd292: begin
				case(col)
					11'd619: star_5<=star1[20];
					11'd620: star_5<=star1[19];
					11'd621: star_5<=star1[18];
					11'd622: star_5<=star1[17];
					11'd623: star_5<=star1[16];
					11'd624: star_5<=star1[15];
					11'd625: star_5<=star1[14];
					11'd626: star_5<=star1[13];
					11'd627: star_5<=star1[12];
					11'd628: star_5<=star1[11];
					11'd629: star_5<=star1[10];
					11'd630: star_5<=star1[9];
					11'd631: star_5<=star1[8];
					11'd632: star_5<=star1[7];
					11'd633: star_5<=star1[6];
					11'd634: star_5<=star1[5];
					11'd635: star_5<=star1[4];
					11'd636: star_5<=star1[3];
					11'd637: star_5<=star1[2];
					11'd638: star_5<=star1[1];
					11'd639: star_5<=star1[0];
					default star_5<=0;
				endcase
			end
			11'd293: begin
				case(col)
					11'd619: star_5<=star2[20];
					11'd620: star_5<=star2[19];
					11'd621: star_5<=star2[18];
					11'd622: star_5<=star2[17];
					11'd623: star_5<=star2[16];
					11'd624: star_5<=star2[15];
					11'd625: star_5<=star2[14];
					11'd626: star_5<=star2[13];
					11'd627: star_5<=star2[12];
					11'd628: star_5<=star2[11];
					11'd629: star_5<=star2[10];
					11'd630: star_5<=star2[9];
					11'd631: star_5<=star2[8];
					11'd632: star_5<=star2[7];
					11'd633: star_5<=star2[6];
					11'd634: star_5<=star2[5];
					11'd635: star_5<=star2[4];
					11'd636: star_5<=star2[3];
					11'd637: star_5<=star2[2];
					11'd638: star_5<=star2[1];
					11'd639: star_5<=star2[0];
					default star_5<=0;
				endcase
			end
			11'd294: begin
				case(col)
					11'd619: star_5<=star3[20];
					11'd620: star_5<=star3[19];
					11'd621: star_5<=star3[18];
					11'd622: star_5<=star3[17];
					11'd623: star_5<=star3[16];
					11'd624: star_5<=star3[15];
					11'd625: star_5<=star3[14];
					11'd626: star_5<=star3[13];
					11'd627: star_5<=star3[12];
					11'd628: star_5<=star3[11];
					11'd629: star_5<=star3[10];
					11'd630: star_5<=star3[9];
					11'd631: star_5<=star3[8];
					11'd632: star_5<=star3[7];
					11'd633: star_5<=star3[6];
					11'd634: star_5<=star3[5];
					11'd635: star_5<=star3[4];
					11'd636: star_5<=star3[3];
					11'd637: star_5<=star3[2];
					11'd638: star_5<=star3[1];
					11'd639: star_5<=star3[0];
					default star_5<=0;
				endcase
			end
			11'd295: begin
				case(col)
					11'd619: star_5<=star4[20];
					11'd620: star_5<=star4[19];
					11'd621: star_5<=star4[18];
					11'd622: star_5<=star4[17];
					11'd623: star_5<=star4[16];
					11'd624: star_5<=star4[15];
					11'd625: star_5<=star4[14];
					11'd626: star_5<=star4[13];
					11'd627: star_5<=star4[12];
					11'd628: star_5<=star4[11];
					11'd629: star_5<=star4[10];
					11'd630: star_5<=star4[9];
					11'd631: star_5<=star4[8];
					11'd632: star_5<=star4[7];
					11'd633: star_5<=star4[6];
					11'd634: star_5<=star4[5];
					11'd635: star_5<=star4[4];
					11'd636: star_5<=star4[3];
					11'd637: star_5<=star4[2];
					11'd638: star_5<=star4[1];
					11'd639: star_5<=star4[0];
					default star_5<=0;
				endcase
			end
			11'd296: begin
				case(col)
					11'd619: star_5<=star5[20];
					11'd620: star_5<=star5[19];
					11'd621: star_5<=star5[18];
					11'd622: star_5<=star5[17];
					11'd623: star_5<=star5[16];
					11'd624: star_5<=star5[15];
					11'd625: star_5<=star5[14];
					11'd626: star_5<=star5[13];
					11'd627: star_5<=star5[12];
					11'd628: star_5<=star5[11];
					11'd629: star_5<=star5[10];
					11'd630: star_5<=star5[9];
					11'd631: star_5<=star5[8];
					11'd632: star_5<=star5[7];
					11'd633: star_5<=star5[6];
					11'd634: star_5<=star5[5];
					11'd635: star_5<=star5[4];
					11'd636: star_5<=star5[3];
					11'd637: star_5<=star5[2];
					11'd638: star_5<=star5[1];
					11'd639: star_5<=star5[0];
					default star_5<=0;
				endcase
			end
			11'd297: begin
				case(col)
					11'd619: star_5<=star1[20];
					11'd620: star_5<=star6[19];
					11'd621: star_5<=star6[18];
					11'd622: star_5<=star6[17];
					11'd623: star_5<=star6[16];
					11'd624: star_5<=star6[15];
					11'd625: star_5<=star6[14];
					11'd626: star_5<=star6[13];
					11'd627: star_5<=star6[12];
					11'd628: star_5<=star6[11];
					11'd629: star_5<=star6[10];
					11'd630: star_5<=star6[9];
					11'd631: star_5<=star6[8];
					11'd632: star_5<=star6[7];
					11'd633: star_5<=star6[6];
					11'd634: star_5<=star6[5];
					11'd635: star_5<=star6[4];
					11'd636: star_5<=star6[3];
					11'd637: star_5<=star6[2];
					11'd638: star_5<=star6[1];
					11'd639: star_5<=star6[0];
					default star_5<=0;
				endcase
			end
			11'd298: begin
				case(col)
					11'd619: star_5<=star7[20];
					11'd620: star_5<=star7[19];
					11'd621: star_5<=star7[18];
					11'd622: star_5<=star7[17];
					11'd623: star_5<=star7[16];
					11'd624: star_5<=star7[15];
					11'd625: star_5<=star7[14];
					11'd626: star_5<=star7[13];
					11'd627: star_5<=star7[12];
					11'd628: star_5<=star7[11];
					11'd629: star_5<=star7[10];
					11'd630: star_5<=star7[9];
					11'd631: star_5<=star7[8];
					11'd632: star_5<=star7[7];
					11'd633: star_5<=star7[6];
					11'd634: star_5<=star7[5];
					11'd635: star_5<=star7[4];
					11'd636: star_5<=star7[3];
					11'd637: star_5<=star7[2];
					11'd638: star_5<=star7[1];
					11'd639: star_5<=star7[0];
					default star_5<=0;
				endcase
			end
			11'd299: begin
				case(col)
					11'd619: star_5<=star8[20];
					11'd620: star_5<=star8[19];
					11'd621: star_5<=star8[18];
					11'd622: star_5<=star8[17];
					11'd623: star_5<=star8[16];
					11'd624: star_5<=star8[15];
					11'd625: star_5<=star8[14];
					11'd626: star_5<=star8[13];
					11'd627: star_5<=star8[12];
					11'd628: star_5<=star8[11];
					11'd629: star_5<=star8[10];
					11'd630: star_5<=star8[9];
					11'd631: star_5<=star8[8];
					11'd632: star_5<=star8[7];
					11'd633: star_5<=star8[6];
					11'd634: star_5<=star8[5];
					11'd635: star_5<=star8[4];
					11'd636: star_5<=star8[3];
					11'd637: star_5<=star8[2];
					11'd638: star_5<=star8[1];
					11'd639: star_5<=star8[0];
					default star_5<=0;
				endcase
			end
			11'd300: begin
				case(col)
					11'd619: star_5<=star9[20];
					11'd620: star_5<=star9[19];
					11'd621: star_5<=star9[18];
					11'd622: star_5<=star9[17];
					11'd623: star_5<=star9[16];
					11'd624: star_5<=star9[15];
					11'd625: star_5<=star9[14];
					11'd626: star_5<=star9[13];
					11'd627: star_5<=star9[12];
					11'd628: star_5<=star9[11];
					11'd629: star_5<=star9[10];
					11'd630: star_5<=star9[9];
					11'd631: star_5<=star9[8];
					11'd632: star_5<=star9[7];
					11'd633: star_5<=star9[6];
					11'd634: star_5<=star9[5];
					11'd635: star_5<=star9[4];
					11'd636: star_5<=star9[3];
					11'd637: star_5<=star9[2];
					11'd638: star_5<=star9[1];
					11'd639: star_5<=star9[0];
					default star_5<=0;
				endcase
			end
			11'd301: begin
				case(col)
					11'd619: star_5<=star10[20];
					11'd620: star_5<=star10[19];
					11'd621: star_5<=star10[18];
					11'd622: star_5<=star10[17];
					11'd623: star_5<=star10[16];
					11'd624: star_5<=star10[15];
					11'd625: star_5<=star10[14];
					11'd626: star_5<=star10[13];
					11'd627: star_5<=star10[12];
					11'd628: star_5<=star10[11];
					11'd629: star_5<=star10[10];
					11'd630: star_5<=star10[9];
					11'd631: star_5<=star10[8];
					11'd632: star_5<=star10[7];
					11'd633: star_5<=star10[6];
					11'd634: star_5<=star10[5];
					11'd635: star_5<=star10[4];
					11'd636: star_5<=star10[3];
					11'd637: star_5<=star10[2];
					11'd638: star_5<=star10[1];
					11'd639: star_5<=star10[0];
					default star_5<=0;
				endcase
			end
			11'd302: begin
				case(col)
					11'd619: star_5<=star11[20];
					11'd620: star_5<=star11[19];
					11'd621: star_5<=star11[18];
					11'd622: star_5<=star11[17];
					11'd623: star_5<=star11[16];
					11'd624: star_5<=star11[15];
					11'd625: star_5<=star11[14];
					11'd626: star_5<=star11[13];
					11'd627: star_5<=star11[12];
					11'd628: star_5<=star11[11];
					11'd629: star_5<=star11[10];
					11'd630: star_5<=star11[9];
					11'd631: star_5<=star11[8];
					11'd632: star_5<=star11[7];
					11'd633: star_5<=star11[6];
					11'd634: star_5<=star11[5];
					11'd635: star_5<=star11[4];
					11'd636: star_5<=star11[3];
					11'd637: star_5<=star11[2];
					11'd638: star_5<=star11[1];
					11'd639: star_5<=star11[0];
					default star_5<=0;
				endcase
			end
			default star_5<=0;
		endcase
	end
end

always@(posedge clk or posedge rst) begin
	if(rst)
		star_6<=0;
	else begin
		case(row)
			11'd467: begin
				case(col)
					11'd319: star_6<=star1[20];
					11'd320: star_6<=star1[19];
					11'd321: star_6<=star1[18];
					11'd322: star_6<=star1[17];
					11'd323: star_6<=star1[16];
					11'd324: star_6<=star1[15];
					11'd325: star_6<=star1[14];
					11'd326: star_6<=star1[13];
					11'd327: star_6<=star1[12];
					11'd328: star_6<=star1[11];
					11'd329: star_6<=star1[10];
					11'd330: star_6<=star1[9];
					11'd331: star_6<=star1[8];
					11'd332: star_6<=star1[7];
					11'd333: star_6<=star1[6];
					11'd334: star_6<=star1[5];
					11'd335: star_6<=star1[4];
					11'd336: star_6<=star1[3];
					11'd337: star_6<=star1[2];
					11'd338: star_6<=star1[1];
					11'd339: star_6<=star1[0];
					default star_6<=0;
				endcase
			end
			11'd468: begin
				case(col)
					11'd319: star_6<=star2[20];
					11'd320: star_6<=star2[19];
					11'd321: star_6<=star2[18];
					11'd322: star_6<=star2[17];
					11'd323: star_6<=star2[16];
					11'd324: star_6<=star2[15];
					11'd325: star_6<=star2[14];
					11'd326: star_6<=star2[13];
					11'd327: star_6<=star2[12];
					11'd328: star_6<=star2[11];
					11'd329: star_6<=star2[10];
					11'd330: star_6<=star2[9];
					11'd331: star_6<=star2[8];
					11'd332: star_6<=star2[7];
					11'd333: star_6<=star2[6];
					11'd334: star_6<=star2[5];
					11'd335: star_6<=star2[4];
					11'd336: star_6<=star2[3];
					11'd337: star_6<=star2[2];
					11'd338: star_6<=star2[1];
					11'd339: star_6<=star2[0];
					default star_6<=0;
				endcase
			end
			11'd469: begin
				case(col)
					11'd319: star_6<=star3[20];
					11'd320: star_6<=star3[19];
					11'd321: star_6<=star3[18];
					11'd322: star_6<=star3[17];
					11'd323: star_6<=star3[16];
					11'd324: star_6<=star3[15];
					11'd325: star_6<=star3[14];
					11'd326: star_6<=star3[13];
					11'd327: star_6<=star3[12];
					11'd328: star_6<=star3[11];
					11'd329: star_6<=star3[10];
					11'd330: star_6<=star3[9];
					11'd331: star_6<=star3[8];
					11'd332: star_6<=star3[7];
					11'd333: star_6<=star3[6];
					11'd334: star_6<=star3[5];
					11'd335: star_6<=star3[4];
					11'd336: star_6<=star3[3];
					11'd337: star_6<=star3[2];
					11'd338: star_6<=star3[1];
					11'd339: star_6<=star3[0];
					default star_6<=0;
				endcase
			end
			11'd470: begin
				case(col)
					11'd319: star_6<=star4[20];
					11'd320: star_6<=star4[19];
					11'd321: star_6<=star4[18];
					11'd322: star_6<=star4[17];
					11'd323: star_6<=star4[16];
					11'd324: star_6<=star4[15];
					11'd325: star_6<=star4[14];
					11'd326: star_6<=star4[13];
					11'd327: star_6<=star4[12];
					11'd328: star_6<=star4[11];
					11'd329: star_6<=star4[10];
					11'd330: star_6<=star4[9];
					11'd331: star_6<=star4[8];
					11'd332: star_6<=star4[7];
					11'd333: star_6<=star4[6];
					11'd334: star_6<=star4[5];
					11'd335: star_6<=star4[4];
					11'd336: star_6<=star4[3];
					11'd337: star_6<=star4[2];
					11'd338: star_6<=star4[1];
					11'd339: star_6<=star4[0];
					default star_6<=0;
				endcase
			end
			11'd471: begin
				case(col)
					11'd319: star_6<=star5[20];
					11'd320: star_6<=star5[19];
					11'd321: star_6<=star5[18];
					11'd322: star_6<=star5[17];
					11'd323: star_6<=star5[16];
					11'd324: star_6<=star5[15];
					11'd325: star_6<=star5[14];
					11'd326: star_6<=star5[13];
					11'd327: star_6<=star5[12];
					11'd328: star_6<=star5[11];
					11'd329: star_6<=star5[10];
					11'd330: star_6<=star5[9];
					11'd331: star_6<=star5[8];
					11'd332: star_6<=star5[7];
					11'd333: star_6<=star5[6];
					11'd334: star_6<=star5[5];
					11'd335: star_6<=star5[4];
					11'd336: star_6<=star5[3];
					11'd337: star_6<=star5[2];
					11'd338: star_6<=star5[1];
					11'd339: star_6<=star5[0];
					default star_6<=0;
				endcase
			end
			11'd472: begin
				case(col)
					11'd319: star_6<=star1[20];
					11'd320: star_6<=star6[19];
					11'd321: star_6<=star6[18];
					11'd322: star_6<=star6[17];
					11'd323: star_6<=star6[16];
					11'd324: star_6<=star6[15];
					11'd325: star_6<=star6[14];
					11'd326: star_6<=star6[13];
					11'd327: star_6<=star6[12];
					11'd328: star_6<=star6[11];
					11'd329: star_6<=star6[10];
					11'd330: star_6<=star6[9];
					11'd331: star_6<=star6[8];
					11'd332: star_6<=star6[7];
					11'd333: star_6<=star6[6];
					11'd334: star_6<=star6[5];
					11'd335: star_6<=star6[4];
					11'd336: star_6<=star6[3];
					11'd337: star_6<=star6[2];
					11'd338: star_6<=star6[1];
					11'd339: star_6<=star6[0];
					default star_6<=0;
				endcase
			end
			11'd473: begin
				case(col)
					11'd319: star_6<=star7[20];
					11'd320: star_6<=star7[19];
					11'd321: star_6<=star7[18];
					11'd322: star_6<=star7[17];
					11'd323: star_6<=star7[16];
					11'd324: star_6<=star7[15];
					11'd325: star_6<=star7[14];
					11'd326: star_6<=star7[13];
					11'd327: star_6<=star7[12];
					11'd328: star_6<=star7[11];
					11'd329: star_6<=star7[10];
					11'd330: star_6<=star7[9];
					11'd331: star_6<=star7[8];
					11'd332: star_6<=star7[7];
					11'd333: star_6<=star7[6];
					11'd334: star_6<=star7[5];
					11'd335: star_6<=star7[4];
					11'd336: star_6<=star7[3];
					11'd337: star_6<=star7[2];
					11'd338: star_6<=star7[1];
					11'd339: star_6<=star7[0];
					default star_6<=0;
				endcase
			end
			11'd474: begin
				case(col)
					11'd319: star_6<=star8[20];
					11'd320: star_6<=star8[19];
					11'd321: star_6<=star8[18];
					11'd322: star_6<=star8[17];
					11'd323: star_6<=star8[16];
					11'd324: star_6<=star8[15];
					11'd325: star_6<=star8[14];
					11'd326: star_6<=star8[13];
					11'd327: star_6<=star8[12];
					11'd328: star_6<=star8[11];
					11'd329: star_6<=star8[10];
					11'd330: star_6<=star8[9];
					11'd331: star_6<=star8[8];
					11'd332: star_6<=star8[7];
					11'd333: star_6<=star8[6];
					11'd334: star_6<=star8[5];
					11'd335: star_6<=star8[4];
					11'd336: star_6<=star8[3];
					11'd337: star_6<=star8[2];
					11'd338: star_6<=star8[1];
					11'd339: star_6<=star8[0];
					default star_6<=0;
				endcase
			end
			11'd475: begin
				case(col)
					11'd319: star_6<=star9[20];
					11'd320: star_6<=star9[19];
					11'd321: star_6<=star9[18];
					11'd322: star_6<=star9[17];
					11'd323: star_6<=star9[16];
					11'd324: star_6<=star9[15];
					11'd325: star_6<=star9[14];
					11'd326: star_6<=star9[13];
					11'd327: star_6<=star9[12];
					11'd328: star_6<=star9[11];
					11'd329: star_6<=star9[10];
					11'd330: star_6<=star9[9];
					11'd331: star_6<=star9[8];
					11'd332: star_6<=star9[7];
					11'd333: star_6<=star9[6];
					11'd334: star_6<=star9[5];
					11'd335: star_6<=star9[4];
					11'd336: star_6<=star9[3];
					11'd337: star_6<=star9[2];
					11'd338: star_6<=star9[1];
					11'd339: star_6<=star9[0];
					default star_6<=0;
				endcase
			end
			11'd476: begin
				case(col)
					11'd319: star_6<=star10[20];
					11'd320: star_6<=star10[19];
					11'd321: star_6<=star10[18];
					11'd322: star_6<=star10[17];
					11'd323: star_6<=star10[16];
					11'd324: star_6<=star10[15];
					11'd325: star_6<=star10[14];
					11'd326: star_6<=star10[13];
					11'd327: star_6<=star10[12];
					11'd328: star_6<=star10[11];
					11'd329: star_6<=star10[10];
					11'd330: star_6<=star10[9];
					11'd331: star_6<=star10[8];
					11'd332: star_6<=star10[7];
					11'd333: star_6<=star10[6];
					11'd334: star_6<=star10[5];
					11'd335: star_6<=star10[4];
					11'd336: star_6<=star10[3];
					11'd337: star_6<=star10[2];
					11'd338: star_6<=star10[1];
					11'd339: star_6<=star10[0];
					default star_6<=0;
				endcase
			end
			11'd477: begin
				case(col)
					11'd319: star_6<=star11[20];
					11'd320: star_6<=star11[19];
					11'd321: star_6<=star11[18];
					11'd322: star_6<=star11[17];
					11'd323: star_6<=star11[16];
					11'd324: star_6<=star11[15];
					11'd325: star_6<=star11[14];
					11'd326: star_6<=star11[13];
					11'd327: star_6<=star11[12];
					11'd328: star_6<=star11[11];
					11'd329: star_6<=star11[10];
					11'd330: star_6<=star11[9];
					11'd331: star_6<=star11[8];
					11'd332: star_6<=star11[7];
					11'd333: star_6<=star11[6];
					11'd334: star_6<=star11[5];
					11'd335: star_6<=star11[4];
					11'd336: star_6<=star11[3];
					11'd337: star_6<=star11[2];
					11'd338: star_6<=star11[1];
					11'd339: star_6<=star11[0];
					default star_6<=0;
				endcase
			end
			default star_6<=0;
		endcase
	end
end

always@(posedge clk or posedge rst) begin
	if(rst)
		star_7<=0;
	else begin
		case(row)
			11'd467: begin
				case(col)
					11'd669: star_7<=star1[20];
					11'd670: star_7<=star1[19];
					11'd671: star_7<=star1[18];
					11'd672: star_7<=star1[17];
					11'd673: star_7<=star1[16];
					11'd674: star_7<=star1[15];
					11'd675: star_7<=star1[14];
					11'd676: star_7<=star1[13];
					11'd677: star_7<=star1[12];
					11'd678: star_7<=star1[11];
					11'd679: star_7<=star1[10];
					11'd680: star_7<=star1[9];
					11'd681: star_7<=star1[8];
					11'd682: star_7<=star1[7];
					11'd683: star_7<=star1[6];
					11'd684: star_7<=star1[5];
					11'd685: star_7<=star1[4];
					11'd686: star_7<=star1[3];
					11'd687: star_7<=star1[2];
					11'd688: star_7<=star1[1];
					11'd689: star_7<=star1[0];
					default star_7<=0;
				endcase
			end
			11'd468: begin
				case(col)
					11'd669: star_7<=star2[20];
					11'd670: star_7<=star2[19];
					11'd671: star_7<=star2[18];
					11'd672: star_7<=star2[17];
					11'd673: star_7<=star2[16];
					11'd674: star_7<=star2[15];
					11'd675: star_7<=star2[14];
					11'd676: star_7<=star2[13];
					11'd677: star_7<=star2[12];
					11'd678: star_7<=star2[11];
					11'd679: star_7<=star2[10];
					11'd680: star_7<=star2[9];
					11'd681: star_7<=star2[8];
					11'd682: star_7<=star2[7];
					11'd683: star_7<=star2[6];
					11'd684: star_7<=star2[5];
					11'd685: star_7<=star2[4];
					11'd686: star_7<=star2[3];
					11'd687: star_7<=star2[2];
					11'd688: star_7<=star2[1];
					11'd689: star_7<=star2[0];
					default star_7<=0;
				endcase
			end
			11'd469: begin
				case(col)
					11'd669: star_7<=star3[20];
					11'd670: star_7<=star3[19];
					11'd671: star_7<=star3[18];
					11'd672: star_7<=star3[17];
					11'd673: star_7<=star3[16];
					11'd674: star_7<=star3[15];
					11'd675: star_7<=star3[14];
					11'd676: star_7<=star3[13];
					11'd677: star_7<=star3[12];
					11'd678: star_7<=star3[11];
					11'd679: star_7<=star3[10];
					11'd680: star_7<=star3[9];
					11'd681: star_7<=star3[8];
					11'd682: star_7<=star3[7];
					11'd683: star_7<=star3[6];
					11'd684: star_7<=star3[5];
					11'd685: star_7<=star3[4];
					11'd686: star_7<=star3[3];
					11'd687: star_7<=star3[2];
					11'd688: star_7<=star3[1];
					11'd689: star_7<=star3[0];
					default star_7<=0;
				endcase
			end
			11'd470: begin
				case(col)
					11'd669: star_7<=star4[20];
					11'd670: star_7<=star4[19];
					11'd671: star_7<=star4[18];
					11'd672: star_7<=star4[17];
					11'd673: star_7<=star4[16];
					11'd674: star_7<=star4[15];
					11'd675: star_7<=star4[14];
					11'd676: star_7<=star4[13];
					11'd677: star_7<=star4[12];
					11'd678: star_7<=star4[11];
					11'd679: star_7<=star4[10];
					11'd680: star_7<=star4[9];
					11'd681: star_7<=star4[8];
					11'd682: star_7<=star4[7];
					11'd683: star_7<=star4[6];
					11'd684: star_7<=star4[5];
					11'd685: star_7<=star4[4];
					11'd686: star_7<=star4[3];
					11'd687: star_7<=star4[2];
					11'd688: star_7<=star4[1];
					11'd689: star_7<=star4[0];
					default star_7<=0;
				endcase
			end
			11'd471: begin
				case(col)
					11'd669: star_7<=star5[20];
					11'd670: star_7<=star5[19];
					11'd671: star_7<=star5[18];
					11'd672: star_7<=star5[17];
					11'd673: star_7<=star5[16];
					11'd674: star_7<=star5[15];
					11'd675: star_7<=star5[14];
					11'd676: star_7<=star5[13];
					11'd677: star_7<=star5[12];
					11'd678: star_7<=star5[11];
					11'd679: star_7<=star5[10];
					11'd680: star_7<=star5[9];
					11'd681: star_7<=star5[8];
					11'd682: star_7<=star5[7];
					11'd683: star_7<=star5[6];
					11'd684: star_7<=star5[5];
					11'd685: star_7<=star5[4];
					11'd686: star_7<=star5[3];
					11'd687: star_7<=star5[2];
					11'd688: star_7<=star5[1];
					11'd689: star_7<=star5[0];
					default star_7<=0;
				endcase
			end
			11'd472: begin
				case(col)
					11'd669: star_7<=star1[20];
					11'd670: star_7<=star6[19];
					11'd671: star_7<=star6[18];
					11'd672: star_7<=star6[17];
					11'd673: star_7<=star6[16];
					11'd674: star_7<=star6[15];
					11'd675: star_7<=star6[14];
					11'd676: star_7<=star6[13];
					11'd677: star_7<=star6[12];
					11'd678: star_7<=star6[11];
					11'd679: star_7<=star6[10];
					11'd680: star_7<=star6[9];
					11'd681: star_7<=star6[8];
					11'd682: star_7<=star6[7];
					11'd683: star_7<=star6[6];
					11'd684: star_7<=star6[5];
					11'd685: star_7<=star6[4];
					11'd686: star_7<=star6[3];
					11'd687: star_7<=star6[2];
					11'd688: star_7<=star6[1];
					11'd689: star_7<=star6[0];
					default star_7<=0;
				endcase
			end
			11'd473: begin
				case(col)
					11'd669: star_7<=star7[20];
					11'd670: star_7<=star7[19];
					11'd671: star_7<=star7[18];
					11'd672: star_7<=star7[17];
					11'd673: star_7<=star7[16];
					11'd674: star_7<=star7[15];
					11'd675: star_7<=star7[14];
					11'd676: star_7<=star7[13];
					11'd677: star_7<=star7[12];
					11'd678: star_7<=star7[11];
					11'd679: star_7<=star7[10];
					11'd680: star_7<=star7[9];
					11'd681: star_7<=star7[8];
					11'd682: star_7<=star7[7];
					11'd683: star_7<=star7[6];
					11'd684: star_7<=star7[5];
					11'd685: star_7<=star7[4];
					11'd686: star_7<=star7[3];
					11'd687: star_7<=star7[2];
					11'd688: star_7<=star7[1];
					11'd689: star_7<=star7[0];
					default star_7<=0;
				endcase
			end
			11'd474: begin
				case(col)
					11'd669: star_7<=star8[20];
					11'd670: star_7<=star8[19];
					11'd671: star_7<=star8[18];
					11'd672: star_7<=star8[17];
					11'd673: star_7<=star8[16];
					11'd674: star_7<=star8[15];
					11'd675: star_7<=star8[14];
					11'd676: star_7<=star8[13];
					11'd677: star_7<=star8[12];
					11'd678: star_7<=star8[11];
					11'd679: star_7<=star8[10];
					11'd680: star_7<=star8[9];
					11'd681: star_7<=star8[8];
					11'd682: star_7<=star8[7];
					11'd683: star_7<=star8[6];
					11'd684: star_7<=star8[5];
					11'd685: star_7<=star8[4];
					11'd686: star_7<=star8[3];
					11'd687: star_7<=star8[2];
					11'd688: star_7<=star8[1];
					11'd689: star_7<=star8[0];
					default star_7<=0;
				endcase
			end
			11'd475: begin
				case(col)
					11'd669: star_7<=star9[20];
					11'd670: star_7<=star9[19];
					11'd671: star_7<=star9[18];
					11'd672: star_7<=star9[17];
					11'd673: star_7<=star9[16];
					11'd674: star_7<=star9[15];
					11'd675: star_7<=star9[14];
					11'd676: star_7<=star9[13];
					11'd677: star_7<=star9[12];
					11'd678: star_7<=star9[11];
					11'd679: star_7<=star9[10];
					11'd680: star_7<=star9[9];
					11'd681: star_7<=star9[8];
					11'd682: star_7<=star9[7];
					11'd683: star_7<=star9[6];
					11'd684: star_7<=star9[5];
					11'd685: star_7<=star9[4];
					11'd686: star_7<=star9[3];
					11'd687: star_7<=star9[2];
					11'd688: star_7<=star9[1];
					11'd689: star_7<=star9[0];
					default star_7<=0;
				endcase
			end
			11'd476: begin
				case(col)
					11'd669: star_7<=star10[20];
					11'd670: star_7<=star10[19];
					11'd671: star_7<=star10[18];
					11'd672: star_7<=star10[17];
					11'd673: star_7<=star10[16];
					11'd674: star_7<=star10[15];
					11'd675: star_7<=star10[14];
					11'd676: star_7<=star10[13];
					11'd677: star_7<=star10[12];
					11'd678: star_7<=star10[11];
					11'd679: star_7<=star10[10];
					11'd680: star_7<=star10[9];
					11'd681: star_7<=star10[8];
					11'd682: star_7<=star10[7];
					11'd683: star_7<=star10[6];
					11'd684: star_7<=star10[5];
					11'd685: star_7<=star10[4];
					11'd686: star_7<=star10[3];
					11'd687: star_7<=star10[2];
					11'd688: star_7<=star10[1];
					11'd689: star_7<=star10[0];
					default star_7<=0;
				endcase
			end
			11'd477: begin
				case(col)
					11'd669: star_7<=star11[20];
					11'd670: star_7<=star11[19];
					11'd671: star_7<=star11[18];
					11'd672: star_7<=star11[17];
					11'd673: star_7<=star11[16];
					11'd674: star_7<=star11[15];
					11'd675: star_7<=star11[14];
					11'd676: star_7<=star11[13];
					11'd677: star_7<=star11[12];
					11'd678: star_7<=star11[11];
					11'd679: star_7<=star11[10];
					11'd680: star_7<=star11[9];
					11'd681: star_7<=star11[8];
					11'd682: star_7<=star11[7];
					11'd683: star_7<=star11[6];
					11'd684: star_7<=star11[5];
					11'd685: star_7<=star11[4];
					11'd686: star_7<=star11[3];
					11'd687: star_7<=star11[2];
					11'd688: star_7<=star11[1];
					11'd689: star_7<=star11[0];
					default star_7<=0;
				endcase
			end
			default star_7<=0;
		endcase
	end
end


reg snow_1,snow_2,snow_3,snow_4;
reg [11:0]y1,y2,y3,y4;
wire [18:0]snow1,snow2,snow3,snow4,snow5,snow6,snow7,snow8,snow9,snow10,snow11,snow12,snow13;
assign snow1=  19'b1100000011100000110;
assign snow2=  19'b1110000011100001110;
assign snow3=  19'b0111000011100011100;
assign snow4=  19'b0011100011100111000;
assign snow5=  19'b0001111011101110000;
assign snow6=  19'b0000011111111000000;
assign snow7=  19'b1111111111111111111;
assign snow8=  19'b0000011111111000000;
assign snow9=  19'b0001111011101111000;
assign snow10= 19'b0011100011100011100;
assign snow11= 19'b0111000011100001110;
assign snow12= 19'b1110000011100000111;
assign snow13= 19'b1100000011100000011;


always@(posedge flag or posedge rst) begin
	if(rst)
		y1<=373;
	else if(y1>=618)
		y1<=373;
	else begin
		y1<=y1+5;
	end
end

always@(posedge flag or posedge rst) begin
	if(rst)
		y2<=173;
	else if(y2>=618)
		y2<=173;
	else
		y2<=y2+5;
end

always@(posedge flag or posedge rst) begin
	if(rst)
		y3<=473;
	else if(y3>=618)
		y3<=473;
	else
		y3<=y3+5;
end

always@(posedge flag or posedge rst) begin
	if(rst)
		y4<=273;
	else if(y4>=618)
		y4<=273;
	else
		y4<=y4+5;
end

/*always@(posedge clk or posedge rst) begin
	if(rst)
		bsnow_2<=0;
	else begin
		case(row)
			11'd123: begin
				case(col)
					y6:    bsnow_2<=snow1[18];
					y6+1:  bsnow_2<=snow1[17];
					y6+2:  bsnow_2<=snow1[16];
					y6+3:  bsnow_2<=snow1[15];
					y6+4:  bsnow_2<=snow1[14];
					y6+5:  bsnow_2<=snow1[13];
					y6+6:  bsnow_2<=snow1[12];
					y6+7:  bsnow_2<=snow1[11];
					y6+8:  bsnow_2<=snow1[10];
					y6+9:  bsnow_2<=snow1[9];
					y6+10: bsnow_2<=snow1[8];
					y6+11: bsnow_2<=snow1[7];
					y6+12: bsnow_2<=snow1[6];
					y6+13: bsnow_2<=snow1[5];
					y6+14: bsnow_2<=snow1[4];
					y6+15: bsnow_2<=snow1[3];
					y6+16: bsnow_2<=snow1[2];
					y6+17: bsnow_2<=snow1[1];
					y6+18: bsnow_2<=snow1[0];
					default:
						bsnow_2<=0;
				endcase
			end
			11'd124: begin
				case(col)
					y6:    bsnow_2<=snow2[18];
					y6+1:  bsnow_2<=snow2[17];
					y6+2:  bsnow_2<=snow2[16];
					y6+3:  bsnow_2<=snow2[15];
					y6+4:  bsnow_2<=snow2[14];
					y6+5:  bsnow_2<=snow2[13];
					y6+6:  bsnow_2<=snow2[12];
					y6+7:  bsnow_2<=snow2[11];
					y6+8:  bsnow_2<=snow2[10];
					y6+9:  bsnow_2<=snow2[9];
					y6+10: bsnow_2<=snow2[8];
					y6+11: bsnow_2<=snow2[7];
					y6+12: bsnow_2<=snow2[6];
					y6+13: bsnow_2<=snow2[5];
					y6+14: bsnow_2<=snow2[4];
					y6+15: bsnow_2<=snow2[3];
					y6+16: bsnow_2<=snow2[2];
					y6+17: bsnow_2<=snow2[1];
					y6+18: bsnow_2<=snow2[0];
					default:
						bsnow_2<=0;
				endcase
			end
			11'd125: begin
				case(col)
					y6:    bsnow_2<=snow3[18];
					y6+1:  bsnow_2<=snow3[17];
					y6+2:  bsnow_2<=snow3[16];
					y6+3:  bsnow_2<=snow3[15];
					y6+4:  bsnow_2<=snow3[14];
					y6+5:  bsnow_2<=snow3[13];
					y6+6:  bsnow_2<=snow3[12];
					y6+7:  bsnow_2<=snow3[11];
					y6+8:  bsnow_2<=snow3[10];
					y6+9:  bsnow_2<=snow3[9];
					y6+10: bsnow_2<=snow3[8];
					y6+11: bsnow_2<=snow3[7];
					y6+12: bsnow_2<=snow3[6];
					y6+13: bsnow_2<=snow3[5];
					y6+14: bsnow_2<=snow3[4];
					y6+15: bsnow_2<=snow3[3];
					y6+16: bsnow_2<=snow3[2];
					y6+17: bsnow_2<=snow3[1];
					y6+18: bsnow_2<=snow3[0];
					default:
						bsnow_2<=0;
				endcase
			end
			11'd126: begin
				case(col)
					y6:    bsnow_2<=snow4[18];
					y6+1:  bsnow_2<=snow4[17];
					y6+2:  bsnow_2<=snow4[16];
					y6+3:  bsnow_2<=snow4[15];
					y6+4:  bsnow_2<=snow4[14];
					y6+5:  bsnow_2<=snow4[13];
					y6+6:  bsnow_2<=snow4[12];
					y6+7:  bsnow_2<=snow4[11];
					y6+8:  bsnow_2<=snow4[10];
					y6+9:  bsnow_2<=snow4[9];
					y6+10: bsnow_2<=snow4[8];
					y6+11: bsnow_2<=snow4[7];
					y6+12: bsnow_2<=snow4[6];
					y6+13: bsnow_2<=snow4[5];
					y6+14: bsnow_2<=snow4[4];
					y6+15: bsnow_2<=snow4[3];
					y6+16: bsnow_2<=snow4[2];
					y6+17: bsnow_2<=snow4[1];
					y6+18: bsnow_2<=snow4[0];
					default:
						bsnow_2<=0;
				endcase
			end
			11'd127: begin
				case(col)
					y6:    bsnow_2<=snow5[18];
					y6+1:  bsnow_2<=snow5[17];
					y6+2:  bsnow_2<=snow5[16];
					y6+3:  bsnow_2<=snow5[15];
					y6+4:  bsnow_2<=snow5[14];
					y6+5:  bsnow_2<=snow5[13];
					y6+6:  bsnow_2<=snow5[12];
					y6+7:  bsnow_2<=snow5[11];
					y6+8:  bsnow_2<=snow5[10];
					y6+9:  bsnow_2<=snow5[9];
					y6+10: bsnow_2<=snow5[8];
					y6+11: bsnow_2<=snow5[7];
					y6+12: bsnow_2<=snow5[6];
					y6+13: bsnow_2<=snow5[5];
					y6+14: bsnow_2<=snow5[4];
					y6+15: bsnow_2<=snow5[3];
					y6+16: bsnow_2<=snow5[2];
					y6+17: bsnow_2<=snow5[1];
					y6+18: bsnow_2<=snow5[0];
					default:
						bsnow_2<=0;
				endcase
			end
			11'd128: begin
				case(col)
					y6:    bsnow_2<=snow6[18];
					y6+1:  bsnow_2<=snow6[17];
					y6+2:  bsnow_2<=snow6[16];
					y6+3:  bsnow_2<=snow6[15];
					y6+4:  bsnow_2<=snow6[14];
					y6+5:  bsnow_2<=snow6[13];
					y6+6:  bsnow_2<=snow6[12];
					y6+7:  bsnow_2<=snow6[11];
					y6+8:  bsnow_2<=snow6[10];
					y6+9:  bsnow_2<=snow6[9];
					y6+10: bsnow_2<=snow6[8];
					y6+11: bsnow_2<=snow6[7];
					y6+12: bsnow_2<=snow6[6];
					y6+13: bsnow_2<=snow6[5];
					y6+14: bsnow_2<=snow6[4];
					y6+15: bsnow_2<=snow6[3];
					y6+16: bsnow_2<=snow6[2];
					y6+17: bsnow_2<=snow6[1];
					y6+18: bsnow_2<=snow6[0];
					default:
						bsnow_2<=0;
				endcase
			end
			11'd129: begin
				case(col)
					y6:    bsnow_2<=snow7[18];
					y6+1:  bsnow_2<=snow7[17];
					y6+2:  bsnow_2<=snow7[16];
					y6+3:  bsnow_2<=snow7[15];
					y6+4:  bsnow_2<=snow7[14];
					y6+5:  bsnow_2<=snow7[13];
					y6+6:  bsnow_2<=snow7[12];
					y6+7:  bsnow_2<=snow7[11];
					y6+8:  bsnow_2<=snow7[10];
					y6+9:  bsnow_2<=snow7[9];
					y6+10: bsnow_2<=snow7[8];
					y6+11: bsnow_2<=snow7[7];
					y6+12: bsnow_2<=snow7[6];
					y6+13: bsnow_2<=snow7[5];
					y6+14: bsnow_2<=snow7[4];
					y6+15: bsnow_2<=snow7[3];
					y6+16: bsnow_2<=snow7[2];
					y6+17: bsnow_2<=snow7[1];
					y6+18: bsnow_2<=snow7[0];
					default:
						bsnow_2<=0;
				endcase
			end
			11'd130: begin
				case(col)
					y6:    bsnow_2<=snow8[18];
					y6+1:  bsnow_2<=snow8[17];
					y6+2:  bsnow_2<=snow8[16];
					y6+3:  bsnow_2<=snow8[15];
					y6+4:  bsnow_2<=snow8[14];
					y6+5:  bsnow_2<=snow8[13];
					y6+6:  bsnow_2<=snow8[12];
					y6+7:  bsnow_2<=snow8[11];
					y6+8:  bsnow_2<=snow8[10];
					y6+9:  bsnow_2<=snow8[9];
					y6+10: bsnow_2<=snow8[8];
					y6+11: bsnow_2<=snow8[7];
					y6+12: bsnow_2<=snow8[6];
					y6+13: bsnow_2<=snow8[5];
					y6+14: bsnow_2<=snow8[4];
					y6+15: bsnow_2<=snow8[3];
					y6+16: bsnow_2<=snow8[2];
					y6+17: bsnow_2<=snow8[1];
					y6+18: bsnow_2<=snow8[0];
					default:
						bsnow_2<=0;
				endcase
			end
			11'd131: begin
				case(col)
					y6:    bsnow_2<=snow9[18];
					y6+1:  bsnow_2<=snow9[17];
					y6+2:  bsnow_2<=snow9[16];
					y6+3:  bsnow_2<=snow9[15];
					y6+4:  bsnow_2<=snow9[14];
					y6+5:  bsnow_2<=snow9[13];
					y6+6:  bsnow_2<=snow9[12];
					y6+7:  bsnow_2<=snow9[11];
					y6+8:  bsnow_2<=snow9[10];
					y6+9:  bsnow_2<=snow9[9];
					y6+10: bsnow_2<=snow9[8];
					y6+11: bsnow_2<=snow9[7];
					y6+12: bsnow_2<=snow9[6];
					y6+13: bsnow_2<=snow9[5];
					y6+14: bsnow_2<=snow9[4];
					y6+15: bsnow_2<=snow9[3];
					y6+16: bsnow_2<=snow9[2];
					y6+17: bsnow_2<=snow9[1];
					y6+18: bsnow_2<=snow9[0];
					default:
						bsnow_2<=0;
				endcase
			end
			11'd132: begin
				case(col)
					y6:    bsnow_2<=snow10[18];
					y6+1:  bsnow_2<=snow10[17];
					y6+2:  bsnow_2<=snow10[16];
					y6+3:  bsnow_2<=snow10[15];
					y6+4:  bsnow_2<=snow10[14];
					y6+5:  bsnow_2<=snow10[13];
					y6+6:  bsnow_2<=snow10[12];
					y6+7:  bsnow_2<=snow10[11];
					y6+8:  bsnow_2<=snow10[10];
					y6+9:  bsnow_2<=snow10[9];
					y6+10: bsnow_2<=snow10[8];
					y6+11: bsnow_2<=snow10[7];
					y6+12: bsnow_2<=snow10[6];
					y6+13: bsnow_2<=snow10[5];
					y6+14: bsnow_2<=snow10[4];
					y6+15: bsnow_2<=snow10[3];
					y6+16: bsnow_2<=snow10[2];
					y6+17: bsnow_2<=snow10[1];
					y6+18: bsnow_2<=snow10[0];
					default:
						bsnow_2<=0;
				endcase
			end
			11'd133: begin
				case(col)
					y6:    bsnow_2<=snow11[18];
					y6+1:  bsnow_2<=snow11[17];
					y6+2:  bsnow_2<=snow11[16];
					y6+3:  bsnow_2<=snow11[15];
					y6+4:  bsnow_2<=snow11[14];
					y6+5:  bsnow_2<=snow11[13];
					y6+6:  bsnow_2<=snow11[12];
					y6+7:  bsnow_2<=snow11[11];
					y6+8:  bsnow_2<=snow11[10];
					y6+9:  bsnow_2<=snow11[9];
					y6+10: bsnow_2<=snow11[8];
					y6+11: bsnow_2<=snow11[7];
					y6+12: bsnow_2<=snow11[6];
					y6+13: bsnow_2<=snow11[5];
					y6+14: bsnow_2<=snow11[4];
					y6+15: bsnow_2<=snow11[3];
					y6+16: bsnow_2<=snow11[2];
					y6+17: bsnow_2<=snow11[1];
					y6+18: bsnow_2<=snow11[0];
					default:
						bsnow_2<=0;
				endcase
			end
			11'd134: begin
				case(col)
					y6:    bsnow_2<=snow12[18];
					y6+1:  bsnow_2<=snow12[17];
					y6+2:  bsnow_2<=snow12[16];
					y6+3:  bsnow_2<=snow12[15];
					y6+4:  bsnow_2<=snow12[14];
					y6+5:  bsnow_2<=snow12[13];
					y6+6:  bsnow_2<=snow12[12];
					y6+7:  bsnow_2<=snow12[11];
					y6+8:  bsnow_2<=snow12[10];
					y6+9:  bsnow_2<=snow12[9];
					y6+10: bsnow_2<=snow12[8];
					y6+11: bsnow_2<=snow12[7];
					y6+12: bsnow_2<=snow12[6];
					y6+13: bsnow_2<=snow12[5];
					y6+14: bsnow_2<=snow12[4];
					y6+15: bsnow_2<=snow12[3];
					y6+16: bsnow_2<=snow12[2];
					y6+17: bsnow_2<=snow12[1];
					y6+18: bsnow_2<=snow12[0];
					default:
						bsnow_2<=0;
				endcase
			end
			11'd135: begin
				case(col)
					y6:    bsnow_2<=snow13[18];
					y6+1:  bsnow_2<=snow13[17];
					y6+2:  bsnow_2<=snow13[16];
					y6+3:  bsnow_2<=snow13[15];
					y6+4:  bsnow_2<=snow13[14];
					y6+5:  bsnow_2<=snow13[13];
					y6+6:  bsnow_2<=snow13[12];
					y6+7:  bsnow_2<=snow13[11];
					y6+8:  bsnow_2<=snow13[10];
					y6+9:  bsnow_2<=snow13[9];
					y6+10: bsnow_2<=snow13[8];
					y6+11: bsnow_2<=snow13[7];
					y6+12: bsnow_2<=snow13[6];
					y6+13: bsnow_2<=snow13[5];
					y6+14: bsnow_2<=snow13[4];
					y6+15: bsnow_2<=snow13[3];
					y6+16: bsnow_2<=snow13[2];
					y6+17: bsnow_2<=snow13[1];
					y6+18: bsnow_2<=snow13[0];
					default:
						bsnow_2<=0;
				endcase
			end
			default:
				bsnow_2<=0;
		endcase
	end
end

always@(posedge clk or posedge rst) begin
	if(rst)
		bsnow_1<=0;
	else begin
		case(row)
			y5: begin
				case(col)
					11'd224: bsnow_1<=snow1[18];
					11'd225: bsnow_1<=snow1[17];
					11'd226: bsnow_1<=snow1[16];
					11'd227: bsnow_1<=snow1[15];
					11'd228: bsnow_1<=snow1[14];
					11'd229: bsnow_1<=snow1[13];
					11'd230: bsnow_1<=snow1[12];
					11'd231: bsnow_1<=snow1[11];
					11'd232: bsnow_1<=snow1[10];
					11'd233: bsnow_1<=snow1[9];
					11'd234: bsnow_1<=snow1[8];
					11'd235: bsnow_1<=snow1[7];
					11'd236: bsnow_1<=snow1[6];
					11'd237: bsnow_1<=snow1[5];
					11'd238: bsnow_1<=snow1[4];
					11'd239: bsnow_1<=snow1[3];
					11'd240: bsnow_1<=snow1[2];
					11'd241: bsnow_1<=snow1[1];
					11'd242: bsnow_1<=snow1[0];
					default: bsnow_1<=0;
				endcase
			end
			y5+1: begin
				case(col)
					11'd224: bsnow_1<=snow2[18];
					11'd225: bsnow_1<=snow2[17];
					11'd226: bsnow_1<=snow2[16];
					11'd227: bsnow_1<=snow2[15];
					11'd228: bsnow_1<=snow2[14];
					11'd229: bsnow_1<=snow2[13];
					11'd230: bsnow_1<=snow2[12];
					11'd231: bsnow_1<=snow2[11];
					11'd232: bsnow_1<=snow2[10];
					11'd233: bsnow_1<=snow2[9];
					11'd234: bsnow_1<=snow2[8];
					11'd235: bsnow_1<=snow2[7];
					11'd236: bsnow_1<=snow2[6];
					11'd237: bsnow_1<=snow2[5];
					11'd238: bsnow_1<=snow2[4];
					11'd239: bsnow_1<=snow2[3];
					11'd240: bsnow_1<=snow2[2];
					11'd241: bsnow_1<=snow2[1];
					11'd242: bsnow_1<=snow2[0];
					default: bsnow_1<=0;
				endcase
			end
			y5+2: begin
				case(col)
					11'd224: bsnow_1<=snow3[18];
					11'd225: bsnow_1<=snow3[17];
					11'd226: bsnow_1<=snow3[16];
					11'd227: bsnow_1<=snow3[15];
					11'd228: bsnow_1<=snow3[14];
					11'd229: bsnow_1<=snow3[13];
					11'd230: bsnow_1<=snow3[12];
					11'd231: bsnow_1<=snow3[11];
					11'd232: bsnow_1<=snow3[10];
					11'd233: bsnow_1<=snow3[9];
					11'd234: bsnow_1<=snow3[8];
					11'd235: bsnow_1<=snow3[7];
					11'd236: bsnow_1<=snow3[6];
					11'd237: bsnow_1<=snow3[5];
					11'd238: bsnow_1<=snow3[4];
					11'd239: bsnow_1<=snow3[3];
					11'd240: bsnow_1<=snow3[2];
					11'd241: bsnow_1<=snow3[1];
					11'd242: bsnow_1<=snow3[0];
					default: bsnow_1<=0;
				endcase
			end 
			y5+3: begin
				case(col)
					11'd224: bsnow_1<=snow4[18];
					11'd225: bsnow_1<=snow4[17];
					11'd226: bsnow_1<=snow4[16];
					11'd227: bsnow_1<=snow4[15];
					11'd228: bsnow_1<=snow4[14];
					11'd229: bsnow_1<=snow4[13];
					11'd230: bsnow_1<=snow4[12];
					11'd231: bsnow_1<=snow4[11];
					11'd232: bsnow_1<=snow4[10];
					11'd233: bsnow_1<=snow4[9];
					11'd234: bsnow_1<=snow4[8];
					11'd235: bsnow_1<=snow4[7];
					11'd236: bsnow_1<=snow4[6];
					11'd237: bsnow_1<=snow4[5];
					11'd238: bsnow_1<=snow4[4];
					11'd239: bsnow_1<=snow4[3];
					11'd240: bsnow_1<=snow4[2];
					11'd241: bsnow_1<=snow4[1];
					11'd242: bsnow_1<=snow4[0];
					default: bsnow_1<=0;
				endcase
			end
			y5+4: begin
				case(col)
					11'd224: bsnow_1<=snow5[18];
					11'd225: bsnow_1<=snow5[17];
					11'd226: bsnow_1<=snow5[16];
					11'd227: bsnow_1<=snow5[15];
					11'd228: bsnow_1<=snow5[14];
					11'd229: bsnow_1<=snow5[13];
					11'd230: bsnow_1<=snow5[12];
					11'd231: bsnow_1<=snow5[11];
					11'd232: bsnow_1<=snow5[10];
					11'd233: bsnow_1<=snow5[9];
					11'd234: bsnow_1<=snow5[8];
					11'd235: bsnow_1<=snow5[7];
					11'd236: bsnow_1<=snow5[6];
					11'd237: bsnow_1<=snow5[5];
					11'd238: bsnow_1<=snow5[4];
					11'd239: bsnow_1<=snow5[3];
					11'd240: bsnow_1<=snow5[2];
					11'd241: bsnow_1<=snow5[1];
					11'd242: bsnow_1<=snow5[0];
					default: bsnow_1<=0;
				endcase
			end
			y5+5: begin
				case(col)
					11'd224: bsnow_1<=snow6[18];
					11'd225: bsnow_1<=snow6[17];
					11'd226: bsnow_1<=snow6[16];
					11'd227: bsnow_1<=snow6[15];
					11'd228: bsnow_1<=snow6[14];
					11'd229: bsnow_1<=snow6[13];
					11'd230: bsnow_1<=snow6[12];
					11'd231: bsnow_1<=snow6[11];
					11'd232: bsnow_1<=snow6[10];
					11'd233: bsnow_1<=snow6[9];
					11'd234: bsnow_1<=snow6[8];
					11'd235: bsnow_1<=snow6[7];
					11'd236: bsnow_1<=snow6[6];
					11'd237: bsnow_1<=snow6[5];
					11'd238: bsnow_1<=snow6[4];
					11'd239: bsnow_1<=snow6[3];
					11'd240: bsnow_1<=snow6[2];
					11'd241: bsnow_1<=snow6[1];
					11'd242: bsnow_1<=snow6[0];
					default: bsnow_1<=0;
				endcase
			end
			y5+6: begin
				case(col)
					11'd224: bsnow_1<=snow7[18];
					11'd225: bsnow_1<=snow7[17];
					11'd226: bsnow_1<=snow7[16];
					11'd227: bsnow_1<=snow7[15];
					11'd228: bsnow_1<=snow7[14];
					11'd229: bsnow_1<=snow7[13];
					11'd230: bsnow_1<=snow7[12];
					11'd231: bsnow_1<=snow7[11];
					11'd232: bsnow_1<=snow7[10];
					11'd233: bsnow_1<=snow7[9];
					11'd234: bsnow_1<=snow7[8];
					11'd235: bsnow_1<=snow7[7];
					11'd236: bsnow_1<=snow7[6];
					11'd237: bsnow_1<=snow7[5];
					11'd238: bsnow_1<=snow7[4];
					11'd239: bsnow_1<=snow7[3];
					11'd240: bsnow_1<=snow7[2];
					11'd241: bsnow_1<=snow7[1];
					11'd242: bsnow_1<=snow7[0];
					default: bsnow_1<=0;
				endcase
			end
			y5+7: begin
				case(col)
					11'd224: bsnow_1<=snow8[18];
					11'd225: bsnow_1<=snow8[17];
					11'd226: bsnow_1<=snow8[16];
					11'd227: bsnow_1<=snow8[15];
					11'd228: bsnow_1<=snow8[14];
					11'd229: bsnow_1<=snow8[13];
					11'd230: bsnow_1<=snow8[12];
					11'd231: bsnow_1<=snow8[11];
					11'd232: bsnow_1<=snow8[10];
					11'd233: bsnow_1<=snow8[9];
					11'd234: bsnow_1<=snow8[8];
					11'd235: bsnow_1<=snow8[7];
					11'd236: bsnow_1<=snow8[6];
					11'd237: bsnow_1<=snow8[5];
					11'd238: bsnow_1<=snow8[4];
					11'd239: bsnow_1<=snow8[3];
					11'd240: bsnow_1<=snow8[2];
					11'd241: bsnow_1<=snow8[1];
					11'd242: bsnow_1<=snow8[0];
					default: bsnow_1<=0;
				endcase
			end
			y5+8: begin
				case(col)
					11'd224: bsnow_1<=snow9[18];
					11'd225: bsnow_1<=snow9[17];
					11'd226: bsnow_1<=snow9[16];
					11'd227: bsnow_1<=snow9[15];
					11'd228: bsnow_1<=snow9[14];
					11'd229: bsnow_1<=snow9[13];
					11'd230: bsnow_1<=snow9[12];
					11'd231: bsnow_1<=snow9[11];
					11'd232: bsnow_1<=snow9[10];
					11'd233: bsnow_1<=snow9[9];
					11'd234: bsnow_1<=snow9[8];
					11'd235: bsnow_1<=snow9[7];
					11'd236: bsnow_1<=snow9[6];
					11'd237: bsnow_1<=snow9[5];
					11'd238: bsnow_1<=snow9[4];
					11'd239: bsnow_1<=snow9[3];
					11'd240: bsnow_1<=snow9[2];
					11'd241: bsnow_1<=snow9[1];
					11'd242: bsnow_1<=snow9[0];
					default: bsnow_1<=0;
				endcase
			end
			y5+9: begin
				case(col)
					11'd224: bsnow_1<=snow10[18];
					11'd225: bsnow_1<=snow10[17];
					11'd226: bsnow_1<=snow10[16];
					11'd227: bsnow_1<=snow10[15];
					11'd228: bsnow_1<=snow10[14];
					11'd229: bsnow_1<=snow10[13];
					11'd230: bsnow_1<=snow10[12];
					11'd231: bsnow_1<=snow10[11];
					11'd232: bsnow_1<=snow10[10];
					11'd233: bsnow_1<=snow10[9];
					11'd234: bsnow_1<=snow10[8];
					11'd235: bsnow_1<=snow10[7];
					11'd236: bsnow_1<=snow10[6];
					11'd237: bsnow_1<=snow10[5];
					11'd238: bsnow_1<=snow10[4];
					11'd239: bsnow_1<=snow10[3];
					11'd240: bsnow_1<=snow10[2];
					11'd241: bsnow_1<=snow10[1];
					11'd242: bsnow_1<=snow10[0];
					default: bsnow_1<=0;
				endcase
			end
			y5+10: begin
				case(col)
					11'd224: bsnow_1<=snow11[18];
					11'd225: bsnow_1<=snow11[17];
					11'd226: bsnow_1<=snow11[16];
					11'd227: bsnow_1<=snow11[15];
					11'd228: bsnow_1<=snow11[14];
					11'd229: bsnow_1<=snow11[13];
					11'd230: bsnow_1<=snow11[12];
					11'd231: bsnow_1<=snow11[11];
					11'd232: bsnow_1<=snow11[10];
					11'd233: bsnow_1<=snow11[9];
					11'd234: bsnow_1<=snow11[8];
					11'd235: bsnow_1<=snow11[7];
					11'd236: bsnow_1<=snow11[6];
					11'd237: bsnow_1<=snow11[5];
					11'd238: bsnow_1<=snow11[4];
					11'd239: bsnow_1<=snow11[3];
					11'd240: bsnow_1<=snow11[2];
					11'd241: bsnow_1<=snow11[1];
					11'd242: bsnow_1<=snow11[0];
					default: bsnow_1<=0;
				endcase
			end
			y5+11: begin
				case(col)
					11'd224: bsnow_1<=snow12[18];
					11'd225: bsnow_1<=snow12[17];
					11'd226: bsnow_1<=snow12[16];
					11'd227: bsnow_1<=snow12[15];
					11'd228: bsnow_1<=snow12[14];
					11'd229: bsnow_1<=snow12[13];
					11'd230: bsnow_1<=snow12[12];
					11'd231: bsnow_1<=snow12[11];
					11'd232: bsnow_1<=snow12[10];
					11'd233: bsnow_1<=snow12[9];
					11'd234: bsnow_1<=snow12[8];
					11'd235: bsnow_1<=snow12[7];
					11'd236: bsnow_1<=snow12[6];
					11'd237: bsnow_1<=snow12[5];
					11'd238: bsnow_1<=snow12[4];
					11'd239: bsnow_1<=snow12[3];
					11'd240: bsnow_1<=snow12[2];
					11'd241: bsnow_1<=snow12[1];
					11'd242: bsnow_1<=snow12[0];
					default: bsnow_1<=0;
				endcase
			end
			y5+12: begin
				case(col)
					11'd224: bsnow_1<=snow13[18];
					11'd225: bsnow_1<=snow13[17];
					11'd226: bsnow_1<=snow13[16];
					11'd227: bsnow_1<=snow13[15];
					11'd228: bsnow_1<=snow13[14];
					11'd229: bsnow_1<=snow13[13];
					11'd230: bsnow_1<=snow13[12];
					11'd231: bsnow_1<=snow13[11];
					11'd232: bsnow_1<=snow13[10];
					11'd233: bsnow_1<=snow13[9];
					11'd234: bsnow_1<=snow13[8];
					11'd235: bsnow_1<=snow13[7];
					11'd236: bsnow_1<=snow13[6];
					11'd237: bsnow_1<=snow13[5];
					11'd238: bsnow_1<=snow13[4];
					11'd239: bsnow_1<=snow13[3];
					11'd240: bsnow_1<=snow13[2];
					11'd241: bsnow_1<=snow13[1];
					11'd242: bsnow_1<=snow13[0];
					default: bsnow_1<=0;
				endcase
			end
			default: bsnow_1<=0;
		endcase
	end
end*/



always@(posedge clk or posedge rst) begin
	if(rst)
		snow_1<=0;
	else begin
		case(row)
			y1: begin
				case(col)
					11'd174: snow_1<=snow1[18];
					11'd175: snow_1<=snow1[17];
					11'd176: snow_1<=snow1[16];
					11'd177: snow_1<=snow1[15];
					11'd178: snow_1<=snow1[14];
					11'd179: snow_1<=snow1[13];
					11'd180: snow_1<=snow1[12];
					11'd181: snow_1<=snow1[11];
					11'd182: snow_1<=snow1[10];
					11'd183: snow_1<=snow1[9];
					11'd184: snow_1<=snow1[8];
					11'd185: snow_1<=snow1[7];
					11'd186: snow_1<=snow1[6];
					11'd187: snow_1<=snow1[5];
					11'd188: snow_1<=snow1[4];
					11'd189: snow_1<=snow1[3];
					11'd190: snow_1<=snow1[2];
					11'd191: snow_1<=snow1[1];
					11'd192: snow_1<=snow1[0];
					default: snow_1<=0;
				endcase
			end
			y1+1: begin
				case(col)
					11'd174: snow_1<=snow2[18];
					11'd175: snow_1<=snow2[17];
					11'd176: snow_1<=snow2[16];
					11'd177: snow_1<=snow2[15];
					11'd178: snow_1<=snow2[14];
					11'd179: snow_1<=snow2[13];
					11'd180: snow_1<=snow2[12];
					11'd181: snow_1<=snow2[11];
					11'd182: snow_1<=snow2[10];
					11'd183: snow_1<=snow2[9];
					11'd184: snow_1<=snow2[8];
					11'd185: snow_1<=snow2[7];
					11'd186: snow_1<=snow2[6];
					11'd187: snow_1<=snow2[5];
					11'd188: snow_1<=snow2[4];
					11'd189: snow_1<=snow2[3];
					11'd190: snow_1<=snow2[2];
					11'd191: snow_1<=snow2[1];
					11'd192: snow_1<=snow2[0];
					default: snow_1<=0;
				endcase
			end
			y1+2: begin
				case(col)
					11'd174: snow_1<=snow3[18];
					11'd175: snow_1<=snow3[17];
					11'd176: snow_1<=snow3[16];
					11'd177: snow_1<=snow3[15];
					11'd178: snow_1<=snow3[14];
					11'd179: snow_1<=snow3[13];
					11'd180: snow_1<=snow3[12];
					11'd181: snow_1<=snow3[11];
					11'd182: snow_1<=snow3[10];
					11'd183: snow_1<=snow3[9];
					11'd184: snow_1<=snow3[8];
					11'd185: snow_1<=snow3[7];
					11'd186: snow_1<=snow3[6];
					11'd187: snow_1<=snow3[5];
					11'd188: snow_1<=snow3[4];
					11'd189: snow_1<=snow3[3];
					11'd190: snow_1<=snow3[2];
					11'd191: snow_1<=snow3[1];
					11'd192: snow_1<=snow3[0];
					default: snow_1<=0;
				endcase
			end
			y1+3: begin
				case(col)
					11'd174: snow_1<=snow4[18];
					11'd175: snow_1<=snow4[17];
					11'd176: snow_1<=snow4[16];
					11'd177: snow_1<=snow4[15];
					11'd178: snow_1<=snow4[14];
					11'd179: snow_1<=snow4[13];
					11'd180: snow_1<=snow4[12];
					11'd181: snow_1<=snow4[11];
					11'd182: snow_1<=snow4[10];
					11'd183: snow_1<=snow4[9];
					11'd184: snow_1<=snow4[8];
					11'd185: snow_1<=snow4[7];
					11'd186: snow_1<=snow4[6];
					11'd187: snow_1<=snow4[5];
					11'd188: snow_1<=snow4[4];
					11'd189: snow_1<=snow4[3];
					11'd190: snow_1<=snow4[2];
					11'd191: snow_1<=snow4[1];
					11'd192: snow_1<=snow4[0];
					default: snow_1<=0;
				endcase
			end
			y1+4: begin
				case(col)
					11'd174: snow_1<=snow5[18];
					11'd175: snow_1<=snow5[17];
					11'd176: snow_1<=snow5[16];
					11'd177: snow_1<=snow5[15];
					11'd178: snow_1<=snow5[14];
					11'd179: snow_1<=snow5[13];
					11'd180: snow_1<=snow5[12];
					11'd181: snow_1<=snow5[11];
					11'd182: snow_1<=snow5[10];
					11'd183: snow_1<=snow5[9];
					11'd184: snow_1<=snow5[8];
					11'd185: snow_1<=snow5[7];
					11'd186: snow_1<=snow5[6];
					11'd187: snow_1<=snow5[5];
					11'd188: snow_1<=snow5[4];
					11'd189: snow_1<=snow5[3];
					11'd190: snow_1<=snow5[2];
					11'd191: snow_1<=snow5[1];
					11'd192: snow_1<=snow5[0];
					default: snow_1<=0;
				endcase
			end
			y1+5: begin
				case(col)
					11'd174: snow_1<=snow6[18];
					11'd175: snow_1<=snow6[17];
					11'd176: snow_1<=snow6[16];
					11'd177: snow_1<=snow6[15];
					11'd178: snow_1<=snow6[14];
					11'd179: snow_1<=snow6[13];
					11'd180: snow_1<=snow6[12];
					11'd181: snow_1<=snow6[11];
					11'd182: snow_1<=snow6[10];
					11'd183: snow_1<=snow6[9];
					11'd184: snow_1<=snow6[8];
					11'd185: snow_1<=snow6[7];
					11'd186: snow_1<=snow6[6];
					11'd187: snow_1<=snow6[5];
					11'd188: snow_1<=snow6[4];
					11'd189: snow_1<=snow6[3];
					11'd190: snow_1<=snow6[2];
					11'd191: snow_1<=snow6[1];
					11'd192: snow_1<=snow6[0];
					default: snow_1<=0;
				endcase
			end
			y1+6: begin
				case(col)
					11'd174: snow_1<=snow7[18];
					11'd175: snow_1<=snow7[17];
					11'd176: snow_1<=snow7[16];
					11'd177: snow_1<=snow7[15];
					11'd178: snow_1<=snow7[14];
					11'd179: snow_1<=snow7[13];
					11'd180: snow_1<=snow7[12];
					11'd181: snow_1<=snow7[11];
					11'd182: snow_1<=snow7[10];
					11'd183: snow_1<=snow7[9];
					11'd184: snow_1<=snow7[8];
					11'd185: snow_1<=snow7[7];
					11'd186: snow_1<=snow7[6];
					11'd187: snow_1<=snow7[5];
					11'd188: snow_1<=snow7[4];
					11'd189: snow_1<=snow7[3];
					11'd190: snow_1<=snow7[2];
					11'd191: snow_1<=snow7[1];
					11'd192: snow_1<=snow7[0];
					default: snow_1<=0;
				endcase
			end
			y1+7: begin
				case(col)
					11'd174: snow_1<=snow8[18];
					11'd175: snow_1<=snow8[17];
					11'd176: snow_1<=snow8[16];
					11'd177: snow_1<=snow8[15];
					11'd178: snow_1<=snow8[14];
					11'd179: snow_1<=snow8[13];
					11'd180: snow_1<=snow8[12];
					11'd181: snow_1<=snow8[11];
					11'd182: snow_1<=snow8[10];
					11'd183: snow_1<=snow8[9];
					11'd184: snow_1<=snow8[8];
					11'd185: snow_1<=snow8[7];
					11'd186: snow_1<=snow8[6];
					11'd187: snow_1<=snow8[5];
					11'd188: snow_1<=snow8[4];
					11'd189: snow_1<=snow8[3];
					11'd190: snow_1<=snow8[2];
					11'd191: snow_1<=snow8[1];
					11'd192: snow_1<=snow8[0];
					default: snow_1<=0;
				endcase
			end
			y1+8: begin
				case(col)
					11'd174: snow_1<=snow9[18];
					11'd175: snow_1<=snow9[17];
					11'd176: snow_1<=snow9[16];
					11'd177: snow_1<=snow9[15];
					11'd178: snow_1<=snow9[14];
					11'd179: snow_1<=snow9[13];
					11'd180: snow_1<=snow9[12];
					11'd181: snow_1<=snow9[11];
					11'd182: snow_1<=snow9[10];
					11'd183: snow_1<=snow9[9];
					11'd184: snow_1<=snow9[8];
					11'd185: snow_1<=snow9[7];
					11'd186: snow_1<=snow9[6];
					11'd187: snow_1<=snow9[5];
					11'd188: snow_1<=snow9[4];
					11'd189: snow_1<=snow9[3];
					11'd190: snow_1<=snow9[2];
					11'd191: snow_1<=snow9[1];
					11'd192: snow_1<=snow9[0];
					default: snow_1<=0;
				endcase
			end
			y1+9: begin
				case(col)
					11'd174: snow_1<=snow10[18];
					11'd175: snow_1<=snow10[17];
					11'd176: snow_1<=snow10[16];
					11'd177: snow_1<=snow10[15];
					11'd178: snow_1<=snow10[14];
					11'd179: snow_1<=snow10[13];
					11'd180: snow_1<=snow10[12];
					11'd181: snow_1<=snow10[11];
					11'd182: snow_1<=snow10[10];
					11'd183: snow_1<=snow10[9];
					11'd184: snow_1<=snow10[8];
					11'd185: snow_1<=snow10[7];
					11'd186: snow_1<=snow10[6];
					11'd187: snow_1<=snow10[5];
					11'd188: snow_1<=snow10[4];
					11'd189: snow_1<=snow10[3];
					11'd190: snow_1<=snow10[2];
					11'd191: snow_1<=snow10[1];
					11'd192: snow_1<=snow10[0];
					default: snow_1<=0;
				endcase
			end
			y1+10: begin
				case(col)
					11'd174: snow_1<=snow11[18];
					11'd175: snow_1<=snow11[17];
					11'd176: snow_1<=snow11[16];
					11'd177: snow_1<=snow11[15];
					11'd178: snow_1<=snow11[14];
					11'd179: snow_1<=snow11[13];
					11'd180: snow_1<=snow11[12];
					11'd181: snow_1<=snow11[11];
					11'd182: snow_1<=snow11[10];
					11'd183: snow_1<=snow11[9];
					11'd184: snow_1<=snow11[8];
					11'd185: snow_1<=snow11[7];
					11'd186: snow_1<=snow11[6];
					11'd187: snow_1<=snow11[5];
					11'd188: snow_1<=snow11[4];
					11'd189: snow_1<=snow11[3];
					11'd190: snow_1<=snow11[2];
					11'd191: snow_1<=snow11[1];
					11'd192: snow_1<=snow11[0];
					default: snow_1<=0;
				endcase
			end
			y1+11: begin
				case(col)
					11'd174: snow_1<=snow12[18];
					11'd175: snow_1<=snow12[17];
					11'd176: snow_1<=snow12[16];
					11'd177: snow_1<=snow12[15];
					11'd178: snow_1<=snow12[14];
					11'd179: snow_1<=snow12[13];
					11'd180: snow_1<=snow12[12];
					11'd181: snow_1<=snow12[11];
					11'd182: snow_1<=snow12[10];
					11'd183: snow_1<=snow12[9];
					11'd184: snow_1<=snow12[8];
					11'd185: snow_1<=snow12[7];
					11'd186: snow_1<=snow12[6];
					11'd187: snow_1<=snow12[5];
					11'd188: snow_1<=snow12[4];
					11'd189: snow_1<=snow12[3];
					11'd190: snow_1<=snow12[2];
					11'd191: snow_1<=snow12[1];
					11'd192: snow_1<=snow12[0];
					default: snow_1<=0;
				endcase
			end
			y1+12: begin
				case(col)
					11'd174: snow_1<=snow13[18];
					11'd175: snow_1<=snow13[17];
					11'd176: snow_1<=snow13[16];
					11'd177: snow_1<=snow13[15];
					11'd178: snow_1<=snow13[14];
					11'd179: snow_1<=snow13[13];
					11'd180: snow_1<=snow13[12];
					11'd181: snow_1<=snow13[11];
					11'd182: snow_1<=snow13[10];
					11'd183: snow_1<=snow13[9];
					11'd184: snow_1<=snow13[8];
					11'd185: snow_1<=snow13[7];
					11'd186: snow_1<=snow13[6];
					11'd187: snow_1<=snow13[5];
					11'd188: snow_1<=snow13[4];
					11'd189: snow_1<=snow13[3];
					11'd190: snow_1<=snow13[2];
					11'd191: snow_1<=snow13[1];
					11'd192: snow_1<=snow13[0];
					default: snow_1<=0;
				endcase
			end
			default: snow_1<=0;
		endcase
	end
end

always@(posedge clk or posedge rst) begin
	if(rst)
		snow_2<=0;
	else begin
		case(row)
			y2: begin
				case(col)
					11'd271: snow_2<=snow1[18];
					11'd272: snow_2<=snow1[17];
					11'd273: snow_2<=snow1[16];
					11'd274: snow_2<=snow1[15];
					11'd275: snow_2<=snow1[14];
					11'd276: snow_2<=snow1[13];
					11'd277: snow_2<=snow1[12];
					11'd278: snow_2<=snow1[11];
					11'd279: snow_2<=snow1[10];
					11'd280: snow_2<=snow1[9];
					11'd281: snow_2<=snow1[8];
					11'd282: snow_2<=snow1[7];
					11'd283: snow_2<=snow1[6];
					11'd284: snow_2<=snow1[5];
					11'd285: snow_2<=snow1[4];
					11'd286: snow_2<=snow1[3];
					11'd287: snow_2<=snow1[2];
					11'd288: snow_2<=snow1[1];
					11'd289: snow_2<=snow1[0];
					default: snow_2<=0;
				endcase
			end
			y2+1: begin
				case(col)
					11'd271: snow_2<=snow2[18];
					11'd272: snow_2<=snow2[17];
					11'd273: snow_2<=snow2[16];
					11'd274: snow_2<=snow2[15];
					11'd275: snow_2<=snow2[14];
					11'd276: snow_2<=snow2[13];
					11'd277: snow_2<=snow2[12];
					11'd278: snow_2<=snow2[11];
					11'd279: snow_2<=snow2[10];
					11'd280: snow_2<=snow2[9];
					11'd281: snow_2<=snow2[8];
					11'd282: snow_2<=snow2[7];
					11'd283: snow_2<=snow2[6];
					11'd284: snow_2<=snow2[5];
					11'd285: snow_2<=snow2[4];
					11'd286: snow_2<=snow2[3];
					11'd287: snow_2<=snow2[2];
					11'd288: snow_2<=snow2[1];
					11'd289: snow_2<=snow2[0];
					default: snow_2<=0;
				endcase
			end
			y2+2: begin
				case(col)
					11'd271: snow_2<=snow3[18];
					11'd272: snow_2<=snow3[17];
					11'd273: snow_2<=snow3[16];
					11'd274: snow_2<=snow3[15];
					11'd275: snow_2<=snow3[14];
					11'd276: snow_2<=snow3[13];
					11'd277: snow_2<=snow3[12];
					11'd278: snow_2<=snow3[11];
					11'd279: snow_2<=snow3[10];
					11'd280: snow_2<=snow3[9];
					11'd281: snow_2<=snow3[8];
					11'd282: snow_2<=snow3[7];
					11'd283: snow_2<=snow3[6];
					11'd284: snow_2<=snow3[5];
					11'd285: snow_2<=snow3[4];
					11'd286: snow_2<=snow3[3];
					11'd287: snow_2<=snow3[2];
					11'd288: snow_2<=snow3[1];
					11'd289: snow_2<=snow3[0];
					default: snow_2<=0;
				endcase
			end
			y2+3: begin
				case(col)
					11'd271: snow_2<=snow4[18];
					11'd272: snow_2<=snow4[17];
					11'd273: snow_2<=snow4[16];
					11'd274: snow_2<=snow4[15];
					11'd275: snow_2<=snow4[14];
					11'd276: snow_2<=snow4[13];
					11'd277: snow_2<=snow4[12];
					11'd278: snow_2<=snow4[11];
					11'd279: snow_2<=snow4[10];
					11'd280: snow_2<=snow4[9];
					11'd281: snow_2<=snow4[8];
					11'd282: snow_2<=snow4[7];
					11'd283: snow_2<=snow4[6];
					11'd284: snow_2<=snow4[5];
					11'd285: snow_2<=snow4[4];
					11'd286: snow_2<=snow4[3];
					11'd287: snow_2<=snow4[2];
					11'd288: snow_2<=snow4[1];
					11'd289: snow_2<=snow4[0];
					default: snow_2<=0;
				endcase
			end
			y2+4: begin
				case(col)
					11'd271: snow_2<=snow5[18];
					11'd272: snow_2<=snow5[17];
					11'd273: snow_2<=snow5[16];
					11'd274: snow_2<=snow5[15];
					11'd275: snow_2<=snow5[14];
					11'd276: snow_2<=snow5[13];
					11'd277: snow_2<=snow5[12];
					11'd278: snow_2<=snow5[11];
					11'd279: snow_2<=snow5[10];
					11'd280: snow_2<=snow5[9];
					11'd281: snow_2<=snow5[8];
					11'd282: snow_2<=snow5[7];
					11'd283: snow_2<=snow5[6];
					11'd284: snow_2<=snow5[5];
					11'd285: snow_2<=snow5[4];
					11'd286: snow_2<=snow5[3];
					11'd287: snow_2<=snow5[2];
					11'd288: snow_2<=snow5[1];
					11'd289: snow_2<=snow5[0];
					default: snow_2<=0;
				endcase
			end
			y2+5: begin
				case(col)
					11'd271: snow_2<=snow6[18];
					11'd272: snow_2<=snow6[17];
					11'd273: snow_2<=snow6[16];
					11'd274: snow_2<=snow6[15];
					11'd275: snow_2<=snow6[14];
					11'd276: snow_2<=snow6[13];
					11'd277: snow_2<=snow6[12];
					11'd278: snow_2<=snow6[11];
					11'd279: snow_2<=snow6[10];
					11'd280: snow_2<=snow6[9];
					11'd281: snow_2<=snow6[8];
					11'd282: snow_2<=snow6[7];
					11'd283: snow_2<=snow6[6];
					11'd284: snow_2<=snow6[5];
					11'd285: snow_2<=snow6[4];
					11'd286: snow_2<=snow6[3];
					11'd287: snow_2<=snow6[2];
					11'd288: snow_2<=snow6[1];
					11'd289: snow_2<=snow6[0];
					default: snow_2<=0;
				endcase
			end
			y2+6: begin
				case(col)
					11'd271: snow_2<=snow7[18];
					11'd272: snow_2<=snow7[17];
					11'd273: snow_2<=snow7[16];
					11'd274: snow_2<=snow7[15];
					11'd275: snow_2<=snow7[14];
					11'd276: snow_2<=snow7[13];
					11'd277: snow_2<=snow7[12];
					11'd278: snow_2<=snow7[11];
					11'd279: snow_2<=snow7[10];
					11'd280: snow_2<=snow7[9];
					11'd281: snow_2<=snow7[8];
					11'd282: snow_2<=snow7[7];
					11'd283: snow_2<=snow7[6];
					11'd284: snow_2<=snow7[5];
					11'd285: snow_2<=snow7[4];
					11'd286: snow_2<=snow7[3];
					11'd287: snow_2<=snow7[2];
					11'd288: snow_2<=snow7[1];
					11'd289: snow_2<=snow7[0];
					default: snow_2<=0;
				endcase
			end
			y2+7: begin
				case(col)
					11'd271: snow_2<=snow8[18];
					11'd272: snow_2<=snow8[17];
					11'd273: snow_2<=snow8[16];
					11'd274: snow_2<=snow8[15];
					11'd275: snow_2<=snow8[14];
					11'd276: snow_2<=snow8[13];
					11'd277: snow_2<=snow8[12];
					11'd278: snow_2<=snow8[11];
					11'd279: snow_2<=snow8[10];
					11'd280: snow_2<=snow8[9];
					11'd281: snow_2<=snow8[8];
					11'd282: snow_2<=snow8[7];
					11'd283: snow_2<=snow8[6];
					11'd284: snow_2<=snow8[5];
					11'd285: snow_2<=snow8[4];
					11'd286: snow_2<=snow8[3];
					11'd287: snow_2<=snow8[2];
					11'd288: snow_2<=snow8[1];
					11'd289: snow_2<=snow8[0];
					default: snow_2<=0;
				endcase
			end
			y2+8: begin
				case(col)
					11'd271: snow_2<=snow9[18];
					11'd272: snow_2<=snow9[17];
					11'd273: snow_2<=snow9[16];
					11'd274: snow_2<=snow9[15];
					11'd275: snow_2<=snow9[14];
					11'd276: snow_2<=snow9[13];
					11'd277: snow_2<=snow9[12];
					11'd278: snow_2<=snow9[11];
					11'd279: snow_2<=snow9[10];
					11'd280: snow_2<=snow9[9];
					11'd281: snow_2<=snow9[8];
					11'd282: snow_2<=snow9[7];
					11'd283: snow_2<=snow9[6];
					11'd284: snow_2<=snow9[5];
					11'd285: snow_2<=snow9[4];
					11'd286: snow_2<=snow9[3];
					11'd287: snow_2<=snow9[2];
					11'd288: snow_2<=snow9[1];
					11'd289: snow_2<=snow9[0];
					default: snow_2<=0;
				endcase
			end
			y2+9: begin
				case(col)
					11'd271: snow_2<=snow10[18];
					11'd272: snow_2<=snow10[17];
					11'd273: snow_2<=snow10[16];
					11'd274: snow_2<=snow10[15];
					11'd275: snow_2<=snow10[14];
					11'd276: snow_2<=snow10[13];
					11'd277: snow_2<=snow10[12];
					11'd278: snow_2<=snow10[11];
					11'd279: snow_2<=snow10[10];
					11'd280: snow_2<=snow10[9];
					11'd281: snow_2<=snow10[8];
					11'd282: snow_2<=snow10[7];
					11'd283: snow_2<=snow10[6];
					11'd284: snow_2<=snow10[5];
					11'd285: snow_2<=snow10[4];
					11'd286: snow_2<=snow10[3];
					11'd287: snow_2<=snow10[2];
					11'd288: snow_2<=snow10[1];
					11'd289: snow_2<=snow10[0];
					default: snow_2<=0;
				endcase
			end
			y2+10: begin
				case(col)
					11'd271: snow_2<=snow11[18];
					11'd272: snow_2<=snow11[17];
					11'd273: snow_2<=snow11[16];
					11'd274: snow_2<=snow11[15];
					11'd275: snow_2<=snow11[14];
					11'd276: snow_2<=snow11[13];
					11'd277: snow_2<=snow11[12];
					11'd278: snow_2<=snow11[11];
					11'd279: snow_2<=snow11[10];
					11'd280: snow_2<=snow11[9];
					11'd281: snow_2<=snow11[8];
					11'd282: snow_2<=snow11[7];
					11'd283: snow_2<=snow11[6];
					11'd284: snow_2<=snow11[5];
					11'd285: snow_2<=snow11[4];
					11'd286: snow_2<=snow11[3];
					11'd287: snow_2<=snow11[2];
					11'd288: snow_2<=snow11[1];
					11'd289: snow_2<=snow11[0];
					default: snow_2<=0;
				endcase
			end
			y2+11: begin
				case(col)
					11'd271: snow_2<=snow12[18];
					11'd272: snow_2<=snow12[17];
					11'd273: snow_2<=snow12[16];
					11'd274: snow_2<=snow12[15];
					11'd275: snow_2<=snow12[14];
					11'd276: snow_2<=snow12[13];
					11'd277: snow_2<=snow12[12];
					11'd278: snow_2<=snow12[11];
					11'd279: snow_2<=snow12[10];
					11'd280: snow_2<=snow12[9];
					11'd281: snow_2<=snow12[8];
					11'd282: snow_2<=snow12[7];
					11'd283: snow_2<=snow12[6];
					11'd284: snow_2<=snow12[5];
					11'd285: snow_2<=snow12[4];
					11'd286: snow_2<=snow12[3];
					11'd287: snow_2<=snow12[2];
					11'd288: snow_2<=snow12[1];
					11'd289: snow_2<=snow12[0];
					default: snow_2<=0;
				endcase
			end
			y2+12: begin
				case(col)
					11'd271: snow_2<=snow13[18];
					11'd272: snow_2<=snow13[17];
					11'd273: snow_2<=snow13[16];
					11'd274: snow_2<=snow13[15];
					11'd275: snow_2<=snow13[14];
					11'd276: snow_2<=snow13[13];
					11'd277: snow_2<=snow13[12];
					11'd278: snow_2<=snow13[11];
					11'd279: snow_2<=snow13[10];
					11'd280: snow_2<=snow13[9];
					11'd281: snow_2<=snow13[8];
					11'd282: snow_2<=snow13[7];
					11'd283: snow_2<=snow13[6];
					11'd284: snow_2<=snow13[5];
					11'd285: snow_2<=snow13[4];
					11'd286: snow_2<=snow13[3];
					11'd287: snow_2<=snow13[2];
					11'd288: snow_2<=snow13[1];
					11'd289: snow_2<=snow13[0];
					default: snow_2<=0;
				endcase
			end
			default: snow_2<=0;
		endcase
	end
end

always@(posedge clk or posedge rst) begin
	if(rst)
		snow_4<=0;
	else begin
		case(row)
			y4: begin
				case(col)
					11'd817: snow_4<=snow1[18];
					11'd818: snow_4<=snow1[17];
					11'd819: snow_4<=snow1[16];
					11'd820: snow_4<=snow1[15];
					11'd821: snow_4<=snow1[14];
					11'd822: snow_4<=snow1[13];
					11'd823: snow_4<=snow1[12];
					11'd824: snow_4<=snow1[11];
					11'd825: snow_4<=snow1[10];
					11'd826: snow_4<=snow1[9];
					11'd827: snow_4<=snow1[8];
					11'd828: snow_4<=snow1[7];
					11'd829: snow_4<=snow1[6];
					11'd830: snow_4<=snow1[5];
					11'd831: snow_4<=snow1[4];
					11'd832: snow_4<=snow1[3];
					11'd833: snow_4<=snow1[2];
					11'd834: snow_4<=snow1[1];
					11'd835: snow_4<=snow1[0];
					default: snow_4<=0;
				endcase
			end
			y4+1: begin
				case(col)
					11'd817: snow_4<=snow2[18];
					11'd818: snow_4<=snow2[17];
					11'd819: snow_4<=snow2[16];
					11'd820: snow_4<=snow2[15];
					11'd821: snow_4<=snow2[14];
					11'd822: snow_4<=snow2[13];
					11'd823: snow_4<=snow2[12];
					11'd824: snow_4<=snow2[11];
					11'd825: snow_4<=snow2[10];
					11'd826: snow_4<=snow2[9];
					11'd827: snow_4<=snow2[8];
					11'd828: snow_4<=snow2[7];
					11'd829: snow_4<=snow2[6];
					11'd830: snow_4<=snow2[5];
					11'd831: snow_4<=snow2[4];
					11'd832: snow_4<=snow2[3];
					11'd833: snow_4<=snow2[2];
					11'd834: snow_4<=snow2[1];
					11'd835: snow_4<=snow2[0];
					default: snow_4<=0;
				endcase
			end
			y4+2: begin
				case(col)
					11'd817: snow_4<=snow3[18];
					11'd818: snow_4<=snow3[17];
					11'd819: snow_4<=snow3[16];
					11'd820: snow_4<=snow3[15];
					11'd821: snow_4<=snow3[14];
					11'd822: snow_4<=snow3[13];
					11'd823: snow_4<=snow3[12];
					11'd824: snow_4<=snow3[11];
					11'd825: snow_4<=snow3[10];
					11'd826: snow_4<=snow3[9];
					11'd827: snow_4<=snow3[8];
					11'd828: snow_4<=snow3[7];
					11'd829: snow_4<=snow3[6];
					11'd830: snow_4<=snow3[5];
					11'd831: snow_4<=snow3[4];
					11'd832: snow_4<=snow3[3];
					11'd833: snow_4<=snow3[2];
					11'd834: snow_4<=snow3[1];
					11'd835: snow_4<=snow3[0];
					default: snow_4<=0;
				endcase
			end
			y4+3: begin
				case(col)
					11'd817: snow_4<=snow4[18];
					11'd818: snow_4<=snow4[17];
					11'd819: snow_4<=snow4[16];
					11'd820: snow_4<=snow4[15];
					11'd821: snow_4<=snow4[14];
					11'd822: snow_4<=snow4[13];
					11'd823: snow_4<=snow4[12];
					11'd824: snow_4<=snow4[11];
					11'd825: snow_4<=snow4[10];
					11'd826: snow_4<=snow4[9];
					11'd827: snow_4<=snow4[8];
					11'd828: snow_4<=snow4[7];
					11'd829: snow_4<=snow4[6];
					11'd830: snow_4<=snow4[5];
					11'd831: snow_4<=snow4[4];
					11'd832: snow_4<=snow4[3];
					11'd833: snow_4<=snow4[2];
					11'd834: snow_4<=snow4[1];
					11'd835: snow_4<=snow4[0];
					default: snow_4<=0;
				endcase
			end
			y4+4: begin
				case(col)
					11'd817: snow_4<=snow5[18];
					11'd818: snow_4<=snow5[17];
					11'd819: snow_4<=snow5[16];
					11'd820: snow_4<=snow5[15];
					11'd821: snow_4<=snow5[14];
					11'd822: snow_4<=snow5[13];
					11'd823: snow_4<=snow5[12];
					11'd824: snow_4<=snow5[11];
					11'd825: snow_4<=snow5[10];
					11'd826: snow_4<=snow5[9];
					11'd827: snow_4<=snow5[8];
					11'd828: snow_4<=snow5[7];
					11'd829: snow_4<=snow5[6];
					11'd830: snow_4<=snow5[5];
					11'd831: snow_4<=snow5[4];
					11'd832: snow_4<=snow5[3];
					11'd833: snow_4<=snow5[2];
					11'd834: snow_4<=snow5[1];
					11'd835: snow_4<=snow5[0];
					default: snow_4<=0;
				endcase
			end
			y4+5: begin
				case(col)
					11'd817: snow_4<=snow6[18];
					11'd818: snow_4<=snow6[17];
					11'd819: snow_4<=snow6[16];
					11'd820: snow_4<=snow6[15];
					11'd821: snow_4<=snow6[14];
					11'd822: snow_4<=snow6[13];
					11'd823: snow_4<=snow6[12];
					11'd824: snow_4<=snow6[11];
					11'd825: snow_4<=snow6[10];
					11'd826: snow_4<=snow6[9];
					11'd827: snow_4<=snow6[8];
					11'd828: snow_4<=snow6[7];
					11'd829: snow_4<=snow6[6];
					11'd830: snow_4<=snow6[5];
					11'd831: snow_4<=snow6[4];
					11'd832: snow_4<=snow6[3];
					11'd833: snow_4<=snow6[2];
					11'd834: snow_4<=snow6[1];
					11'd835: snow_4<=snow6[0];
					default: snow_4<=0;
				endcase
			end
			y4+6: begin
				case(col)
					11'd817: snow_4<=snow7[18];
					11'd818: snow_4<=snow7[17];
					11'd819: snow_4<=snow7[16];
					11'd820: snow_4<=snow7[15];
					11'd821: snow_4<=snow7[14];
					11'd822: snow_4<=snow7[13];
					11'd823: snow_4<=snow7[12];
					11'd824: snow_4<=snow7[11];
					11'd825: snow_4<=snow7[10];
					11'd826: snow_4<=snow7[9];
					11'd827: snow_4<=snow7[8];
					11'd828: snow_4<=snow7[7];
					11'd829: snow_4<=snow7[6];
					11'd830: snow_4<=snow7[5];
					11'd831: snow_4<=snow7[4];
					11'd832: snow_4<=snow7[3];
					11'd833: snow_4<=snow7[2];
					11'd834: snow_4<=snow7[1];
					11'd835: snow_4<=snow7[0];
					default: snow_4<=0;
				endcase
			end
			y4+7: begin
				case(col)
					11'd817: snow_4<=snow8[18];
					11'd818: snow_4<=snow8[17];
					11'd819: snow_4<=snow8[16];
					11'd820: snow_4<=snow8[15];
					11'd821: snow_4<=snow8[14];
					11'd822: snow_4<=snow8[13];
					11'd823: snow_4<=snow8[12];
					11'd824: snow_4<=snow8[11];
					11'd825: snow_4<=snow8[10];
					11'd826: snow_4<=snow8[9];
					11'd827: snow_4<=snow8[8];
					11'd828: snow_4<=snow8[7];
					11'd829: snow_4<=snow8[6];
					11'd830: snow_4<=snow8[5];
					11'd831: snow_4<=snow8[4];
					11'd832: snow_4<=snow8[3];
					11'd833: snow_4<=snow8[2];
					11'd834: snow_4<=snow8[1];
					11'd835: snow_4<=snow8[0];
					default: snow_4<=0;
				endcase
			end
			y4+8: begin
				case(col)
					11'd817: snow_4<=snow9[18];
					11'd818: snow_4<=snow9[17];
					11'd819: snow_4<=snow9[16];
					11'd820: snow_4<=snow9[15];
					11'd821: snow_4<=snow9[14];
					11'd822: snow_4<=snow9[13];
					11'd823: snow_4<=snow9[12];
					11'd824: snow_4<=snow9[11];
					11'd825: snow_4<=snow9[10];
					11'd826: snow_4<=snow9[9];
					11'd827: snow_4<=snow9[8];
					11'd828: snow_4<=snow9[7];
					11'd829: snow_4<=snow9[6];
					11'd830: snow_4<=snow9[5];
					11'd831: snow_4<=snow9[4];
					11'd832: snow_4<=snow9[3];
					11'd833: snow_4<=snow9[2];
					11'd834: snow_4<=snow9[1];
					11'd835: snow_4<=snow9[0];
					default: snow_4<=0;
				endcase
			end
			y4+9: begin
				case(col)
					11'd817: snow_4<=snow10[18];
					11'd818: snow_4<=snow10[17];
					11'd819: snow_4<=snow10[16];
					11'd820: snow_4<=snow10[15];
					11'd821: snow_4<=snow10[14];
					11'd822: snow_4<=snow10[13];
					11'd823: snow_4<=snow10[12];
					11'd824: snow_4<=snow10[11];
					11'd825: snow_4<=snow10[10];
					11'd826: snow_4<=snow10[9];
					11'd827: snow_4<=snow10[8];
					11'd828: snow_4<=snow10[7];
					11'd829: snow_4<=snow10[6];
					11'd830: snow_4<=snow10[5];
					11'd831: snow_4<=snow10[4];
					11'd832: snow_4<=snow10[3];
					11'd833: snow_4<=snow10[2];
					11'd834: snow_4<=snow10[1];
					11'd835: snow_4<=snow10[0];
					default: snow_4<=0;
				endcase
			end
			y4+10: begin
				case(col)
					11'd817: snow_4<=snow11[18];
					11'd818: snow_4<=snow11[17];
					11'd819: snow_4<=snow11[16];
					11'd820: snow_4<=snow11[15];
					11'd821: snow_4<=snow11[14];
					11'd822: snow_4<=snow11[13];
					11'd823: snow_4<=snow11[12];
					11'd824: snow_4<=snow11[11];
					11'd825: snow_4<=snow11[10];
					11'd826: snow_4<=snow11[9];
					11'd827: snow_4<=snow11[8];
					11'd828: snow_4<=snow11[7];
					11'd829: snow_4<=snow11[6];
					11'd830: snow_4<=snow11[5];
					11'd831: snow_4<=snow11[4];
					11'd832: snow_4<=snow11[3];
					11'd833: snow_4<=snow11[2];
					11'd834: snow_4<=snow11[1];
					11'd835: snow_4<=snow11[0];
					default: snow_4<=0;
				endcase
			end
			y4+11: begin
				case(col)
					11'd817: snow_4<=snow12[18];
					11'd818: snow_4<=snow12[17];
					11'd819: snow_4<=snow12[16];
					11'd820: snow_4<=snow12[15];
					11'd821: snow_4<=snow12[14];
					11'd822: snow_4<=snow12[13];
					11'd823: snow_4<=snow12[12];
					11'd824: snow_4<=snow12[11];
					11'd825: snow_4<=snow12[10];
					11'd826: snow_4<=snow12[9];
					11'd827: snow_4<=snow12[8];
					11'd828: snow_4<=snow12[7];
					11'd829: snow_4<=snow12[6];
					11'd830: snow_4<=snow12[5];
					11'd831: snow_4<=snow12[4];
					11'd832: snow_4<=snow12[3];
					11'd833: snow_4<=snow12[2];
					11'd834: snow_4<=snow12[1];
					11'd835: snow_4<=snow12[0];
					default: snow_4<=0;
				endcase
			end
			y4+12: begin
				case(col)
					11'd817: snow_4<=snow13[18];
					11'd818: snow_4<=snow13[17];
					11'd819: snow_4<=snow13[16];
					11'd820: snow_4<=snow13[15];
					11'd821: snow_4<=snow13[14];
					11'd822: snow_4<=snow13[13];
					11'd823: snow_4<=snow13[12];
					11'd824: snow_4<=snow13[11];
					11'd825: snow_4<=snow13[10];
					11'd826: snow_4<=snow13[9];
					11'd827: snow_4<=snow13[8];
					11'd828: snow_4<=snow13[7];
					11'd829: snow_4<=snow13[6];
					11'd830: snow_4<=snow13[5];
					11'd831: snow_4<=snow13[4];
					11'd832: snow_4<=snow13[3];
					11'd833: snow_4<=snow13[2];
					11'd834: snow_4<=snow13[1];
					11'd835: snow_4<=snow13[0];
					default: snow_4<=0;
				endcase
			end
			default: snow_4<=0;
		endcase
	end
end

always@(posedge clk or posedge rst) begin
	if(rst)
		snow_3<=0;
	else begin
		case(row)
			y3: begin
				case(col)
					11'd717: snow_3<=snow1[18];
					11'd718: snow_3<=snow1[17];
					11'd719: snow_3<=snow1[16];
					11'd720: snow_3<=snow1[15];
					11'd721: snow_3<=snow1[14];
					11'd722: snow_3<=snow1[13];
					11'd723: snow_3<=snow1[12];
					11'd724: snow_3<=snow1[11];
					11'd725: snow_3<=snow1[10];
					11'd726: snow_3<=snow1[9];
					11'd727: snow_3<=snow1[8];
					11'd728: snow_3<=snow1[7];
					11'd729: snow_3<=snow1[6];
					11'd730: snow_3<=snow1[5];
					11'd731: snow_3<=snow1[4];
					11'd732: snow_3<=snow1[3];
					11'd733: snow_3<=snow1[2];
					11'd734: snow_3<=snow1[1];
					11'd735: snow_3<=snow1[0];
					default: snow_3<=0;
				endcase
			end
			y3+1: begin
				case(col)
					11'd717: snow_3<=snow2[18];
					11'd718: snow_3<=snow2[17];
					11'd719: snow_3<=snow2[16];
					11'd720: snow_3<=snow2[15];
					11'd721: snow_3<=snow2[14];
					11'd722: snow_3<=snow2[13];
					11'd723: snow_3<=snow2[12];
					11'd724: snow_3<=snow2[11];
					11'd725: snow_3<=snow2[10];
					11'd726: snow_3<=snow2[9];
					11'd727: snow_3<=snow2[8];
					11'd728: snow_3<=snow2[7];
					11'd729: snow_3<=snow2[6];
					11'd730: snow_3<=snow2[5];
					11'd731: snow_3<=snow2[4];
					11'd732: snow_3<=snow2[3];
					11'd733: snow_3<=snow2[2];
					11'd734: snow_3<=snow2[1];
					11'd735: snow_3<=snow2[0];
					default: snow_3<=0;
				endcase
			end
			y3+2: begin
				case(col)
					11'd717: snow_3<=snow3[18];
					11'd718: snow_3<=snow3[17];
					11'd719: snow_3<=snow3[16];
					11'd720: snow_3<=snow3[15];
					11'd721: snow_3<=snow3[14];
					11'd722: snow_3<=snow3[13];
					11'd723: snow_3<=snow3[12];
					11'd724: snow_3<=snow3[11];
					11'd725: snow_3<=snow3[10];
					11'd726: snow_3<=snow3[9];
					11'd727: snow_3<=snow3[8];
					11'd728: snow_3<=snow3[7];
					11'd729: snow_3<=snow3[6];
					11'd730: snow_3<=snow3[5];
					11'd731: snow_3<=snow3[4];
					11'd732: snow_3<=snow3[3];
					11'd733: snow_3<=snow3[2];
					11'd734: snow_3<=snow3[1];
					11'd735: snow_3<=snow3[0];
					default: snow_3<=0;
				endcase
			end
			y3+3: begin
				case(col)
					11'd717: snow_3<=snow4[18];
					11'd718: snow_3<=snow4[17];
					11'd719: snow_3<=snow4[16];
					11'd720: snow_3<=snow4[15];
					11'd721: snow_3<=snow4[14];
					11'd722: snow_3<=snow4[13];
					11'd723: snow_3<=snow4[12];
					11'd724: snow_3<=snow4[11];
					11'd725: snow_3<=snow4[10];
					11'd726: snow_3<=snow4[9];
					11'd727: snow_3<=snow4[8];
					11'd728: snow_3<=snow4[7];
					11'd729: snow_3<=snow4[6];
					11'd730: snow_3<=snow4[5];
					11'd731: snow_3<=snow4[4];
					11'd732: snow_3<=snow4[3];
					11'd733: snow_3<=snow4[2];
					11'd734: snow_3<=snow4[1];
					11'd735: snow_3<=snow4[0];
					default: snow_3<=0;
				endcase
			end
			y3+4: begin
				case(col)
					11'd717: snow_3<=snow5[18];
					11'd718: snow_3<=snow5[17];
					11'd719: snow_3<=snow5[16];
					11'd720: snow_3<=snow5[15];
					11'd721: snow_3<=snow5[14];
					11'd722: snow_3<=snow5[13];
					11'd723: snow_3<=snow5[12];
					11'd724: snow_3<=snow5[11];
					11'd725: snow_3<=snow5[10];
					11'd726: snow_3<=snow5[9];
					11'd727: snow_3<=snow5[8];
					11'd728: snow_3<=snow5[7];
					11'd729: snow_3<=snow5[6];
					11'd730: snow_3<=snow5[5];
					11'd731: snow_3<=snow5[4];
					11'd732: snow_3<=snow5[3];
					11'd733: snow_3<=snow5[2];
					11'd734: snow_3<=snow5[1];
					11'd735: snow_3<=snow5[0];
					default: snow_3<=0;
				endcase
			end
			y3+5: begin
				case(col)
					11'd717: snow_3<=snow6[18];
					11'd718: snow_3<=snow6[17];
					11'd719: snow_3<=snow6[16];
					11'd720: snow_3<=snow6[15];
					11'd721: snow_3<=snow6[14];
					11'd722: snow_3<=snow6[13];
					11'd723: snow_3<=snow6[12];
					11'd724: snow_3<=snow6[11];
					11'd725: snow_3<=snow6[10];
					11'd726: snow_3<=snow6[9];
					11'd727: snow_3<=snow6[8];
					11'd728: snow_3<=snow6[7];
					11'd729: snow_3<=snow6[6];
					11'd730: snow_3<=snow6[5];
					11'd731: snow_3<=snow6[4];
					11'd732: snow_3<=snow6[3];
					11'd733: snow_3<=snow6[2];
					11'd734: snow_3<=snow6[1];
					11'd735: snow_3<=snow6[0];
					default: snow_3<=0;
				endcase
			end
			y3+6: begin
				case(col)
					11'd717: snow_3<=snow7[18];
					11'd718: snow_3<=snow7[17];
					11'd719: snow_3<=snow7[16];
					11'd720: snow_3<=snow7[15];
					11'd721: snow_3<=snow7[14];
					11'd722: snow_3<=snow7[13];
					11'd723: snow_3<=snow7[12];
					11'd724: snow_3<=snow7[11];
					11'd725: snow_3<=snow7[10];
					11'd726: snow_3<=snow7[9];
					11'd727: snow_3<=snow7[8];
					11'd728: snow_3<=snow7[7];
					11'd729: snow_3<=snow7[6];
					11'd730: snow_3<=snow7[5];
					11'd731: snow_3<=snow7[4];
					11'd732: snow_3<=snow7[3];
					11'd733: snow_3<=snow7[2];
					11'd734: snow_3<=snow7[1];
					11'd735: snow_3<=snow7[0];
					default: snow_3<=0;
				endcase
			end
			y3+7: begin
				case(col)
					11'd717: snow_3<=snow8[18];
					11'd718: snow_3<=snow8[17];
					11'd719: snow_3<=snow8[16];
					11'd720: snow_3<=snow8[15];
					11'd721: snow_3<=snow8[14];
					11'd722: snow_3<=snow8[13];
					11'd723: snow_3<=snow8[12];
					11'd724: snow_3<=snow8[11];
					11'd725: snow_3<=snow8[10];
					11'd726: snow_3<=snow8[9];
					11'd727: snow_3<=snow8[8];
					11'd728: snow_3<=snow8[7];
					11'd729: snow_3<=snow8[6];
					11'd730: snow_3<=snow8[5];
					11'd731: snow_3<=snow8[4];
					11'd732: snow_3<=snow8[3];
					11'd733: snow_3<=snow8[2];
					11'd734: snow_3<=snow8[1];
					11'd735: snow_3<=snow8[0];
					default: snow_3<=0;
				endcase
			end
			y3+8: begin
				case(col)
					11'd717: snow_3<=snow9[18];
					11'd718: snow_3<=snow9[17];
					11'd719: snow_3<=snow9[16];
					11'd720: snow_3<=snow9[15];
					11'd721: snow_3<=snow9[14];
					11'd722: snow_3<=snow9[13];
					11'd723: snow_3<=snow9[12];
					11'd724: snow_3<=snow9[11];
					11'd725: snow_3<=snow9[10];
					11'd726: snow_3<=snow9[9];
					11'd727: snow_3<=snow9[8];
					11'd728: snow_3<=snow9[7];
					11'd729: snow_3<=snow9[6];
					11'd730: snow_3<=snow9[5];
					11'd731: snow_3<=snow9[4];
					11'd732: snow_3<=snow9[3];
					11'd733: snow_3<=snow9[2];
					11'd734: snow_3<=snow9[1];
					11'd735: snow_3<=snow9[0];
					default: snow_3<=0;
				endcase
			end
			y3+9: begin
				case(col)
					11'd717: snow_3<=snow10[18];
					11'd718: snow_3<=snow10[17];
					11'd719: snow_3<=snow10[16];
					11'd720: snow_3<=snow10[15];
					11'd721: snow_3<=snow10[14];
					11'd722: snow_3<=snow10[13];
					11'd723: snow_3<=snow10[12];
					11'd724: snow_3<=snow10[11];
					11'd725: snow_3<=snow10[10];
					11'd726: snow_3<=snow10[9];
					11'd727: snow_3<=snow10[8];
					11'd728: snow_3<=snow10[7];
					11'd729: snow_3<=snow10[6];
					11'd730: snow_3<=snow10[5];
					11'd731: snow_3<=snow10[4];
					11'd732: snow_3<=snow10[3];
					11'd733: snow_3<=snow10[2];
					11'd734: snow_3<=snow10[1];
					11'd735: snow_3<=snow10[0];
					default: snow_3<=0;
				endcase
			end
			y3+10: begin
				case(col)
					11'd717: snow_3<=snow11[18];
					11'd718: snow_3<=snow11[17];
					11'd719: snow_3<=snow11[16];
					11'd720: snow_3<=snow11[15];
					11'd721: snow_3<=snow11[14];
					11'd722: snow_3<=snow11[13];
					11'd723: snow_3<=snow11[12];
					11'd724: snow_3<=snow11[11];
					11'd725: snow_3<=snow11[10];
					11'd726: snow_3<=snow11[9];
					11'd727: snow_3<=snow11[8];
					11'd728: snow_3<=snow11[7];
					11'd729: snow_3<=snow11[6];
					11'd730: snow_3<=snow11[5];
					11'd731: snow_3<=snow11[4];
					11'd732: snow_3<=snow11[3];
					11'd733: snow_3<=snow11[2];
					11'd734: snow_3<=snow11[1];
					11'd735: snow_3<=snow11[0];
					default: snow_3<=0;
				endcase
			end
			y3+11: begin
				case(col)
					11'd717: snow_3<=snow12[18];
					11'd718: snow_3<=snow12[17];
					11'd719: snow_3<=snow12[16];
					11'd720: snow_3<=snow12[15];
					11'd721: snow_3<=snow12[14];
					11'd722: snow_3<=snow12[13];
					11'd723: snow_3<=snow12[12];
					11'd724: snow_3<=snow12[11];
					11'd725: snow_3<=snow12[10];
					11'd726: snow_3<=snow12[9];
					11'd727: snow_3<=snow12[8];
					11'd728: snow_3<=snow12[7];
					11'd729: snow_3<=snow12[6];
					11'd730: snow_3<=snow12[5];
					11'd731: snow_3<=snow12[4];
					11'd732: snow_3<=snow12[3];
					11'd733: snow_3<=snow12[2];
					11'd734: snow_3<=snow12[1];
					11'd735: snow_3<=snow12[0];
					default: snow_3<=0;
				endcase
			end
			y3+12: begin
				case(col)
					11'd717: snow_3<=snow13[18];
					11'd718: snow_3<=snow13[17];
					11'd719: snow_3<=snow13[16];
					11'd720: snow_3<=snow13[15];
					11'd721: snow_3<=snow13[14];
					11'd722: snow_3<=snow13[13];
					11'd723: snow_3<=snow13[12];
					11'd724: snow_3<=snow13[11];
					11'd725: snow_3<=snow13[10];
					11'd726: snow_3<=snow13[9];
					11'd727: snow_3<=snow13[8];
					11'd728: snow_3<=snow13[7];
					11'd729: snow_3<=snow13[6];
					11'd730: snow_3<=snow13[5];
					11'd731: snow_3<=snow13[4];
					11'd732: snow_3<=snow13[3];
					11'd733: snow_3<=snow13[2];
					11'd734: snow_3<=snow13[1];
					11'd735: snow_3<=snow13[0];
					default: snow_3<=0;
				endcase
			end
			default: snow_3<=0;
		endcase
	end
end

reg [10:0]moon_count;
//reg [2:0]color;
//reg [20:0]col,row;
reg [99:0]moon_pix;
wire sqr;
wire moon_area;
//wire visible;

wire [99:0]moon[0:99];
assign moon[0]= 100'b0000000000000000000000000000000000000000011111111100000000000000000000000000000000000000000000000000;
assign moon[1]= 100'b0000000000000000000000000000000000000111111111111111111100000000000000000000000000000000000000000000;
assign moon[2]= 100'b0000000000000000000000000000000000111111111111111111111111111000000000000000000000000000000000000000;
assign moon[3]= 100'b0000000000000000000000000000000111111111111111111111111111111100000000000000000000000000000000000000;
assign moon[4]= 100'b0000000000000000000000000000011111111111111111111111111111111111000000000000000000000000000000000000;
assign moon[5]= 100'b0000000000000000000000000011111111111111111111111111111111111111110000000000000000000000000000000000;
assign moon[6]= 100'b0000000000000000000000001111111111111111111111111111111110000000000000000000000000000000000000000000;
assign moon[7]= 100'b0000000000000000000000111111111111111111111111111111111000000000000000000000000000000000000000000000;
assign moon[8]= 100'b0000000000000000000001111111111111111111111111111111000000000000000000000000000000000000000000000000;
assign moon[9]= 100'b0000000000000000000111111111111111111111111111111000000000000000000000000000000000000000000000000000;
assign moon[10]=100'b0000000000000000011111111111111111111111111111000000000000000000000000000000000000000000000000000000;
assign moon[11]=100'b0000000000000000011111111111111111111111111000000000000000000000000000000000000000000000000000000000;
assign moon[12]=100'b0000000000000001111111111111111111111111100000000000000000000000000000000000000000000000000000000000;
assign moon[13]=100'b0000000000000111111111111111111111111100000000000000000000000000000000000000000000000000000000000000;
assign moon[14]=100'b0000000000001111111111111111111111110000000000000000000000000000000000000000000000000000000000000000;
assign moon[15]=100'b0000000000011111111111111111111111000000000000000000000000000000000000000000000000000000000000000000;
assign moon[16]=100'b0000000000111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000;
assign moon[17]=100'b0000000000111111111111111111111000000000000000000000000000000000000000000000000000000000000000000000;
assign moon[18]=100'b0000000001111111111111111111110000000000000000000000000000000000000000000000000000000000000000000000;
assign moon[19]=100'b0000000001111111111111111111110000000000000000000000000000000000000000000000000000000000000000000000;
assign moon[20]=100'b0000000011111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000;
assign moon[21]=100'b0000000111111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000;
assign moon[22]=100'b0000000111111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000;
assign moon[23]=100'b0000001111111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000;
assign moon[24]=100'b0000011111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000;
assign moon[25]=100'b0000011111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000000;
assign moon[26]=100'b0000111111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000000;
assign moon[27]=100'b0000111111111111111111110000000000000000000000000000000000000000000000000000000000000000000000000000;
assign moon[28]=100'b0001111111111111111111110000000000000000000000000000000000000000000000000000000000000000000000000000;
assign moon[29]=100'b0001111111111111111111110000000000000000000000000000000000000000000000000000000000000000000000000000;
assign moon[30]=100'b0001111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000;
assign moon[31]=100'b0011111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000;
assign moon[32]=100'b0011111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000000000;
assign moon[33]=100'b0111111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000000000;
assign moon[34]=100'b0111111111111111111110000000000000000000000000000000000000000000000000000000000000000000000000000000;
assign moon[35]=100'b1111111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000000000;
assign moon[36]=100'b1111111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000000000;
assign moon[37]=100'b1111111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000000000;
assign moon[38]=100'b1111111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000000000;
assign moon[39]=100'b1111111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000000000;
assign moon[40]=100'b1111111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000000000;
assign moon[41]=100'b1111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000;
assign moon[42]=100'b1111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000;
assign moon[43]=100'b1111111111111111111111110000000000000000000000000000000000000000000000000000000000000000000000000000;
assign moon[44]=100'b1111111111111111111111110000000000000000000000000000000000000000000000000000000000000000000000000000;
assign moon[45]=100'b1111111111111111111111110000000000000000000000000000000000000000000000000000000000000000000000000000;
assign moon[46]=100'b1111111111111111111111110000000000000000000000000000000000000000000000000000000000000000000000000000;
assign moon[47]=100'b1111111111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000000;
assign moon[48]=100'b0111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000;
assign moon[49]=100'b0011111111111111111111111110000000000000000000000000000000000000000000000000000000000000000000000000;
assign moon[50]=100'b0001111111111111111111111110000000000000000000000000000000000000000000000000000000000000000000000000;
assign moon[51]=100'b0001111111111111111111111110000000000000000000000000000000000000000000000000000000000000000000000000;
assign moon[52]=100'b0001111111111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000;
assign moon[53]=100'b0001111111111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000;
assign moon[54]=100'b0001111111111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000;
assign moon[55]=100'b0001111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000;
assign moon[56]=100'b0000111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000;
assign moon[57]=100'b0000011111111111111111111111110000000000000000000000000000000000000000000000000000000000000000000000;
assign moon[58]=100'b0000011111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000;
assign moon[59]=100'b0000011111111111111111111111111110000000000000000000000000000000000000000000000000000000000000000000;
assign moon[60]=100'b0000001111111111111111111111111111000000000000000000000000000000000000000000000000000000000000000000;
assign moon[61]=100'b0000001111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000;
assign moon[62]=100'b0000001111111111111111111111111111110000000000000000000000000000000000000000000000000000000000000000;
assign moon[63]=100'b0000000011111111111111111111111111110000000000000000000000000000000000000000000000000000000000000000;
assign moon[64]=100'b0000000011111111111111111111111111111000000000000000000000000000000000000000000000000000000000000000;
assign moon[65]=100'b0000000011111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000;
assign moon[66]=100'b0000000001111111111111111111111111111110000000000000000000000000000000000000000000000000000000000000;
assign moon[67]=100'b0000000000011111111111111111111111111110000000000000000000000000000000000000000000000000000000000000;
assign moon[68]=100'b0000000000001111111111111111111111111111000000000000000000000000000000000000000000000000000000000000;
assign moon[69]=100'b0000000000001111111111111111111111111111100000000000000000000000000000000000000000000000000000000000;
assign moon[70]=100'b0000000000000111111111111111111111111111111000000000000000000000000000000000000000000000000000000000;
assign moon[71]=100'b0000000000000011111111111111111111111111111100000000000000000000000000000000000000000000000000000000;
assign moon[72]=100'b0000000000000001111111111111111111111111111110000000000000000000000000000000000000000000000000000000;
assign moon[73]=100'b0000000000000001111111111111111111111111111111100000000000000000000000000000000000000000000000000000;
assign moon[74]=100'b0000000000000000011111111111111111111111111111110000000000000000000000000000000000000000000000000000;
assign moon[75]=100'b0000000000000000000111111111111111111111111111110000000000000000000000000000000000000000000000000000;
assign moon[76]=100'b0000000000000000000011111111111111111111111111111100000000000000000000000000000000000000000000000000;
assign moon[77]=100'b0000000000000000000011111111111111111111111111111110000000000000000000000000000000000000000000000000;
assign moon[78]=100'b0000000000000000000000111111111111111111111111111111000000000000000000000000000000000000000000000000;
assign moon[79]=100'b0000000000000000000000011111111111111111111111111111110000000000000000000000000000000000000000001000;
assign moon[80]=100'b0000000000000000000000011111111111111111111111111111111000000000000000000000000000000000000000001000;
assign moon[81]=100'b0000000000000000000000000111111111111111111111111111111100000000000000000000000000000000000000011000;
assign moon[82]=100'b0000000000000000000000000111111111111111111111111111111111000000000000000000000000000000000000111000;
assign moon[83]=100'b0000000000000000000000000011111111111111111111111111111111110000000000000000000000000000000111110000;
assign moon[84]=100'b0000000000000000000000000011111111111111111111111111111111111000000000000000000000000000011111100000;
assign moon[85]=100'b0000000000000000000000000000111111111111111111111111111111111100000000000000000000000011111111000000;
assign moon[86]=100'b0000000000000000000000000000001111111111111111111111111111111110000000000000000000000111111110000000;
assign moon[87]=100'b0000000000000000000000000000000111111111111111111111111111111111100000000000000000111111111000000000;
assign moon[88]=100'b0000000000000000000000000000000011111111111111111111111111111111111111000000111111111111110000000000;
assign moon[89]=100'b0000000000000000000000000000000000111111111111111111111111111111111111111111111111111111100000000000;
assign moon[90]=100'b0000000000000000000000000000000000001111111111111111111111111111111111111111111111111111100000000000;
assign moon[91]=100'b0000000000000000000000000000000000000011111111111111111111111111111111111111111111111110000000000000;
assign moon[92]=100'b0000000000000000000000000000000000000001111111111111111111111111111111111111111111111100000000000000;
assign moon[93]=100'b0000000000000000000000000000000000000000011111111111111111111111111111111111111111110000000000000000;
assign moon[94]=100'b0000000000000000000000000000000000000000000111111111111111111111111111111111111111110000000000000000;
assign moon[95]=100'b0000000000000000000000000000000000000000000011111111111111111111111111111111111111000000000000000000;
assign moon[96]=100'b0000000000000000000000000000000000000000000000111111111111111111111111111111111110000000000000000000;
assign moon[97]=100'b0000000000000000000000000000000000000000000000000011111111111111111111111111110000000000000000000000;
assign moon[98]=100'b0000000000000000000000000000000000000000000000000000001111111111111111111111000000000000000000000000;
assign moon[99]=100'b0000000000000000000000000000000000000000000000000000000001111111111111110000000000000000000000000000;





/*always@(posedge clk or posedge reset)
   if(reset) col<=0;
   else if(col==1039) col<=0;
   else col<=col+1;

always@(posedge clk or posedge reset)
   if(reset) row<=0;
   else if(row==665)row<=0;
   else if(col==1039) row<=row+1;
   else row<=row;

assign VGA_HSYNC = ~((col>=919)&&(col<1039));
assign VGA_VSYNC = ~((row>=659)&& (row<665));
assign visible= ((col>=104)&& (col<904)&&(row>=23)&&(row<623));*/



//assign {VGA_RED,VGA_GREEN,VGA_BLUE}=color;

//assign sqr=(row<300&&row>200) && (col<300&&col>200);
assign moon_area=(row>=150 && row<250) && (col<900 && col>=800);


always@(posedge clk or posedge rst)
  if(rst) moon_count<=0;
  else if(row>=250) moon_count<=0;
  else if(row>=150 && row <250 &&col==0) moon_count<=moon_count+1;
  else moon_count<=moon_count;

always@(posedge clk or posedge rst)
  if(rst) moon_pix<=0;
  else if(row>=150 && row <250 )  moon_pix<=moon[moon_count];
  else moon_pix<=0;
    

always@(posedge clk or posedge rst) begin
	if(rst)
		color<=0;
	else if(visible) begin
		if(star_1) begin
			if(!flag)
				color<=3'b110;
			else
				color<=3'b111;
		end
		else if(star_2) begin
			if(!flag)
				color<=3'b110;
			else
				color<=3'b111;
		end
		else if(star_3) begin
			if(!flag)
				color<=3'b110;
			else
				color<=3'b111;
		end
		else if(star_4) begin
			if(!flag)
				color<=3'b110;
			else
				color<=3'b111;
		end
		else if(star_5) begin
			if(!flag)
				color<=3'b110;
			else
				color<=3'b111;
		end
		else if(star_6) begin
			if(!flag)
				color<=3'b110;
			else
				color<=3'b111;
		end
		else if(star_7) begin
			if(!flag)
				color<=3'b110;
			else
				color<=3'b111;
		end
        else if(visible && moon_area)begin
            if(moon_pix[col-800]) color<=3'b111;
            else color<=3'b001;
        end
		else if(snow_1)
			color<=3'b111;
		else if(snow_2)
			color<=3'b111;
		else if(snow_3)
			color<=3'b111;
		else if(snow_4)
			color<=3'b111;
		else if(btri1)
			color<=0;
        else if(btri2)
            color<=0;
		else if(btri3)
			color<=0;
        else if(btri4)
            color<=0;
		else if(triangle1)
			color<=3'b010;
		else if(triangle2)
			color<=3'b010;
		else if(triangle3)
			color<=3'b010;
		else if(rectangle)
			color<=0;
		else 
			color<=3'b001;
	end
	else
		color<=0;
end

endmodule
