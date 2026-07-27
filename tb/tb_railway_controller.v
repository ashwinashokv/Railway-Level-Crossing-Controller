`timescale 1ns/1ps

module tb_railway_controller;

    
    reg clk;
    reg reset;
    reg train_arrival;
    reg train_departure;

    
    wire gate;
    wire warning;
    wire road_signal;
    wire [1:0] state_out;

    
    railway_controller uut (
        .clk(clk),
        .reset(reset),
        .train_arrival(train_arrival),
        .train_departure(train_departure),
        .gate(gate),
        .warning(warning),
        .road_signal(road_signal),
        .state_out(state_out)
    );

    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    
    initial begin
        $dumpfile("railway.vcd");
        $dumpvars(0, tb_railway_controller);
    end

    
    initial begin

        reset = 1;
        train_arrival = 0;
        train_departure = 0;

        #20;
        reset = 0;

        
        #20;
        train_arrival = 1;

        #10;
        train_arrival = 0;

        #60;
        train_departure = 1;

        #10;
        train_departure = 0;

        #40;

        
        train_arrival = 1;

        #10;
        train_arrival = 0;

        #40;
        train_departure = 1;

        #10;
        train_departure = 0;

        #40;

        
        train_arrival = 1;

        #10;
        train_arrival = 0;

        #20;
        reset = 1;

        #10;
        reset = 0;

        #40;

        $finish;

    end

    
    initial begin
        $monitor("Time=%0t Reset=%b Arr=%b Dep=%b State=%b Gate=%b Warn=%b Road=%b",
                  $time,
                  reset,
                  train_arrival,
                  train_departure,
                  state_out,
                  gate,
                  warning,
                  road_signal);
    end

endmodule
