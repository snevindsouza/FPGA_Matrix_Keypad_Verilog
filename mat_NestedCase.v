//This module may contain some logical errors depending on the FPGA of your choice. Use of Else-If ladder is highly recommended.
module matkey (
    input clk,
    input [3:0] row,
    output reg [3:0] col,
    output reg [3:0] ctrl,
    output [7:0] segment
);

reg [7:0] display ;

initial col = 4'b0001;
    
always @(posedge clk) ctrl = 4'b1110;
    
always @(posedge clk) begin
    case (col)
        4'b0001: case (row)
            row[0]: display = 8'b11111100;//0
            row[1]: display = 8'b01100110;//4
            row[2]: display = 8'b11111110;//8
            row[3]: display = 8'b10011100;//C
        endcase 
        4'b0010: case (row)
            row[0]: display = 8'b01100000;//1
            row[1]: display = 8'b10110110;//5
            row[2]: display = 8'b11110110;//9
            row[3]: display = 8'b01111010;//D
        endcase 
        4'b0100: case (row)
            row[0]: display = 8'b11011010;//2
            row[1]: display = 8'b10111110;//6
            row[2]: display = 8'b11101110;//A
            row[3]: display = 8'b10011110;//E
        endcase 
        4'b1000: case (row)
            row[0]: display = 8'b11110010;//3
            row[1]: display = 8'b11100000;//7
            row[2]: display = 8'b00111110;//B
            row[3]: display = 8'b10001110;//F
        endcase
    endcase
    col = ({col[2:0],col[3]});
end

assign segment = display;

endmodule
