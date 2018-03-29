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
	    data_in_S0_T0_reg <= 1'b1;
	 end
      end
   end



   wire [0:0] data_in_S0_T0;
   assign data_in_S0_T0 = data_in_S0_T0_reg;
   
   top cgra(.clk_in(clk),
	    .reset_in(rst),
	    .config_addr_in(config_addr),
	    .config_data_in(config_data),

	    .pad_S0_T0(data_in_S0_T0),
	    
	    .tdi(tdi),
	    .tms(tms),
	    .tck(tck),
	    .tdo(tdo),
	    .trst_n(trst_n));
   
endmodule
