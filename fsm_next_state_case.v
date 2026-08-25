// FSM State Transition Decoder (case)
// Maps next-state logic using explicit enumerated state signals.
module fsm_next_state_case(
  input      start, done,
  input      [1:0] state,
  output reg [1:0] next_state
);

typedef enum reg [1:0] {IDLE, RUN, STOP} state_t;

always @* begin
  next_state = state;
  case (state)
      IDLE: if (start) next_state = RUN;
      RUN:  if (done)  next_state = STOP;
      STOP:            next_state = IDLE;
      default:         next_state = IDLE;
  endcase
end

endmodule
