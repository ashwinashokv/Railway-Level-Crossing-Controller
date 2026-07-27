module railway_controller (
    input clk,
    input reset,
    input train_arrival,
    input train_departure,

    output reg gate,
    output reg warning,
    output reg road_signal,

    output [1:0] state_out
);

    
    parameter IDLE          = 2'b00;
    parameter GATE_CLOSING  = 2'b01;
    parameter TRAIN_PASSING = 2'b10;
    parameter GATE_OPENING  = 2'b11;

    reg [1:0] current_state;
    reg [1:0] next_state;

    
    assign state_out = current_state;

    
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end

    
    always @(*) begin
        case (current_state)

            IDLE:
                if (train_arrival)
                    next_state = GATE_CLOSING;
                else
                    next_state = IDLE;

            GATE_CLOSING:
                next_state = TRAIN_PASSING;

            TRAIN_PASSING:
                if (train_departure)
                    next_state = GATE_OPENING;
                else
                    next_state = TRAIN_PASSING;

            GATE_OPENING:
                next_state = IDLE;

            default:
                next_state = IDLE;

        endcase
    end

    
    always @(*) begin

        gate        = 1'b0;
        warning     = 1'b0;
        road_signal = 1'b0;

        case(current_state)

            IDLE: begin
                gate        = 1'b0;   // Open
                warning     = 1'b0;
                road_signal = 1'b0;   // Green
            end

            GATE_CLOSING: begin
                gate        = 1'b1;   // Closed
                warning     = 1'b1;
                road_signal = 1'b1;   // Red
            end

            TRAIN_PASSING: begin
                gate        = 1'b1;
                warning     = 1'b1;
                road_signal = 1'b1;
            end

            GATE_OPENING: begin
                gate        = 1'b0;   // Open
                warning     = 1'b0;
                road_signal = 1'b0;   // Green
            end

            default: begin
                gate        = 1'b0;
                warning     = 1'b0;
                road_signal = 1'b0;
            end

        endcase

    end

endmodule
