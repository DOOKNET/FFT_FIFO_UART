module un_signed
(
	input  [31:0] unsigned_I,
	output [31:0] signed_I
);


assign signed_I[31]=~unsigned_I[31];
assign signed_I[30:0]=unsigned_I[30:0];

endmodule
