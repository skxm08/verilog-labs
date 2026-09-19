module tb;

reg [1:0] t_a;
reg [1:0] t_b;
wire t_gt;
wire t_lt;
wire t_eq;

reg exp_gt;
reg exp_lt;
reg exp_eq;

integer errors = 0;
integer total_test = 0;
integer i,j;

comp2 DUT (
    .A (t_a),
    .B (t_b),
    .GT (t_gt),
    .LT (t_lt),
    .EQ (t_eq)
);

string vcd_file;
initial begin 
    if ($value$plusargs("vcd=%s" , vcd_file)) begin
        $dumpfile(vcd_file);
        $dumpvars(0,DUT);
    end
end

    initial begin 
        for(i=0; i<4 ; i=i+1) begin 
            for(j=0; j<4; j=j+1) begin
                t_a = i;
                t_b =j;

                exp_gt = (i>j);
                exp_lt = (i<j);
                exp_eq = (i==j);

                #5;
                total_test = total_test +1;

                if ({t_gt, t_lt, t_eq} !== {exp_gt, exp_lt, exp_eq}) begin
                    $display ("FAIL at time %0t: A=%b B=%b got GT=%b LT=%b EQ=%b expected GT=%b LT=%b EQ=%b", $time, t_a, t_b, t_gt, t_lt, t_eq, exp_gt, exp_lt, exp_eq);
                    
                    errors = errors +1;
                end 
            end
        end

        $write("TEST RESULT: ");
        if (errors == 0) begin 
            $display("PASSED %0d out of %0d tests." , total_test - errors, total_test);
        end else begin 
            $display("FAILED! %0d out of %0d tests passed (%0d errors). " , total_test - errors , total_test, errors);
        end

        $finish;
    end 

endmodule 