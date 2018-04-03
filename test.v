// Full system test of CGRA
module test();

   reg clk;
   reg rst;

   wire tdo;
   wire trst_n;
   wire tdi;
   wire tms;
   
   wire tck;

   reg reset_done;
   
   reg [31:0] config_addr;
   reg [31:0] config_data;

   integer    config_file;
   integer    scan_file;
   
   initial begin

      config_file = $fopen("../../CGRAGenerator/bitstream/examples/pw2_sixteen.bsa", "r");
      reset_done = 0;

      if (config_file == 0) begin
	 $display("config_file was null");
	 $finish;
      end else begin
	 $display("Loaded config file, descriptor = %d", config_file);
      end

      #1 clk = 0;
      
      config_addr = 0;
      config_data = 0;

      #2 rst = 0;
      #2 rst = 1;
      #3 rst = 0;

      reset_done = 1;
      $display("DONE WITH RESET");

   end // initial begin

   always #2 clk = ~clk;

   reg [0:0] data_in_S0_T0_reg;
   
   // After reseting load data / configuration between rising clock edges
   always @(negedge clk) begin

      $display("clk = %d", clk);
      $display("config file = %d", config_file);

      if (reset_done) begin
	 scan_file = $fscanf(config_file, "%h %h\n", config_addr, config_data);

	 if (!$feof(config_file)) begin
	 
	    $display("config addr = %h", config_addr);
	    $display("config data = %h", config_data);
	 
	 end else begin
	    $display("Reached end of file!");
	 end
      end
   end

   wire [0:0] data_out_S0_T0;
   wire [0:0] data_out_S0_T1;
   wire [0:0] data_out_S0_T2;
   wire [0:0] data_out_S0_T3;
   wire [0:0] data_out_S0_T4;
   wire [0:0] data_out_S0_T5;
   wire [0:0] data_out_S0_T6;
   wire [0:0] data_out_S0_T7;
   wire [0:0] data_out_S0_T8;
   wire [0:0] data_out_S0_T9;
   wire [0:0] data_out_S0_T10;
   wire [0:0] data_out_S0_T11;
   wire [0:0] data_out_S0_T12;
   wire [0:0] data_out_S0_T13;
   wire [0:0] data_out_S0_T14;
   wire [0:0] data_out_S0_T15;

   always @(posedge clk) begin
      $display("data_out_S0_T15 = %d", data_out_S0_T15);
   end

   
   wire [0:0] data_in_S2_T0;
   wire [0:0] data_in_S2_T1;
   wire [0:0] data_in_S2_T2;
   wire [0:0] data_in_S2_T3;
   wire [0:0] data_in_S2_T4;
   wire [0:0] data_in_S2_T5;
   wire [0:0] data_in_S2_T6;
   wire [0:0] data_in_S2_T7;
   wire [0:0] data_in_S2_T8;
   wire [0:0] data_in_S2_T9;
   wire [0:0] data_in_S2_T10;
   wire [0:0] data_in_S2_T11;
   wire [0:0] data_in_S2_T12;
   wire [0:0] data_in_S2_T13;
   wire [0:0] data_in_S2_T14;
   wire [0:0] data_in_S2_T15;   

   assign data_in_S2_T0 = 1'h1;
   assign data_in_S2_T1 = 1'h1;
   assign data_in_S2_T2 = 1'h1;
   assign data_in_S2_T3 = 1'h1;
   assign data_in_S2_T4 = 1'h1;
   assign data_in_S2_T5 = 1'h1;
   assign data_in_S2_T6 = 1'h1;
   assign data_in_S2_T7 = 1'h1;
   assign data_in_S2_T8 = 1'h1;
   assign data_in_S2_T9 = 1'h1;
   assign data_in_S2_T10 = 1'h1;
   assign data_in_S2_T11 = 1'h1;
   assign data_in_S2_T12 = 1'h1;
   assign data_in_S2_T13 = 1'h1;
   assign data_in_S2_T14 = 1'h1;
   assign data_in_S2_T15 = 1'h1;
   
   top cgra(.clk_in(clk),
	    .reset_in(rst),
	    .config_addr_in(config_addr),
	    .config_data_in(config_data),

	    .pad_S2_T0_in(data_in_S2_T0),
	    .pad_S2_T1_in(data_in_S2_T1),
	    .pad_S2_T2_in(data_in_S2_T2),
	    .pad_S2_T3_in(data_in_S2_T3),
	    .pad_S2_T4_in(data_in_S2_T4),
	    .pad_S2_T5_in(data_in_S2_T5),
	    .pad_S2_T6_in(data_in_S2_T6),
	    .pad_S2_T7_in(data_in_S2_T7),
	    .pad_S2_T8_in(data_in_S2_T8),
	    .pad_S2_T9_in(data_in_S2_T9),
	    .pad_S2_T10_in(data_in_S2_T10),
	    .pad_S2_T11_in(data_in_S2_T11),
	    .pad_S2_T12_in(data_in_S2_T12),
	    .pad_S2_T13_in(data_in_S2_T13),
	    .pad_S2_T14_in(data_in_S2_T14),
	    .pad_S2_T15_in(data_in_S2_T15),

	    .pad_S0_T0_out(data_out_S0_T0),
	    .pad_S0_T1_out(data_out_S0_T1),
	    .pad_S0_T2_out(data_out_S0_T2),
	    .pad_S0_T3_out(data_out_S0_T3),	    	    
	    .pad_S0_T4_out(data_out_S0_T4),
	    .pad_S0_T5_out(data_out_S0_T5),
	    .pad_S0_T6_out(data_out_S0_T6),
	    .pad_S0_T7_out(data_out_S0_T7),
	    .pad_S0_T8_out(data_out_S0_T8),
	    .pad_S0_T9_out(data_out_S0_T9),
	    .pad_S0_T10_out(data_out_S0_T10),
	    .pad_S0_T11_out(data_out_S0_T11),
	    .pad_S0_T12_out(data_out_S0_T12),
	    .pad_S0_T13_out(data_out_S0_T13),
	    .pad_S0_T14_out(data_out_S0_T14),
	    .pad_S0_T15_out(data_out_S0_T15),	    
	    
	    .tdi(tdi),
	    .tms(tms),
	    .tck(tck),
	    .tdo(tdo),
	    .trst_n(trst_n));
   
endmodule
