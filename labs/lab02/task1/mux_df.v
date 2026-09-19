// mux_df.v
// 2-to-1 multiplexer, DATAFLOW style.
//
// This file does not compile as-is. Find the bug and fix it before moving on.
// Hint: think carefully about which port should be a net and which should be
// a variable in dataflow modeling.

module mux_df (
  input      I0,
  input      I1,
  input      S,
  output wire Y //wire and not a reg
);

  assign Y = S ? I1 : I0;

endmodule
//here Y is driven by a continous assign statement, and only a wire can auto update like that.
//reg doesn't work here because it's meant to hold the values a procedural block last wrote to it.