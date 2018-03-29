// Full system test of CGRA
module test();

   reg clk;
   reg rst;

   wire tdo;
   wire trst_n;
   wire tdi;
   wire tms;
   
   wire tck;

   reg [31:0] config_addr;
   reg [31:0] config_data;

   integer    config_file;
   integer    scan_file;
   
   initial begin

      config_file = $fopen("../../CGRAGenerator/bitstream/examples/conv_1_2.bs", "r");

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

      $display("DONE WITH RESET");

      #3 clk = ~clk;
      #3 clk = ~clk;
      #3 clk = ~clk;
      #3 clk = ~clk;

   end // initial begin

   always #2 clk = ~clk;

   always @(posedge clk) begin

      $display("clk = %d", clk);
      $display("config file = %d", config_file);

      scan_file = $fscanf(config_file, "%h %h\n", config_addr, config_data);

      if (!$feof(config_file)) begin
	 
	 $display("config addr = %h", config_addr);
	 $display("config data = %h", config_data);
	 
      end else begin
	 $display("Reached end of file!");
      end

   end

   top cgra(.clk_in(clk),
	    .reset_in(rst),
	    .config_addr_in(config_addr),
	    .config_data_in(config_data),
	    
	    .tdi(tdi),
	    .tms(tms),
	    .tck(tck),
	    .tdo(tdo),
	    .trst_n(trst_n));
   
endmodule
