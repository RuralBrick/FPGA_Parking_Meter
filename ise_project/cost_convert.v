

module cost_convert(
 input [7:0] sw, 
 input [11:0] sec_count,
 output [13:0] cst
);
 
 reg [13:0] cost = 0;
 
 assign cst = cost;
 
 wire [2:0] location;
 assign location = sw[7:5];

 wire [4:0] hour;
 assign hour = sw[4:0];

 reg [11:0] min_count;
 
 //convert seconds to minutes
 always @* begin
  if(sec_count % 60 != 0)
     min_count = sec_count / 60 + 1;
  else
     min_count = sec_count / 60;

   //based on the location and time, calculate cost in cents accordingly
   if (location == 'b000) begin
   //12 am to 8 am
   if (hour >= 'b00000 && hour < 'b01000) begin
      cost = min_count * 1;
   //8 am to 1 pm
   end else if (hour >= 'b01000 && hour < 'b01101) begin
      cost = min_count * 2;
   //1 pm to 6 pm
   end else if (hour >= 'b01101 && hour < 'b10010) begin
      cost = min_count * 2;
   //6 pm to 12 am
   end else if (hour >= 'b10010 && hour < 'b11000) begin
      cost = min_count * 1;
   end

   end else if (location == 'b001) begin
   //12 am to 8 am
   if (hour >= 'b00000 && hour < 'b01000) begin
      cost = min_count * 2;
   //8 am to 1 pm
   end else if (hour >= 'b01000 && hour < 'b01101) begin
      cost = min_count * 3;
   //1 pm to 6 pm
   end else if (hour >= 'b01101 && hour < 'b10010) begin
      cost = min_count * 3;
   //6 pm to 12 am
   end else if (hour >= 'b10010 && hour < 'b11000) begin
      cost = min_count * 2;
   end

   end else if (location == 'b010) begin
   //12 am to 8 am
   if (hour >= 'b00000 && hour < 'b01000) begin
      cost = min_count * 3;
   //8 am to 1 pm
   end else if (hour >= 'b01000 && hour < 'b01101) begin
      cost = min_count * 4;
   //1 pm to 6 pm
   end else if (hour >= 'b01101 && hour < 'b10010) begin
      cost = min_count * 4;
   //6 pm to 12 am
   end else if (hour >= 'b10010 && hour < 'b11000) begin
      cost = min_count * 3;
   end

   end else if (location == 'b011) begin
   //12 am to 8 am
   if (hour >= 'b00000 && hour < 'b01000) begin
      cost = min_count * 4;
   //8 am to 1 pm
   end else if (hour >= 'b01000 && hour < 'b01101) begin
      cost = min_count * 5;
   //1 pm to 6 pm
   end else if (hour >= 'b01101 && hour < 'b10010) begin
      cost = min_count * 5;
   //6 pm to 12 am
   end else if (hour >= 'b10010 && hour < 'b11000) begin
      cost = min_count * 4;
   end

   end else if (location == 'b100) begin
   //12 am to 8 am
   if (hour >= 'b00000 && hour < 'b01000) begin
      cost = min_count * 5;
   //8 am to 1 pm
   end else if (hour >= 'b01000 && hour < 'b01101) begin
      cost = min_count * 6;
   //1 pm to 6 pm
   end else if (hour >= 'b01101 && hour < 'b10010) begin
      cost = min_count * 6;
   //6 pm to 12 am
   end else if (hour >= 'b10010 && hour < 'b11000) begin
      cost = min_count * 5;
   end

   end else if (location == 'b101) begin
   //12 am to 8 am
   if (hour >= 'b00000 && hour < 'b01000) begin
      cost = min_count * 6;
   //8 am to 1 pm
   end else if (hour >= 'b01000 && hour < 'b01101) begin
      cost = min_count * 7;
   //1 pm to 6 pm
   end else if (hour >= 'b01101 && hour < 'b10010) begin
      cost = min_count * 7;
   //6 pm to 12 am
   end else if (hour >= 'b10010 && hour < 'b11000) begin
      cost = min_count * 6;
   end

   end else if (location == 'b110) begin
   //12 am to 8 am
   if (hour >= 'b00000 && hour < 'b01000) begin
      cost = min_count * 7;
   //8 am to 1 pm
   end else if (hour >= 'b01000 && hour < 'b01101) begin
      cost = min_count * 8;
   //1 pm to 6 pm
   end else if (hour >= 'b01101 && hour < 'b10010) begin
      cost = min_count * 8;
   //6 pm to 12 am
   end else if (hour >= 'b10010 && hour < 'b11000) begin
      cost = min_count * 7;
   end

   end else if (location == 'b111) begin
   //12 am to 8 am
   if (hour >= 'b00000 && hour < 'b01000) begin
      cost = min_count * 8;
   //8 am to 1 pm
   end else if (hour >= 'b01000 && hour < 'b01101) begin
      cost = min_count * 9;
   //1 pm to 6 pm
   end else if (hour >= 'b01101 && hour < 'b10010) begin
      cost = min_count * 9;
   //6 pm to 12 am
   end else if (hour >= 'b10010 && hour < 'b11000) begin
      cost = min_count * 8;
   end
   
   end

 end

endmodule

