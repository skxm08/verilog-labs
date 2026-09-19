// mux_beh.v
// 2-to-1 multiplexer, BEHAVIORAL style.
//
// This file does not compile as-is. Find the bug and fix it before moving on.
// Hint: think carefully about which port should be a net and which should be
// a variable in behavioral modeling.

module mux_beh (
  input       I0,
  input       I1,
  input       S,
  output reg Y //reg and not a wire
);

  always @(*) begin
    if (S)
      Y = I1;
    else
      Y = I0;
  end

endmodule

//here Y is written inside a procedural always block, which requires a varialble to hold value between trigger events and a wire has no such storage.