module matkey (
    input clk,
    input [3:0] row,
    output reg [3:0] col,
    output reg [3:0] ctrl,
    output [7:0] segment
);

reg [7:0] display ;

initial col = 4'b0001;

always @(posedge clk) ctrl = 4'b0111;

always @(posedge clk) begin
    if (col==4'b0001) begin
        if (row[0]==1) display = 8'b11111100;//0
        else if (row[1]==1) display = 8'b01100110;//4
        else if (row[2]==1) display = 8'b11111110;//8
        else if (row[3]==1) display = 8'b11111100;//0
    end
    else if (col==4'b0010) begin
        if (row[0]==1) display = 8'b01100000;//1
        else if (row[1]==1) display = 8'b10110110;//5
        else if (row[2]==1) display = 8'b11110110;//9
        else if (row[3]==1) display = 8'b01111010;//D
    end
    else if (col==4'b0100) begin
        if (row[0]==1) display = 8'b11011010;//2
        else if (row[1]==1) display = 8'b10111110;//6
        else if (row[2]==1) display = 8'b11101110;//A
        else if (row[3]==1) display = 8'b10011110;//E
    end
    else if (col==4'b1000) begin
        if (row[0]==1) display = 8'b11110010;//3
        else if (row[1]==1) display = 8'b11100000;//7
        else if (row[2]==1) display = 8'b00111110;//B
        else if (row[3]==1) display = 8'b10001110;//F
    end
    col = ({col[2:0],col[3]});    //column changes at the rate of 4MHz
end

assign segment = display;

endmodule
