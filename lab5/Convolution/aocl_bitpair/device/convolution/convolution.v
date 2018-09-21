// (C) 1992-2015 Altera Corporation. All rights reserved.                         
// Your use of Altera Corporation's design tools, logic functions and other       
// software and tools, and its AMPP partner logic functions, and any output       
// files any of the foregoing (including device programming or simulation         
// files), and any associated documentation or information are expressly subject  
// to the terms and conditions of the Altera Program License Subscription         
// Agreement, Altera MegaCore Function License Agreement, or other applicable     
// license agreement, including, without limitation, that your use is for the     
// sole purpose of programming logic devices manufactured by Altera and sold by   
// Altera or its authorized distributors.  Please refer to the applicable         
// agreement for further details.                                                 
    

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

// altera message_off 10036
// altera message_off 10230
// altera message_off 10858
module convolution_kernel_basic_block_0
	(
		input 		clock,
		input 		resetn,
		input 		start,
		input [63:0] 		input_inputArray,
		input [63:0] 		input_size,
		input 		valid_in,
		output 		stall_out,
		input [31:0] 		input_global_id_0,
		output 		valid_out,
		input 		stall_in,
		output [31:0] 		lvb_bb0_add7,
		output [31:0] 		lvb_bb0_sub,
		output [31:0] 		lvb_input_global_id_0,
		input [31:0] 		workgroup_size,
		output 		avm_local_bb0_ld__enable,
		input [255:0] 		avm_local_bb0_ld__readdata,
		input 		avm_local_bb0_ld__readdatavalid,
		input 		avm_local_bb0_ld__waitrequest,
		output [29:0] 		avm_local_bb0_ld__address,
		output 		avm_local_bb0_ld__read,
		output 		avm_local_bb0_ld__write,
		input 		avm_local_bb0_ld__writeack,
		output [255:0] 		avm_local_bb0_ld__writedata,
		output [31:0] 		avm_local_bb0_ld__byteenable,
		output [4:0] 		avm_local_bb0_ld__burstcount,
		output 		local_bb0_ld__active,
		input 		clock2x,
		output 		avm_local_bb0_ld_memcoalesce_inputArray_load_0_enable,
		input [255:0] 		avm_local_bb0_ld_memcoalesce_inputArray_load_0_readdata,
		input 		avm_local_bb0_ld_memcoalesce_inputArray_load_0_readdatavalid,
		input 		avm_local_bb0_ld_memcoalesce_inputArray_load_0_waitrequest,
		output [29:0] 		avm_local_bb0_ld_memcoalesce_inputArray_load_0_address,
		output 		avm_local_bb0_ld_memcoalesce_inputArray_load_0_read,
		output 		avm_local_bb0_ld_memcoalesce_inputArray_load_0_write,
		input 		avm_local_bb0_ld_memcoalesce_inputArray_load_0_writeack,
		output [255:0] 		avm_local_bb0_ld_memcoalesce_inputArray_load_0_writedata,
		output [31:0] 		avm_local_bb0_ld_memcoalesce_inputArray_load_0_byteenable,
		output [4:0] 		avm_local_bb0_ld_memcoalesce_inputArray_load_0_burstcount,
		output 		local_bb0_ld_memcoalesce_inputArray_load_0_active
	);


// Values used for debugging.  These are swept away by synthesis.
wire _entry;
wire _exit;
 reg [31:0] _num_entry_NO_SHIFT_REG;
 reg [31:0] _num_exit_NO_SHIFT_REG;
wire [31:0] _num_live;

assign _entry = ((&valid_in) & ~((|stall_out)));
assign _exit = ((&valid_out) & ~((|stall_in)));
assign _num_live = (_num_entry_NO_SHIFT_REG - _num_exit_NO_SHIFT_REG);

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		_num_entry_NO_SHIFT_REG <= 32'h0;
		_num_exit_NO_SHIFT_REG <= 32'h0;
	end
	else
	begin
		if (_entry)
		begin
			_num_entry_NO_SHIFT_REG <= (_num_entry_NO_SHIFT_REG + 2'h1);
		end
		if (_exit)
		begin
			_num_exit_NO_SHIFT_REG <= (_num_exit_NO_SHIFT_REG + 2'h1);
		end
	end
end



// This section defines the behaviour of the MERGE node
wire merge_node_stall_in_0;
 reg merge_node_valid_out_0_NO_SHIFT_REG;
wire merge_node_stall_in_1;
 reg merge_node_valid_out_1_NO_SHIFT_REG;
wire merge_node_stall_in_2;
 reg merge_node_valid_out_2_NO_SHIFT_REG;
wire merge_stalled_by_successors;
 reg merge_block_selector_NO_SHIFT_REG;
 reg merge_node_valid_in_staging_reg_NO_SHIFT_REG;
 reg [31:0] input_global_id_0_staging_reg_NO_SHIFT_REG;
 reg [31:0] local_lvm_input_global_id_0_NO_SHIFT_REG;
 reg is_merge_data_to_local_regs_valid_NO_SHIFT_REG;
 reg invariant_valid_NO_SHIFT_REG;

assign merge_stalled_by_successors = ((merge_node_stall_in_0 & merge_node_valid_out_0_NO_SHIFT_REG) | (merge_node_stall_in_1 & merge_node_valid_out_1_NO_SHIFT_REG) | (merge_node_stall_in_2 & merge_node_valid_out_2_NO_SHIFT_REG));
assign stall_out = merge_node_valid_in_staging_reg_NO_SHIFT_REG;

always @(*)
begin
	if ((merge_node_valid_in_staging_reg_NO_SHIFT_REG | valid_in))
	begin
		merge_block_selector_NO_SHIFT_REG = 1'b0;
		is_merge_data_to_local_regs_valid_NO_SHIFT_REG = 1'b1;
	end
	else
	begin
		merge_block_selector_NO_SHIFT_REG = 1'b0;
		is_merge_data_to_local_regs_valid_NO_SHIFT_REG = 1'b0;
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		input_global_id_0_staging_reg_NO_SHIFT_REG <= 'x;
		merge_node_valid_in_staging_reg_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (((merge_block_selector_NO_SHIFT_REG != 1'b0) | merge_stalled_by_successors))
		begin
			if (~(merge_node_valid_in_staging_reg_NO_SHIFT_REG))
			begin
				input_global_id_0_staging_reg_NO_SHIFT_REG <= input_global_id_0;
				merge_node_valid_in_staging_reg_NO_SHIFT_REG <= valid_in;
			end
		end
		else
		begin
			merge_node_valid_in_staging_reg_NO_SHIFT_REG <= 1'b0;
		end
	end
end

always @(posedge clock)
begin
	if (~(merge_stalled_by_successors))
	begin
		case (merge_block_selector_NO_SHIFT_REG)
			1'b0:
			begin
				if (merge_node_valid_in_staging_reg_NO_SHIFT_REG)
				begin
					local_lvm_input_global_id_0_NO_SHIFT_REG <= input_global_id_0_staging_reg_NO_SHIFT_REG;
				end
				else
				begin
					local_lvm_input_global_id_0_NO_SHIFT_REG <= input_global_id_0;
				end
			end

			default:
			begin
			end

		endcase
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		merge_node_valid_out_0_NO_SHIFT_REG <= 1'b0;
		merge_node_valid_out_1_NO_SHIFT_REG <= 1'b0;
		merge_node_valid_out_2_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (~(merge_stalled_by_successors))
		begin
			merge_node_valid_out_0_NO_SHIFT_REG <= is_merge_data_to_local_regs_valid_NO_SHIFT_REG;
			merge_node_valid_out_1_NO_SHIFT_REG <= is_merge_data_to_local_regs_valid_NO_SHIFT_REG;
			merge_node_valid_out_2_NO_SHIFT_REG <= is_merge_data_to_local_regs_valid_NO_SHIFT_REG;
		end
		else
		begin
			if (~(merge_node_stall_in_0))
			begin
				merge_node_valid_out_0_NO_SHIFT_REG <= 1'b0;
			end
			if (~(merge_node_stall_in_1))
			begin
				merge_node_valid_out_1_NO_SHIFT_REG <= 1'b0;
			end
			if (~(merge_node_stall_in_2))
			begin
				merge_node_valid_out_2_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		invariant_valid_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		invariant_valid_NO_SHIFT_REG <= (~(start) & (invariant_valid_NO_SHIFT_REG | is_merge_data_to_local_regs_valid_NO_SHIFT_REG));
	end
end


// This section implements an unregistered operation.
// 
wire local_bb0_memcoalesce_inputArray_bitcast_0_valid_out;
wire local_bb0_memcoalesce_inputArray_bitcast_0_stall_in;
wire local_bb0_memcoalesce_inputArray_bitcast_0_inputs_ready;
wire local_bb0_memcoalesce_inputArray_bitcast_0_stall_local;
wire [63:0] local_bb0_memcoalesce_inputArray_bitcast_0;

assign local_bb0_memcoalesce_inputArray_bitcast_0_inputs_ready = merge_node_valid_out_0_NO_SHIFT_REG;
assign local_bb0_memcoalesce_inputArray_bitcast_0 = (input_inputArray & 64'hFFFFFFFFFFFFFC00);
assign local_bb0_memcoalesce_inputArray_bitcast_0_valid_out = local_bb0_memcoalesce_inputArray_bitcast_0_inputs_ready;
assign local_bb0_memcoalesce_inputArray_bitcast_0_stall_local = local_bb0_memcoalesce_inputArray_bitcast_0_stall_in;
assign merge_node_stall_in_0 = (|local_bb0_memcoalesce_inputArray_bitcast_0_stall_local);

// This section implements a registered operation.
// 
wire local_bb0_ld__inputs_ready;
 reg local_bb0_ld__wii_reg_NO_SHIFT_REG;
 reg local_bb0_ld__valid_out_NO_SHIFT_REG;
wire local_bb0_ld__stall_in;
wire local_bb0_ld__output_regs_ready;
wire local_bb0_ld__fu_stall_out;
wire local_bb0_ld__fu_valid_out;
wire [31:0] local_bb0_ld__lsu_dataout;
 reg [31:0] local_bb0_ld__NO_SHIFT_REG;
wire local_bb0_ld__causedstall;

lsu_top lsu_local_bb0_ld_ (
	.clock(clock),
	.clock2x(clock2x),
	.resetn(resetn),
	.flush(start),
	.stream_base_addr(),
	.stream_size(),
	.stream_reset(),
	.o_stall(local_bb0_ld__fu_stall_out),
	.i_valid((~(local_bb0_ld__wii_reg_NO_SHIFT_REG) & local_bb0_ld__inputs_ready)),
	.i_address((input_size & 64'hFFFFFFFFFFFFFC00)),
	.i_writedata(),
	.i_cmpdata(),
	.i_predicate(1'b0),
	.i_bitwiseor(64'h0),
	.i_byteenable(),
	.i_stall(~(local_bb0_ld__output_regs_ready)),
	.o_valid(local_bb0_ld__fu_valid_out),
	.o_readdata(local_bb0_ld__lsu_dataout),
	.o_input_fifo_depth(),
	.o_writeack(),
	.i_atomic_op(3'h0),
	.o_active(local_bb0_ld__active),
	.avm_address(avm_local_bb0_ld__address),
	.avm_read(avm_local_bb0_ld__read),
	.avm_enable(avm_local_bb0_ld__enable),
	.avm_readdata(avm_local_bb0_ld__readdata),
	.avm_write(avm_local_bb0_ld__write),
	.avm_writeack(avm_local_bb0_ld__writeack),
	.avm_burstcount(avm_local_bb0_ld__burstcount),
	.avm_writedata(avm_local_bb0_ld__writedata),
	.avm_byteenable(avm_local_bb0_ld__byteenable),
	.avm_waitrequest(avm_local_bb0_ld__waitrequest),
	.avm_readdatavalid(avm_local_bb0_ld__readdatavalid),
	.profile_bw(),
	.profile_bw_incr(),
	.profile_total_ivalid(),
	.profile_total_req(),
	.profile_i_stall_count(),
	.profile_o_stall_count(),
	.profile_avm_readwrite_count(),
	.profile_avm_burstcount_total(),
	.profile_avm_burstcount_total_incr(),
	.profile_req_cache_hit_count(),
	.profile_extra_unaligned_reqs(),
	.profile_avm_stall()
);

defparam lsu_local_bb0_ld_.AWIDTH = 30;
defparam lsu_local_bb0_ld_.WIDTH_BYTES = 4;
defparam lsu_local_bb0_ld_.MWIDTH_BYTES = 32;
defparam lsu_local_bb0_ld_.WRITEDATAWIDTH_BYTES = 32;
defparam lsu_local_bb0_ld_.ALIGNMENT_BYTES = 32;
defparam lsu_local_bb0_ld_.READ = 1;
defparam lsu_local_bb0_ld_.ATOMIC = 0;
defparam lsu_local_bb0_ld_.WIDTH = 32;
defparam lsu_local_bb0_ld_.MWIDTH = 256;
defparam lsu_local_bb0_ld_.ATOMIC_WIDTH = 3;
defparam lsu_local_bb0_ld_.BURSTCOUNT_WIDTH = 5;
defparam lsu_local_bb0_ld_.KERNEL_SIDE_MEM_LATENCY = 1;
defparam lsu_local_bb0_ld_.MEMORY_SIDE_MEM_LATENCY = 0;
defparam lsu_local_bb0_ld_.USE_WRITE_ACK = 0;
defparam lsu_local_bb0_ld_.ENABLE_BANKED_MEMORY = 0;
defparam lsu_local_bb0_ld_.ABITS_PER_LMEM_BANK = 0;
defparam lsu_local_bb0_ld_.NUMBER_BANKS = 1;
defparam lsu_local_bb0_ld_.LMEM_ADDR_PERMUTATION_STYLE = 0;
defparam lsu_local_bb0_ld_.INTENDED_DEVICE_FAMILY = "Cyclone V";
defparam lsu_local_bb0_ld_.USEINPUTFIFO = 0;
defparam lsu_local_bb0_ld_.USECACHING = 0;
defparam lsu_local_bb0_ld_.USEOUTPUTFIFO = 1;
defparam lsu_local_bb0_ld_.FORCE_NOP_SUPPORT = 0;
defparam lsu_local_bb0_ld_.ADDRSPACE = 1;
defparam lsu_local_bb0_ld_.STYLE = "SIMPLE";

assign local_bb0_ld__inputs_ready = merge_node_valid_out_1_NO_SHIFT_REG;
assign local_bb0_ld__output_regs_ready = (~(local_bb0_ld__wii_reg_NO_SHIFT_REG) & (&(~(local_bb0_ld__valid_out_NO_SHIFT_REG) | ~(local_bb0_ld__stall_in))));
assign merge_node_stall_in_1 = (~(local_bb0_ld__wii_reg_NO_SHIFT_REG) & (local_bb0_ld__fu_stall_out | ~((~(local_bb0_ld__wii_reg_NO_SHIFT_REG) & local_bb0_ld__inputs_ready))));
assign local_bb0_ld__causedstall = ((~(local_bb0_ld__wii_reg_NO_SHIFT_REG) & local_bb0_ld__inputs_ready) && (local_bb0_ld__fu_stall_out && !(~(local_bb0_ld__output_regs_ready))));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_ld__NO_SHIFT_REG <= 'x;
		local_bb0_ld__valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_ld__NO_SHIFT_REG <= 'x;
			local_bb0_ld__valid_out_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_ld__output_regs_ready)
			begin
				local_bb0_ld__NO_SHIFT_REG <= local_bb0_ld__lsu_dataout;
				local_bb0_ld__valid_out_NO_SHIFT_REG <= local_bb0_ld__fu_valid_out;
			end
			else
			begin
				if (~(local_bb0_ld__stall_in))
				begin
					local_bb0_ld__valid_out_NO_SHIFT_REG <= local_bb0_ld__wii_reg_NO_SHIFT_REG;
				end
			end
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_ld__wii_reg_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_ld__wii_reg_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_ld__fu_valid_out)
			begin
				local_bb0_ld__wii_reg_NO_SHIFT_REG <= 1'b1;
			end
		end
	end
end


// This section implements a registered operation.
// 
wire local_bb0_ld_memcoalesce_inputArray_load_0_inputs_ready;
 reg local_bb0_ld_memcoalesce_inputArray_load_0_wii_reg_NO_SHIFT_REG;
 reg local_bb0_ld_memcoalesce_inputArray_load_0_valid_out_NO_SHIFT_REG;
wire local_bb0_ld_memcoalesce_inputArray_load_0_stall_in;
wire local_bb0_ld_memcoalesce_inputArray_load_0_output_regs_ready;
wire local_bb0_ld_memcoalesce_inputArray_load_0_fu_stall_out;
wire local_bb0_ld_memcoalesce_inputArray_load_0_fu_valid_out;
wire [63:0] local_bb0_ld_memcoalesce_inputArray_load_0_lsu_dataout;
 reg [63:0] local_bb0_ld_memcoalesce_inputArray_load_0_NO_SHIFT_REG;
wire local_bb0_ld_memcoalesce_inputArray_load_0_causedstall;

lsu_top lsu_local_bb0_ld_memcoalesce_inputArray_load_0 (
	.clock(clock),
	.clock2x(clock2x),
	.resetn(resetn),
	.flush(start),
	.stream_base_addr(),
	.stream_size(),
	.stream_reset(),
	.o_stall(local_bb0_ld_memcoalesce_inputArray_load_0_fu_stall_out),
	.i_valid((~(local_bb0_ld_memcoalesce_inputArray_load_0_wii_reg_NO_SHIFT_REG) & local_bb0_ld_memcoalesce_inputArray_load_0_inputs_ready)),
	.i_address((local_bb0_memcoalesce_inputArray_bitcast_0 & 64'hFFFFFFFFFFFFFC00)),
	.i_writedata(),
	.i_cmpdata(),
	.i_predicate(1'b0),
	.i_bitwiseor(64'h0),
	.i_byteenable(),
	.i_stall(~(local_bb0_ld_memcoalesce_inputArray_load_0_output_regs_ready)),
	.o_valid(local_bb0_ld_memcoalesce_inputArray_load_0_fu_valid_out),
	.o_readdata(local_bb0_ld_memcoalesce_inputArray_load_0_lsu_dataout),
	.o_input_fifo_depth(),
	.o_writeack(),
	.i_atomic_op(3'h0),
	.o_active(local_bb0_ld_memcoalesce_inputArray_load_0_active),
	.avm_address(avm_local_bb0_ld_memcoalesce_inputArray_load_0_address),
	.avm_read(avm_local_bb0_ld_memcoalesce_inputArray_load_0_read),
	.avm_enable(avm_local_bb0_ld_memcoalesce_inputArray_load_0_enable),
	.avm_readdata(avm_local_bb0_ld_memcoalesce_inputArray_load_0_readdata),
	.avm_write(avm_local_bb0_ld_memcoalesce_inputArray_load_0_write),
	.avm_writeack(avm_local_bb0_ld_memcoalesce_inputArray_load_0_writeack),
	.avm_burstcount(avm_local_bb0_ld_memcoalesce_inputArray_load_0_burstcount),
	.avm_writedata(avm_local_bb0_ld_memcoalesce_inputArray_load_0_writedata),
	.avm_byteenable(avm_local_bb0_ld_memcoalesce_inputArray_load_0_byteenable),
	.avm_waitrequest(avm_local_bb0_ld_memcoalesce_inputArray_load_0_waitrequest),
	.avm_readdatavalid(avm_local_bb0_ld_memcoalesce_inputArray_load_0_readdatavalid),
	.profile_bw(),
	.profile_bw_incr(),
	.profile_total_ivalid(),
	.profile_total_req(),
	.profile_i_stall_count(),
	.profile_o_stall_count(),
	.profile_avm_readwrite_count(),
	.profile_avm_burstcount_total(),
	.profile_avm_burstcount_total_incr(),
	.profile_req_cache_hit_count(),
	.profile_extra_unaligned_reqs(),
	.profile_avm_stall()
);

defparam lsu_local_bb0_ld_memcoalesce_inputArray_load_0.AWIDTH = 30;
defparam lsu_local_bb0_ld_memcoalesce_inputArray_load_0.WIDTH_BYTES = 8;
defparam lsu_local_bb0_ld_memcoalesce_inputArray_load_0.MWIDTH_BYTES = 32;
defparam lsu_local_bb0_ld_memcoalesce_inputArray_load_0.WRITEDATAWIDTH_BYTES = 32;
defparam lsu_local_bb0_ld_memcoalesce_inputArray_load_0.ALIGNMENT_BYTES = 32;
defparam lsu_local_bb0_ld_memcoalesce_inputArray_load_0.READ = 1;
defparam lsu_local_bb0_ld_memcoalesce_inputArray_load_0.ATOMIC = 0;
defparam lsu_local_bb0_ld_memcoalesce_inputArray_load_0.WIDTH = 64;
defparam lsu_local_bb0_ld_memcoalesce_inputArray_load_0.MWIDTH = 256;
defparam lsu_local_bb0_ld_memcoalesce_inputArray_load_0.ATOMIC_WIDTH = 3;
defparam lsu_local_bb0_ld_memcoalesce_inputArray_load_0.BURSTCOUNT_WIDTH = 5;
defparam lsu_local_bb0_ld_memcoalesce_inputArray_load_0.KERNEL_SIDE_MEM_LATENCY = 1;
defparam lsu_local_bb0_ld_memcoalesce_inputArray_load_0.MEMORY_SIDE_MEM_LATENCY = 0;
defparam lsu_local_bb0_ld_memcoalesce_inputArray_load_0.USE_WRITE_ACK = 0;
defparam lsu_local_bb0_ld_memcoalesce_inputArray_load_0.ENABLE_BANKED_MEMORY = 0;
defparam lsu_local_bb0_ld_memcoalesce_inputArray_load_0.ABITS_PER_LMEM_BANK = 0;
defparam lsu_local_bb0_ld_memcoalesce_inputArray_load_0.NUMBER_BANKS = 1;
defparam lsu_local_bb0_ld_memcoalesce_inputArray_load_0.LMEM_ADDR_PERMUTATION_STYLE = 0;
defparam lsu_local_bb0_ld_memcoalesce_inputArray_load_0.INTENDED_DEVICE_FAMILY = "Cyclone V";
defparam lsu_local_bb0_ld_memcoalesce_inputArray_load_0.USEINPUTFIFO = 0;
defparam lsu_local_bb0_ld_memcoalesce_inputArray_load_0.USECACHING = 0;
defparam lsu_local_bb0_ld_memcoalesce_inputArray_load_0.USEOUTPUTFIFO = 1;
defparam lsu_local_bb0_ld_memcoalesce_inputArray_load_0.FORCE_NOP_SUPPORT = 0;
defparam lsu_local_bb0_ld_memcoalesce_inputArray_load_0.ADDRSPACE = 1;
defparam lsu_local_bb0_ld_memcoalesce_inputArray_load_0.STYLE = "SIMPLE";

assign local_bb0_ld_memcoalesce_inputArray_load_0_inputs_ready = local_bb0_memcoalesce_inputArray_bitcast_0_valid_out;
assign local_bb0_ld_memcoalesce_inputArray_load_0_output_regs_ready = (~(local_bb0_ld_memcoalesce_inputArray_load_0_wii_reg_NO_SHIFT_REG) & (&(~(local_bb0_ld_memcoalesce_inputArray_load_0_valid_out_NO_SHIFT_REG) | ~(local_bb0_ld_memcoalesce_inputArray_load_0_stall_in))));
assign local_bb0_memcoalesce_inputArray_bitcast_0_stall_in = (~(local_bb0_ld_memcoalesce_inputArray_load_0_wii_reg_NO_SHIFT_REG) & (local_bb0_ld_memcoalesce_inputArray_load_0_fu_stall_out | ~((~(local_bb0_ld_memcoalesce_inputArray_load_0_wii_reg_NO_SHIFT_REG) & local_bb0_ld_memcoalesce_inputArray_load_0_inputs_ready))));
assign local_bb0_ld_memcoalesce_inputArray_load_0_causedstall = ((~(local_bb0_ld_memcoalesce_inputArray_load_0_wii_reg_NO_SHIFT_REG) & local_bb0_ld_memcoalesce_inputArray_load_0_inputs_ready) && (local_bb0_ld_memcoalesce_inputArray_load_0_fu_stall_out && !(~(local_bb0_ld_memcoalesce_inputArray_load_0_output_regs_ready))));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_ld_memcoalesce_inputArray_load_0_NO_SHIFT_REG <= 'x;
		local_bb0_ld_memcoalesce_inputArray_load_0_valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_ld_memcoalesce_inputArray_load_0_NO_SHIFT_REG <= 'x;
			local_bb0_ld_memcoalesce_inputArray_load_0_valid_out_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_ld_memcoalesce_inputArray_load_0_output_regs_ready)
			begin
				local_bb0_ld_memcoalesce_inputArray_load_0_NO_SHIFT_REG <= local_bb0_ld_memcoalesce_inputArray_load_0_lsu_dataout;
				local_bb0_ld_memcoalesce_inputArray_load_0_valid_out_NO_SHIFT_REG <= local_bb0_ld_memcoalesce_inputArray_load_0_fu_valid_out;
			end
			else
			begin
				if (~(local_bb0_ld_memcoalesce_inputArray_load_0_stall_in))
				begin
					local_bb0_ld_memcoalesce_inputArray_load_0_valid_out_NO_SHIFT_REG <= local_bb0_ld_memcoalesce_inputArray_load_0_wii_reg_NO_SHIFT_REG;
				end
			end
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_ld_memcoalesce_inputArray_load_0_wii_reg_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_ld_memcoalesce_inputArray_load_0_wii_reg_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_ld_memcoalesce_inputArray_load_0_fu_valid_out)
			begin
				local_bb0_ld_memcoalesce_inputArray_load_0_wii_reg_NO_SHIFT_REG <= 1'b1;
			end
		end
	end
end


// This section implements a staging register.
// 
wire rstag_16to16_bb0_ld__valid_out;
wire rstag_16to16_bb0_ld__stall_in;
wire rstag_16to16_bb0_ld__inputs_ready;
wire rstag_16to16_bb0_ld__stall_local;
 reg rstag_16to16_bb0_ld__staging_valid_NO_SHIFT_REG;
wire rstag_16to16_bb0_ld__combined_valid;
 reg [31:0] rstag_16to16_bb0_ld__staging_reg_NO_SHIFT_REG;
wire [31:0] rstag_16to16_bb0_ld_;

assign rstag_16to16_bb0_ld__inputs_ready = local_bb0_ld__valid_out_NO_SHIFT_REG;
assign rstag_16to16_bb0_ld_ = (rstag_16to16_bb0_ld__staging_valid_NO_SHIFT_REG ? rstag_16to16_bb0_ld__staging_reg_NO_SHIFT_REG : local_bb0_ld__NO_SHIFT_REG);
assign rstag_16to16_bb0_ld__combined_valid = (rstag_16to16_bb0_ld__staging_valid_NO_SHIFT_REG | rstag_16to16_bb0_ld__inputs_ready);
assign rstag_16to16_bb0_ld__valid_out = rstag_16to16_bb0_ld__combined_valid;
assign rstag_16to16_bb0_ld__stall_local = rstag_16to16_bb0_ld__stall_in;
assign local_bb0_ld__stall_in = (|rstag_16to16_bb0_ld__staging_valid_NO_SHIFT_REG);

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		rstag_16to16_bb0_ld__staging_valid_NO_SHIFT_REG <= 1'b0;
		rstag_16to16_bb0_ld__staging_reg_NO_SHIFT_REG <= 'x;
	end
	else
	begin
		if (start)
		begin
			rstag_16to16_bb0_ld__staging_valid_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (rstag_16to16_bb0_ld__stall_local)
			begin
				if (~(rstag_16to16_bb0_ld__staging_valid_NO_SHIFT_REG))
				begin
					rstag_16to16_bb0_ld__staging_valid_NO_SHIFT_REG <= rstag_16to16_bb0_ld__inputs_ready;
				end
			end
			else
			begin
				rstag_16to16_bb0_ld__staging_valid_NO_SHIFT_REG <= 1'b0;
			end
		end
		if (~(rstag_16to16_bb0_ld__staging_valid_NO_SHIFT_REG))
		begin
			rstag_16to16_bb0_ld__staging_reg_NO_SHIFT_REG <= local_bb0_ld__NO_SHIFT_REG;
		end
	end
end


// This section implements a staging register.
// 
wire rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_valid_out_0;
wire rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_stall_in_0;
wire rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_valid_out_1;
wire rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_stall_in_1;
wire rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_inputs_ready;
wire rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_stall_local;
 reg rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_staging_valid_NO_SHIFT_REG;
wire rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_combined_valid;
 reg [63:0] rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_staging_reg_NO_SHIFT_REG;
wire [63:0] rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0;
 reg rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_consumed_0_NO_SHIFT_REG;
 reg rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_consumed_1_NO_SHIFT_REG;

assign rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_inputs_ready = local_bb0_ld_memcoalesce_inputArray_load_0_valid_out_NO_SHIFT_REG;
assign rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0 = (rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_staging_valid_NO_SHIFT_REG ? rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_staging_reg_NO_SHIFT_REG : local_bb0_ld_memcoalesce_inputArray_load_0_NO_SHIFT_REG);
assign rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_combined_valid = (rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_staging_valid_NO_SHIFT_REG | rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_inputs_ready);
assign rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_stall_local = ((rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_stall_in_0 & ~(rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_consumed_0_NO_SHIFT_REG)) | (rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_stall_in_1 & ~(rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_consumed_1_NO_SHIFT_REG)));
assign rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_valid_out_0 = (rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_combined_valid & ~(rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_consumed_0_NO_SHIFT_REG));
assign rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_valid_out_1 = (rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_combined_valid & ~(rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_consumed_1_NO_SHIFT_REG));
assign local_bb0_ld_memcoalesce_inputArray_load_0_stall_in = (|rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_staging_valid_NO_SHIFT_REG);

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_staging_valid_NO_SHIFT_REG <= 1'b0;
		rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_staging_reg_NO_SHIFT_REG <= 'x;
	end
	else
	begin
		if (start)
		begin
			rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_staging_valid_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_stall_local)
			begin
				if (~(rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_staging_valid_NO_SHIFT_REG))
				begin
					rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_staging_valid_NO_SHIFT_REG <= rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_inputs_ready;
				end
			end
			else
			begin
				rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_staging_valid_NO_SHIFT_REG <= 1'b0;
			end
		end
		if (~(rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_staging_valid_NO_SHIFT_REG))
		begin
			rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_staging_reg_NO_SHIFT_REG <= local_bb0_ld_memcoalesce_inputArray_load_0_NO_SHIFT_REG;
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_consumed_0_NO_SHIFT_REG <= 1'b0;
		rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_consumed_1_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_consumed_0_NO_SHIFT_REG <= 1'b0;
			rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_consumed_1_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_consumed_0_NO_SHIFT_REG <= (rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_combined_valid & (rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_consumed_0_NO_SHIFT_REG | ~(rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_stall_in_0)) & rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_stall_local);
			rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_consumed_1_NO_SHIFT_REG <= (rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_combined_valid & (rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_consumed_1_NO_SHIFT_REG | ~(rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_stall_in_1)) & rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_stall_local);
		end
	end
end


// This section implements a registered operation.
// 
wire local_bb0_sub_inputs_ready;
 reg local_bb0_sub_wii_reg_NO_SHIFT_REG;
 reg local_bb0_sub_valid_out_NO_SHIFT_REG;
wire local_bb0_sub_stall_in;
wire local_bb0_sub_output_regs_ready;
 reg [31:0] local_bb0_sub_NO_SHIFT_REG;
wire local_bb0_sub_causedstall;

assign local_bb0_sub_inputs_ready = rstag_16to16_bb0_ld__valid_out;
assign local_bb0_sub_output_regs_ready = (~(local_bb0_sub_wii_reg_NO_SHIFT_REG) & (&(~(local_bb0_sub_valid_out_NO_SHIFT_REG) | ~(local_bb0_sub_stall_in))));
assign rstag_16to16_bb0_ld__stall_in = (~(local_bb0_sub_wii_reg_NO_SHIFT_REG) & (~(local_bb0_sub_output_regs_ready) | ~(local_bb0_sub_inputs_ready)));
assign local_bb0_sub_causedstall = (local_bb0_sub_inputs_ready && (~(local_bb0_sub_output_regs_ready) && !(~(local_bb0_sub_output_regs_ready))));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_sub_NO_SHIFT_REG <= 'x;
		local_bb0_sub_valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_sub_NO_SHIFT_REG <= 'x;
			local_bb0_sub_valid_out_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_sub_output_regs_ready)
			begin
				local_bb0_sub_NO_SHIFT_REG <= (rstag_16to16_bb0_ld_ + 32'hFFFFFFFF);
				local_bb0_sub_valid_out_NO_SHIFT_REG <= local_bb0_sub_inputs_ready;
			end
			else
			begin
				if (~(local_bb0_sub_stall_in))
				begin
					local_bb0_sub_valid_out_NO_SHIFT_REG <= local_bb0_sub_wii_reg_NO_SHIFT_REG;
				end
			end
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_sub_wii_reg_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_sub_wii_reg_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_sub_inputs_ready)
			begin
				local_bb0_sub_wii_reg_NO_SHIFT_REG <= 1'b1;
			end
		end
	end
end


// This section implements a registered operation.
// 
wire local_bb0_memcoalesce_inputArray_extrValue_1_inputs_ready;
 reg local_bb0_memcoalesce_inputArray_extrValue_1_wii_reg_NO_SHIFT_REG;
 reg local_bb0_memcoalesce_inputArray_extrValue_1_valid_out_NO_SHIFT_REG;
wire local_bb0_memcoalesce_inputArray_extrValue_1_stall_in;
wire local_bb0_memcoalesce_inputArray_extrValue_1_output_regs_ready;
 reg [31:0] local_bb0_memcoalesce_inputArray_extrValue_1_NO_SHIFT_REG;
wire [31:0] local_bb0_memcoalesce_inputArray_extrValue_1_op_wire;
wire local_bb0_memcoalesce_inputArray_extrValue_1_causedstall;

assign local_bb0_memcoalesce_inputArray_extrValue_1_inputs_ready = rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_valid_out_0;
assign local_bb0_memcoalesce_inputArray_extrValue_1_output_regs_ready = (~(local_bb0_memcoalesce_inputArray_extrValue_1_wii_reg_NO_SHIFT_REG) & (&(~(local_bb0_memcoalesce_inputArray_extrValue_1_valid_out_NO_SHIFT_REG) | ~(local_bb0_memcoalesce_inputArray_extrValue_1_stall_in))));
assign local_bb0_memcoalesce_inputArray_extrValue_1_op_wire = rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0[63:32];
assign rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_stall_in_0 = (~(local_bb0_memcoalesce_inputArray_extrValue_1_wii_reg_NO_SHIFT_REG) & (~(local_bb0_memcoalesce_inputArray_extrValue_1_output_regs_ready) | ~(local_bb0_memcoalesce_inputArray_extrValue_1_inputs_ready)));
assign local_bb0_memcoalesce_inputArray_extrValue_1_causedstall = (local_bb0_memcoalesce_inputArray_extrValue_1_inputs_ready && (~(local_bb0_memcoalesce_inputArray_extrValue_1_output_regs_ready) && !(~(local_bb0_memcoalesce_inputArray_extrValue_1_output_regs_ready))));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_memcoalesce_inputArray_extrValue_1_NO_SHIFT_REG <= 'x;
		local_bb0_memcoalesce_inputArray_extrValue_1_valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_memcoalesce_inputArray_extrValue_1_NO_SHIFT_REG <= 'x;
			local_bb0_memcoalesce_inputArray_extrValue_1_valid_out_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_memcoalesce_inputArray_extrValue_1_output_regs_ready)
			begin
				local_bb0_memcoalesce_inputArray_extrValue_1_NO_SHIFT_REG <= local_bb0_memcoalesce_inputArray_extrValue_1_op_wire;
				local_bb0_memcoalesce_inputArray_extrValue_1_valid_out_NO_SHIFT_REG <= local_bb0_memcoalesce_inputArray_extrValue_1_inputs_ready;
			end
			else
			begin
				if (~(local_bb0_memcoalesce_inputArray_extrValue_1_stall_in))
				begin
					local_bb0_memcoalesce_inputArray_extrValue_1_valid_out_NO_SHIFT_REG <= local_bb0_memcoalesce_inputArray_extrValue_1_wii_reg_NO_SHIFT_REG;
				end
			end
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_memcoalesce_inputArray_extrValue_1_wii_reg_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_memcoalesce_inputArray_extrValue_1_wii_reg_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_memcoalesce_inputArray_extrValue_1_inputs_ready)
			begin
				local_bb0_memcoalesce_inputArray_extrValue_1_wii_reg_NO_SHIFT_REG <= 1'b1;
			end
		end
	end
end


// This section implements an unregistered operation.
// 
wire local_bb0_memcoalesce_inputArray_extrValue_0_valid_out;
wire local_bb0_memcoalesce_inputArray_extrValue_0_stall_in;
wire local_bb0_memcoalesce_inputArray_extrValue_0_inputs_ready;
wire local_bb0_memcoalesce_inputArray_extrValue_0_stall_local;
wire [31:0] local_bb0_memcoalesce_inputArray_extrValue_0;

assign local_bb0_memcoalesce_inputArray_extrValue_0_inputs_ready = rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_valid_out_1;
assign local_bb0_memcoalesce_inputArray_extrValue_0 = rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0[31:0];
assign local_bb0_memcoalesce_inputArray_extrValue_0_valid_out = local_bb0_memcoalesce_inputArray_extrValue_0_inputs_ready;
assign local_bb0_memcoalesce_inputArray_extrValue_0_stall_local = local_bb0_memcoalesce_inputArray_extrValue_0_stall_in;
assign rstag_2to2_bb0_ld_memcoalesce_inputArray_load_0_stall_in_1 = (|local_bb0_memcoalesce_inputArray_extrValue_0_stall_local);

// This section implements a registered operation.
// 
wire local_bb0_mul6_inputs_ready;
 reg local_bb0_mul6_wii_reg_NO_SHIFT_REG;
 reg local_bb0_mul6_valid_out_NO_SHIFT_REG;
wire local_bb0_mul6_stall_in;
wire local_bb0_mul6_output_regs_ready;
wire [31:0] local_bb0_mul6;
 reg local_bb0_mul6_valid_pipe_0_NO_SHIFT_REG;
 reg local_bb0_mul6_valid_pipe_1_NO_SHIFT_REG;
 reg local_bb0_mul6_valid_pipe_2_NO_SHIFT_REG;
 reg local_bb0_mul6_valid_pipe_3_NO_SHIFT_REG;
 reg local_bb0_mul6_valid_pipe_4_NO_SHIFT_REG;
wire local_bb0_mul6_causedstall;

acl_fp_mul_ll_s5 fp_module_local_bb0_mul6 (
	.clock(clock),
	.dataa(local_bb0_memcoalesce_inputArray_extrValue_1_NO_SHIFT_REG),
	.datab(32'h3E2AAAAB),
	.enable(local_bb0_mul6_output_regs_ready),
	.result(local_bb0_mul6)
);


assign local_bb0_mul6_inputs_ready = local_bb0_memcoalesce_inputArray_extrValue_1_valid_out_NO_SHIFT_REG;
assign local_bb0_mul6_output_regs_ready = (~(local_bb0_mul6_wii_reg_NO_SHIFT_REG) & (&(~(local_bb0_mul6_valid_out_NO_SHIFT_REG) | ~(local_bb0_mul6_stall_in))));
assign local_bb0_memcoalesce_inputArray_extrValue_1_stall_in = (~(local_bb0_mul6_wii_reg_NO_SHIFT_REG) & (~(local_bb0_mul6_output_regs_ready) | ~(local_bb0_mul6_inputs_ready)));
assign local_bb0_mul6_causedstall = (local_bb0_mul6_inputs_ready && (~(local_bb0_mul6_output_regs_ready) && !(~(local_bb0_mul6_output_regs_ready))));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_mul6_valid_pipe_0_NO_SHIFT_REG <= 1'b0;
		local_bb0_mul6_valid_pipe_1_NO_SHIFT_REG <= 1'b0;
		local_bb0_mul6_valid_pipe_2_NO_SHIFT_REG <= 1'b0;
		local_bb0_mul6_valid_pipe_3_NO_SHIFT_REG <= 1'b0;
		local_bb0_mul6_valid_pipe_4_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_mul6_valid_pipe_0_NO_SHIFT_REG <= 1'b0;
			local_bb0_mul6_valid_pipe_1_NO_SHIFT_REG <= 1'b0;
			local_bb0_mul6_valid_pipe_2_NO_SHIFT_REG <= 1'b0;
			local_bb0_mul6_valid_pipe_3_NO_SHIFT_REG <= 1'b0;
			local_bb0_mul6_valid_pipe_4_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_mul6_output_regs_ready)
			begin
				local_bb0_mul6_valid_pipe_0_NO_SHIFT_REG <= local_bb0_mul6_inputs_ready;
				local_bb0_mul6_valid_pipe_1_NO_SHIFT_REG <= local_bb0_mul6_valid_pipe_0_NO_SHIFT_REG;
				local_bb0_mul6_valid_pipe_2_NO_SHIFT_REG <= local_bb0_mul6_valid_pipe_1_NO_SHIFT_REG;
				local_bb0_mul6_valid_pipe_3_NO_SHIFT_REG <= local_bb0_mul6_valid_pipe_2_NO_SHIFT_REG;
				local_bb0_mul6_valid_pipe_4_NO_SHIFT_REG <= local_bb0_mul6_valid_pipe_3_NO_SHIFT_REG;
			end
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_mul6_valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_mul6_valid_out_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_mul6_output_regs_ready)
			begin
				local_bb0_mul6_valid_out_NO_SHIFT_REG <= local_bb0_mul6_valid_pipe_4_NO_SHIFT_REG;
			end
			else
			begin
				if (~(local_bb0_mul6_stall_in))
				begin
					local_bb0_mul6_valid_out_NO_SHIFT_REG <= local_bb0_mul6_wii_reg_NO_SHIFT_REG;
				end
			end
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_mul6_wii_reg_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_mul6_wii_reg_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_mul6_valid_pipe_4_NO_SHIFT_REG)
			begin
				local_bb0_mul6_wii_reg_NO_SHIFT_REG <= 1'b1;
			end
		end
	end
end


// This section implements a registered operation.
// 
wire local_bb0_var__inputs_ready;
 reg local_bb0_var__wii_reg_NO_SHIFT_REG;
 reg local_bb0_var__valid_out_NO_SHIFT_REG;
wire local_bb0_var__stall_in;
wire local_bb0_var__output_regs_ready;
 reg [31:0] local_bb0_var__NO_SHIFT_REG;
wire local_bb0_var__causedstall;

assign local_bb0_var__inputs_ready = local_bb0_memcoalesce_inputArray_extrValue_0_valid_out;
assign local_bb0_var__output_regs_ready = (~(local_bb0_var__wii_reg_NO_SHIFT_REG) & (&(~(local_bb0_var__valid_out_NO_SHIFT_REG) | ~(local_bb0_var__stall_in))));
assign local_bb0_memcoalesce_inputArray_extrValue_0_stall_in = (~(local_bb0_var__wii_reg_NO_SHIFT_REG) & (~(local_bb0_var__output_regs_ready) | ~(local_bb0_var__inputs_ready)));
assign local_bb0_var__causedstall = (local_bb0_var__inputs_ready && (~(local_bb0_var__output_regs_ready) && !(~(local_bb0_var__output_regs_ready))));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_var__NO_SHIFT_REG <= 'x;
		local_bb0_var__valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_var__NO_SHIFT_REG <= 'x;
			local_bb0_var__valid_out_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_var__output_regs_ready)
			begin
				local_bb0_var__NO_SHIFT_REG <= local_bb0_memcoalesce_inputArray_extrValue_0;
				local_bb0_var__valid_out_NO_SHIFT_REG <= local_bb0_var__inputs_ready;
			end
			else
			begin
				if (~(local_bb0_var__stall_in))
				begin
					local_bb0_var__valid_out_NO_SHIFT_REG <= local_bb0_var__wii_reg_NO_SHIFT_REG;
				end
			end
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_var__wii_reg_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_var__wii_reg_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_var__inputs_ready)
			begin
				local_bb0_var__wii_reg_NO_SHIFT_REG <= 1'b1;
			end
		end
	end
end


// This section implements a staging register.
// 
wire rstag_3to3_bb0_var__valid_out_0;
wire rstag_3to3_bb0_var__stall_in_0;
wire rstag_3to3_bb0_var__valid_out_1;
wire rstag_3to3_bb0_var__stall_in_1;
wire rstag_3to3_bb0_var__valid_out_2;
wire rstag_3to3_bb0_var__stall_in_2;
wire rstag_3to3_bb0_var__inputs_ready;
wire rstag_3to3_bb0_var__stall_local;
 reg rstag_3to3_bb0_var__staging_valid_NO_SHIFT_REG;
wire rstag_3to3_bb0_var__combined_valid;
 reg [31:0] rstag_3to3_bb0_var__staging_reg_NO_SHIFT_REG;
wire [31:0] rstag_3to3_bb0_var_;
 reg rstag_3to3_bb0_var__consumed_0_NO_SHIFT_REG;
 reg rstag_3to3_bb0_var__consumed_1_NO_SHIFT_REG;
 reg rstag_3to3_bb0_var__consumed_2_NO_SHIFT_REG;

assign rstag_3to3_bb0_var__inputs_ready = local_bb0_var__valid_out_NO_SHIFT_REG;
assign rstag_3to3_bb0_var_ = (rstag_3to3_bb0_var__staging_valid_NO_SHIFT_REG ? rstag_3to3_bb0_var__staging_reg_NO_SHIFT_REG : local_bb0_var__NO_SHIFT_REG);
assign rstag_3to3_bb0_var__combined_valid = (rstag_3to3_bb0_var__staging_valid_NO_SHIFT_REG | rstag_3to3_bb0_var__inputs_ready);
assign rstag_3to3_bb0_var__stall_local = ((rstag_3to3_bb0_var__stall_in_0 & ~(rstag_3to3_bb0_var__consumed_0_NO_SHIFT_REG)) | (rstag_3to3_bb0_var__stall_in_1 & ~(rstag_3to3_bb0_var__consumed_1_NO_SHIFT_REG)) | (rstag_3to3_bb0_var__stall_in_2 & ~(rstag_3to3_bb0_var__consumed_2_NO_SHIFT_REG)));
assign rstag_3to3_bb0_var__valid_out_0 = (rstag_3to3_bb0_var__combined_valid & ~(rstag_3to3_bb0_var__consumed_0_NO_SHIFT_REG));
assign rstag_3to3_bb0_var__valid_out_1 = (rstag_3to3_bb0_var__combined_valid & ~(rstag_3to3_bb0_var__consumed_1_NO_SHIFT_REG));
assign rstag_3to3_bb0_var__valid_out_2 = (rstag_3to3_bb0_var__combined_valid & ~(rstag_3to3_bb0_var__consumed_2_NO_SHIFT_REG));
assign local_bb0_var__stall_in = (|rstag_3to3_bb0_var__staging_valid_NO_SHIFT_REG);

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		rstag_3to3_bb0_var__staging_valid_NO_SHIFT_REG <= 1'b0;
		rstag_3to3_bb0_var__staging_reg_NO_SHIFT_REG <= 'x;
	end
	else
	begin
		if (start)
		begin
			rstag_3to3_bb0_var__staging_valid_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (rstag_3to3_bb0_var__stall_local)
			begin
				if (~(rstag_3to3_bb0_var__staging_valid_NO_SHIFT_REG))
				begin
					rstag_3to3_bb0_var__staging_valid_NO_SHIFT_REG <= rstag_3to3_bb0_var__inputs_ready;
				end
			end
			else
			begin
				rstag_3to3_bb0_var__staging_valid_NO_SHIFT_REG <= 1'b0;
			end
		end
		if (~(rstag_3to3_bb0_var__staging_valid_NO_SHIFT_REG))
		begin
			rstag_3to3_bb0_var__staging_reg_NO_SHIFT_REG <= local_bb0_var__NO_SHIFT_REG;
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		rstag_3to3_bb0_var__consumed_0_NO_SHIFT_REG <= 1'b0;
		rstag_3to3_bb0_var__consumed_1_NO_SHIFT_REG <= 1'b0;
		rstag_3to3_bb0_var__consumed_2_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			rstag_3to3_bb0_var__consumed_0_NO_SHIFT_REG <= 1'b0;
			rstag_3to3_bb0_var__consumed_1_NO_SHIFT_REG <= 1'b0;
			rstag_3to3_bb0_var__consumed_2_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			rstag_3to3_bb0_var__consumed_0_NO_SHIFT_REG <= (rstag_3to3_bb0_var__combined_valid & (rstag_3to3_bb0_var__consumed_0_NO_SHIFT_REG | ~(rstag_3to3_bb0_var__stall_in_0)) & rstag_3to3_bb0_var__stall_local);
			rstag_3to3_bb0_var__consumed_1_NO_SHIFT_REG <= (rstag_3to3_bb0_var__combined_valid & (rstag_3to3_bb0_var__consumed_1_NO_SHIFT_REG | ~(rstag_3to3_bb0_var__stall_in_1)) & rstag_3to3_bb0_var__stall_local);
			rstag_3to3_bb0_var__consumed_2_NO_SHIFT_REG <= (rstag_3to3_bb0_var__combined_valid & (rstag_3to3_bb0_var__consumed_2_NO_SHIFT_REG | ~(rstag_3to3_bb0_var__stall_in_2)) & rstag_3to3_bb0_var__stall_local);
		end
	end
end


// This section implements a registered operation.
// 
wire local_bb0_and28_i_inputs_ready;
 reg local_bb0_and28_i_wii_reg_NO_SHIFT_REG;
 reg local_bb0_and28_i_valid_out_NO_SHIFT_REG;
wire local_bb0_and28_i_stall_in;
wire local_bb0_and28_i_output_regs_ready;
 reg [31:0] local_bb0_and28_i_NO_SHIFT_REG;
wire local_bb0_and28_i_causedstall;

assign local_bb0_and28_i_inputs_ready = rstag_3to3_bb0_var__valid_out_0;
assign local_bb0_and28_i_output_regs_ready = (~(local_bb0_and28_i_wii_reg_NO_SHIFT_REG) & (&(~(local_bb0_and28_i_valid_out_NO_SHIFT_REG) | ~(local_bb0_and28_i_stall_in))));
assign rstag_3to3_bb0_var__stall_in_0 = (~(local_bb0_and28_i_wii_reg_NO_SHIFT_REG) & (~(local_bb0_and28_i_output_regs_ready) | ~(local_bb0_and28_i_inputs_ready)));
assign local_bb0_and28_i_causedstall = (local_bb0_and28_i_inputs_ready && (~(local_bb0_and28_i_output_regs_ready) && !(~(local_bb0_and28_i_output_regs_ready))));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_and28_i_NO_SHIFT_REG <= 'x;
		local_bb0_and28_i_valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_and28_i_NO_SHIFT_REG <= 'x;
			local_bb0_and28_i_valid_out_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_and28_i_output_regs_ready)
			begin
				local_bb0_and28_i_NO_SHIFT_REG <= (rstag_3to3_bb0_var_ & 32'h807FFFFF);
				local_bb0_and28_i_valid_out_NO_SHIFT_REG <= local_bb0_and28_i_inputs_ready;
			end
			else
			begin
				if (~(local_bb0_and28_i_stall_in))
				begin
					local_bb0_and28_i_valid_out_NO_SHIFT_REG <= local_bb0_and28_i_wii_reg_NO_SHIFT_REG;
				end
			end
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_and28_i_wii_reg_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_and28_i_wii_reg_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_and28_i_inputs_ready)
			begin
				local_bb0_and28_i_wii_reg_NO_SHIFT_REG <= 1'b1;
			end
		end
	end
end


// This section implements an unregistered operation.
// 
wire local_bb0_and2_i_valid_out;
wire local_bb0_and2_i_stall_in;
wire local_bb0_and2_i_inputs_ready;
wire local_bb0_and2_i_stall_local;
wire [31:0] local_bb0_and2_i;

assign local_bb0_and2_i_inputs_ready = rstag_3to3_bb0_var__valid_out_1;
assign local_bb0_and2_i = (rstag_3to3_bb0_var_ & 32'h7FFFFF);
assign local_bb0_and2_i_valid_out = local_bb0_and2_i_inputs_ready;
assign local_bb0_and2_i_stall_local = local_bb0_and2_i_stall_in;
assign rstag_3to3_bb0_var__stall_in_1 = (|local_bb0_and2_i_stall_local);

// This section implements a registered operation.
// 
wire local_bb0_shr_i_inputs_ready;
 reg local_bb0_shr_i_wii_reg_NO_SHIFT_REG;
 reg local_bb0_shr_i_valid_out_NO_SHIFT_REG;
wire local_bb0_shr_i_stall_in;
wire local_bb0_shr_i_output_regs_ready;
 reg [31:0] local_bb0_shr_i_NO_SHIFT_REG;
wire local_bb0_shr_i_causedstall;

assign local_bb0_shr_i_inputs_ready = rstag_3to3_bb0_var__valid_out_2;
assign local_bb0_shr_i_output_regs_ready = (~(local_bb0_shr_i_wii_reg_NO_SHIFT_REG) & (&(~(local_bb0_shr_i_valid_out_NO_SHIFT_REG) | ~(local_bb0_shr_i_stall_in))));
assign rstag_3to3_bb0_var__stall_in_2 = (~(local_bb0_shr_i_wii_reg_NO_SHIFT_REG) & (~(local_bb0_shr_i_output_regs_ready) | ~(local_bb0_shr_i_inputs_ready)));
assign local_bb0_shr_i_causedstall = (local_bb0_shr_i_inputs_ready && (~(local_bb0_shr_i_output_regs_ready) && !(~(local_bb0_shr_i_output_regs_ready))));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_shr_i_NO_SHIFT_REG <= 'x;
		local_bb0_shr_i_valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_shr_i_NO_SHIFT_REG <= 'x;
			local_bb0_shr_i_valid_out_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_shr_i_output_regs_ready)
			begin
				local_bb0_shr_i_NO_SHIFT_REG <= (rstag_3to3_bb0_var_ >> 32'h17);
				local_bb0_shr_i_valid_out_NO_SHIFT_REG <= local_bb0_shr_i_inputs_ready;
			end
			else
			begin
				if (~(local_bb0_shr_i_stall_in))
				begin
					local_bb0_shr_i_valid_out_NO_SHIFT_REG <= local_bb0_shr_i_wii_reg_NO_SHIFT_REG;
				end
			end
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_shr_i_wii_reg_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_shr_i_wii_reg_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_shr_i_inputs_ready)
			begin
				local_bb0_shr_i_wii_reg_NO_SHIFT_REG <= 1'b1;
			end
		end
	end
end


// This section implements a registered operation.
// 
wire local_bb0_lnot6_i_inputs_ready;
 reg local_bb0_lnot6_i_wii_reg_NO_SHIFT_REG;
 reg local_bb0_lnot6_i_valid_out_NO_SHIFT_REG;
wire local_bb0_lnot6_i_stall_in;
wire local_bb0_lnot6_i_output_regs_ready;
 reg local_bb0_lnot6_i_NO_SHIFT_REG;
wire local_bb0_lnot6_i_causedstall;

assign local_bb0_lnot6_i_inputs_ready = local_bb0_and2_i_valid_out;
assign local_bb0_lnot6_i_output_regs_ready = (~(local_bb0_lnot6_i_wii_reg_NO_SHIFT_REG) & (&(~(local_bb0_lnot6_i_valid_out_NO_SHIFT_REG) | ~(local_bb0_lnot6_i_stall_in))));
assign local_bb0_and2_i_stall_in = (~(local_bb0_lnot6_i_wii_reg_NO_SHIFT_REG) & (~(local_bb0_lnot6_i_output_regs_ready) | ~(local_bb0_lnot6_i_inputs_ready)));
assign local_bb0_lnot6_i_causedstall = (local_bb0_lnot6_i_inputs_ready && (~(local_bb0_lnot6_i_output_regs_ready) && !(~(local_bb0_lnot6_i_output_regs_ready))));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_lnot6_i_NO_SHIFT_REG <= 'x;
		local_bb0_lnot6_i_valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_lnot6_i_NO_SHIFT_REG <= 'x;
			local_bb0_lnot6_i_valid_out_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_lnot6_i_output_regs_ready)
			begin
				local_bb0_lnot6_i_NO_SHIFT_REG <= ((local_bb0_and2_i & 32'h7FFFFF) != 32'h0);
				local_bb0_lnot6_i_valid_out_NO_SHIFT_REG <= local_bb0_lnot6_i_inputs_ready;
			end
			else
			begin
				if (~(local_bb0_lnot6_i_stall_in))
				begin
					local_bb0_lnot6_i_valid_out_NO_SHIFT_REG <= local_bb0_lnot6_i_wii_reg_NO_SHIFT_REG;
				end
			end
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_lnot6_i_wii_reg_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_lnot6_i_wii_reg_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_lnot6_i_inputs_ready)
			begin
				local_bb0_lnot6_i_wii_reg_NO_SHIFT_REG <= 1'b1;
			end
		end
	end
end


// This section implements a staging register.
// 
wire rstag_4to4_bb0_shr_i_valid_out_0;
wire rstag_4to4_bb0_shr_i_stall_in_0;
wire rstag_4to4_bb0_shr_i_valid_out_1;
wire rstag_4to4_bb0_shr_i_stall_in_1;
wire rstag_4to4_bb0_shr_i_inputs_ready;
wire rstag_4to4_bb0_shr_i_stall_local;
 reg rstag_4to4_bb0_shr_i_staging_valid_NO_SHIFT_REG;
wire rstag_4to4_bb0_shr_i_combined_valid;
 reg [31:0] rstag_4to4_bb0_shr_i_staging_reg_NO_SHIFT_REG;
wire [31:0] rstag_4to4_bb0_shr_i;
 reg rstag_4to4_bb0_shr_i_consumed_0_NO_SHIFT_REG;
 reg rstag_4to4_bb0_shr_i_consumed_1_NO_SHIFT_REG;

assign rstag_4to4_bb0_shr_i_inputs_ready = local_bb0_shr_i_valid_out_NO_SHIFT_REG;
assign rstag_4to4_bb0_shr_i = (rstag_4to4_bb0_shr_i_staging_valid_NO_SHIFT_REG ? rstag_4to4_bb0_shr_i_staging_reg_NO_SHIFT_REG : (local_bb0_shr_i_NO_SHIFT_REG & 32'h1FF));
assign rstag_4to4_bb0_shr_i_combined_valid = (rstag_4to4_bb0_shr_i_staging_valid_NO_SHIFT_REG | rstag_4to4_bb0_shr_i_inputs_ready);
assign rstag_4to4_bb0_shr_i_stall_local = ((rstag_4to4_bb0_shr_i_stall_in_0 & ~(rstag_4to4_bb0_shr_i_consumed_0_NO_SHIFT_REG)) | (rstag_4to4_bb0_shr_i_stall_in_1 & ~(rstag_4to4_bb0_shr_i_consumed_1_NO_SHIFT_REG)));
assign rstag_4to4_bb0_shr_i_valid_out_0 = (rstag_4to4_bb0_shr_i_combined_valid & ~(rstag_4to4_bb0_shr_i_consumed_0_NO_SHIFT_REG));
assign rstag_4to4_bb0_shr_i_valid_out_1 = (rstag_4to4_bb0_shr_i_combined_valid & ~(rstag_4to4_bb0_shr_i_consumed_1_NO_SHIFT_REG));
assign local_bb0_shr_i_stall_in = (|rstag_4to4_bb0_shr_i_staging_valid_NO_SHIFT_REG);

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		rstag_4to4_bb0_shr_i_staging_valid_NO_SHIFT_REG <= 1'b0;
		rstag_4to4_bb0_shr_i_staging_reg_NO_SHIFT_REG <= 'x;
	end
	else
	begin
		if (start)
		begin
			rstag_4to4_bb0_shr_i_staging_valid_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (rstag_4to4_bb0_shr_i_stall_local)
			begin
				if (~(rstag_4to4_bb0_shr_i_staging_valid_NO_SHIFT_REG))
				begin
					rstag_4to4_bb0_shr_i_staging_valid_NO_SHIFT_REG <= rstag_4to4_bb0_shr_i_inputs_ready;
				end
			end
			else
			begin
				rstag_4to4_bb0_shr_i_staging_valid_NO_SHIFT_REG <= 1'b0;
			end
		end
		if (~(rstag_4to4_bb0_shr_i_staging_valid_NO_SHIFT_REG))
		begin
			rstag_4to4_bb0_shr_i_staging_reg_NO_SHIFT_REG <= (local_bb0_shr_i_NO_SHIFT_REG & 32'h1FF);
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		rstag_4to4_bb0_shr_i_consumed_0_NO_SHIFT_REG <= 1'b0;
		rstag_4to4_bb0_shr_i_consumed_1_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			rstag_4to4_bb0_shr_i_consumed_0_NO_SHIFT_REG <= 1'b0;
			rstag_4to4_bb0_shr_i_consumed_1_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			rstag_4to4_bb0_shr_i_consumed_0_NO_SHIFT_REG <= (rstag_4to4_bb0_shr_i_combined_valid & (rstag_4to4_bb0_shr_i_consumed_0_NO_SHIFT_REG | ~(rstag_4to4_bb0_shr_i_stall_in_0)) & rstag_4to4_bb0_shr_i_stall_local);
			rstag_4to4_bb0_shr_i_consumed_1_NO_SHIFT_REG <= (rstag_4to4_bb0_shr_i_combined_valid & (rstag_4to4_bb0_shr_i_consumed_1_NO_SHIFT_REG | ~(rstag_4to4_bb0_shr_i_stall_in_1)) & rstag_4to4_bb0_shr_i_stall_local);
		end
	end
end


// This section implements a registered operation.
// 
wire local_bb0_and1_i_inputs_ready;
 reg local_bb0_and1_i_wii_reg_NO_SHIFT_REG;
 reg local_bb0_and1_i_valid_out_NO_SHIFT_REG;
wire local_bb0_and1_i_stall_in;
wire local_bb0_and1_i_output_regs_ready;
 reg [31:0] local_bb0_and1_i_NO_SHIFT_REG;
wire local_bb0_and1_i_causedstall;

assign local_bb0_and1_i_inputs_ready = rstag_4to4_bb0_shr_i_valid_out_1;
assign local_bb0_and1_i_output_regs_ready = (~(local_bb0_and1_i_wii_reg_NO_SHIFT_REG) & (&(~(local_bb0_and1_i_valid_out_NO_SHIFT_REG) | ~(local_bb0_and1_i_stall_in))));
assign rstag_4to4_bb0_shr_i_stall_in_1 = (~(local_bb0_and1_i_wii_reg_NO_SHIFT_REG) & (~(local_bb0_and1_i_output_regs_ready) | ~(local_bb0_and1_i_inputs_ready)));
assign local_bb0_and1_i_causedstall = (local_bb0_and1_i_inputs_ready && (~(local_bb0_and1_i_output_regs_ready) && !(~(local_bb0_and1_i_output_regs_ready))));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_and1_i_NO_SHIFT_REG <= 'x;
		local_bb0_and1_i_valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_and1_i_NO_SHIFT_REG <= 'x;
			local_bb0_and1_i_valid_out_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_and1_i_output_regs_ready)
			begin
				local_bb0_and1_i_NO_SHIFT_REG <= ((rstag_4to4_bb0_shr_i & 32'h1FF) & 32'hFF);
				local_bb0_and1_i_valid_out_NO_SHIFT_REG <= local_bb0_and1_i_inputs_ready;
			end
			else
			begin
				if (~(local_bb0_and1_i_stall_in))
				begin
					local_bb0_and1_i_valid_out_NO_SHIFT_REG <= local_bb0_and1_i_wii_reg_NO_SHIFT_REG;
				end
			end
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_and1_i_wii_reg_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_and1_i_wii_reg_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_and1_i_inputs_ready)
			begin
				local_bb0_and1_i_wii_reg_NO_SHIFT_REG <= 1'b1;
			end
		end
	end
end


// This section implements a staging register.
// 
wire rstag_5to5_bb0_and1_i_valid_out_0;
wire rstag_5to5_bb0_and1_i_stall_in_0;
wire rstag_5to5_bb0_and1_i_valid_out_1;
wire rstag_5to5_bb0_and1_i_stall_in_1;
wire rstag_5to5_bb0_and1_i_valid_out_2;
wire rstag_5to5_bb0_and1_i_stall_in_2;
wire rstag_5to5_bb0_and1_i_inputs_ready;
wire rstag_5to5_bb0_and1_i_stall_local;
 reg rstag_5to5_bb0_and1_i_staging_valid_NO_SHIFT_REG;
wire rstag_5to5_bb0_and1_i_combined_valid;
 reg [31:0] rstag_5to5_bb0_and1_i_staging_reg_NO_SHIFT_REG;
wire [31:0] rstag_5to5_bb0_and1_i;
 reg rstag_5to5_bb0_and1_i_consumed_0_NO_SHIFT_REG;
 reg rstag_5to5_bb0_and1_i_consumed_1_NO_SHIFT_REG;
 reg rstag_5to5_bb0_and1_i_consumed_2_NO_SHIFT_REG;

assign rstag_5to5_bb0_and1_i_inputs_ready = local_bb0_and1_i_valid_out_NO_SHIFT_REG;
assign rstag_5to5_bb0_and1_i = (rstag_5to5_bb0_and1_i_staging_valid_NO_SHIFT_REG ? rstag_5to5_bb0_and1_i_staging_reg_NO_SHIFT_REG : (local_bb0_and1_i_NO_SHIFT_REG & 32'hFF));
assign rstag_5to5_bb0_and1_i_combined_valid = (rstag_5to5_bb0_and1_i_staging_valid_NO_SHIFT_REG | rstag_5to5_bb0_and1_i_inputs_ready);
assign rstag_5to5_bb0_and1_i_stall_local = ((rstag_5to5_bb0_and1_i_stall_in_0 & ~(rstag_5to5_bb0_and1_i_consumed_0_NO_SHIFT_REG)) | (rstag_5to5_bb0_and1_i_stall_in_1 & ~(rstag_5to5_bb0_and1_i_consumed_1_NO_SHIFT_REG)) | (rstag_5to5_bb0_and1_i_stall_in_2 & ~(rstag_5to5_bb0_and1_i_consumed_2_NO_SHIFT_REG)));
assign rstag_5to5_bb0_and1_i_valid_out_0 = (rstag_5to5_bb0_and1_i_combined_valid & ~(rstag_5to5_bb0_and1_i_consumed_0_NO_SHIFT_REG));
assign rstag_5to5_bb0_and1_i_valid_out_1 = (rstag_5to5_bb0_and1_i_combined_valid & ~(rstag_5to5_bb0_and1_i_consumed_1_NO_SHIFT_REG));
assign rstag_5to5_bb0_and1_i_valid_out_2 = (rstag_5to5_bb0_and1_i_combined_valid & ~(rstag_5to5_bb0_and1_i_consumed_2_NO_SHIFT_REG));
assign local_bb0_and1_i_stall_in = (|rstag_5to5_bb0_and1_i_staging_valid_NO_SHIFT_REG);

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		rstag_5to5_bb0_and1_i_staging_valid_NO_SHIFT_REG <= 1'b0;
		rstag_5to5_bb0_and1_i_staging_reg_NO_SHIFT_REG <= 'x;
	end
	else
	begin
		if (start)
		begin
			rstag_5to5_bb0_and1_i_staging_valid_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (rstag_5to5_bb0_and1_i_stall_local)
			begin
				if (~(rstag_5to5_bb0_and1_i_staging_valid_NO_SHIFT_REG))
				begin
					rstag_5to5_bb0_and1_i_staging_valid_NO_SHIFT_REG <= rstag_5to5_bb0_and1_i_inputs_ready;
				end
			end
			else
			begin
				rstag_5to5_bb0_and1_i_staging_valid_NO_SHIFT_REG <= 1'b0;
			end
		end
		if (~(rstag_5to5_bb0_and1_i_staging_valid_NO_SHIFT_REG))
		begin
			rstag_5to5_bb0_and1_i_staging_reg_NO_SHIFT_REG <= (local_bb0_and1_i_NO_SHIFT_REG & 32'hFF);
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		rstag_5to5_bb0_and1_i_consumed_0_NO_SHIFT_REG <= 1'b0;
		rstag_5to5_bb0_and1_i_consumed_1_NO_SHIFT_REG <= 1'b0;
		rstag_5to5_bb0_and1_i_consumed_2_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			rstag_5to5_bb0_and1_i_consumed_0_NO_SHIFT_REG <= 1'b0;
			rstag_5to5_bb0_and1_i_consumed_1_NO_SHIFT_REG <= 1'b0;
			rstag_5to5_bb0_and1_i_consumed_2_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			rstag_5to5_bb0_and1_i_consumed_0_NO_SHIFT_REG <= (rstag_5to5_bb0_and1_i_combined_valid & (rstag_5to5_bb0_and1_i_consumed_0_NO_SHIFT_REG | ~(rstag_5to5_bb0_and1_i_stall_in_0)) & rstag_5to5_bb0_and1_i_stall_local);
			rstag_5to5_bb0_and1_i_consumed_1_NO_SHIFT_REG <= (rstag_5to5_bb0_and1_i_combined_valid & (rstag_5to5_bb0_and1_i_consumed_1_NO_SHIFT_REG | ~(rstag_5to5_bb0_and1_i_stall_in_1)) & rstag_5to5_bb0_and1_i_stall_local);
			rstag_5to5_bb0_and1_i_consumed_2_NO_SHIFT_REG <= (rstag_5to5_bb0_and1_i_combined_valid & (rstag_5to5_bb0_and1_i_consumed_2_NO_SHIFT_REG | ~(rstag_5to5_bb0_and1_i_stall_in_2)) & rstag_5to5_bb0_and1_i_stall_local);
		end
	end
end


// This section implements a registered operation.
// 
wire local_bb0_cmp10_i_inputs_ready;
 reg local_bb0_cmp10_i_wii_reg_NO_SHIFT_REG;
 reg local_bb0_cmp10_i_valid_out_NO_SHIFT_REG;
wire local_bb0_cmp10_i_stall_in;
wire local_bb0_cmp10_i_output_regs_ready;
 reg local_bb0_cmp10_i_NO_SHIFT_REG;
wire local_bb0_cmp10_i_causedstall;

assign local_bb0_cmp10_i_inputs_ready = rstag_5to5_bb0_and1_i_valid_out_1;
assign local_bb0_cmp10_i_output_regs_ready = (~(local_bb0_cmp10_i_wii_reg_NO_SHIFT_REG) & (&(~(local_bb0_cmp10_i_valid_out_NO_SHIFT_REG) | ~(local_bb0_cmp10_i_stall_in))));
assign rstag_5to5_bb0_and1_i_stall_in_1 = (~(local_bb0_cmp10_i_wii_reg_NO_SHIFT_REG) & (~(local_bb0_cmp10_i_output_regs_ready) | ~(local_bb0_cmp10_i_inputs_ready)));
assign local_bb0_cmp10_i_causedstall = (local_bb0_cmp10_i_inputs_ready && (~(local_bb0_cmp10_i_output_regs_ready) && !(~(local_bb0_cmp10_i_output_regs_ready))));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_cmp10_i_NO_SHIFT_REG <= 'x;
		local_bb0_cmp10_i_valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_cmp10_i_NO_SHIFT_REG <= 'x;
			local_bb0_cmp10_i_valid_out_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_cmp10_i_output_regs_ready)
			begin
				local_bb0_cmp10_i_NO_SHIFT_REG <= ((rstag_5to5_bb0_and1_i & 32'hFF) == 32'h0);
				local_bb0_cmp10_i_valid_out_NO_SHIFT_REG <= local_bb0_cmp10_i_inputs_ready;
			end
			else
			begin
				if (~(local_bb0_cmp10_i_stall_in))
				begin
					local_bb0_cmp10_i_valid_out_NO_SHIFT_REG <= local_bb0_cmp10_i_wii_reg_NO_SHIFT_REG;
				end
			end
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_cmp10_i_wii_reg_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_cmp10_i_wii_reg_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_cmp10_i_inputs_ready)
			begin
				local_bb0_cmp10_i_wii_reg_NO_SHIFT_REG <= 1'b1;
			end
		end
	end
end


// This section implements a registered operation.
// 
wire local_bb0_cmp_i_inputs_ready;
 reg local_bb0_cmp_i_wii_reg_NO_SHIFT_REG;
 reg local_bb0_cmp_i_valid_out_0_NO_SHIFT_REG;
wire local_bb0_cmp_i_stall_in_0;
 reg local_bb0_cmp_i_valid_out_1_NO_SHIFT_REG;
wire local_bb0_cmp_i_stall_in_1;
wire local_bb0_cmp_i_output_regs_ready;
 reg local_bb0_cmp_i_NO_SHIFT_REG;
wire local_bb0_cmp_i_causedstall;

assign local_bb0_cmp_i_inputs_ready = rstag_5to5_bb0_and1_i_valid_out_2;
assign local_bb0_cmp_i_output_regs_ready = (~(local_bb0_cmp_i_wii_reg_NO_SHIFT_REG) & ((~(local_bb0_cmp_i_valid_out_0_NO_SHIFT_REG) | ~(local_bb0_cmp_i_stall_in_0)) & (~(local_bb0_cmp_i_valid_out_1_NO_SHIFT_REG) | ~(local_bb0_cmp_i_stall_in_1))));
assign rstag_5to5_bb0_and1_i_stall_in_2 = (~(local_bb0_cmp_i_wii_reg_NO_SHIFT_REG) & (~(local_bb0_cmp_i_output_regs_ready) | ~(local_bb0_cmp_i_inputs_ready)));
assign local_bb0_cmp_i_causedstall = (local_bb0_cmp_i_inputs_ready && (~(local_bb0_cmp_i_output_regs_ready) && !(~(local_bb0_cmp_i_output_regs_ready))));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_cmp_i_NO_SHIFT_REG <= 'x;
		local_bb0_cmp_i_valid_out_0_NO_SHIFT_REG <= 1'b0;
		local_bb0_cmp_i_valid_out_1_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_cmp_i_NO_SHIFT_REG <= 'x;
			local_bb0_cmp_i_valid_out_0_NO_SHIFT_REG <= 1'b0;
			local_bb0_cmp_i_valid_out_1_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_cmp_i_output_regs_ready)
			begin
				local_bb0_cmp_i_NO_SHIFT_REG <= ((rstag_5to5_bb0_and1_i & 32'hFF) == 32'hFF);
				local_bb0_cmp_i_valid_out_0_NO_SHIFT_REG <= local_bb0_cmp_i_inputs_ready;
				local_bb0_cmp_i_valid_out_1_NO_SHIFT_REG <= local_bb0_cmp_i_inputs_ready;
			end
			else
			begin
				if (~(local_bb0_cmp_i_stall_in_0))
				begin
					local_bb0_cmp_i_valid_out_0_NO_SHIFT_REG <= local_bb0_cmp_i_wii_reg_NO_SHIFT_REG;
				end
				if (~(local_bb0_cmp_i_stall_in_1))
				begin
					local_bb0_cmp_i_valid_out_1_NO_SHIFT_REG <= local_bb0_cmp_i_wii_reg_NO_SHIFT_REG;
				end
			end
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_cmp_i_wii_reg_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_cmp_i_wii_reg_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_cmp_i_inputs_ready)
			begin
				local_bb0_cmp_i_wii_reg_NO_SHIFT_REG <= 1'b1;
			end
		end
	end
end


// This section implements a staging register.
// 
wire rstag_6to6_bb0_cmp10_i_valid_out_0;
wire rstag_6to6_bb0_cmp10_i_stall_in_0;
wire rstag_6to6_bb0_cmp10_i_valid_out_1;
wire rstag_6to6_bb0_cmp10_i_stall_in_1;
wire rstag_6to6_bb0_cmp10_i_valid_out_2;
wire rstag_6to6_bb0_cmp10_i_stall_in_2;
wire rstag_6to6_bb0_cmp10_i_inputs_ready;
wire rstag_6to6_bb0_cmp10_i_stall_local;
 reg rstag_6to6_bb0_cmp10_i_staging_valid_NO_SHIFT_REG;
wire rstag_6to6_bb0_cmp10_i_combined_valid;
 reg rstag_6to6_bb0_cmp10_i_staging_reg_NO_SHIFT_REG;
wire rstag_6to6_bb0_cmp10_i;
 reg rstag_6to6_bb0_cmp10_i_consumed_0_NO_SHIFT_REG;
 reg rstag_6to6_bb0_cmp10_i_consumed_2_NO_SHIFT_REG;

assign rstag_6to6_bb0_cmp10_i_inputs_ready = local_bb0_cmp10_i_valid_out_NO_SHIFT_REG;
assign rstag_6to6_bb0_cmp10_i = (rstag_6to6_bb0_cmp10_i_staging_valid_NO_SHIFT_REG ? rstag_6to6_bb0_cmp10_i_staging_reg_NO_SHIFT_REG : local_bb0_cmp10_i_NO_SHIFT_REG);
assign rstag_6to6_bb0_cmp10_i_combined_valid = (rstag_6to6_bb0_cmp10_i_staging_valid_NO_SHIFT_REG | rstag_6to6_bb0_cmp10_i_inputs_ready);
assign rstag_6to6_bb0_cmp10_i_stall_local = ((rstag_6to6_bb0_cmp10_i_stall_in_0 & ~(rstag_6to6_bb0_cmp10_i_consumed_0_NO_SHIFT_REG)) | 1'b0 | (rstag_6to6_bb0_cmp10_i_stall_in_2 & ~(rstag_6to6_bb0_cmp10_i_consumed_2_NO_SHIFT_REG)));
assign rstag_6to6_bb0_cmp10_i_valid_out_0 = (rstag_6to6_bb0_cmp10_i_combined_valid & ~(rstag_6to6_bb0_cmp10_i_consumed_0_NO_SHIFT_REG));
assign rstag_6to6_bb0_cmp10_i_valid_out_1 = rstag_6to6_bb0_cmp10_i_combined_valid;
assign rstag_6to6_bb0_cmp10_i_valid_out_2 = (rstag_6to6_bb0_cmp10_i_combined_valid & ~(rstag_6to6_bb0_cmp10_i_consumed_2_NO_SHIFT_REG));
assign local_bb0_cmp10_i_stall_in = (|rstag_6to6_bb0_cmp10_i_staging_valid_NO_SHIFT_REG);

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		rstag_6to6_bb0_cmp10_i_staging_valid_NO_SHIFT_REG <= 1'b0;
		rstag_6to6_bb0_cmp10_i_staging_reg_NO_SHIFT_REG <= 'x;
	end
	else
	begin
		if (start)
		begin
			rstag_6to6_bb0_cmp10_i_staging_valid_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (rstag_6to6_bb0_cmp10_i_stall_local)
			begin
				if (~(rstag_6to6_bb0_cmp10_i_staging_valid_NO_SHIFT_REG))
				begin
					rstag_6to6_bb0_cmp10_i_staging_valid_NO_SHIFT_REG <= rstag_6to6_bb0_cmp10_i_inputs_ready;
				end
			end
			else
			begin
				rstag_6to6_bb0_cmp10_i_staging_valid_NO_SHIFT_REG <= 1'b0;
			end
		end
		if (~(rstag_6to6_bb0_cmp10_i_staging_valid_NO_SHIFT_REG))
		begin
			rstag_6to6_bb0_cmp10_i_staging_reg_NO_SHIFT_REG <= local_bb0_cmp10_i_NO_SHIFT_REG;
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		rstag_6to6_bb0_cmp10_i_consumed_0_NO_SHIFT_REG <= 1'b0;
		rstag_6to6_bb0_cmp10_i_consumed_2_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			rstag_6to6_bb0_cmp10_i_consumed_0_NO_SHIFT_REG <= 1'b0;
			rstag_6to6_bb0_cmp10_i_consumed_2_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			rstag_6to6_bb0_cmp10_i_consumed_0_NO_SHIFT_REG <= (rstag_6to6_bb0_cmp10_i_combined_valid & (rstag_6to6_bb0_cmp10_i_consumed_0_NO_SHIFT_REG | ~(rstag_6to6_bb0_cmp10_i_stall_in_0)) & rstag_6to6_bb0_cmp10_i_stall_local);
			rstag_6to6_bb0_cmp10_i_consumed_2_NO_SHIFT_REG <= (rstag_6to6_bb0_cmp10_i_combined_valid & (rstag_6to6_bb0_cmp10_i_consumed_2_NO_SHIFT_REG | ~(rstag_6to6_bb0_cmp10_i_stall_in_2)) & rstag_6to6_bb0_cmp10_i_stall_local);
		end
	end
end


// This section implements a registered operation.
// 
wire local_bb0___i_inputs_ready;
 reg local_bb0___i_wii_reg_NO_SHIFT_REG;
 reg local_bb0___i_valid_out_NO_SHIFT_REG;
wire local_bb0___i_stall_in;
wire local_bb0___i_output_regs_ready;
 reg local_bb0___i_NO_SHIFT_REG;
wire local_bb0___i_causedstall;

assign local_bb0___i_inputs_ready = (local_bb0_lnot6_i_valid_out_NO_SHIFT_REG & local_bb0_cmp_i_valid_out_0_NO_SHIFT_REG);
assign local_bb0___i_output_regs_ready = (~(local_bb0___i_wii_reg_NO_SHIFT_REG) & (&(~(local_bb0___i_valid_out_NO_SHIFT_REG) | ~(local_bb0___i_stall_in))));
assign local_bb0_lnot6_i_stall_in = (~(local_bb0___i_wii_reg_NO_SHIFT_REG) & (~(local_bb0___i_output_regs_ready) | ~(local_bb0___i_inputs_ready)));
assign local_bb0_cmp_i_stall_in_0 = (~(local_bb0___i_wii_reg_NO_SHIFT_REG) & (~(local_bb0___i_output_regs_ready) | ~(local_bb0___i_inputs_ready)));
assign local_bb0___i_causedstall = (local_bb0___i_inputs_ready && (~(local_bb0___i_output_regs_ready) && !(~(local_bb0___i_output_regs_ready))));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0___i_NO_SHIFT_REG <= 'x;
		local_bb0___i_valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0___i_NO_SHIFT_REG <= 'x;
			local_bb0___i_valid_out_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0___i_output_regs_ready)
			begin
				local_bb0___i_NO_SHIFT_REG <= (local_bb0_lnot6_i_NO_SHIFT_REG & local_bb0_cmp_i_NO_SHIFT_REG);
				local_bb0___i_valid_out_NO_SHIFT_REG <= local_bb0___i_inputs_ready;
			end
			else
			begin
				if (~(local_bb0___i_stall_in))
				begin
					local_bb0___i_valid_out_NO_SHIFT_REG <= local_bb0___i_wii_reg_NO_SHIFT_REG;
				end
			end
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0___i_wii_reg_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0___i_wii_reg_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0___i_inputs_ready)
			begin
				local_bb0___i_wii_reg_NO_SHIFT_REG <= 1'b1;
			end
		end
	end
end


// This section implements an unregistered operation.
// 
wire local_bb0_not_cmp10_i_stall_local;
wire local_bb0_not_cmp10_i;

assign local_bb0_not_cmp10_i = (rstag_6to6_bb0_cmp10_i ^ 1'b1);

// This section implements an unregistered operation.
// 
wire local_bb0_cond38_i_stall_local;
wire [31:0] local_bb0_cond38_i;

assign local_bb0_cond38_i = (local_bb0___i_NO_SHIFT_REG ? 32'h400000 : 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0__1_i_stall_local;
wire local_bb0__1_i;

assign local_bb0__1_i = (1'b0 & local_bb0_not_cmp10_i);

// This section implements an unregistered operation.
// 
wire local_bb0__2_i_valid_out;
wire local_bb0__2_i_stall_in;
wire local_bb0__2_i_inputs_ready;
wire local_bb0__2_i_stall_local;
wire [31:0] local_bb0__2_i;

assign local_bb0__2_i_inputs_ready = rstag_6to6_bb0_cmp10_i_valid_out_2;
assign local_bb0__2_i = ((local_bb0__1_i & 1'b0) ? 32'h100 : 32'hFFFFFFFF);
assign local_bb0__2_i_valid_out = local_bb0__2_i_inputs_ready;
assign local_bb0__2_i_stall_local = local_bb0__2_i_stall_in;
assign rstag_6to6_bb0_cmp10_i_stall_in_2 = (|local_bb0__2_i_stall_local);

// This section implements a registered operation.
// 
wire local_bb0__3_i_inputs_ready;
 reg local_bb0__3_i_wii_reg_NO_SHIFT_REG;
 reg local_bb0__3_i_valid_out_NO_SHIFT_REG;
wire local_bb0__3_i_stall_in;
wire local_bb0__3_i_output_regs_ready;
 reg [31:0] local_bb0__3_i_NO_SHIFT_REG;
wire local_bb0__3_i_causedstall;

assign local_bb0__3_i_inputs_ready = (local_bb0__2_i_valid_out & rstag_6to6_bb0_cmp10_i_valid_out_1);
assign local_bb0__3_i_output_regs_ready = (~(local_bb0__3_i_wii_reg_NO_SHIFT_REG) & (&(~(local_bb0__3_i_valid_out_NO_SHIFT_REG) | ~(local_bb0__3_i_stall_in))));
assign local_bb0__2_i_stall_in = (~(local_bb0__3_i_wii_reg_NO_SHIFT_REG) & (~(local_bb0__3_i_output_regs_ready) | ~(local_bb0__3_i_inputs_ready)));
assign rstag_6to6_bb0_cmp10_i_stall_in_1 = (~(local_bb0__3_i_wii_reg_NO_SHIFT_REG) & (~(local_bb0__3_i_output_regs_ready) | ~(local_bb0__3_i_inputs_ready)));
assign local_bb0__3_i_causedstall = (local_bb0__3_i_inputs_ready && (~(local_bb0__3_i_output_regs_ready) && !(~(local_bb0__3_i_output_regs_ready))));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0__3_i_NO_SHIFT_REG <= 'x;
		local_bb0__3_i_valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0__3_i_NO_SHIFT_REG <= 'x;
			local_bb0__3_i_valid_out_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0__3_i_output_regs_ready)
			begin
				local_bb0__3_i_NO_SHIFT_REG <= (rstag_6to6_bb0_cmp10_i ? 32'h0 : (local_bb0__2_i | 32'h100));
				local_bb0__3_i_valid_out_NO_SHIFT_REG <= local_bb0__3_i_inputs_ready;
			end
			else
			begin
				if (~(local_bb0__3_i_stall_in))
				begin
					local_bb0__3_i_valid_out_NO_SHIFT_REG <= local_bb0__3_i_wii_reg_NO_SHIFT_REG;
				end
			end
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0__3_i_wii_reg_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0__3_i_wii_reg_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0__3_i_inputs_ready)
			begin
				local_bb0__3_i_wii_reg_NO_SHIFT_REG <= 1'b1;
			end
		end
	end
end


// This section implements a staging register.
// 
wire rstag_7to7_bb0__3_i_valid_out_0;
wire rstag_7to7_bb0__3_i_stall_in_0;
wire rstag_7to7_bb0__3_i_valid_out_1;
wire rstag_7to7_bb0__3_i_stall_in_1;
wire rstag_7to7_bb0__3_i_inputs_ready;
wire rstag_7to7_bb0__3_i_stall_local;
 reg rstag_7to7_bb0__3_i_staging_valid_NO_SHIFT_REG;
wire rstag_7to7_bb0__3_i_combined_valid;
 reg [31:0] rstag_7to7_bb0__3_i_staging_reg_NO_SHIFT_REG;
wire [31:0] rstag_7to7_bb0__3_i;
 reg rstag_7to7_bb0__3_i_consumed_0_NO_SHIFT_REG;
 reg rstag_7to7_bb0__3_i_consumed_1_NO_SHIFT_REG;

assign rstag_7to7_bb0__3_i_inputs_ready = local_bb0__3_i_valid_out_NO_SHIFT_REG;
assign rstag_7to7_bb0__3_i = (rstag_7to7_bb0__3_i_staging_valid_NO_SHIFT_REG ? rstag_7to7_bb0__3_i_staging_reg_NO_SHIFT_REG : local_bb0__3_i_NO_SHIFT_REG);
assign rstag_7to7_bb0__3_i_combined_valid = (rstag_7to7_bb0__3_i_staging_valid_NO_SHIFT_REG | rstag_7to7_bb0__3_i_inputs_ready);
assign rstag_7to7_bb0__3_i_stall_local = ((rstag_7to7_bb0__3_i_stall_in_0 & ~(rstag_7to7_bb0__3_i_consumed_0_NO_SHIFT_REG)) | (rstag_7to7_bb0__3_i_stall_in_1 & ~(rstag_7to7_bb0__3_i_consumed_1_NO_SHIFT_REG)));
assign rstag_7to7_bb0__3_i_valid_out_0 = (rstag_7to7_bb0__3_i_combined_valid & ~(rstag_7to7_bb0__3_i_consumed_0_NO_SHIFT_REG));
assign rstag_7to7_bb0__3_i_valid_out_1 = (rstag_7to7_bb0__3_i_combined_valid & ~(rstag_7to7_bb0__3_i_consumed_1_NO_SHIFT_REG));
assign local_bb0__3_i_stall_in = (|rstag_7to7_bb0__3_i_staging_valid_NO_SHIFT_REG);

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		rstag_7to7_bb0__3_i_staging_valid_NO_SHIFT_REG <= 1'b0;
		rstag_7to7_bb0__3_i_staging_reg_NO_SHIFT_REG <= 'x;
	end
	else
	begin
		if (start)
		begin
			rstag_7to7_bb0__3_i_staging_valid_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (rstag_7to7_bb0__3_i_stall_local)
			begin
				if (~(rstag_7to7_bb0__3_i_staging_valid_NO_SHIFT_REG))
				begin
					rstag_7to7_bb0__3_i_staging_valid_NO_SHIFT_REG <= rstag_7to7_bb0__3_i_inputs_ready;
				end
			end
			else
			begin
				rstag_7to7_bb0__3_i_staging_valid_NO_SHIFT_REG <= 1'b0;
			end
		end
		if (~(rstag_7to7_bb0__3_i_staging_valid_NO_SHIFT_REG))
		begin
			rstag_7to7_bb0__3_i_staging_reg_NO_SHIFT_REG <= local_bb0__3_i_NO_SHIFT_REG;
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		rstag_7to7_bb0__3_i_consumed_0_NO_SHIFT_REG <= 1'b0;
		rstag_7to7_bb0__3_i_consumed_1_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			rstag_7to7_bb0__3_i_consumed_0_NO_SHIFT_REG <= 1'b0;
			rstag_7to7_bb0__3_i_consumed_1_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			rstag_7to7_bb0__3_i_consumed_0_NO_SHIFT_REG <= (rstag_7to7_bb0__3_i_combined_valid & (rstag_7to7_bb0__3_i_consumed_0_NO_SHIFT_REG | ~(rstag_7to7_bb0__3_i_stall_in_0)) & rstag_7to7_bb0__3_i_stall_local);
			rstag_7to7_bb0__3_i_consumed_1_NO_SHIFT_REG <= (rstag_7to7_bb0__3_i_combined_valid & (rstag_7to7_bb0__3_i_consumed_1_NO_SHIFT_REG | ~(rstag_7to7_bb0__3_i_stall_in_1)) & rstag_7to7_bb0__3_i_stall_local);
		end
	end
end


// This section implements an unregistered operation.
// 
wire local_bb0_fold_i_valid_out;
wire local_bb0_fold_i_stall_in;
wire local_bb0_fold_i_inputs_ready;
wire local_bb0_fold_i_stall_local;
wire [31:0] local_bb0_fold_i;

assign local_bb0_fold_i_inputs_ready = (rstag_7to7_bb0__3_i_valid_out_0 & rstag_4to4_bb0_shr_i_valid_out_0);
assign local_bb0_fold_i = (rstag_7to7_bb0__3_i + (rstag_4to4_bb0_shr_i & 32'h1FF));
assign local_bb0_fold_i_valid_out = local_bb0_fold_i_inputs_ready;
assign local_bb0_fold_i_stall_local = local_bb0_fold_i_stall_in;
assign rstag_7to7_bb0__3_i_stall_in_0 = (local_bb0_fold_i_stall_local | ~(local_bb0_fold_i_inputs_ready));
assign rstag_4to4_bb0_shr_i_stall_in_0 = (local_bb0_fold_i_stall_local | ~(local_bb0_fold_i_inputs_ready));

// This section implements a registered operation.
// 
wire local_bb0_add_i_inputs_ready;
 reg local_bb0_add_i_wii_reg_NO_SHIFT_REG;
 reg local_bb0_add_i_valid_out_0_NO_SHIFT_REG;
wire local_bb0_add_i_stall_in_0;
 reg local_bb0_add_i_valid_out_1_NO_SHIFT_REG;
wire local_bb0_add_i_stall_in_1;
wire local_bb0_add_i_output_regs_ready;
 reg [31:0] local_bb0_add_i_NO_SHIFT_REG;
wire local_bb0_add_i_causedstall;

assign local_bb0_add_i_inputs_ready = (rstag_7to7_bb0__3_i_valid_out_1 & rstag_5to5_bb0_and1_i_valid_out_0);
assign local_bb0_add_i_output_regs_ready = (~(local_bb0_add_i_wii_reg_NO_SHIFT_REG) & ((~(local_bb0_add_i_valid_out_0_NO_SHIFT_REG) | ~(local_bb0_add_i_stall_in_0)) & (~(local_bb0_add_i_valid_out_1_NO_SHIFT_REG) | ~(local_bb0_add_i_stall_in_1))));
assign rstag_7to7_bb0__3_i_stall_in_1 = (~(local_bb0_add_i_wii_reg_NO_SHIFT_REG) & (~(local_bb0_add_i_output_regs_ready) | ~(local_bb0_add_i_inputs_ready)));
assign rstag_5to5_bb0_and1_i_stall_in_0 = (~(local_bb0_add_i_wii_reg_NO_SHIFT_REG) & (~(local_bb0_add_i_output_regs_ready) | ~(local_bb0_add_i_inputs_ready)));
assign local_bb0_add_i_causedstall = (local_bb0_add_i_inputs_ready && (~(local_bb0_add_i_output_regs_ready) && !(~(local_bb0_add_i_output_regs_ready))));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_add_i_NO_SHIFT_REG <= 'x;
		local_bb0_add_i_valid_out_0_NO_SHIFT_REG <= 1'b0;
		local_bb0_add_i_valid_out_1_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_add_i_NO_SHIFT_REG <= 'x;
			local_bb0_add_i_valid_out_0_NO_SHIFT_REG <= 1'b0;
			local_bb0_add_i_valid_out_1_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_add_i_output_regs_ready)
			begin
				local_bb0_add_i_NO_SHIFT_REG <= (rstag_7to7_bb0__3_i + (rstag_5to5_bb0_and1_i & 32'hFF));
				local_bb0_add_i_valid_out_0_NO_SHIFT_REG <= local_bb0_add_i_inputs_ready;
				local_bb0_add_i_valid_out_1_NO_SHIFT_REG <= local_bb0_add_i_inputs_ready;
			end
			else
			begin
				if (~(local_bb0_add_i_stall_in_0))
				begin
					local_bb0_add_i_valid_out_0_NO_SHIFT_REG <= local_bb0_add_i_wii_reg_NO_SHIFT_REG;
				end
				if (~(local_bb0_add_i_stall_in_1))
				begin
					local_bb0_add_i_valid_out_1_NO_SHIFT_REG <= local_bb0_add_i_wii_reg_NO_SHIFT_REG;
				end
			end
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_add_i_wii_reg_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_add_i_wii_reg_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_add_i_inputs_ready)
			begin
				local_bb0_add_i_wii_reg_NO_SHIFT_REG <= 1'b1;
			end
		end
	end
end


// This section implements a registered operation.
// 
wire local_bb0_and27_i_inputs_ready;
 reg local_bb0_and27_i_wii_reg_NO_SHIFT_REG;
 reg local_bb0_and27_i_valid_out_NO_SHIFT_REG;
wire local_bb0_and27_i_stall_in;
wire local_bb0_and27_i_output_regs_ready;
 reg [31:0] local_bb0_and27_i_NO_SHIFT_REG;
wire local_bb0_and27_i_causedstall;

assign local_bb0_and27_i_inputs_ready = local_bb0_fold_i_valid_out;
assign local_bb0_and27_i_output_regs_ready = (~(local_bb0_and27_i_wii_reg_NO_SHIFT_REG) & (&(~(local_bb0_and27_i_valid_out_NO_SHIFT_REG) | ~(local_bb0_and27_i_stall_in))));
assign local_bb0_fold_i_stall_in = (~(local_bb0_and27_i_wii_reg_NO_SHIFT_REG) & (~(local_bb0_and27_i_output_regs_ready) | ~(local_bb0_and27_i_inputs_ready)));
assign local_bb0_and27_i_causedstall = (local_bb0_and27_i_inputs_ready && (~(local_bb0_and27_i_output_regs_ready) && !(~(local_bb0_and27_i_output_regs_ready))));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_and27_i_NO_SHIFT_REG <= 'x;
		local_bb0_and27_i_valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_and27_i_NO_SHIFT_REG <= 'x;
			local_bb0_and27_i_valid_out_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_and27_i_output_regs_ready)
			begin
				local_bb0_and27_i_NO_SHIFT_REG <= (local_bb0_fold_i << 32'h17);
				local_bb0_and27_i_valid_out_NO_SHIFT_REG <= local_bb0_and27_i_inputs_ready;
			end
			else
			begin
				if (~(local_bb0_and27_i_stall_in))
				begin
					local_bb0_and27_i_valid_out_NO_SHIFT_REG <= local_bb0_and27_i_wii_reg_NO_SHIFT_REG;
				end
			end
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_and27_i_wii_reg_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_and27_i_wii_reg_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_and27_i_inputs_ready)
			begin
				local_bb0_and27_i_wii_reg_NO_SHIFT_REG <= 1'b1;
			end
		end
	end
end


// This section implements an unregistered operation.
// 
wire local_bb0_cmp20_i_valid_out;
wire local_bb0_cmp20_i_stall_in;
wire local_bb0_cmp20_i_inputs_ready;
wire local_bb0_cmp20_i_stall_local;
wire local_bb0_cmp20_i;

assign local_bb0_cmp20_i_inputs_ready = local_bb0_add_i_valid_out_0_NO_SHIFT_REG;
assign local_bb0_cmp20_i = ($signed(local_bb0_add_i_NO_SHIFT_REG) > $signed(32'hFE));
assign local_bb0_cmp20_i_valid_out = local_bb0_cmp20_i_inputs_ready;
assign local_bb0_cmp20_i_stall_local = local_bb0_cmp20_i_stall_in;
assign local_bb0_add_i_stall_in_0 = (|local_bb0_cmp20_i_stall_local);

// This section implements an unregistered operation.
// 
wire local_bb0_cmp23_i_valid_out;
wire local_bb0_cmp23_i_stall_in;
wire local_bb0_cmp23_i_inputs_ready;
wire local_bb0_cmp23_i_stall_local;
wire local_bb0_cmp23_i;

assign local_bb0_cmp23_i_inputs_ready = local_bb0_add_i_valid_out_1_NO_SHIFT_REG;
assign local_bb0_cmp23_i = ($signed(local_bb0_add_i_NO_SHIFT_REG) < $signed(32'h1));
assign local_bb0_cmp23_i_valid_out = local_bb0_cmp23_i_inputs_ready;
assign local_bb0_cmp23_i_stall_local = local_bb0_cmp23_i_stall_in;
assign local_bb0_add_i_stall_in_1 = (|local_bb0_cmp23_i_stall_local);

// This section implements an unregistered operation.
// 
wire local_bb0_shl_i_stall_local;
wire [31:0] local_bb0_shl_i;

assign local_bb0_shl_i = ((local_bb0_and27_i_NO_SHIFT_REG & 32'hFF800000) & 32'h7F800000);

// This section implements a registered operation.
// 
wire local_bb0_or_i_inputs_ready;
 reg local_bb0_or_i_wii_reg_NO_SHIFT_REG;
 reg local_bb0_or_i_valid_out_0_NO_SHIFT_REG;
wire local_bb0_or_i_stall_in_0;
 reg local_bb0_or_i_valid_out_1_NO_SHIFT_REG;
wire local_bb0_or_i_stall_in_1;
wire local_bb0_or_i_output_regs_ready;
 reg local_bb0_or_i_NO_SHIFT_REG;
wire local_bb0_or_i_causedstall;

assign local_bb0_or_i_inputs_ready = (local_bb0_cmp_i_valid_out_1_NO_SHIFT_REG & local_bb0_cmp20_i_valid_out);
assign local_bb0_or_i_output_regs_ready = (~(local_bb0_or_i_wii_reg_NO_SHIFT_REG) & ((~(local_bb0_or_i_valid_out_0_NO_SHIFT_REG) | ~(local_bb0_or_i_stall_in_0)) & (~(local_bb0_or_i_valid_out_1_NO_SHIFT_REG) | ~(local_bb0_or_i_stall_in_1))));
assign local_bb0_cmp_i_stall_in_1 = (~(local_bb0_or_i_wii_reg_NO_SHIFT_REG) & (~(local_bb0_or_i_output_regs_ready) | ~(local_bb0_or_i_inputs_ready)));
assign local_bb0_cmp20_i_stall_in = (~(local_bb0_or_i_wii_reg_NO_SHIFT_REG) & (~(local_bb0_or_i_output_regs_ready) | ~(local_bb0_or_i_inputs_ready)));
assign local_bb0_or_i_causedstall = (local_bb0_or_i_inputs_ready && (~(local_bb0_or_i_output_regs_ready) && !(~(local_bb0_or_i_output_regs_ready))));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_or_i_NO_SHIFT_REG <= 'x;
		local_bb0_or_i_valid_out_0_NO_SHIFT_REG <= 1'b0;
		local_bb0_or_i_valid_out_1_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_or_i_NO_SHIFT_REG <= 'x;
			local_bb0_or_i_valid_out_0_NO_SHIFT_REG <= 1'b0;
			local_bb0_or_i_valid_out_1_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_or_i_output_regs_ready)
			begin
				local_bb0_or_i_NO_SHIFT_REG <= (local_bb0_cmp_i_NO_SHIFT_REG | local_bb0_cmp20_i);
				local_bb0_or_i_valid_out_0_NO_SHIFT_REG <= local_bb0_or_i_inputs_ready;
				local_bb0_or_i_valid_out_1_NO_SHIFT_REG <= local_bb0_or_i_inputs_ready;
			end
			else
			begin
				if (~(local_bb0_or_i_stall_in_0))
				begin
					local_bb0_or_i_valid_out_0_NO_SHIFT_REG <= local_bb0_or_i_wii_reg_NO_SHIFT_REG;
				end
				if (~(local_bb0_or_i_stall_in_1))
				begin
					local_bb0_or_i_valid_out_1_NO_SHIFT_REG <= local_bb0_or_i_wii_reg_NO_SHIFT_REG;
				end
			end
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_or_i_wii_reg_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_or_i_wii_reg_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_or_i_inputs_ready)
			begin
				local_bb0_or_i_wii_reg_NO_SHIFT_REG <= 1'b1;
			end
		end
	end
end


// This section implements a registered operation.
// 
wire local_bb0_or25_i_inputs_ready;
 reg local_bb0_or25_i_wii_reg_NO_SHIFT_REG;
 reg local_bb0_or25_i_valid_out_NO_SHIFT_REG;
wire local_bb0_or25_i_stall_in;
wire local_bb0_or25_i_output_regs_ready;
 reg local_bb0_or25_i_NO_SHIFT_REG;
wire local_bb0_or25_i_causedstall;

assign local_bb0_or25_i_inputs_ready = (local_bb0_cmp23_i_valid_out & rstag_6to6_bb0_cmp10_i_valid_out_0);
assign local_bb0_or25_i_output_regs_ready = (~(local_bb0_or25_i_wii_reg_NO_SHIFT_REG) & (&(~(local_bb0_or25_i_valid_out_NO_SHIFT_REG) | ~(local_bb0_or25_i_stall_in))));
assign local_bb0_cmp23_i_stall_in = (~(local_bb0_or25_i_wii_reg_NO_SHIFT_REG) & (~(local_bb0_or25_i_output_regs_ready) | ~(local_bb0_or25_i_inputs_ready)));
assign rstag_6to6_bb0_cmp10_i_stall_in_0 = (~(local_bb0_or25_i_wii_reg_NO_SHIFT_REG) & (~(local_bb0_or25_i_output_regs_ready) | ~(local_bb0_or25_i_inputs_ready)));
assign local_bb0_or25_i_causedstall = (local_bb0_or25_i_inputs_ready && (~(local_bb0_or25_i_output_regs_ready) && !(~(local_bb0_or25_i_output_regs_ready))));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_or25_i_NO_SHIFT_REG <= 'x;
		local_bb0_or25_i_valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_or25_i_NO_SHIFT_REG <= 'x;
			local_bb0_or25_i_valid_out_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_or25_i_output_regs_ready)
			begin
				local_bb0_or25_i_NO_SHIFT_REG <= (rstag_6to6_bb0_cmp10_i | local_bb0_cmp23_i);
				local_bb0_or25_i_valid_out_NO_SHIFT_REG <= local_bb0_or25_i_inputs_ready;
			end
			else
			begin
				if (~(local_bb0_or25_i_stall_in))
				begin
					local_bb0_or25_i_valid_out_NO_SHIFT_REG <= local_bb0_or25_i_wii_reg_NO_SHIFT_REG;
				end
			end
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_or25_i_wii_reg_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_or25_i_wii_reg_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_or25_i_inputs_ready)
			begin
				local_bb0_or25_i_wii_reg_NO_SHIFT_REG <= 1'b1;
			end
		end
	end
end


// This section implements an unregistered operation.
// 
wire local_bb0_or29_i_stall_local;
wire [31:0] local_bb0_or29_i;

assign local_bb0_or29_i = ((local_bb0_shl_i & 32'h7F800000) | (local_bb0_and28_i_NO_SHIFT_REG & 32'h807FFFFF));

// This section implements an unregistered operation.
// 
wire local_bb0_cond36_i_stall_local;
wire [31:0] local_bb0_cond36_i;

assign local_bb0_cond36_i = (local_bb0_or_i_NO_SHIFT_REG ? 32'h7F800000 : 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_or32_i_stall_local;
wire local_bb0_or32_i;

assign local_bb0_or32_i = (local_bb0_or25_i_NO_SHIFT_REG | local_bb0_or_i_NO_SHIFT_REG);

// This section implements an unregistered operation.
// 
wire local_bb0_or40_i_stall_local;
wire [31:0] local_bb0_or40_i;

assign local_bb0_or40_i = ((local_bb0_cond36_i & 32'h7F800000) | (local_bb0_cond38_i & 32'h400000));

// This section implements an unregistered operation.
// 
wire local_bb0_cond_i_stall_local;
wire [31:0] local_bb0_cond_i;

assign local_bb0_cond_i = (local_bb0_or32_i ? 32'h80000000 : 32'hFFFFFFFF);

// This section implements an unregistered operation.
// 
wire local_bb0_and39_i_stall_local;
wire [31:0] local_bb0_and39_i;

assign local_bb0_and39_i = ((local_bb0_cond_i | 32'h80000000) & local_bb0_or29_i);

// This section implements an unregistered operation.
// 
wire local_bb0_or41_i_stall_local;
wire [31:0] local_bb0_or41_i;

assign local_bb0_or41_i = ((local_bb0_or40_i & 32'h7FC00000) | local_bb0_and39_i);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u0_valid_out;
wire local_bb0_var__u0_stall_in;
wire local_bb0_var__u0_inputs_ready;
wire local_bb0_var__u0_stall_local;
wire [31:0] local_bb0_var__u0;

assign local_bb0_var__u0_inputs_ready = (local_bb0_and28_i_valid_out_NO_SHIFT_REG & local_bb0___i_valid_out_NO_SHIFT_REG & local_bb0_and27_i_valid_out_NO_SHIFT_REG & local_bb0_or_i_valid_out_1_NO_SHIFT_REG & local_bb0_or25_i_valid_out_NO_SHIFT_REG & local_bb0_or_i_valid_out_0_NO_SHIFT_REG);
assign local_bb0_var__u0 = local_bb0_or41_i;
assign local_bb0_var__u0_valid_out = local_bb0_var__u0_inputs_ready;
assign local_bb0_var__u0_stall_local = local_bb0_var__u0_stall_in;
assign local_bb0_and28_i_stall_in = (local_bb0_var__u0_stall_local | ~(local_bb0_var__u0_inputs_ready));
assign local_bb0___i_stall_in = (local_bb0_var__u0_stall_local | ~(local_bb0_var__u0_inputs_ready));
assign local_bb0_and27_i_stall_in = (local_bb0_var__u0_stall_local | ~(local_bb0_var__u0_inputs_ready));
assign local_bb0_or_i_stall_in_1 = (local_bb0_var__u0_stall_local | ~(local_bb0_var__u0_inputs_ready));
assign local_bb0_or25_i_stall_in = (local_bb0_var__u0_stall_local | ~(local_bb0_var__u0_inputs_ready));
assign local_bb0_or_i_stall_in_0 = (local_bb0_var__u0_stall_local | ~(local_bb0_var__u0_inputs_ready));

// This section implements a registered operation.
// 
wire local_bb0_add7_inputs_ready;
 reg local_bb0_add7_wii_reg_NO_SHIFT_REG;
 reg local_bb0_add7_valid_out_NO_SHIFT_REG;
wire local_bb0_add7_stall_in;
wire local_bb0_add7_output_regs_ready;
wire [31:0] local_bb0_add7;
 reg local_bb0_add7_valid_pipe_0_NO_SHIFT_REG;
 reg local_bb0_add7_valid_pipe_1_NO_SHIFT_REG;
 reg local_bb0_add7_valid_pipe_2_NO_SHIFT_REG;
 reg local_bb0_add7_valid_pipe_3_NO_SHIFT_REG;
 reg local_bb0_add7_valid_pipe_4_NO_SHIFT_REG;
 reg local_bb0_add7_valid_pipe_5_NO_SHIFT_REG;
 reg local_bb0_add7_valid_pipe_6_NO_SHIFT_REG;
wire local_bb0_add7_causedstall;

acl_fp_custom_add_ll fp_module_local_bb0_add7 (
	.clock(clock),
	.resetn(resetn),
	.dataa(local_bb0_var__u0),
	.datab(local_bb0_mul6),
	.enable(local_bb0_add7_output_regs_ready),
	.result(local_bb0_add7)
);


assign local_bb0_add7_inputs_ready = (local_bb0_var__u0_valid_out & local_bb0_mul6_valid_out_NO_SHIFT_REG);
assign local_bb0_add7_output_regs_ready = (~(local_bb0_add7_wii_reg_NO_SHIFT_REG) & (&(~(local_bb0_add7_valid_out_NO_SHIFT_REG) | ~(local_bb0_add7_stall_in))));
assign local_bb0_var__u0_stall_in = (~(local_bb0_add7_wii_reg_NO_SHIFT_REG) & (~(local_bb0_add7_output_regs_ready) | ~(local_bb0_add7_inputs_ready)));
assign local_bb0_mul6_stall_in = (~(local_bb0_add7_wii_reg_NO_SHIFT_REG) & (~(local_bb0_add7_output_regs_ready) | ~(local_bb0_add7_inputs_ready)));
assign local_bb0_add7_causedstall = (local_bb0_add7_inputs_ready && (~(local_bb0_add7_output_regs_ready) && !(~(local_bb0_add7_output_regs_ready))));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_add7_valid_pipe_0_NO_SHIFT_REG <= 1'b0;
		local_bb0_add7_valid_pipe_1_NO_SHIFT_REG <= 1'b0;
		local_bb0_add7_valid_pipe_2_NO_SHIFT_REG <= 1'b0;
		local_bb0_add7_valid_pipe_3_NO_SHIFT_REG <= 1'b0;
		local_bb0_add7_valid_pipe_4_NO_SHIFT_REG <= 1'b0;
		local_bb0_add7_valid_pipe_5_NO_SHIFT_REG <= 1'b0;
		local_bb0_add7_valid_pipe_6_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_add7_valid_pipe_0_NO_SHIFT_REG <= 1'b0;
			local_bb0_add7_valid_pipe_1_NO_SHIFT_REG <= 1'b0;
			local_bb0_add7_valid_pipe_2_NO_SHIFT_REG <= 1'b0;
			local_bb0_add7_valid_pipe_3_NO_SHIFT_REG <= 1'b0;
			local_bb0_add7_valid_pipe_4_NO_SHIFT_REG <= 1'b0;
			local_bb0_add7_valid_pipe_5_NO_SHIFT_REG <= 1'b0;
			local_bb0_add7_valid_pipe_6_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_add7_output_regs_ready)
			begin
				local_bb0_add7_valid_pipe_0_NO_SHIFT_REG <= local_bb0_add7_inputs_ready;
				local_bb0_add7_valid_pipe_1_NO_SHIFT_REG <= local_bb0_add7_valid_pipe_0_NO_SHIFT_REG;
				local_bb0_add7_valid_pipe_2_NO_SHIFT_REG <= local_bb0_add7_valid_pipe_1_NO_SHIFT_REG;
				local_bb0_add7_valid_pipe_3_NO_SHIFT_REG <= local_bb0_add7_valid_pipe_2_NO_SHIFT_REG;
				local_bb0_add7_valid_pipe_4_NO_SHIFT_REG <= local_bb0_add7_valid_pipe_3_NO_SHIFT_REG;
				local_bb0_add7_valid_pipe_5_NO_SHIFT_REG <= local_bb0_add7_valid_pipe_4_NO_SHIFT_REG;
				local_bb0_add7_valid_pipe_6_NO_SHIFT_REG <= local_bb0_add7_valid_pipe_5_NO_SHIFT_REG;
			end
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_add7_valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_add7_valid_out_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_add7_output_regs_ready)
			begin
				local_bb0_add7_valid_out_NO_SHIFT_REG <= local_bb0_add7_valid_pipe_6_NO_SHIFT_REG;
			end
			else
			begin
				if (~(local_bb0_add7_stall_in))
				begin
					local_bb0_add7_valid_out_NO_SHIFT_REG <= local_bb0_add7_wii_reg_NO_SHIFT_REG;
				end
			end
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_add7_wii_reg_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_add7_wii_reg_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_add7_valid_pipe_6_NO_SHIFT_REG)
			begin
				local_bb0_add7_wii_reg_NO_SHIFT_REG <= 1'b1;
			end
		end
	end
end


// This section describes the behaviour of the BRANCH node.
wire branch_var__inputs_ready;
 reg branch_node_valid_out_NO_SHIFT_REG;
wire branch_var__output_regs_ready;
wire combined_branch_stall_in_signal;
 reg [31:0] lvb_bb0_add7_reg_NO_SHIFT_REG;
 reg [31:0] lvb_bb0_sub_reg_NO_SHIFT_REG;
 reg [31:0] lvb_input_global_id_0_reg_NO_SHIFT_REG;

assign branch_var__inputs_ready = (local_bb0_sub_valid_out_NO_SHIFT_REG & local_bb0_add7_valid_out_NO_SHIFT_REG & merge_node_valid_out_2_NO_SHIFT_REG);
assign branch_var__output_regs_ready = (~(stall_in) | ~(branch_node_valid_out_NO_SHIFT_REG));
assign local_bb0_sub_stall_in = (~(branch_var__output_regs_ready) | ~(branch_var__inputs_ready));
assign local_bb0_add7_stall_in = (~(branch_var__output_regs_ready) | ~(branch_var__inputs_ready));
assign merge_node_stall_in_2 = (~(branch_var__output_regs_ready) | ~(branch_var__inputs_ready));
assign lvb_bb0_add7 = lvb_bb0_add7_reg_NO_SHIFT_REG;
assign lvb_bb0_sub = lvb_bb0_sub_reg_NO_SHIFT_REG;
assign lvb_input_global_id_0 = lvb_input_global_id_0_reg_NO_SHIFT_REG;
assign combined_branch_stall_in_signal = stall_in;
assign valid_out = branch_node_valid_out_NO_SHIFT_REG;

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		branch_node_valid_out_NO_SHIFT_REG <= 1'b0;
		lvb_bb0_add7_reg_NO_SHIFT_REG <= 'x;
		lvb_bb0_sub_reg_NO_SHIFT_REG <= 'x;
		lvb_input_global_id_0_reg_NO_SHIFT_REG <= 'x;
	end
	else
	begin
		if (branch_var__output_regs_ready)
		begin
			branch_node_valid_out_NO_SHIFT_REG <= branch_var__inputs_ready;
			lvb_bb0_add7_reg_NO_SHIFT_REG <= local_bb0_add7;
			lvb_bb0_sub_reg_NO_SHIFT_REG <= local_bb0_sub_NO_SHIFT_REG;
			lvb_input_global_id_0_reg_NO_SHIFT_REG <= local_lvm_input_global_id_0_NO_SHIFT_REG;
		end
		else
		begin
			if (~(combined_branch_stall_in_signal))
			begin
				branch_node_valid_out_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end


endmodule

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

// altera message_off 10036
// altera message_off 10230
// altera message_off 10858
module convolution_kernel_basic_block_1
	(
		input 		clock,
		input 		resetn,
		input [63:0] 		input_result,
		input [63:0] 		input_inputArray,
		input [31:0] 		input_wii_add7,
		input [31:0] 		input_wii_sub,
		input 		valid_in,
		output 		stall_out,
		input [31:0] 		input_global_id_0,
		output 		valid_out,
		input 		stall_in,
		input [31:0] 		workgroup_size,
		input 		start,
		output 		avm_local_bb1_ld_memcoalesce_inputArray_load_09_enable,
		input [255:0] 		avm_local_bb1_ld_memcoalesce_inputArray_load_09_readdata,
		input 		avm_local_bb1_ld_memcoalesce_inputArray_load_09_readdatavalid,
		input 		avm_local_bb1_ld_memcoalesce_inputArray_load_09_waitrequest,
		output [29:0] 		avm_local_bb1_ld_memcoalesce_inputArray_load_09_address,
		output 		avm_local_bb1_ld_memcoalesce_inputArray_load_09_read,
		output 		avm_local_bb1_ld_memcoalesce_inputArray_load_09_write,
		input 		avm_local_bb1_ld_memcoalesce_inputArray_load_09_writeack,
		output [255:0] 		avm_local_bb1_ld_memcoalesce_inputArray_load_09_writedata,
		output [31:0] 		avm_local_bb1_ld_memcoalesce_inputArray_load_09_byteenable,
		output [4:0] 		avm_local_bb1_ld_memcoalesce_inputArray_load_09_burstcount,
		output 		local_bb1_ld_memcoalesce_inputArray_load_09_active,
		input 		clock2x,
		output 		avm_local_bb1_st_add7_enable,
		input [255:0] 		avm_local_bb1_st_add7_readdata,
		input 		avm_local_bb1_st_add7_readdatavalid,
		input 		avm_local_bb1_st_add7_waitrequest,
		output [29:0] 		avm_local_bb1_st_add7_address,
		output 		avm_local_bb1_st_add7_read,
		output 		avm_local_bb1_st_add7_write,
		input 		avm_local_bb1_st_add7_writeack,
		output [255:0] 		avm_local_bb1_st_add7_writedata,
		output [31:0] 		avm_local_bb1_st_add7_byteenable,
		output [4:0] 		avm_local_bb1_st_add7_burstcount,
		output 		local_bb1_st_add7_active,
		output 		avm_local_bb1_st_c0_exe2_enable,
		input [255:0] 		avm_local_bb1_st_c0_exe2_readdata,
		input 		avm_local_bb1_st_c0_exe2_readdatavalid,
		input 		avm_local_bb1_st_c0_exe2_waitrequest,
		output [29:0] 		avm_local_bb1_st_c0_exe2_address,
		output 		avm_local_bb1_st_c0_exe2_read,
		output 		avm_local_bb1_st_c0_exe2_write,
		input 		avm_local_bb1_st_c0_exe2_writeack,
		output [255:0] 		avm_local_bb1_st_c0_exe2_writedata,
		output [31:0] 		avm_local_bb1_st_c0_exe2_byteenable,
		output [4:0] 		avm_local_bb1_st_c0_exe2_burstcount,
		output 		local_bb1_st_c0_exe2_active
	);


// Values used for debugging.  These are swept away by synthesis.
wire _entry;
wire _exit;
 reg [31:0] _num_entry_NO_SHIFT_REG;
 reg [31:0] _num_exit_NO_SHIFT_REG;
wire [31:0] _num_live;

assign _entry = ((&valid_in) & ~((|stall_out)));
assign _exit = ((&valid_out) & ~((|stall_in)));
assign _num_live = (_num_entry_NO_SHIFT_REG - _num_exit_NO_SHIFT_REG);

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		_num_entry_NO_SHIFT_REG <= 32'h0;
		_num_exit_NO_SHIFT_REG <= 32'h0;
	end
	else
	begin
		if (_entry)
		begin
			_num_entry_NO_SHIFT_REG <= (_num_entry_NO_SHIFT_REG + 2'h1);
		end
		if (_exit)
		begin
			_num_exit_NO_SHIFT_REG <= (_num_exit_NO_SHIFT_REG + 2'h1);
		end
	end
end



// This section defines the behaviour of the MERGE node
wire merge_node_stall_in_0;
 reg merge_node_valid_out_0_NO_SHIFT_REG;
wire merge_node_stall_in_1;
 reg merge_node_valid_out_1_NO_SHIFT_REG;
wire merge_node_stall_in_2;
 reg merge_node_valid_out_2_NO_SHIFT_REG;
wire merge_node_stall_in_3;
 reg merge_node_valid_out_3_NO_SHIFT_REG;
wire merge_stalled_by_successors;
 reg merge_block_selector_NO_SHIFT_REG;
 reg merge_node_valid_in_staging_reg_NO_SHIFT_REG;
 reg [31:0] input_global_id_0_staging_reg_NO_SHIFT_REG;
 reg [31:0] local_lvm_input_global_id_0_NO_SHIFT_REG;
 reg is_merge_data_to_local_regs_valid_NO_SHIFT_REG;
 reg invariant_valid_NO_SHIFT_REG;

assign merge_stalled_by_successors = ((merge_node_stall_in_0 & merge_node_valid_out_0_NO_SHIFT_REG) | (merge_node_stall_in_1 & merge_node_valid_out_1_NO_SHIFT_REG) | (merge_node_stall_in_2 & merge_node_valid_out_2_NO_SHIFT_REG) | (merge_node_stall_in_3 & merge_node_valid_out_3_NO_SHIFT_REG));
assign stall_out = merge_node_valid_in_staging_reg_NO_SHIFT_REG;

always @(*)
begin
	if ((merge_node_valid_in_staging_reg_NO_SHIFT_REG | valid_in))
	begin
		merge_block_selector_NO_SHIFT_REG = 1'b0;
		is_merge_data_to_local_regs_valid_NO_SHIFT_REG = 1'b1;
	end
	else
	begin
		merge_block_selector_NO_SHIFT_REG = 1'b0;
		is_merge_data_to_local_regs_valid_NO_SHIFT_REG = 1'b0;
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		input_global_id_0_staging_reg_NO_SHIFT_REG <= 'x;
		merge_node_valid_in_staging_reg_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (((merge_block_selector_NO_SHIFT_REG != 1'b0) | merge_stalled_by_successors))
		begin
			if (~(merge_node_valid_in_staging_reg_NO_SHIFT_REG))
			begin
				input_global_id_0_staging_reg_NO_SHIFT_REG <= input_global_id_0;
				merge_node_valid_in_staging_reg_NO_SHIFT_REG <= valid_in;
			end
		end
		else
		begin
			merge_node_valid_in_staging_reg_NO_SHIFT_REG <= 1'b0;
		end
	end
end

always @(posedge clock)
begin
	if (~(merge_stalled_by_successors))
	begin
		case (merge_block_selector_NO_SHIFT_REG)
			1'b0:
			begin
				if (merge_node_valid_in_staging_reg_NO_SHIFT_REG)
				begin
					local_lvm_input_global_id_0_NO_SHIFT_REG <= input_global_id_0_staging_reg_NO_SHIFT_REG;
				end
				else
				begin
					local_lvm_input_global_id_0_NO_SHIFT_REG <= input_global_id_0;
				end
			end

			default:
			begin
			end

		endcase
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		merge_node_valid_out_0_NO_SHIFT_REG <= 1'b0;
		merge_node_valid_out_1_NO_SHIFT_REG <= 1'b0;
		merge_node_valid_out_2_NO_SHIFT_REG <= 1'b0;
		merge_node_valid_out_3_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (~(merge_stalled_by_successors))
		begin
			merge_node_valid_out_0_NO_SHIFT_REG <= is_merge_data_to_local_regs_valid_NO_SHIFT_REG;
			merge_node_valid_out_1_NO_SHIFT_REG <= is_merge_data_to_local_regs_valid_NO_SHIFT_REG;
			merge_node_valid_out_2_NO_SHIFT_REG <= is_merge_data_to_local_regs_valid_NO_SHIFT_REG;
			merge_node_valid_out_3_NO_SHIFT_REG <= is_merge_data_to_local_regs_valid_NO_SHIFT_REG;
		end
		else
		begin
			if (~(merge_node_stall_in_0))
			begin
				merge_node_valid_out_0_NO_SHIFT_REG <= 1'b0;
			end
			if (~(merge_node_stall_in_1))
			begin
				merge_node_valid_out_1_NO_SHIFT_REG <= 1'b0;
			end
			if (~(merge_node_stall_in_2))
			begin
				merge_node_valid_out_2_NO_SHIFT_REG <= 1'b0;
			end
			if (~(merge_node_stall_in_3))
			begin
				merge_node_valid_out_3_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		invariant_valid_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		invariant_valid_NO_SHIFT_REG <= (~(start) & (invariant_valid_NO_SHIFT_REG | is_merge_data_to_local_regs_valid_NO_SHIFT_REG));
	end
end


// This section implements an unregistered operation.
// 
wire local_bb1_sub12_valid_out;
wire local_bb1_sub12_stall_in;
wire local_bb1_sub12_inputs_ready;
wire local_bb1_sub12_stall_local;
wire [31:0] local_bb1_sub12;

assign local_bb1_sub12_inputs_ready = merge_node_valid_out_0_NO_SHIFT_REG;
assign local_bb1_sub12 = (local_lvm_input_global_id_0_NO_SHIFT_REG + 32'hFFFFFFFF);
assign local_bb1_sub12_valid_out = local_bb1_sub12_inputs_ready;
assign local_bb1_sub12_stall_local = local_bb1_sub12_stall_in;
assign merge_node_stall_in_0 = (|local_bb1_sub12_stall_local);

// Register node:
//  * latency = 155
//  * capacity = 155
 logic rnode_1to156_add7_0_valid_out_NO_SHIFT_REG;
 logic rnode_1to156_add7_0_stall_in_NO_SHIFT_REG;
 logic rnode_1to156_add7_0_reg_156_inputs_ready_NO_SHIFT_REG;
 logic rnode_1to156_add7_0_valid_out_reg_156_NO_SHIFT_REG;
 logic rnode_1to156_add7_0_stall_in_reg_156_NO_SHIFT_REG;
 logic rnode_1to156_add7_0_stall_out_reg_156_NO_SHIFT_REG;

acl_data_fifo rnode_1to156_add7_0_reg_156_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_1to156_add7_0_reg_156_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_1to156_add7_0_stall_in_reg_156_NO_SHIFT_REG),
	.valid_out(rnode_1to156_add7_0_valid_out_reg_156_NO_SHIFT_REG),
	.stall_out(rnode_1to156_add7_0_stall_out_reg_156_NO_SHIFT_REG),
	.data_in(),
	.data_out()
);

defparam rnode_1to156_add7_0_reg_156_fifo.DEPTH = 156;
defparam rnode_1to156_add7_0_reg_156_fifo.DATA_WIDTH = 0;
defparam rnode_1to156_add7_0_reg_156_fifo.ALLOW_FULL_WRITE = 0;
defparam rnode_1to156_add7_0_reg_156_fifo.IMPL = "ram";

assign rnode_1to156_add7_0_reg_156_inputs_ready_NO_SHIFT_REG = merge_node_valid_out_1_NO_SHIFT_REG;
assign merge_node_stall_in_1 = rnode_1to156_add7_0_stall_out_reg_156_NO_SHIFT_REG;
assign rnode_1to156_add7_0_stall_in_reg_156_NO_SHIFT_REG = rnode_1to156_add7_0_stall_in_NO_SHIFT_REG;
assign rnode_1to156_add7_0_valid_out_NO_SHIFT_REG = rnode_1to156_add7_0_valid_out_reg_156_NO_SHIFT_REG;

// Register node:
//  * latency = 155
//  * capacity = 155
 logic rnode_1to156_input_result_0_valid_out_NO_SHIFT_REG;
 logic rnode_1to156_input_result_0_stall_in_NO_SHIFT_REG;
 logic rnode_1to156_input_result_0_reg_156_inputs_ready_NO_SHIFT_REG;
 logic rnode_1to156_input_result_0_valid_out_reg_156_NO_SHIFT_REG;
 logic rnode_1to156_input_result_0_stall_in_reg_156_NO_SHIFT_REG;
 logic rnode_1to156_input_result_0_stall_out_reg_156_NO_SHIFT_REG;

acl_data_fifo rnode_1to156_input_result_0_reg_156_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_1to156_input_result_0_reg_156_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_1to156_input_result_0_stall_in_reg_156_NO_SHIFT_REG),
	.valid_out(rnode_1to156_input_result_0_valid_out_reg_156_NO_SHIFT_REG),
	.stall_out(rnode_1to156_input_result_0_stall_out_reg_156_NO_SHIFT_REG),
	.data_in(),
	.data_out()
);

defparam rnode_1to156_input_result_0_reg_156_fifo.DEPTH = 156;
defparam rnode_1to156_input_result_0_reg_156_fifo.DATA_WIDTH = 0;
defparam rnode_1to156_input_result_0_reg_156_fifo.ALLOW_FULL_WRITE = 0;
defparam rnode_1to156_input_result_0_reg_156_fifo.IMPL = "ram";

assign rnode_1to156_input_result_0_reg_156_inputs_ready_NO_SHIFT_REG = merge_node_valid_out_2_NO_SHIFT_REG;
assign merge_node_stall_in_2 = rnode_1to156_input_result_0_stall_out_reg_156_NO_SHIFT_REG;
assign rnode_1to156_input_result_0_stall_in_reg_156_NO_SHIFT_REG = rnode_1to156_input_result_0_stall_in_NO_SHIFT_REG;
assign rnode_1to156_input_result_0_valid_out_NO_SHIFT_REG = rnode_1to156_input_result_0_valid_out_reg_156_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_1to2_input_global_id_0_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_1to2_input_global_id_0_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_1to2_input_global_id_0_0_NO_SHIFT_REG;
 logic rnode_1to2_input_global_id_0_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_1to2_input_global_id_0_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_1to2_input_global_id_0_1_NO_SHIFT_REG;
 logic rnode_1to2_input_global_id_0_0_reg_2_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_1to2_input_global_id_0_0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_input_global_id_0_0_valid_out_0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_input_global_id_0_0_stall_in_0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_input_global_id_0_0_stall_out_reg_2_NO_SHIFT_REG;
 reg rnode_1to2_input_global_id_0_0_consumed_0_NO_SHIFT_REG;
 reg rnode_1to2_input_global_id_0_0_consumed_1_NO_SHIFT_REG;

acl_data_fifo rnode_1to2_input_global_id_0_0_reg_2_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_1to2_input_global_id_0_0_reg_2_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_1to2_input_global_id_0_0_stall_in_0_reg_2_NO_SHIFT_REG),
	.valid_out(rnode_1to2_input_global_id_0_0_valid_out_0_reg_2_NO_SHIFT_REG),
	.stall_out(rnode_1to2_input_global_id_0_0_stall_out_reg_2_NO_SHIFT_REG),
	.data_in(local_lvm_input_global_id_0_NO_SHIFT_REG),
	.data_out(rnode_1to2_input_global_id_0_0_reg_2_NO_SHIFT_REG)
);

defparam rnode_1to2_input_global_id_0_0_reg_2_fifo.DEPTH = 1;
defparam rnode_1to2_input_global_id_0_0_reg_2_fifo.DATA_WIDTH = 32;
defparam rnode_1to2_input_global_id_0_0_reg_2_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_1to2_input_global_id_0_0_reg_2_fifo.IMPL = "ll_reg";

assign rnode_1to2_input_global_id_0_0_reg_2_inputs_ready_NO_SHIFT_REG = merge_node_valid_out_3_NO_SHIFT_REG;
assign merge_node_stall_in_3 = rnode_1to2_input_global_id_0_0_stall_out_reg_2_NO_SHIFT_REG;
assign rnode_1to2_input_global_id_0_0_stall_in_0_reg_2_NO_SHIFT_REG = ((rnode_1to2_input_global_id_0_0_stall_in_0_NO_SHIFT_REG & ~(rnode_1to2_input_global_id_0_0_consumed_0_NO_SHIFT_REG)) | (rnode_1to2_input_global_id_0_0_stall_in_1_NO_SHIFT_REG & ~(rnode_1to2_input_global_id_0_0_consumed_1_NO_SHIFT_REG)));
assign rnode_1to2_input_global_id_0_0_valid_out_0_NO_SHIFT_REG = (rnode_1to2_input_global_id_0_0_valid_out_0_reg_2_NO_SHIFT_REG & ~(rnode_1to2_input_global_id_0_0_consumed_0_NO_SHIFT_REG));
assign rnode_1to2_input_global_id_0_0_valid_out_1_NO_SHIFT_REG = (rnode_1to2_input_global_id_0_0_valid_out_0_reg_2_NO_SHIFT_REG & ~(rnode_1to2_input_global_id_0_0_consumed_1_NO_SHIFT_REG));
assign rnode_1to2_input_global_id_0_0_NO_SHIFT_REG = rnode_1to2_input_global_id_0_0_reg_2_NO_SHIFT_REG;
assign rnode_1to2_input_global_id_0_1_NO_SHIFT_REG = rnode_1to2_input_global_id_0_0_reg_2_NO_SHIFT_REG;

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		rnode_1to2_input_global_id_0_0_consumed_0_NO_SHIFT_REG <= 1'b0;
		rnode_1to2_input_global_id_0_0_consumed_1_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		rnode_1to2_input_global_id_0_0_consumed_0_NO_SHIFT_REG <= (rnode_1to2_input_global_id_0_0_valid_out_0_reg_2_NO_SHIFT_REG & (rnode_1to2_input_global_id_0_0_consumed_0_NO_SHIFT_REG | ~(rnode_1to2_input_global_id_0_0_stall_in_0_NO_SHIFT_REG)) & rnode_1to2_input_global_id_0_0_stall_in_0_reg_2_NO_SHIFT_REG);
		rnode_1to2_input_global_id_0_0_consumed_1_NO_SHIFT_REG <= (rnode_1to2_input_global_id_0_0_valid_out_0_reg_2_NO_SHIFT_REG & (rnode_1to2_input_global_id_0_0_consumed_1_NO_SHIFT_REG | ~(rnode_1to2_input_global_id_0_0_stall_in_1_NO_SHIFT_REG)) & rnode_1to2_input_global_id_0_0_stall_in_0_reg_2_NO_SHIFT_REG);
	end
end


// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_1to2_bb1_sub12_0_valid_out_NO_SHIFT_REG;
 logic rnode_1to2_bb1_sub12_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_1to2_bb1_sub12_0_NO_SHIFT_REG;
 logic rnode_1to2_bb1_sub12_0_reg_2_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_1to2_bb1_sub12_0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb1_sub12_0_valid_out_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb1_sub12_0_stall_in_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb1_sub12_0_stall_out_reg_2_NO_SHIFT_REG;

acl_data_fifo rnode_1to2_bb1_sub12_0_reg_2_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_1to2_bb1_sub12_0_reg_2_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_1to2_bb1_sub12_0_stall_in_reg_2_NO_SHIFT_REG),
	.valid_out(rnode_1to2_bb1_sub12_0_valid_out_reg_2_NO_SHIFT_REG),
	.stall_out(rnode_1to2_bb1_sub12_0_stall_out_reg_2_NO_SHIFT_REG),
	.data_in(local_bb1_sub12),
	.data_out(rnode_1to2_bb1_sub12_0_reg_2_NO_SHIFT_REG)
);

defparam rnode_1to2_bb1_sub12_0_reg_2_fifo.DEPTH = 2;
defparam rnode_1to2_bb1_sub12_0_reg_2_fifo.DATA_WIDTH = 32;
defparam rnode_1to2_bb1_sub12_0_reg_2_fifo.ALLOW_FULL_WRITE = 0;
defparam rnode_1to2_bb1_sub12_0_reg_2_fifo.IMPL = "ll_reg";

assign rnode_1to2_bb1_sub12_0_reg_2_inputs_ready_NO_SHIFT_REG = local_bb1_sub12_valid_out;
assign local_bb1_sub12_stall_in = rnode_1to2_bb1_sub12_0_stall_out_reg_2_NO_SHIFT_REG;
assign rnode_1to2_bb1_sub12_0_NO_SHIFT_REG = rnode_1to2_bb1_sub12_0_reg_2_NO_SHIFT_REG;
assign rnode_1to2_bb1_sub12_0_stall_in_reg_2_NO_SHIFT_REG = rnode_1to2_bb1_sub12_0_stall_in_NO_SHIFT_REG;
assign rnode_1to2_bb1_sub12_0_valid_out_NO_SHIFT_REG = rnode_1to2_bb1_sub12_0_valid_out_reg_2_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_156to157_add7_0_valid_out_NO_SHIFT_REG;
 logic rnode_156to157_add7_0_stall_in_NO_SHIFT_REG;
 logic rnode_156to157_add7_0_reg_157_inputs_ready_NO_SHIFT_REG;
 logic rnode_156to157_add7_0_valid_out_reg_157_NO_SHIFT_REG;
 logic rnode_156to157_add7_0_stall_in_reg_157_NO_SHIFT_REG;
 logic rnode_156to157_add7_0_stall_out_reg_157_NO_SHIFT_REG;

acl_data_fifo rnode_156to157_add7_0_reg_157_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_156to157_add7_0_reg_157_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_156to157_add7_0_stall_in_reg_157_NO_SHIFT_REG),
	.valid_out(rnode_156to157_add7_0_valid_out_reg_157_NO_SHIFT_REG),
	.stall_out(rnode_156to157_add7_0_stall_out_reg_157_NO_SHIFT_REG),
	.data_in(),
	.data_out()
);

defparam rnode_156to157_add7_0_reg_157_fifo.DEPTH = 2;
defparam rnode_156to157_add7_0_reg_157_fifo.DATA_WIDTH = 0;
defparam rnode_156to157_add7_0_reg_157_fifo.ALLOW_FULL_WRITE = 0;
defparam rnode_156to157_add7_0_reg_157_fifo.IMPL = "ll_reg";

assign rnode_156to157_add7_0_reg_157_inputs_ready_NO_SHIFT_REG = rnode_1to156_add7_0_valid_out_NO_SHIFT_REG;
assign rnode_1to156_add7_0_stall_in_NO_SHIFT_REG = rnode_156to157_add7_0_stall_out_reg_157_NO_SHIFT_REG;
assign rnode_156to157_add7_0_stall_in_reg_157_NO_SHIFT_REG = rnode_156to157_add7_0_stall_in_NO_SHIFT_REG;
assign rnode_156to157_add7_0_valid_out_NO_SHIFT_REG = rnode_156to157_add7_0_valid_out_reg_157_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_156to157_input_result_0_valid_out_NO_SHIFT_REG;
 logic rnode_156to157_input_result_0_stall_in_NO_SHIFT_REG;
 logic rnode_156to157_input_result_0_reg_157_inputs_ready_NO_SHIFT_REG;
 logic rnode_156to157_input_result_0_valid_out_reg_157_NO_SHIFT_REG;
 logic rnode_156to157_input_result_0_stall_in_reg_157_NO_SHIFT_REG;
 logic rnode_156to157_input_result_0_stall_out_reg_157_NO_SHIFT_REG;

acl_data_fifo rnode_156to157_input_result_0_reg_157_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_156to157_input_result_0_reg_157_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_156to157_input_result_0_stall_in_reg_157_NO_SHIFT_REG),
	.valid_out(rnode_156to157_input_result_0_valid_out_reg_157_NO_SHIFT_REG),
	.stall_out(rnode_156to157_input_result_0_stall_out_reg_157_NO_SHIFT_REG),
	.data_in(),
	.data_out()
);

defparam rnode_156to157_input_result_0_reg_157_fifo.DEPTH = 2;
defparam rnode_156to157_input_result_0_reg_157_fifo.DATA_WIDTH = 0;
defparam rnode_156to157_input_result_0_reg_157_fifo.ALLOW_FULL_WRITE = 0;
defparam rnode_156to157_input_result_0_reg_157_fifo.IMPL = "ll_reg";

assign rnode_156to157_input_result_0_reg_157_inputs_ready_NO_SHIFT_REG = rnode_1to156_input_result_0_valid_out_NO_SHIFT_REG;
assign rnode_1to156_input_result_0_stall_in_NO_SHIFT_REG = rnode_156to157_input_result_0_stall_out_reg_157_NO_SHIFT_REG;
assign rnode_156to157_input_result_0_stall_in_reg_157_NO_SHIFT_REG = rnode_156to157_input_result_0_stall_in_NO_SHIFT_REG;
assign rnode_156to157_input_result_0_valid_out_NO_SHIFT_REG = rnode_156to157_input_result_0_valid_out_reg_157_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb1_cmp_valid_out;
wire local_bb1_cmp_stall_in;
wire local_bb1_cmp_inputs_ready;
wire local_bb1_cmp_stall_local;
wire local_bb1_cmp;

assign local_bb1_cmp_inputs_ready = rnode_1to2_input_global_id_0_0_valid_out_0_NO_SHIFT_REG;
assign local_bb1_cmp = (rnode_1to2_input_global_id_0_0_NO_SHIFT_REG == 32'h0);
assign local_bb1_cmp_valid_out = local_bb1_cmp_inputs_ready;
assign local_bb1_cmp_stall_local = local_bb1_cmp_stall_in;
assign rnode_1to2_input_global_id_0_0_stall_in_0_NO_SHIFT_REG = (|local_bb1_cmp_stall_local);

// Register node:
//  * latency = 130
//  * capacity = 130
 logic rnode_2to132_input_global_id_0_0_valid_out_NO_SHIFT_REG;
 logic rnode_2to132_input_global_id_0_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_2to132_input_global_id_0_0_NO_SHIFT_REG;
 logic rnode_2to132_input_global_id_0_0_reg_132_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_2to132_input_global_id_0_0_reg_132_NO_SHIFT_REG;
 logic rnode_2to132_input_global_id_0_0_valid_out_reg_132_NO_SHIFT_REG;
 logic rnode_2to132_input_global_id_0_0_stall_in_reg_132_NO_SHIFT_REG;
 logic rnode_2to132_input_global_id_0_0_stall_out_reg_132_NO_SHIFT_REG;

acl_data_fifo rnode_2to132_input_global_id_0_0_reg_132_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_2to132_input_global_id_0_0_reg_132_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_2to132_input_global_id_0_0_stall_in_reg_132_NO_SHIFT_REG),
	.valid_out(rnode_2to132_input_global_id_0_0_valid_out_reg_132_NO_SHIFT_REG),
	.stall_out(rnode_2to132_input_global_id_0_0_stall_out_reg_132_NO_SHIFT_REG),
	.data_in(rnode_1to2_input_global_id_0_1_NO_SHIFT_REG),
	.data_out(rnode_2to132_input_global_id_0_0_reg_132_NO_SHIFT_REG)
);

defparam rnode_2to132_input_global_id_0_0_reg_132_fifo.DEPTH = 131;
defparam rnode_2to132_input_global_id_0_0_reg_132_fifo.DATA_WIDTH = 32;
defparam rnode_2to132_input_global_id_0_0_reg_132_fifo.ALLOW_FULL_WRITE = 0;
defparam rnode_2to132_input_global_id_0_0_reg_132_fifo.IMPL = "ram";

assign rnode_2to132_input_global_id_0_0_reg_132_inputs_ready_NO_SHIFT_REG = rnode_1to2_input_global_id_0_0_valid_out_1_NO_SHIFT_REG;
assign rnode_1to2_input_global_id_0_0_stall_in_1_NO_SHIFT_REG = rnode_2to132_input_global_id_0_0_stall_out_reg_132_NO_SHIFT_REG;
assign rnode_2to132_input_global_id_0_0_NO_SHIFT_REG = rnode_2to132_input_global_id_0_0_reg_132_NO_SHIFT_REG;
assign rnode_2to132_input_global_id_0_0_stall_in_reg_132_NO_SHIFT_REG = rnode_2to132_input_global_id_0_0_stall_in_NO_SHIFT_REG;
assign rnode_2to132_input_global_id_0_0_valid_out_NO_SHIFT_REG = rnode_2to132_input_global_id_0_0_valid_out_reg_132_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb1_idxprom13_stall_local;
wire [63:0] local_bb1_idxprom13;

assign local_bb1_idxprom13[32] = rnode_1to2_bb1_sub12_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom13[33] = rnode_1to2_bb1_sub12_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom13[34] = rnode_1to2_bb1_sub12_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom13[35] = rnode_1to2_bb1_sub12_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom13[36] = rnode_1to2_bb1_sub12_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom13[37] = rnode_1to2_bb1_sub12_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom13[38] = rnode_1to2_bb1_sub12_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom13[39] = rnode_1to2_bb1_sub12_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom13[40] = rnode_1to2_bb1_sub12_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom13[41] = rnode_1to2_bb1_sub12_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom13[42] = rnode_1to2_bb1_sub12_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom13[43] = rnode_1to2_bb1_sub12_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom13[44] = rnode_1to2_bb1_sub12_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom13[45] = rnode_1to2_bb1_sub12_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom13[46] = rnode_1to2_bb1_sub12_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom13[47] = rnode_1to2_bb1_sub12_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom13[48] = rnode_1to2_bb1_sub12_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom13[49] = rnode_1to2_bb1_sub12_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom13[50] = rnode_1to2_bb1_sub12_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom13[51] = rnode_1to2_bb1_sub12_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom13[52] = rnode_1to2_bb1_sub12_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom13[53] = rnode_1to2_bb1_sub12_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom13[54] = rnode_1to2_bb1_sub12_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom13[55] = rnode_1to2_bb1_sub12_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom13[56] = rnode_1to2_bb1_sub12_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom13[57] = rnode_1to2_bb1_sub12_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom13[58] = rnode_1to2_bb1_sub12_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom13[59] = rnode_1to2_bb1_sub12_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom13[60] = rnode_1to2_bb1_sub12_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom13[61] = rnode_1to2_bb1_sub12_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom13[62] = rnode_1to2_bb1_sub12_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom13[63] = rnode_1to2_bb1_sub12_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom13[31:0] = rnode_1to2_bb1_sub12_0_NO_SHIFT_REG;

// This section implements a staging register.
// 
wire rstag_2to2_bb1_cmp_valid_out_0;
wire rstag_2to2_bb1_cmp_stall_in_0;
wire rstag_2to2_bb1_cmp_valid_out_1;
wire rstag_2to2_bb1_cmp_stall_in_1;
wire rstag_2to2_bb1_cmp_inputs_ready;
wire rstag_2to2_bb1_cmp_stall_local;
 reg rstag_2to2_bb1_cmp_staging_valid_NO_SHIFT_REG;
wire rstag_2to2_bb1_cmp_combined_valid;
 reg rstag_2to2_bb1_cmp_staging_reg_NO_SHIFT_REG;
wire rstag_2to2_bb1_cmp;
 reg rstag_2to2_bb1_cmp_consumed_0_NO_SHIFT_REG;
 reg rstag_2to2_bb1_cmp_consumed_1_NO_SHIFT_REG;

assign rstag_2to2_bb1_cmp_inputs_ready = local_bb1_cmp_valid_out;
assign rstag_2to2_bb1_cmp = (rstag_2to2_bb1_cmp_staging_valid_NO_SHIFT_REG ? rstag_2to2_bb1_cmp_staging_reg_NO_SHIFT_REG : local_bb1_cmp);
assign rstag_2to2_bb1_cmp_combined_valid = (rstag_2to2_bb1_cmp_staging_valid_NO_SHIFT_REG | rstag_2to2_bb1_cmp_inputs_ready);
assign rstag_2to2_bb1_cmp_stall_local = ((rstag_2to2_bb1_cmp_stall_in_0 & ~(rstag_2to2_bb1_cmp_consumed_0_NO_SHIFT_REG)) | (rstag_2to2_bb1_cmp_stall_in_1 & ~(rstag_2to2_bb1_cmp_consumed_1_NO_SHIFT_REG)));
assign rstag_2to2_bb1_cmp_valid_out_0 = (rstag_2to2_bb1_cmp_combined_valid & ~(rstag_2to2_bb1_cmp_consumed_0_NO_SHIFT_REG));
assign rstag_2to2_bb1_cmp_valid_out_1 = (rstag_2to2_bb1_cmp_combined_valid & ~(rstag_2to2_bb1_cmp_consumed_1_NO_SHIFT_REG));
assign local_bb1_cmp_stall_in = (|rstag_2to2_bb1_cmp_staging_valid_NO_SHIFT_REG);

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		rstag_2to2_bb1_cmp_staging_valid_NO_SHIFT_REG <= 1'b0;
		rstag_2to2_bb1_cmp_staging_reg_NO_SHIFT_REG <= 'x;
	end
	else
	begin
		if (rstag_2to2_bb1_cmp_stall_local)
		begin
			if (~(rstag_2to2_bb1_cmp_staging_valid_NO_SHIFT_REG))
			begin
				rstag_2to2_bb1_cmp_staging_valid_NO_SHIFT_REG <= rstag_2to2_bb1_cmp_inputs_ready;
			end
		end
		else
		begin
			rstag_2to2_bb1_cmp_staging_valid_NO_SHIFT_REG <= 1'b0;
		end
		if (~(rstag_2to2_bb1_cmp_staging_valid_NO_SHIFT_REG))
		begin
			rstag_2to2_bb1_cmp_staging_reg_NO_SHIFT_REG <= local_bb1_cmp;
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		rstag_2to2_bb1_cmp_consumed_0_NO_SHIFT_REG <= 1'b0;
		rstag_2to2_bb1_cmp_consumed_1_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		rstag_2to2_bb1_cmp_consumed_0_NO_SHIFT_REG <= (rstag_2to2_bb1_cmp_combined_valid & (rstag_2to2_bb1_cmp_consumed_0_NO_SHIFT_REG | ~(rstag_2to2_bb1_cmp_stall_in_0)) & rstag_2to2_bb1_cmp_stall_local);
		rstag_2to2_bb1_cmp_consumed_1_NO_SHIFT_REG <= (rstag_2to2_bb1_cmp_combined_valid & (rstag_2to2_bb1_cmp_consumed_1_NO_SHIFT_REG | ~(rstag_2to2_bb1_cmp_stall_in_1)) & rstag_2to2_bb1_cmp_stall_local);
	end
end


// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_132to133_input_global_id_0_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_132to133_input_global_id_0_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_132to133_input_global_id_0_0_NO_SHIFT_REG;
 logic rnode_132to133_input_global_id_0_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_132to133_input_global_id_0_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_132to133_input_global_id_0_1_NO_SHIFT_REG;
 logic rnode_132to133_input_global_id_0_0_reg_133_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_132to133_input_global_id_0_0_reg_133_NO_SHIFT_REG;
 logic rnode_132to133_input_global_id_0_0_valid_out_0_reg_133_NO_SHIFT_REG;
 logic rnode_132to133_input_global_id_0_0_stall_in_0_reg_133_NO_SHIFT_REG;
 logic rnode_132to133_input_global_id_0_0_stall_out_reg_133_NO_SHIFT_REG;
 reg rnode_132to133_input_global_id_0_0_consumed_0_NO_SHIFT_REG;
 reg rnode_132to133_input_global_id_0_0_consumed_1_NO_SHIFT_REG;

acl_data_fifo rnode_132to133_input_global_id_0_0_reg_133_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_132to133_input_global_id_0_0_reg_133_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_132to133_input_global_id_0_0_stall_in_0_reg_133_NO_SHIFT_REG),
	.valid_out(rnode_132to133_input_global_id_0_0_valid_out_0_reg_133_NO_SHIFT_REG),
	.stall_out(rnode_132to133_input_global_id_0_0_stall_out_reg_133_NO_SHIFT_REG),
	.data_in(rnode_2to132_input_global_id_0_0_NO_SHIFT_REG),
	.data_out(rnode_132to133_input_global_id_0_0_reg_133_NO_SHIFT_REG)
);

defparam rnode_132to133_input_global_id_0_0_reg_133_fifo.DEPTH = 1;
defparam rnode_132to133_input_global_id_0_0_reg_133_fifo.DATA_WIDTH = 32;
defparam rnode_132to133_input_global_id_0_0_reg_133_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_132to133_input_global_id_0_0_reg_133_fifo.IMPL = "ll_reg";

assign rnode_132to133_input_global_id_0_0_reg_133_inputs_ready_NO_SHIFT_REG = rnode_2to132_input_global_id_0_0_valid_out_NO_SHIFT_REG;
assign rnode_2to132_input_global_id_0_0_stall_in_NO_SHIFT_REG = rnode_132to133_input_global_id_0_0_stall_out_reg_133_NO_SHIFT_REG;
assign rnode_132to133_input_global_id_0_0_stall_in_0_reg_133_NO_SHIFT_REG = ((rnode_132to133_input_global_id_0_0_stall_in_0_NO_SHIFT_REG & ~(rnode_132to133_input_global_id_0_0_consumed_0_NO_SHIFT_REG)) | (rnode_132to133_input_global_id_0_0_stall_in_1_NO_SHIFT_REG & ~(rnode_132to133_input_global_id_0_0_consumed_1_NO_SHIFT_REG)));
assign rnode_132to133_input_global_id_0_0_valid_out_0_NO_SHIFT_REG = (rnode_132to133_input_global_id_0_0_valid_out_0_reg_133_NO_SHIFT_REG & ~(rnode_132to133_input_global_id_0_0_consumed_0_NO_SHIFT_REG));
assign rnode_132to133_input_global_id_0_0_valid_out_1_NO_SHIFT_REG = (rnode_132to133_input_global_id_0_0_valid_out_0_reg_133_NO_SHIFT_REG & ~(rnode_132to133_input_global_id_0_0_consumed_1_NO_SHIFT_REG));
assign rnode_132to133_input_global_id_0_0_NO_SHIFT_REG = rnode_132to133_input_global_id_0_0_reg_133_NO_SHIFT_REG;
assign rnode_132to133_input_global_id_0_1_NO_SHIFT_REG = rnode_132to133_input_global_id_0_0_reg_133_NO_SHIFT_REG;

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		rnode_132to133_input_global_id_0_0_consumed_0_NO_SHIFT_REG <= 1'b0;
		rnode_132to133_input_global_id_0_0_consumed_1_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		rnode_132to133_input_global_id_0_0_consumed_0_NO_SHIFT_REG <= (rnode_132to133_input_global_id_0_0_valid_out_0_reg_133_NO_SHIFT_REG & (rnode_132to133_input_global_id_0_0_consumed_0_NO_SHIFT_REG | ~(rnode_132to133_input_global_id_0_0_stall_in_0_NO_SHIFT_REG)) & rnode_132to133_input_global_id_0_0_stall_in_0_reg_133_NO_SHIFT_REG);
		rnode_132to133_input_global_id_0_0_consumed_1_NO_SHIFT_REG <= (rnode_132to133_input_global_id_0_0_valid_out_0_reg_133_NO_SHIFT_REG & (rnode_132to133_input_global_id_0_0_consumed_1_NO_SHIFT_REG | ~(rnode_132to133_input_global_id_0_0_stall_in_1_NO_SHIFT_REG)) & rnode_132to133_input_global_id_0_0_stall_in_0_reg_133_NO_SHIFT_REG);
	end
end


// This section implements an unregistered operation.
// 
wire local_bb1_arrayidx14_stall_local;
wire [63:0] local_bb1_arrayidx14;

assign local_bb1_arrayidx14 = ((input_inputArray & 64'hFFFFFFFFFFFFFC00) + (local_bb1_idxprom13 << 6'h2));

// Register node:
//  * latency = 130
//  * capacity = 130
 logic rnode_2to132_bb1_cmp_0_valid_out_NO_SHIFT_REG;
 logic rnode_2to132_bb1_cmp_0_stall_in_NO_SHIFT_REG;
 logic rnode_2to132_bb1_cmp_0_NO_SHIFT_REG;
 logic rnode_2to132_bb1_cmp_0_reg_132_inputs_ready_NO_SHIFT_REG;
 logic rnode_2to132_bb1_cmp_0_reg_132_NO_SHIFT_REG;
 logic rnode_2to132_bb1_cmp_0_valid_out_reg_132_NO_SHIFT_REG;
 logic rnode_2to132_bb1_cmp_0_stall_in_reg_132_NO_SHIFT_REG;
 logic rnode_2to132_bb1_cmp_0_stall_out_reg_132_NO_SHIFT_REG;

acl_data_fifo rnode_2to132_bb1_cmp_0_reg_132_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_2to132_bb1_cmp_0_reg_132_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_2to132_bb1_cmp_0_stall_in_reg_132_NO_SHIFT_REG),
	.valid_out(rnode_2to132_bb1_cmp_0_valid_out_reg_132_NO_SHIFT_REG),
	.stall_out(rnode_2to132_bb1_cmp_0_stall_out_reg_132_NO_SHIFT_REG),
	.data_in(rstag_2to2_bb1_cmp),
	.data_out(rnode_2to132_bb1_cmp_0_reg_132_NO_SHIFT_REG)
);

defparam rnode_2to132_bb1_cmp_0_reg_132_fifo.DEPTH = 131;
defparam rnode_2to132_bb1_cmp_0_reg_132_fifo.DATA_WIDTH = 1;
defparam rnode_2to132_bb1_cmp_0_reg_132_fifo.ALLOW_FULL_WRITE = 0;
defparam rnode_2to132_bb1_cmp_0_reg_132_fifo.IMPL = "ram";

assign rnode_2to132_bb1_cmp_0_reg_132_inputs_ready_NO_SHIFT_REG = rstag_2to2_bb1_cmp_valid_out_0;
assign rstag_2to2_bb1_cmp_stall_in_0 = rnode_2to132_bb1_cmp_0_stall_out_reg_132_NO_SHIFT_REG;
assign rnode_2to132_bb1_cmp_0_NO_SHIFT_REG = rnode_2to132_bb1_cmp_0_reg_132_NO_SHIFT_REG;
assign rnode_2to132_bb1_cmp_0_stall_in_reg_132_NO_SHIFT_REG = rnode_2to132_bb1_cmp_0_stall_in_NO_SHIFT_REG;
assign rnode_2to132_bb1_cmp_0_valid_out_NO_SHIFT_REG = rnode_2to132_bb1_cmp_0_valid_out_reg_132_NO_SHIFT_REG;

// Register node:
//  * latency = 23
//  * capacity = 23
 logic rnode_133to156_input_global_id_0_0_valid_out_NO_SHIFT_REG;
 logic rnode_133to156_input_global_id_0_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_133to156_input_global_id_0_0_NO_SHIFT_REG;
 logic rnode_133to156_input_global_id_0_0_reg_156_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_133to156_input_global_id_0_0_reg_156_NO_SHIFT_REG;
 logic rnode_133to156_input_global_id_0_0_valid_out_reg_156_NO_SHIFT_REG;
 logic rnode_133to156_input_global_id_0_0_stall_in_reg_156_NO_SHIFT_REG;
 logic rnode_133to156_input_global_id_0_0_stall_out_reg_156_NO_SHIFT_REG;

acl_data_fifo rnode_133to156_input_global_id_0_0_reg_156_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_133to156_input_global_id_0_0_reg_156_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_133to156_input_global_id_0_0_stall_in_reg_156_NO_SHIFT_REG),
	.valid_out(rnode_133to156_input_global_id_0_0_valid_out_reg_156_NO_SHIFT_REG),
	.stall_out(rnode_133to156_input_global_id_0_0_stall_out_reg_156_NO_SHIFT_REG),
	.data_in(rnode_132to133_input_global_id_0_1_NO_SHIFT_REG),
	.data_out(rnode_133to156_input_global_id_0_0_reg_156_NO_SHIFT_REG)
);

defparam rnode_133to156_input_global_id_0_0_reg_156_fifo.DEPTH = 24;
defparam rnode_133to156_input_global_id_0_0_reg_156_fifo.DATA_WIDTH = 32;
defparam rnode_133to156_input_global_id_0_0_reg_156_fifo.ALLOW_FULL_WRITE = 0;
defparam rnode_133to156_input_global_id_0_0_reg_156_fifo.IMPL = "ram";

assign rnode_133to156_input_global_id_0_0_reg_156_inputs_ready_NO_SHIFT_REG = rnode_132to133_input_global_id_0_0_valid_out_1_NO_SHIFT_REG;
assign rnode_132to133_input_global_id_0_0_stall_in_1_NO_SHIFT_REG = rnode_133to156_input_global_id_0_0_stall_out_reg_156_NO_SHIFT_REG;
assign rnode_133to156_input_global_id_0_0_NO_SHIFT_REG = rnode_133to156_input_global_id_0_0_reg_156_NO_SHIFT_REG;
assign rnode_133to156_input_global_id_0_0_stall_in_reg_156_NO_SHIFT_REG = rnode_133to156_input_global_id_0_0_stall_in_NO_SHIFT_REG;
assign rnode_133to156_input_global_id_0_0_valid_out_NO_SHIFT_REG = rnode_133to156_input_global_id_0_0_valid_out_reg_156_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb1_memcoalesce_inputArray_bitcast_08_valid_out;
wire local_bb1_memcoalesce_inputArray_bitcast_08_stall_in;
wire local_bb1_memcoalesce_inputArray_bitcast_08_inputs_ready;
wire local_bb1_memcoalesce_inputArray_bitcast_08_stall_local;
wire [63:0] local_bb1_memcoalesce_inputArray_bitcast_08;

assign local_bb1_memcoalesce_inputArray_bitcast_08_inputs_ready = rnode_1to2_bb1_sub12_0_valid_out_NO_SHIFT_REG;
assign local_bb1_memcoalesce_inputArray_bitcast_08 = (local_bb1_arrayidx14 & 64'hFFFFFFFFFFFFFFFC);
assign local_bb1_memcoalesce_inputArray_bitcast_08_valid_out = local_bb1_memcoalesce_inputArray_bitcast_08_inputs_ready;
assign local_bb1_memcoalesce_inputArray_bitcast_08_stall_local = local_bb1_memcoalesce_inputArray_bitcast_08_stall_in;
assign rnode_1to2_bb1_sub12_0_stall_in_NO_SHIFT_REG = (|local_bb1_memcoalesce_inputArray_bitcast_08_stall_local);

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_132to133_bb1_cmp_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_132to133_bb1_cmp_0_stall_in_0_NO_SHIFT_REG;
 logic rnode_132to133_bb1_cmp_0_NO_SHIFT_REG;
 logic rnode_132to133_bb1_cmp_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_132to133_bb1_cmp_0_stall_in_1_NO_SHIFT_REG;
 logic rnode_132to133_bb1_cmp_1_NO_SHIFT_REG;
 logic rnode_132to133_bb1_cmp_0_reg_133_inputs_ready_NO_SHIFT_REG;
 logic rnode_132to133_bb1_cmp_0_reg_133_NO_SHIFT_REG;
 logic rnode_132to133_bb1_cmp_0_valid_out_0_reg_133_NO_SHIFT_REG;
 logic rnode_132to133_bb1_cmp_0_stall_in_0_reg_133_NO_SHIFT_REG;
 logic rnode_132to133_bb1_cmp_0_stall_out_reg_133_NO_SHIFT_REG;
 reg rnode_132to133_bb1_cmp_0_consumed_0_NO_SHIFT_REG;
 reg rnode_132to133_bb1_cmp_0_consumed_1_NO_SHIFT_REG;

acl_data_fifo rnode_132to133_bb1_cmp_0_reg_133_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_132to133_bb1_cmp_0_reg_133_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_132to133_bb1_cmp_0_stall_in_0_reg_133_NO_SHIFT_REG),
	.valid_out(rnode_132to133_bb1_cmp_0_valid_out_0_reg_133_NO_SHIFT_REG),
	.stall_out(rnode_132to133_bb1_cmp_0_stall_out_reg_133_NO_SHIFT_REG),
	.data_in(rnode_2to132_bb1_cmp_0_NO_SHIFT_REG),
	.data_out(rnode_132to133_bb1_cmp_0_reg_133_NO_SHIFT_REG)
);

defparam rnode_132to133_bb1_cmp_0_reg_133_fifo.DEPTH = 1;
defparam rnode_132to133_bb1_cmp_0_reg_133_fifo.DATA_WIDTH = 1;
defparam rnode_132to133_bb1_cmp_0_reg_133_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_132to133_bb1_cmp_0_reg_133_fifo.IMPL = "ll_reg";

assign rnode_132to133_bb1_cmp_0_reg_133_inputs_ready_NO_SHIFT_REG = rnode_2to132_bb1_cmp_0_valid_out_NO_SHIFT_REG;
assign rnode_2to132_bb1_cmp_0_stall_in_NO_SHIFT_REG = rnode_132to133_bb1_cmp_0_stall_out_reg_133_NO_SHIFT_REG;
assign rnode_132to133_bb1_cmp_0_stall_in_0_reg_133_NO_SHIFT_REG = ((rnode_132to133_bb1_cmp_0_stall_in_0_NO_SHIFT_REG & ~(rnode_132to133_bb1_cmp_0_consumed_0_NO_SHIFT_REG)) | (rnode_132to133_bb1_cmp_0_stall_in_1_NO_SHIFT_REG & ~(rnode_132to133_bb1_cmp_0_consumed_1_NO_SHIFT_REG)));
assign rnode_132to133_bb1_cmp_0_valid_out_0_NO_SHIFT_REG = (rnode_132to133_bb1_cmp_0_valid_out_0_reg_133_NO_SHIFT_REG & ~(rnode_132to133_bb1_cmp_0_consumed_0_NO_SHIFT_REG));
assign rnode_132to133_bb1_cmp_0_valid_out_1_NO_SHIFT_REG = (rnode_132to133_bb1_cmp_0_valid_out_0_reg_133_NO_SHIFT_REG & ~(rnode_132to133_bb1_cmp_0_consumed_1_NO_SHIFT_REG));
assign rnode_132to133_bb1_cmp_0_NO_SHIFT_REG = rnode_132to133_bb1_cmp_0_reg_133_NO_SHIFT_REG;
assign rnode_132to133_bb1_cmp_1_NO_SHIFT_REG = rnode_132to133_bb1_cmp_0_reg_133_NO_SHIFT_REG;

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		rnode_132to133_bb1_cmp_0_consumed_0_NO_SHIFT_REG <= 1'b0;
		rnode_132to133_bb1_cmp_0_consumed_1_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		rnode_132to133_bb1_cmp_0_consumed_0_NO_SHIFT_REG <= (rnode_132to133_bb1_cmp_0_valid_out_0_reg_133_NO_SHIFT_REG & (rnode_132to133_bb1_cmp_0_consumed_0_NO_SHIFT_REG | ~(rnode_132to133_bb1_cmp_0_stall_in_0_NO_SHIFT_REG)) & rnode_132to133_bb1_cmp_0_stall_in_0_reg_133_NO_SHIFT_REG);
		rnode_132to133_bb1_cmp_0_consumed_1_NO_SHIFT_REG <= (rnode_132to133_bb1_cmp_0_valid_out_0_reg_133_NO_SHIFT_REG & (rnode_132to133_bb1_cmp_0_consumed_1_NO_SHIFT_REG | ~(rnode_132to133_bb1_cmp_0_stall_in_1_NO_SHIFT_REG)) & rnode_132to133_bb1_cmp_0_stall_in_0_reg_133_NO_SHIFT_REG);
	end
end


// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_156to157_input_global_id_0_0_valid_out_NO_SHIFT_REG;
 logic rnode_156to157_input_global_id_0_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_156to157_input_global_id_0_0_NO_SHIFT_REG;
 logic rnode_156to157_input_global_id_0_0_reg_157_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_156to157_input_global_id_0_0_reg_157_NO_SHIFT_REG;
 logic rnode_156to157_input_global_id_0_0_valid_out_reg_157_NO_SHIFT_REG;
 logic rnode_156to157_input_global_id_0_0_stall_in_reg_157_NO_SHIFT_REG;
 logic rnode_156to157_input_global_id_0_0_stall_out_reg_157_NO_SHIFT_REG;

acl_data_fifo rnode_156to157_input_global_id_0_0_reg_157_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_156to157_input_global_id_0_0_reg_157_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_156to157_input_global_id_0_0_stall_in_reg_157_NO_SHIFT_REG),
	.valid_out(rnode_156to157_input_global_id_0_0_valid_out_reg_157_NO_SHIFT_REG),
	.stall_out(rnode_156to157_input_global_id_0_0_stall_out_reg_157_NO_SHIFT_REG),
	.data_in(rnode_133to156_input_global_id_0_0_NO_SHIFT_REG),
	.data_out(rnode_156to157_input_global_id_0_0_reg_157_NO_SHIFT_REG)
);

defparam rnode_156to157_input_global_id_0_0_reg_157_fifo.DEPTH = 2;
defparam rnode_156to157_input_global_id_0_0_reg_157_fifo.DATA_WIDTH = 32;
defparam rnode_156to157_input_global_id_0_0_reg_157_fifo.ALLOW_FULL_WRITE = 0;
defparam rnode_156to157_input_global_id_0_0_reg_157_fifo.IMPL = "ll_reg";

assign rnode_156to157_input_global_id_0_0_reg_157_inputs_ready_NO_SHIFT_REG = rnode_133to156_input_global_id_0_0_valid_out_NO_SHIFT_REG;
assign rnode_133to156_input_global_id_0_0_stall_in_NO_SHIFT_REG = rnode_156to157_input_global_id_0_0_stall_out_reg_157_NO_SHIFT_REG;
assign rnode_156to157_input_global_id_0_0_NO_SHIFT_REG = rnode_156to157_input_global_id_0_0_reg_157_NO_SHIFT_REG;
assign rnode_156to157_input_global_id_0_0_stall_in_reg_157_NO_SHIFT_REG = rnode_156to157_input_global_id_0_0_stall_in_NO_SHIFT_REG;
assign rnode_156to157_input_global_id_0_0_valid_out_NO_SHIFT_REG = rnode_156to157_input_global_id_0_0_valid_out_reg_157_NO_SHIFT_REG;

// This section implements a registered operation.
// 
wire local_bb1_ld_memcoalesce_inputArray_load_09_inputs_ready;
 reg local_bb1_ld_memcoalesce_inputArray_load_09_valid_out_NO_SHIFT_REG;
wire local_bb1_ld_memcoalesce_inputArray_load_09_stall_in;
wire local_bb1_ld_memcoalesce_inputArray_load_09_output_regs_ready;
wire local_bb1_ld_memcoalesce_inputArray_load_09_fu_stall_out;
wire local_bb1_ld_memcoalesce_inputArray_load_09_fu_valid_out;
wire [127:0] local_bb1_ld_memcoalesce_inputArray_load_09_lsu_dataout;
 reg [127:0] local_bb1_ld_memcoalesce_inputArray_load_09_NO_SHIFT_REG;
wire local_bb1_ld_memcoalesce_inputArray_load_09_causedstall;

lsu_top lsu_local_bb1_ld_memcoalesce_inputArray_load_09 (
	.clock(clock),
	.clock2x(clock2x),
	.resetn(resetn),
	.flush(start),
	.stream_base_addr(),
	.stream_size(),
	.stream_reset(),
	.o_stall(local_bb1_ld_memcoalesce_inputArray_load_09_fu_stall_out),
	.i_valid(local_bb1_ld_memcoalesce_inputArray_load_09_inputs_ready),
	.i_address((local_bb1_memcoalesce_inputArray_bitcast_08 & 64'hFFFFFFFFFFFFFFFC)),
	.i_writedata(),
	.i_cmpdata(),
	.i_predicate(rstag_2to2_bb1_cmp),
	.i_bitwiseor(64'h0),
	.i_byteenable(),
	.i_stall(~(local_bb1_ld_memcoalesce_inputArray_load_09_output_regs_ready)),
	.o_valid(local_bb1_ld_memcoalesce_inputArray_load_09_fu_valid_out),
	.o_readdata(local_bb1_ld_memcoalesce_inputArray_load_09_lsu_dataout),
	.o_input_fifo_depth(),
	.o_writeack(),
	.i_atomic_op(3'h0),
	.o_active(local_bb1_ld_memcoalesce_inputArray_load_09_active),
	.avm_address(avm_local_bb1_ld_memcoalesce_inputArray_load_09_address),
	.avm_read(avm_local_bb1_ld_memcoalesce_inputArray_load_09_read),
	.avm_enable(avm_local_bb1_ld_memcoalesce_inputArray_load_09_enable),
	.avm_readdata(avm_local_bb1_ld_memcoalesce_inputArray_load_09_readdata),
	.avm_write(avm_local_bb1_ld_memcoalesce_inputArray_load_09_write),
	.avm_writeack(avm_local_bb1_ld_memcoalesce_inputArray_load_09_writeack),
	.avm_burstcount(avm_local_bb1_ld_memcoalesce_inputArray_load_09_burstcount),
	.avm_writedata(avm_local_bb1_ld_memcoalesce_inputArray_load_09_writedata),
	.avm_byteenable(avm_local_bb1_ld_memcoalesce_inputArray_load_09_byteenable),
	.avm_waitrequest(avm_local_bb1_ld_memcoalesce_inputArray_load_09_waitrequest),
	.avm_readdatavalid(avm_local_bb1_ld_memcoalesce_inputArray_load_09_readdatavalid),
	.profile_bw(),
	.profile_bw_incr(),
	.profile_total_ivalid(),
	.profile_total_req(),
	.profile_i_stall_count(),
	.profile_o_stall_count(),
	.profile_avm_readwrite_count(),
	.profile_avm_burstcount_total(),
	.profile_avm_burstcount_total_incr(),
	.profile_req_cache_hit_count(),
	.profile_extra_unaligned_reqs(),
	.profile_avm_stall()
);

defparam lsu_local_bb1_ld_memcoalesce_inputArray_load_09.AWIDTH = 30;
defparam lsu_local_bb1_ld_memcoalesce_inputArray_load_09.WIDTH_BYTES = 16;
defparam lsu_local_bb1_ld_memcoalesce_inputArray_load_09.MWIDTH_BYTES = 32;
defparam lsu_local_bb1_ld_memcoalesce_inputArray_load_09.WRITEDATAWIDTH_BYTES = 32;
defparam lsu_local_bb1_ld_memcoalesce_inputArray_load_09.ALIGNMENT_BYTES = 4;
defparam lsu_local_bb1_ld_memcoalesce_inputArray_load_09.READ = 1;
defparam lsu_local_bb1_ld_memcoalesce_inputArray_load_09.ATOMIC = 0;
defparam lsu_local_bb1_ld_memcoalesce_inputArray_load_09.WIDTH = 128;
defparam lsu_local_bb1_ld_memcoalesce_inputArray_load_09.MWIDTH = 256;
defparam lsu_local_bb1_ld_memcoalesce_inputArray_load_09.ATOMIC_WIDTH = 3;
defparam lsu_local_bb1_ld_memcoalesce_inputArray_load_09.BURSTCOUNT_WIDTH = 5;
defparam lsu_local_bb1_ld_memcoalesce_inputArray_load_09.KERNEL_SIDE_MEM_LATENCY = 131;
defparam lsu_local_bb1_ld_memcoalesce_inputArray_load_09.MEMORY_SIDE_MEM_LATENCY = 57;
defparam lsu_local_bb1_ld_memcoalesce_inputArray_load_09.USE_WRITE_ACK = 0;
defparam lsu_local_bb1_ld_memcoalesce_inputArray_load_09.ENABLE_BANKED_MEMORY = 0;
defparam lsu_local_bb1_ld_memcoalesce_inputArray_load_09.ABITS_PER_LMEM_BANK = 0;
defparam lsu_local_bb1_ld_memcoalesce_inputArray_load_09.NUMBER_BANKS = 1;
defparam lsu_local_bb1_ld_memcoalesce_inputArray_load_09.LMEM_ADDR_PERMUTATION_STYLE = 0;
defparam lsu_local_bb1_ld_memcoalesce_inputArray_load_09.INTENDED_DEVICE_FAMILY = "Cyclone V";
defparam lsu_local_bb1_ld_memcoalesce_inputArray_load_09.USEINPUTFIFO = 0;
defparam lsu_local_bb1_ld_memcoalesce_inputArray_load_09.USECACHING = 0;
defparam lsu_local_bb1_ld_memcoalesce_inputArray_load_09.USEOUTPUTFIFO = 1;
defparam lsu_local_bb1_ld_memcoalesce_inputArray_load_09.FORCE_NOP_SUPPORT = 0;
defparam lsu_local_bb1_ld_memcoalesce_inputArray_load_09.ADDRSPACE = 1;
defparam lsu_local_bb1_ld_memcoalesce_inputArray_load_09.STYLE = "BURST-NON-ALIGNED";

assign local_bb1_ld_memcoalesce_inputArray_load_09_inputs_ready = (local_bb1_memcoalesce_inputArray_bitcast_08_valid_out & rstag_2to2_bb1_cmp_valid_out_1);
assign local_bb1_ld_memcoalesce_inputArray_load_09_output_regs_ready = (&(~(local_bb1_ld_memcoalesce_inputArray_load_09_valid_out_NO_SHIFT_REG) | ~(local_bb1_ld_memcoalesce_inputArray_load_09_stall_in)));
assign local_bb1_memcoalesce_inputArray_bitcast_08_stall_in = (local_bb1_ld_memcoalesce_inputArray_load_09_fu_stall_out | ~(local_bb1_ld_memcoalesce_inputArray_load_09_inputs_ready));
assign rstag_2to2_bb1_cmp_stall_in_1 = (local_bb1_ld_memcoalesce_inputArray_load_09_fu_stall_out | ~(local_bb1_ld_memcoalesce_inputArray_load_09_inputs_ready));
assign local_bb1_ld_memcoalesce_inputArray_load_09_causedstall = (local_bb1_ld_memcoalesce_inputArray_load_09_inputs_ready && (local_bb1_ld_memcoalesce_inputArray_load_09_fu_stall_out && !(~(local_bb1_ld_memcoalesce_inputArray_load_09_output_regs_ready))));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb1_ld_memcoalesce_inputArray_load_09_NO_SHIFT_REG <= 'x;
		local_bb1_ld_memcoalesce_inputArray_load_09_valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (local_bb1_ld_memcoalesce_inputArray_load_09_output_regs_ready)
		begin
			local_bb1_ld_memcoalesce_inputArray_load_09_NO_SHIFT_REG <= local_bb1_ld_memcoalesce_inputArray_load_09_lsu_dataout;
			local_bb1_ld_memcoalesce_inputArray_load_09_valid_out_NO_SHIFT_REG <= local_bb1_ld_memcoalesce_inputArray_load_09_fu_valid_out;
		end
		else
		begin
			if (~(local_bb1_ld_memcoalesce_inputArray_load_09_stall_in))
			begin
				local_bb1_ld_memcoalesce_inputArray_load_09_valid_out_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end


// This section implements an unregistered operation.
// 
wire local_bb1_c0_eni1_stall_local;
wire [191:0] local_bb1_c0_eni1;

assign local_bb1_c0_eni1[7:0] = 8'bx;
assign local_bb1_c0_eni1[8] = rnode_132to133_bb1_cmp_0_NO_SHIFT_REG;
assign local_bb1_c0_eni1[191:9] = 183'bx;

// Register node:
//  * latency = 23
//  * capacity = 23
 logic rnode_133to156_bb1_cmp_0_valid_out_NO_SHIFT_REG;
 logic rnode_133to156_bb1_cmp_0_stall_in_NO_SHIFT_REG;
 logic rnode_133to156_bb1_cmp_0_NO_SHIFT_REG;
 logic rnode_133to156_bb1_cmp_0_reg_156_inputs_ready_NO_SHIFT_REG;
 logic rnode_133to156_bb1_cmp_0_reg_156_NO_SHIFT_REG;
 logic rnode_133to156_bb1_cmp_0_valid_out_reg_156_NO_SHIFT_REG;
 logic rnode_133to156_bb1_cmp_0_stall_in_reg_156_NO_SHIFT_REG;
 logic rnode_133to156_bb1_cmp_0_stall_out_reg_156_NO_SHIFT_REG;

acl_data_fifo rnode_133to156_bb1_cmp_0_reg_156_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_133to156_bb1_cmp_0_reg_156_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_133to156_bb1_cmp_0_stall_in_reg_156_NO_SHIFT_REG),
	.valid_out(rnode_133to156_bb1_cmp_0_valid_out_reg_156_NO_SHIFT_REG),
	.stall_out(rnode_133to156_bb1_cmp_0_stall_out_reg_156_NO_SHIFT_REG),
	.data_in(rnode_132to133_bb1_cmp_1_NO_SHIFT_REG),
	.data_out(rnode_133to156_bb1_cmp_0_reg_156_NO_SHIFT_REG)
);

defparam rnode_133to156_bb1_cmp_0_reg_156_fifo.DEPTH = 24;
defparam rnode_133to156_bb1_cmp_0_reg_156_fifo.DATA_WIDTH = 1;
defparam rnode_133to156_bb1_cmp_0_reg_156_fifo.ALLOW_FULL_WRITE = 0;
defparam rnode_133to156_bb1_cmp_0_reg_156_fifo.IMPL = "ram";

assign rnode_133to156_bb1_cmp_0_reg_156_inputs_ready_NO_SHIFT_REG = rnode_132to133_bb1_cmp_0_valid_out_1_NO_SHIFT_REG;
assign rnode_132to133_bb1_cmp_0_stall_in_1_NO_SHIFT_REG = rnode_133to156_bb1_cmp_0_stall_out_reg_156_NO_SHIFT_REG;
assign rnode_133to156_bb1_cmp_0_NO_SHIFT_REG = rnode_133to156_bb1_cmp_0_reg_156_NO_SHIFT_REG;
assign rnode_133to156_bb1_cmp_0_stall_in_reg_156_NO_SHIFT_REG = rnode_133to156_bb1_cmp_0_stall_in_NO_SHIFT_REG;
assign rnode_133to156_bb1_cmp_0_valid_out_NO_SHIFT_REG = rnode_133to156_bb1_cmp_0_valid_out_reg_156_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb1_idxprom17_stall_local;
wire [63:0] local_bb1_idxprom17;

assign local_bb1_idxprom17[32] = rnode_156to157_input_global_id_0_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom17[33] = rnode_156to157_input_global_id_0_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom17[34] = rnode_156to157_input_global_id_0_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom17[35] = rnode_156to157_input_global_id_0_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom17[36] = rnode_156to157_input_global_id_0_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom17[37] = rnode_156to157_input_global_id_0_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom17[38] = rnode_156to157_input_global_id_0_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom17[39] = rnode_156to157_input_global_id_0_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom17[40] = rnode_156to157_input_global_id_0_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom17[41] = rnode_156to157_input_global_id_0_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom17[42] = rnode_156to157_input_global_id_0_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom17[43] = rnode_156to157_input_global_id_0_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom17[44] = rnode_156to157_input_global_id_0_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom17[45] = rnode_156to157_input_global_id_0_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom17[46] = rnode_156to157_input_global_id_0_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom17[47] = rnode_156to157_input_global_id_0_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom17[48] = rnode_156to157_input_global_id_0_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom17[49] = rnode_156to157_input_global_id_0_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom17[50] = rnode_156to157_input_global_id_0_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom17[51] = rnode_156to157_input_global_id_0_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom17[52] = rnode_156to157_input_global_id_0_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom17[53] = rnode_156to157_input_global_id_0_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom17[54] = rnode_156to157_input_global_id_0_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom17[55] = rnode_156to157_input_global_id_0_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom17[56] = rnode_156to157_input_global_id_0_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom17[57] = rnode_156to157_input_global_id_0_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom17[58] = rnode_156to157_input_global_id_0_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom17[59] = rnode_156to157_input_global_id_0_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom17[60] = rnode_156to157_input_global_id_0_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom17[61] = rnode_156to157_input_global_id_0_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom17[62] = rnode_156to157_input_global_id_0_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom17[63] = rnode_156to157_input_global_id_0_0_NO_SHIFT_REG[31];
assign local_bb1_idxprom17[31:0] = rnode_156to157_input_global_id_0_0_NO_SHIFT_REG;

// This section implements a staging register.
// 
wire rstag_133to133_bb1_ld_memcoalesce_inputArray_load_09_valid_out;
wire rstag_133to133_bb1_ld_memcoalesce_inputArray_load_09_stall_in;
wire rstag_133to133_bb1_ld_memcoalesce_inputArray_load_09_inputs_ready;
wire rstag_133to133_bb1_ld_memcoalesce_inputArray_load_09_stall_local;
 reg rstag_133to133_bb1_ld_memcoalesce_inputArray_load_09_staging_valid_NO_SHIFT_REG;
wire rstag_133to133_bb1_ld_memcoalesce_inputArray_load_09_combined_valid;
 reg [127:0] rstag_133to133_bb1_ld_memcoalesce_inputArray_load_09_staging_reg_NO_SHIFT_REG;
wire [127:0] rstag_133to133_bb1_ld_memcoalesce_inputArray_load_09;

assign rstag_133to133_bb1_ld_memcoalesce_inputArray_load_09_inputs_ready = local_bb1_ld_memcoalesce_inputArray_load_09_valid_out_NO_SHIFT_REG;
assign rstag_133to133_bb1_ld_memcoalesce_inputArray_load_09 = (rstag_133to133_bb1_ld_memcoalesce_inputArray_load_09_staging_valid_NO_SHIFT_REG ? rstag_133to133_bb1_ld_memcoalesce_inputArray_load_09_staging_reg_NO_SHIFT_REG : local_bb1_ld_memcoalesce_inputArray_load_09_NO_SHIFT_REG);
assign rstag_133to133_bb1_ld_memcoalesce_inputArray_load_09_combined_valid = (rstag_133to133_bb1_ld_memcoalesce_inputArray_load_09_staging_valid_NO_SHIFT_REG | rstag_133to133_bb1_ld_memcoalesce_inputArray_load_09_inputs_ready);
assign rstag_133to133_bb1_ld_memcoalesce_inputArray_load_09_valid_out = rstag_133to133_bb1_ld_memcoalesce_inputArray_load_09_combined_valid;
assign rstag_133to133_bb1_ld_memcoalesce_inputArray_load_09_stall_local = rstag_133to133_bb1_ld_memcoalesce_inputArray_load_09_stall_in;
assign local_bb1_ld_memcoalesce_inputArray_load_09_stall_in = (|rstag_133to133_bb1_ld_memcoalesce_inputArray_load_09_staging_valid_NO_SHIFT_REG);

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		rstag_133to133_bb1_ld_memcoalesce_inputArray_load_09_staging_valid_NO_SHIFT_REG <= 1'b0;
		rstag_133to133_bb1_ld_memcoalesce_inputArray_load_09_staging_reg_NO_SHIFT_REG <= 'x;
	end
	else
	begin
		if (rstag_133to133_bb1_ld_memcoalesce_inputArray_load_09_stall_local)
		begin
			if (~(rstag_133to133_bb1_ld_memcoalesce_inputArray_load_09_staging_valid_NO_SHIFT_REG))
			begin
				rstag_133to133_bb1_ld_memcoalesce_inputArray_load_09_staging_valid_NO_SHIFT_REG <= rstag_133to133_bb1_ld_memcoalesce_inputArray_load_09_inputs_ready;
			end
		end
		else
		begin
			rstag_133to133_bb1_ld_memcoalesce_inputArray_load_09_staging_valid_NO_SHIFT_REG <= 1'b0;
		end
		if (~(rstag_133to133_bb1_ld_memcoalesce_inputArray_load_09_staging_valid_NO_SHIFT_REG))
		begin
			rstag_133to133_bb1_ld_memcoalesce_inputArray_load_09_staging_reg_NO_SHIFT_REG <= local_bb1_ld_memcoalesce_inputArray_load_09_NO_SHIFT_REG;
		end
	end
end


// This section implements an unregistered operation.
// 
wire local_bb1_c0_eni2_stall_local;
wire [191:0] local_bb1_c0_eni2;

assign local_bb1_c0_eni2[31:0] = local_bb1_c0_eni1[31:0];
assign local_bb1_c0_eni2[63:32] = rnode_132to133_input_global_id_0_0_NO_SHIFT_REG;
assign local_bb1_c0_eni2[191:64] = local_bb1_c0_eni1[191:64];

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_156to157_bb1_cmp_0_valid_out_NO_SHIFT_REG;
 logic rnode_156to157_bb1_cmp_0_stall_in_NO_SHIFT_REG;
 logic rnode_156to157_bb1_cmp_0_NO_SHIFT_REG;
 logic rnode_156to157_bb1_cmp_0_reg_157_inputs_ready_NO_SHIFT_REG;
 logic rnode_156to157_bb1_cmp_0_reg_157_NO_SHIFT_REG;
 logic rnode_156to157_bb1_cmp_0_valid_out_reg_157_NO_SHIFT_REG;
 logic rnode_156to157_bb1_cmp_0_stall_in_reg_157_NO_SHIFT_REG;
 logic rnode_156to157_bb1_cmp_0_stall_out_reg_157_NO_SHIFT_REG;

acl_data_fifo rnode_156to157_bb1_cmp_0_reg_157_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_156to157_bb1_cmp_0_reg_157_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_156to157_bb1_cmp_0_stall_in_reg_157_NO_SHIFT_REG),
	.valid_out(rnode_156to157_bb1_cmp_0_valid_out_reg_157_NO_SHIFT_REG),
	.stall_out(rnode_156to157_bb1_cmp_0_stall_out_reg_157_NO_SHIFT_REG),
	.data_in(rnode_133to156_bb1_cmp_0_NO_SHIFT_REG),
	.data_out(rnode_156to157_bb1_cmp_0_reg_157_NO_SHIFT_REG)
);

defparam rnode_156to157_bb1_cmp_0_reg_157_fifo.DEPTH = 2;
defparam rnode_156to157_bb1_cmp_0_reg_157_fifo.DATA_WIDTH = 1;
defparam rnode_156to157_bb1_cmp_0_reg_157_fifo.ALLOW_FULL_WRITE = 0;
defparam rnode_156to157_bb1_cmp_0_reg_157_fifo.IMPL = "ll_reg";

assign rnode_156to157_bb1_cmp_0_reg_157_inputs_ready_NO_SHIFT_REG = rnode_133to156_bb1_cmp_0_valid_out_NO_SHIFT_REG;
assign rnode_133to156_bb1_cmp_0_stall_in_NO_SHIFT_REG = rnode_156to157_bb1_cmp_0_stall_out_reg_157_NO_SHIFT_REG;
assign rnode_156to157_bb1_cmp_0_NO_SHIFT_REG = rnode_156to157_bb1_cmp_0_reg_157_NO_SHIFT_REG;
assign rnode_156to157_bb1_cmp_0_stall_in_reg_157_NO_SHIFT_REG = rnode_156to157_bb1_cmp_0_stall_in_NO_SHIFT_REG;
assign rnode_156to157_bb1_cmp_0_valid_out_NO_SHIFT_REG = rnode_156to157_bb1_cmp_0_valid_out_reg_157_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb1_arrayidx23_valid_out;
wire local_bb1_arrayidx23_stall_in;
wire local_bb1_arrayidx23_inputs_ready;
wire local_bb1_arrayidx23_stall_local;
wire [63:0] local_bb1_arrayidx23;

assign local_bb1_arrayidx23_inputs_ready = rnode_156to157_input_global_id_0_0_valid_out_NO_SHIFT_REG;
assign local_bb1_arrayidx23 = ((input_result & 64'hFFFFFFFFFFFFFC00) + (local_bb1_idxprom17 << 6'h2));
assign local_bb1_arrayidx23_valid_out = local_bb1_arrayidx23_inputs_ready;
assign local_bb1_arrayidx23_stall_local = local_bb1_arrayidx23_stall_in;
assign rnode_156to157_input_global_id_0_0_stall_in_NO_SHIFT_REG = (|local_bb1_arrayidx23_stall_local);

// This section implements an unregistered operation.
// 
wire local_bb1_c0_eni3_valid_out;
wire local_bb1_c0_eni3_stall_in;
wire local_bb1_c0_eni3_inputs_ready;
wire local_bb1_c0_eni3_stall_local;
wire [191:0] local_bb1_c0_eni3;

assign local_bb1_c0_eni3_inputs_ready = (rnode_132to133_input_global_id_0_0_valid_out_0_NO_SHIFT_REG & rstag_133to133_bb1_ld_memcoalesce_inputArray_load_09_valid_out & rnode_132to133_bb1_cmp_0_valid_out_0_NO_SHIFT_REG);
assign local_bb1_c0_eni3[63:0] = local_bb1_c0_eni2[63:0];
assign local_bb1_c0_eni3[191:64] = rstag_133to133_bb1_ld_memcoalesce_inputArray_load_09;
assign local_bb1_c0_eni3_valid_out = local_bb1_c0_eni3_inputs_ready;
assign local_bb1_c0_eni3_stall_local = local_bb1_c0_eni3_stall_in;
assign rnode_132to133_input_global_id_0_0_stall_in_0_NO_SHIFT_REG = (local_bb1_c0_eni3_stall_local | ~(local_bb1_c0_eni3_inputs_ready));
assign rstag_133to133_bb1_ld_memcoalesce_inputArray_load_09_stall_in = (local_bb1_c0_eni3_stall_local | ~(local_bb1_c0_eni3_inputs_ready));
assign rnode_132to133_bb1_cmp_0_stall_in_0_NO_SHIFT_REG = (local_bb1_c0_eni3_stall_local | ~(local_bb1_c0_eni3_inputs_ready));

// This section implements a registered operation.
// 
wire local_bb1_c0_enter_c0_eni3_inputs_ready;
 reg local_bb1_c0_enter_c0_eni3_valid_out_0_NO_SHIFT_REG;
wire local_bb1_c0_enter_c0_eni3_stall_in_0;
 reg local_bb1_c0_enter_c0_eni3_valid_out_1_NO_SHIFT_REG;
wire local_bb1_c0_enter_c0_eni3_stall_in_1;
 reg local_bb1_c0_enter_c0_eni3_valid_out_2_NO_SHIFT_REG;
wire local_bb1_c0_enter_c0_eni3_stall_in_2;
 reg local_bb1_c0_enter_c0_eni3_valid_out_3_NO_SHIFT_REG;
wire local_bb1_c0_enter_c0_eni3_stall_in_3;
wire local_bb1_c0_enter_c0_eni3_output_regs_ready;
 reg [191:0] local_bb1_c0_enter_c0_eni3_NO_SHIFT_REG;
wire local_bb1_c0_enter_c0_eni3_input_accepted;
 reg local_bb1_c0_enter_c0_eni3_valid_bit_NO_SHIFT_REG;
wire local_bb1_c0_exit_c0_exi2_entry_stall;
wire local_bb1_c0_exit_c0_exi2_output_regs_ready;
wire local_bb1_c0_exit_c0_exi2_valid_in;
wire local_bb1_c0_exit_c0_exi2_phases;
wire local_bb1_c0_enter_c0_eni3_inc_pipelined_thread;
wire local_bb1_c0_enter_c0_eni3_dec_pipelined_thread;
wire local_bb1_c0_enter_c0_eni3_causedstall;

assign local_bb1_c0_enter_c0_eni3_inputs_ready = local_bb1_c0_eni3_valid_out;
assign local_bb1_c0_enter_c0_eni3_output_regs_ready = 1'b1;
assign local_bb1_c0_enter_c0_eni3_input_accepted = (local_bb1_c0_enter_c0_eni3_inputs_ready && !(local_bb1_c0_exit_c0_exi2_entry_stall));
assign local_bb1_c0_enter_c0_eni3_inc_pipelined_thread = 1'b1;
assign local_bb1_c0_enter_c0_eni3_dec_pipelined_thread = ~(1'b0);
assign local_bb1_c0_eni3_stall_in = ((~(local_bb1_c0_enter_c0_eni3_inputs_ready) | local_bb1_c0_exit_c0_exi2_entry_stall) | ~(1'b1));
assign local_bb1_c0_enter_c0_eni3_causedstall = (1'b1 && ((~(local_bb1_c0_enter_c0_eni3_inputs_ready) | local_bb1_c0_exit_c0_exi2_entry_stall) && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb1_c0_enter_c0_eni3_valid_bit_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		local_bb1_c0_enter_c0_eni3_valid_bit_NO_SHIFT_REG <= local_bb1_c0_enter_c0_eni3_input_accepted;
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb1_c0_enter_c0_eni3_NO_SHIFT_REG <= 'x;
		local_bb1_c0_enter_c0_eni3_valid_out_0_NO_SHIFT_REG <= 1'b0;
		local_bb1_c0_enter_c0_eni3_valid_out_1_NO_SHIFT_REG <= 1'b0;
		local_bb1_c0_enter_c0_eni3_valid_out_2_NO_SHIFT_REG <= 1'b0;
		local_bb1_c0_enter_c0_eni3_valid_out_3_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (local_bb1_c0_enter_c0_eni3_output_regs_ready)
		begin
			local_bb1_c0_enter_c0_eni3_NO_SHIFT_REG <= local_bb1_c0_eni3;
			local_bb1_c0_enter_c0_eni3_valid_out_0_NO_SHIFT_REG <= 1'b1;
			local_bb1_c0_enter_c0_eni3_valid_out_1_NO_SHIFT_REG <= 1'b1;
			local_bb1_c0_enter_c0_eni3_valid_out_2_NO_SHIFT_REG <= 1'b1;
			local_bb1_c0_enter_c0_eni3_valid_out_3_NO_SHIFT_REG <= 1'b1;
		end
		else
		begin
			if (~(local_bb1_c0_enter_c0_eni3_stall_in_0))
			begin
				local_bb1_c0_enter_c0_eni3_valid_out_0_NO_SHIFT_REG <= 1'b0;
			end
			if (~(local_bb1_c0_enter_c0_eni3_stall_in_1))
			begin
				local_bb1_c0_enter_c0_eni3_valid_out_1_NO_SHIFT_REG <= 1'b0;
			end
			if (~(local_bb1_c0_enter_c0_eni3_stall_in_2))
			begin
				local_bb1_c0_enter_c0_eni3_valid_out_2_NO_SHIFT_REG <= 1'b0;
			end
			if (~(local_bb1_c0_enter_c0_eni3_stall_in_3))
			begin
				local_bb1_c0_enter_c0_eni3_valid_out_3_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end


// This section implements an unregistered operation.
// 
wire local_bb1_c0_ene1_valid_out;
wire local_bb1_c0_ene1_stall_in;
wire local_bb1_c0_ene1_inputs_ready;
wire local_bb1_c0_ene1_stall_local;
wire local_bb1_c0_ene1;

assign local_bb1_c0_ene1_inputs_ready = local_bb1_c0_enter_c0_eni3_valid_out_0_NO_SHIFT_REG;
assign local_bb1_c0_ene1 = local_bb1_c0_enter_c0_eni3_NO_SHIFT_REG[8];
assign local_bb1_c0_ene1_valid_out = 1'b1;
assign local_bb1_c0_enter_c0_eni3_stall_in_0 = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb1_c0_ene2_stall_local;
wire [31:0] local_bb1_c0_ene2;

assign local_bb1_c0_ene2 = local_bb1_c0_enter_c0_eni3_NO_SHIFT_REG[63:32];

// This section implements an unregistered operation.
// 
wire local_bb1_c0_ene3_stall_local;
wire [127:0] local_bb1_c0_ene3;

assign local_bb1_c0_ene3 = local_bb1_c0_enter_c0_eni3_NO_SHIFT_REG[191:64];

// This section implements an unregistered operation.
// 
wire SFC_1_VALID_134_134_0_valid_out;
wire SFC_1_VALID_134_134_0_stall_in;
wire SFC_1_VALID_134_134_0_inputs_ready;
wire SFC_1_VALID_134_134_0_stall_local;
wire SFC_1_VALID_134_134_0;

assign SFC_1_VALID_134_134_0_inputs_ready = local_bb1_c0_enter_c0_eni3_valid_out_3_NO_SHIFT_REG;
assign SFC_1_VALID_134_134_0 = local_bb1_c0_enter_c0_eni3_valid_bit_NO_SHIFT_REG;
assign SFC_1_VALID_134_134_0_valid_out = 1'b1;
assign local_bb1_c0_enter_c0_eni3_stall_in_3 = 1'b0;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_134to135_bb1_c0_ene1_0_valid_out_NO_SHIFT_REG;
 logic rnode_134to135_bb1_c0_ene1_0_stall_in_NO_SHIFT_REG;
 logic rnode_134to135_bb1_c0_ene1_0_NO_SHIFT_REG;
 logic rnode_134to135_bb1_c0_ene1_0_reg_135_inputs_ready_NO_SHIFT_REG;
 logic rnode_134to135_bb1_c0_ene1_0_reg_135_NO_SHIFT_REG;
 logic rnode_134to135_bb1_c0_ene1_0_valid_out_reg_135_NO_SHIFT_REG;
 logic rnode_134to135_bb1_c0_ene1_0_stall_in_reg_135_NO_SHIFT_REG;
 logic rnode_134to135_bb1_c0_ene1_0_stall_out_reg_135_NO_SHIFT_REG;

acl_data_fifo rnode_134to135_bb1_c0_ene1_0_reg_135_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_134to135_bb1_c0_ene1_0_reg_135_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_134to135_bb1_c0_ene1_0_stall_in_reg_135_NO_SHIFT_REG),
	.valid_out(rnode_134to135_bb1_c0_ene1_0_valid_out_reg_135_NO_SHIFT_REG),
	.stall_out(rnode_134to135_bb1_c0_ene1_0_stall_out_reg_135_NO_SHIFT_REG),
	.data_in(local_bb1_c0_ene1),
	.data_out(rnode_134to135_bb1_c0_ene1_0_reg_135_NO_SHIFT_REG)
);

defparam rnode_134to135_bb1_c0_ene1_0_reg_135_fifo.DEPTH = 1;
defparam rnode_134to135_bb1_c0_ene1_0_reg_135_fifo.DATA_WIDTH = 1;
defparam rnode_134to135_bb1_c0_ene1_0_reg_135_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_134to135_bb1_c0_ene1_0_reg_135_fifo.IMPL = "shift_reg";

assign rnode_134to135_bb1_c0_ene1_0_reg_135_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_c0_ene1_stall_in = 1'b0;
assign rnode_134to135_bb1_c0_ene1_0_NO_SHIFT_REG = rnode_134to135_bb1_c0_ene1_0_reg_135_NO_SHIFT_REG;
assign rnode_134to135_bb1_c0_ene1_0_stall_in_reg_135_NO_SHIFT_REG = 1'b0;
assign rnode_134to135_bb1_c0_ene1_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb1_cmp9_valid_out;
wire local_bb1_cmp9_stall_in;
wire local_bb1_cmp9_inputs_ready;
wire local_bb1_cmp9_stall_local;
wire local_bb1_cmp9;

assign local_bb1_cmp9_inputs_ready = local_bb1_c0_enter_c0_eni3_valid_out_1_NO_SHIFT_REG;
assign local_bb1_cmp9 = (input_wii_sub == local_bb1_c0_ene2);
assign local_bb1_cmp9_valid_out = 1'b1;
assign local_bb1_c0_enter_c0_eni3_stall_in_1 = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb1_memcoalesce_inputArray_extrValue_010_stall_local;
wire [31:0] local_bb1_memcoalesce_inputArray_extrValue_010;

assign local_bb1_memcoalesce_inputArray_extrValue_010 = local_bb1_c0_ene3[31:0];

// This section implements an unregistered operation.
// 
wire local_bb1_memcoalesce_inputArray_extrValue_111_stall_local;
wire [31:0] local_bb1_memcoalesce_inputArray_extrValue_111;

assign local_bb1_memcoalesce_inputArray_extrValue_111 = local_bb1_c0_ene3[63:32];

// This section implements an unregistered operation.
// 
wire local_bb1_memcoalesce_inputArray_extrValue_2_stall_local;
wire [31:0] local_bb1_memcoalesce_inputArray_extrValue_2;

assign local_bb1_memcoalesce_inputArray_extrValue_2 = local_bb1_c0_ene3[95:64];

// This section implements a registered operation.
// 
wire SFC_1_VALID_134_135_0_inputs_ready;
 reg SFC_1_VALID_134_135_0_valid_out_NO_SHIFT_REG;
wire SFC_1_VALID_134_135_0_stall_in;
wire SFC_1_VALID_134_135_0_output_regs_ready;
 reg SFC_1_VALID_134_135_0_NO_SHIFT_REG /* synthesis  preserve  */;
wire SFC_1_VALID_134_135_0_causedstall;

assign SFC_1_VALID_134_135_0_inputs_ready = 1'b1;
assign SFC_1_VALID_134_135_0_output_regs_ready = 1'b1;
assign SFC_1_VALID_134_134_0_stall_in = 1'b0;
assign SFC_1_VALID_134_135_0_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		SFC_1_VALID_134_135_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (SFC_1_VALID_134_135_0_output_regs_ready)
		begin
			SFC_1_VALID_134_135_0_NO_SHIFT_REG <= SFC_1_VALID_134_134_0;
		end
	end
end


// Register node:
//  * latency = 16
//  * capacity = 16
 logic rnode_135to151_bb1_c0_ene1_0_valid_out_NO_SHIFT_REG;
 logic rnode_135to151_bb1_c0_ene1_0_stall_in_NO_SHIFT_REG;
 logic rnode_135to151_bb1_c0_ene1_0_NO_SHIFT_REG;
 logic rnode_135to151_bb1_c0_ene1_0_reg_151_inputs_ready_NO_SHIFT_REG;
 logic rnode_135to151_bb1_c0_ene1_0_reg_151_NO_SHIFT_REG;
 logic rnode_135to151_bb1_c0_ene1_0_valid_out_reg_151_NO_SHIFT_REG;
 logic rnode_135to151_bb1_c0_ene1_0_stall_in_reg_151_NO_SHIFT_REG;
 logic rnode_135to151_bb1_c0_ene1_0_stall_out_reg_151_NO_SHIFT_REG;

acl_data_fifo rnode_135to151_bb1_c0_ene1_0_reg_151_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_135to151_bb1_c0_ene1_0_reg_151_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_135to151_bb1_c0_ene1_0_stall_in_reg_151_NO_SHIFT_REG),
	.valid_out(rnode_135to151_bb1_c0_ene1_0_valid_out_reg_151_NO_SHIFT_REG),
	.stall_out(rnode_135to151_bb1_c0_ene1_0_stall_out_reg_151_NO_SHIFT_REG),
	.data_in(rnode_134to135_bb1_c0_ene1_0_NO_SHIFT_REG),
	.data_out(rnode_135to151_bb1_c0_ene1_0_reg_151_NO_SHIFT_REG)
);

defparam rnode_135to151_bb1_c0_ene1_0_reg_151_fifo.DEPTH = 16;
defparam rnode_135to151_bb1_c0_ene1_0_reg_151_fifo.DATA_WIDTH = 1;
defparam rnode_135to151_bb1_c0_ene1_0_reg_151_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_135to151_bb1_c0_ene1_0_reg_151_fifo.IMPL = "shift_reg";

assign rnode_135to151_bb1_c0_ene1_0_reg_151_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_134to135_bb1_c0_ene1_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_135to151_bb1_c0_ene1_0_NO_SHIFT_REG = rnode_135to151_bb1_c0_ene1_0_reg_151_NO_SHIFT_REG;
assign rnode_135to151_bb1_c0_ene1_0_stall_in_reg_151_NO_SHIFT_REG = 1'b0;
assign rnode_135to151_bb1_c0_ene1_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_134to135_bb1_cmp9_0_valid_out_NO_SHIFT_REG;
 logic rnode_134to135_bb1_cmp9_0_stall_in_NO_SHIFT_REG;
 logic rnode_134to135_bb1_cmp9_0_NO_SHIFT_REG;
 logic rnode_134to135_bb1_cmp9_0_reg_135_inputs_ready_NO_SHIFT_REG;
 logic rnode_134to135_bb1_cmp9_0_reg_135_NO_SHIFT_REG;
 logic rnode_134to135_bb1_cmp9_0_valid_out_reg_135_NO_SHIFT_REG;
 logic rnode_134to135_bb1_cmp9_0_stall_in_reg_135_NO_SHIFT_REG;
 logic rnode_134to135_bb1_cmp9_0_stall_out_reg_135_NO_SHIFT_REG;

acl_data_fifo rnode_134to135_bb1_cmp9_0_reg_135_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_134to135_bb1_cmp9_0_reg_135_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_134to135_bb1_cmp9_0_stall_in_reg_135_NO_SHIFT_REG),
	.valid_out(rnode_134to135_bb1_cmp9_0_valid_out_reg_135_NO_SHIFT_REG),
	.stall_out(rnode_134to135_bb1_cmp9_0_stall_out_reg_135_NO_SHIFT_REG),
	.data_in(local_bb1_cmp9),
	.data_out(rnode_134to135_bb1_cmp9_0_reg_135_NO_SHIFT_REG)
);

defparam rnode_134to135_bb1_cmp9_0_reg_135_fifo.DEPTH = 1;
defparam rnode_134to135_bb1_cmp9_0_reg_135_fifo.DATA_WIDTH = 1;
defparam rnode_134to135_bb1_cmp9_0_reg_135_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_134to135_bb1_cmp9_0_reg_135_fifo.IMPL = "shift_reg";

assign rnode_134to135_bb1_cmp9_0_reg_135_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_cmp9_stall_in = 1'b0;
assign rnode_134to135_bb1_cmp9_0_NO_SHIFT_REG = rnode_134to135_bb1_cmp9_0_reg_135_NO_SHIFT_REG;
assign rnode_134to135_bb1_cmp9_0_stall_in_reg_135_NO_SHIFT_REG = 1'b0;
assign rnode_134to135_bb1_cmp9_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb1_var__stall_local;
wire [31:0] local_bb1_var_;

assign local_bb1_var_ = local_bb1_memcoalesce_inputArray_extrValue_010;

// This section implements an unregistered operation.
// 
wire local_bb1_var__u1_stall_local;
wire [31:0] local_bb1_var__u1;

assign local_bb1_var__u1 = local_bb1_memcoalesce_inputArray_extrValue_2;

// This section implements a registered operation.
// 
wire SFC_1_VALID_135_136_0_inputs_ready;
 reg SFC_1_VALID_135_136_0_valid_out_NO_SHIFT_REG;
wire SFC_1_VALID_135_136_0_stall_in;
wire SFC_1_VALID_135_136_0_output_regs_ready;
 reg SFC_1_VALID_135_136_0_NO_SHIFT_REG /* synthesis  preserve  */;
wire SFC_1_VALID_135_136_0_causedstall;

assign SFC_1_VALID_135_136_0_inputs_ready = 1'b1;
assign SFC_1_VALID_135_136_0_output_regs_ready = 1'b1;
assign SFC_1_VALID_134_135_0_stall_in = 1'b0;
assign SFC_1_VALID_135_136_0_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		SFC_1_VALID_135_136_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (SFC_1_VALID_135_136_0_output_regs_ready)
		begin
			SFC_1_VALID_135_136_0_NO_SHIFT_REG <= SFC_1_VALID_134_135_0_NO_SHIFT_REG;
		end
	end
end


// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_151to152_bb1_c0_ene1_0_valid_out_NO_SHIFT_REG;
 logic rnode_151to152_bb1_c0_ene1_0_stall_in_NO_SHIFT_REG;
 logic rnode_151to152_bb1_c0_ene1_0_NO_SHIFT_REG;
 logic rnode_151to152_bb1_c0_ene1_0_reg_152_inputs_ready_NO_SHIFT_REG;
 logic rnode_151to152_bb1_c0_ene1_0_reg_152_NO_SHIFT_REG;
 logic rnode_151to152_bb1_c0_ene1_0_valid_out_reg_152_NO_SHIFT_REG;
 logic rnode_151to152_bb1_c0_ene1_0_stall_in_reg_152_NO_SHIFT_REG;
 logic rnode_151to152_bb1_c0_ene1_0_stall_out_reg_152_NO_SHIFT_REG;

acl_data_fifo rnode_151to152_bb1_c0_ene1_0_reg_152_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_151to152_bb1_c0_ene1_0_reg_152_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_151to152_bb1_c0_ene1_0_stall_in_reg_152_NO_SHIFT_REG),
	.valid_out(rnode_151to152_bb1_c0_ene1_0_valid_out_reg_152_NO_SHIFT_REG),
	.stall_out(rnode_151to152_bb1_c0_ene1_0_stall_out_reg_152_NO_SHIFT_REG),
	.data_in(rnode_135to151_bb1_c0_ene1_0_NO_SHIFT_REG),
	.data_out(rnode_151to152_bb1_c0_ene1_0_reg_152_NO_SHIFT_REG)
);

defparam rnode_151to152_bb1_c0_ene1_0_reg_152_fifo.DEPTH = 1;
defparam rnode_151to152_bb1_c0_ene1_0_reg_152_fifo.DATA_WIDTH = 1;
defparam rnode_151to152_bb1_c0_ene1_0_reg_152_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_151to152_bb1_c0_ene1_0_reg_152_fifo.IMPL = "shift_reg";

assign rnode_151to152_bb1_c0_ene1_0_reg_152_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_135to151_bb1_c0_ene1_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_151to152_bb1_c0_ene1_0_NO_SHIFT_REG = rnode_151to152_bb1_c0_ene1_0_reg_152_NO_SHIFT_REG;
assign rnode_151to152_bb1_c0_ene1_0_stall_in_reg_152_NO_SHIFT_REG = 1'b0;
assign rnode_151to152_bb1_c0_ene1_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 16
//  * capacity = 16
 logic rnode_135to151_bb1_cmp9_0_valid_out_NO_SHIFT_REG;
 logic rnode_135to151_bb1_cmp9_0_stall_in_NO_SHIFT_REG;
 logic rnode_135to151_bb1_cmp9_0_NO_SHIFT_REG;
 logic rnode_135to151_bb1_cmp9_0_reg_151_inputs_ready_NO_SHIFT_REG;
 logic rnode_135to151_bb1_cmp9_0_reg_151_NO_SHIFT_REG;
 logic rnode_135to151_bb1_cmp9_0_valid_out_reg_151_NO_SHIFT_REG;
 logic rnode_135to151_bb1_cmp9_0_stall_in_reg_151_NO_SHIFT_REG;
 logic rnode_135to151_bb1_cmp9_0_stall_out_reg_151_NO_SHIFT_REG;

acl_data_fifo rnode_135to151_bb1_cmp9_0_reg_151_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_135to151_bb1_cmp9_0_reg_151_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_135to151_bb1_cmp9_0_stall_in_reg_151_NO_SHIFT_REG),
	.valid_out(rnode_135to151_bb1_cmp9_0_valid_out_reg_151_NO_SHIFT_REG),
	.stall_out(rnode_135to151_bb1_cmp9_0_stall_out_reg_151_NO_SHIFT_REG),
	.data_in(rnode_134to135_bb1_cmp9_0_NO_SHIFT_REG),
	.data_out(rnode_135to151_bb1_cmp9_0_reg_151_NO_SHIFT_REG)
);

defparam rnode_135to151_bb1_cmp9_0_reg_151_fifo.DEPTH = 16;
defparam rnode_135to151_bb1_cmp9_0_reg_151_fifo.DATA_WIDTH = 1;
defparam rnode_135to151_bb1_cmp9_0_reg_151_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_135to151_bb1_cmp9_0_reg_151_fifo.IMPL = "shift_reg";

assign rnode_135to151_bb1_cmp9_0_reg_151_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_134to135_bb1_cmp9_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_135to151_bb1_cmp9_0_NO_SHIFT_REG = rnode_135to151_bb1_cmp9_0_reg_151_NO_SHIFT_REG;
assign rnode_135to151_bb1_cmp9_0_stall_in_reg_151_NO_SHIFT_REG = 1'b0;
assign rnode_135to151_bb1_cmp9_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb1_shr_i241_stall_local;
wire [31:0] local_bb1_shr_i241;

assign local_bb1_shr_i241 = (local_bb1_var_ >> 32'h17);

// This section implements an unregistered operation.
// 
wire local_bb1_and4_i244_stall_local;
wire [31:0] local_bb1_and4_i244;

assign local_bb1_and4_i244 = (local_bb1_var_ & 32'h80000000);

// This section implements an unregistered operation.
// 
wire local_bb1_and5_i245_stall_local;
wire [31:0] local_bb1_and5_i245;

assign local_bb1_and5_i245 = (local_bb1_var_ & 32'h7FFFFF);

// This section implements an unregistered operation.
// 
wire local_bb1_shr_i9_stall_local;
wire [31:0] local_bb1_shr_i9;

assign local_bb1_shr_i9 = (local_bb1_var__u1 >> 32'h17);

// This section implements an unregistered operation.
// 
wire local_bb1_and4_i_stall_local;
wire [31:0] local_bb1_and4_i;

assign local_bb1_and4_i = (local_bb1_var__u1 & 32'h80000000);

// This section implements an unregistered operation.
// 
wire local_bb1_and5_i_stall_local;
wire [31:0] local_bb1_and5_i;

assign local_bb1_and5_i = (local_bb1_var__u1 & 32'h7FFFFF);

// This section implements a registered operation.
// 
wire SFC_1_VALID_136_137_0_inputs_ready;
 reg SFC_1_VALID_136_137_0_valid_out_NO_SHIFT_REG;
wire SFC_1_VALID_136_137_0_stall_in;
wire SFC_1_VALID_136_137_0_output_regs_ready;
 reg SFC_1_VALID_136_137_0_NO_SHIFT_REG /* synthesis  preserve  */;
wire SFC_1_VALID_136_137_0_causedstall;

assign SFC_1_VALID_136_137_0_inputs_ready = 1'b1;
assign SFC_1_VALID_136_137_0_output_regs_ready = 1'b1;
assign SFC_1_VALID_135_136_0_stall_in = 1'b0;
assign SFC_1_VALID_136_137_0_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		SFC_1_VALID_136_137_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (SFC_1_VALID_136_137_0_output_regs_ready)
		begin
			SFC_1_VALID_136_137_0_NO_SHIFT_REG <= SFC_1_VALID_135_136_0_NO_SHIFT_REG;
		end
	end
end


// This section implements an unregistered operation.
// 
wire local_bb1_cmp_xor_stall_local;
wire local_bb1_cmp_xor;

assign local_bb1_cmp_xor = (rnode_151to152_bb1_c0_ene1_0_NO_SHIFT_REG ^ 1'b1);

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_151to152_bb1_cmp9_0_valid_out_NO_SHIFT_REG;
 logic rnode_151to152_bb1_cmp9_0_stall_in_NO_SHIFT_REG;
 logic rnode_151to152_bb1_cmp9_0_NO_SHIFT_REG;
 logic rnode_151to152_bb1_cmp9_0_reg_152_inputs_ready_NO_SHIFT_REG;
 logic rnode_151to152_bb1_cmp9_0_reg_152_NO_SHIFT_REG;
 logic rnode_151to152_bb1_cmp9_0_valid_out_reg_152_NO_SHIFT_REG;
 logic rnode_151to152_bb1_cmp9_0_stall_in_reg_152_NO_SHIFT_REG;
 logic rnode_151to152_bb1_cmp9_0_stall_out_reg_152_NO_SHIFT_REG;

acl_data_fifo rnode_151to152_bb1_cmp9_0_reg_152_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_151to152_bb1_cmp9_0_reg_152_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_151to152_bb1_cmp9_0_stall_in_reg_152_NO_SHIFT_REG),
	.valid_out(rnode_151to152_bb1_cmp9_0_valid_out_reg_152_NO_SHIFT_REG),
	.stall_out(rnode_151to152_bb1_cmp9_0_stall_out_reg_152_NO_SHIFT_REG),
	.data_in(rnode_135to151_bb1_cmp9_0_NO_SHIFT_REG),
	.data_out(rnode_151to152_bb1_cmp9_0_reg_152_NO_SHIFT_REG)
);

defparam rnode_151to152_bb1_cmp9_0_reg_152_fifo.DEPTH = 1;
defparam rnode_151to152_bb1_cmp9_0_reg_152_fifo.DATA_WIDTH = 1;
defparam rnode_151to152_bb1_cmp9_0_reg_152_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_151to152_bb1_cmp9_0_reg_152_fifo.IMPL = "shift_reg";

assign rnode_151to152_bb1_cmp9_0_reg_152_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_135to151_bb1_cmp9_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_151to152_bb1_cmp9_0_NO_SHIFT_REG = rnode_151to152_bb1_cmp9_0_reg_152_NO_SHIFT_REG;
assign rnode_151to152_bb1_cmp9_0_stall_in_reg_152_NO_SHIFT_REG = 1'b0;
assign rnode_151to152_bb1_cmp9_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb1_lnot14_not_i248_stall_local;
wire local_bb1_lnot14_not_i248;

assign local_bb1_lnot14_not_i248 = ((local_bb1_and5_i245 & 32'h7FFFFF) != 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_or_i256_stall_local;
wire [31:0] local_bb1_or_i256;

assign local_bb1_or_i256 = ((local_bb1_and5_i245 & 32'h7FFFFF) | 32'h800000);

// This section implements an unregistered operation.
// 
wire local_bb1_lnot14_not_i_stall_local;
wire local_bb1_lnot14_not_i;

assign local_bb1_lnot14_not_i = ((local_bb1_and5_i & 32'h7FFFFF) != 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_or_i17_stall_local;
wire [31:0] local_bb1_or_i17;

assign local_bb1_or_i17 = ((local_bb1_and5_i & 32'h7FFFFF) | 32'h800000);

// This section implements a registered operation.
// 
wire SFC_1_VALID_137_138_0_inputs_ready;
 reg SFC_1_VALID_137_138_0_valid_out_NO_SHIFT_REG;
wire SFC_1_VALID_137_138_0_stall_in;
wire SFC_1_VALID_137_138_0_output_regs_ready;
 reg SFC_1_VALID_137_138_0_NO_SHIFT_REG /* synthesis  preserve  */;
wire SFC_1_VALID_137_138_0_causedstall;

assign SFC_1_VALID_137_138_0_inputs_ready = 1'b1;
assign SFC_1_VALID_137_138_0_output_regs_ready = 1'b1;
assign SFC_1_VALID_136_137_0_stall_in = 1'b0;
assign SFC_1_VALID_137_138_0_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		SFC_1_VALID_137_138_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (SFC_1_VALID_137_138_0_output_regs_ready)
		begin
			SFC_1_VALID_137_138_0_NO_SHIFT_REG <= SFC_1_VALID_136_137_0_NO_SHIFT_REG;
		end
	end
end


// This section implements an unregistered operation.
// 
wire local_bb1_c0_exi1_stall_local;
wire [63:0] local_bb1_c0_exi1;

assign local_bb1_c0_exi1[7:0] = 8'bx;
assign local_bb1_c0_exi1[8] = local_bb1_cmp_xor;
assign local_bb1_c0_exi1[63:9] = 55'bx;

// This section implements an unregistered operation.
// 
wire local_bb1___stall_local;
wire local_bb1__;

assign local_bb1__ = (rnode_151to152_bb1_cmp9_0_NO_SHIFT_REG & local_bb1_cmp_xor);

// This section implements an unregistered operation.
// 
wire local_bb1_conv_i_i257_stall_local;
wire [63:0] local_bb1_conv_i_i257;

assign local_bb1_conv_i_i257[63:32] = 32'h0;
assign local_bb1_conv_i_i257[31:0] = ((local_bb1_or_i256 & 32'hFFFFFF) | 32'h800000);

// This section implements an unregistered operation.
// 
wire local_bb1_memcoalesce_inputArray_extrValue_111_valid_out;
wire local_bb1_memcoalesce_inputArray_extrValue_111_stall_in;
wire local_bb1_shr_i241_valid_out;
wire local_bb1_shr_i241_stall_in;
wire local_bb1_and4_i244_valid_out;
wire local_bb1_and4_i244_stall_in;
wire local_bb1_shr_i9_valid_out;
wire local_bb1_shr_i9_stall_in;
wire local_bb1_and4_i_valid_out;
wire local_bb1_and4_i_stall_in;
wire local_bb1_lnot14_not_i248_valid_out;
wire local_bb1_lnot14_not_i248_stall_in;
wire local_bb1_lnot14_not_i_valid_out;
wire local_bb1_lnot14_not_i_stall_in;
wire local_bb1_conv_i_i257_valid_out;
wire local_bb1_conv_i_i257_stall_in;
wire local_bb1_conv_i_i_valid_out;
wire local_bb1_conv_i_i_stall_in;
wire local_bb1_conv_i_i_inputs_ready;
wire local_bb1_conv_i_i_stall_local;
wire [63:0] local_bb1_conv_i_i;

assign local_bb1_conv_i_i_inputs_ready = local_bb1_c0_enter_c0_eni3_valid_out_2_NO_SHIFT_REG;
assign local_bb1_conv_i_i[63:32] = 32'h0;
assign local_bb1_conv_i_i[31:0] = ((local_bb1_or_i17 & 32'hFFFFFF) | 32'h800000);
assign local_bb1_memcoalesce_inputArray_extrValue_111_valid_out = 1'b1;
assign local_bb1_shr_i241_valid_out = 1'b1;
assign local_bb1_and4_i244_valid_out = 1'b1;
assign local_bb1_shr_i9_valid_out = 1'b1;
assign local_bb1_and4_i_valid_out = 1'b1;
assign local_bb1_lnot14_not_i248_valid_out = 1'b1;
assign local_bb1_lnot14_not_i_valid_out = 1'b1;
assign local_bb1_conv_i_i257_valid_out = 1'b1;
assign local_bb1_conv_i_i_valid_out = 1'b1;
assign local_bb1_c0_enter_c0_eni3_stall_in_2 = 1'b0;

// This section implements a registered operation.
// 
wire SFC_1_VALID_138_139_0_inputs_ready;
 reg SFC_1_VALID_138_139_0_valid_out_NO_SHIFT_REG;
wire SFC_1_VALID_138_139_0_stall_in;
wire SFC_1_VALID_138_139_0_output_regs_ready;
 reg SFC_1_VALID_138_139_0_NO_SHIFT_REG /* synthesis  preserve  */;
wire SFC_1_VALID_138_139_0_causedstall;

assign SFC_1_VALID_138_139_0_inputs_ready = 1'b1;
assign SFC_1_VALID_138_139_0_output_regs_ready = 1'b1;
assign SFC_1_VALID_137_138_0_stall_in = 1'b0;
assign SFC_1_VALID_138_139_0_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		SFC_1_VALID_138_139_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (SFC_1_VALID_138_139_0_output_regs_ready)
		begin
			SFC_1_VALID_138_139_0_NO_SHIFT_REG <= SFC_1_VALID_137_138_0_NO_SHIFT_REG;
		end
	end
end


// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_134to135_bb1_memcoalesce_inputArray_extrValue_111_0_valid_out_NO_SHIFT_REG;
 logic rnode_134to135_bb1_memcoalesce_inputArray_extrValue_111_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_134to135_bb1_memcoalesce_inputArray_extrValue_111_0_NO_SHIFT_REG;
 logic rnode_134to135_bb1_memcoalesce_inputArray_extrValue_111_0_reg_135_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_134to135_bb1_memcoalesce_inputArray_extrValue_111_0_reg_135_NO_SHIFT_REG;
 logic rnode_134to135_bb1_memcoalesce_inputArray_extrValue_111_0_valid_out_reg_135_NO_SHIFT_REG;
 logic rnode_134to135_bb1_memcoalesce_inputArray_extrValue_111_0_stall_in_reg_135_NO_SHIFT_REG;
 logic rnode_134to135_bb1_memcoalesce_inputArray_extrValue_111_0_stall_out_reg_135_NO_SHIFT_REG;

acl_data_fifo rnode_134to135_bb1_memcoalesce_inputArray_extrValue_111_0_reg_135_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_134to135_bb1_memcoalesce_inputArray_extrValue_111_0_reg_135_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_134to135_bb1_memcoalesce_inputArray_extrValue_111_0_stall_in_reg_135_NO_SHIFT_REG),
	.valid_out(rnode_134to135_bb1_memcoalesce_inputArray_extrValue_111_0_valid_out_reg_135_NO_SHIFT_REG),
	.stall_out(rnode_134to135_bb1_memcoalesce_inputArray_extrValue_111_0_stall_out_reg_135_NO_SHIFT_REG),
	.data_in(local_bb1_memcoalesce_inputArray_extrValue_111),
	.data_out(rnode_134to135_bb1_memcoalesce_inputArray_extrValue_111_0_reg_135_NO_SHIFT_REG)
);

defparam rnode_134to135_bb1_memcoalesce_inputArray_extrValue_111_0_reg_135_fifo.DEPTH = 1;
defparam rnode_134to135_bb1_memcoalesce_inputArray_extrValue_111_0_reg_135_fifo.DATA_WIDTH = 32;
defparam rnode_134to135_bb1_memcoalesce_inputArray_extrValue_111_0_reg_135_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_134to135_bb1_memcoalesce_inputArray_extrValue_111_0_reg_135_fifo.IMPL = "shift_reg";

assign rnode_134to135_bb1_memcoalesce_inputArray_extrValue_111_0_reg_135_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_memcoalesce_inputArray_extrValue_111_stall_in = 1'b0;
assign rnode_134to135_bb1_memcoalesce_inputArray_extrValue_111_0_NO_SHIFT_REG = rnode_134to135_bb1_memcoalesce_inputArray_extrValue_111_0_reg_135_NO_SHIFT_REG;
assign rnode_134to135_bb1_memcoalesce_inputArray_extrValue_111_0_stall_in_reg_135_NO_SHIFT_REG = 1'b0;
assign rnode_134to135_bb1_memcoalesce_inputArray_extrValue_111_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 2
//  * capacity = 2
 logic rnode_134to136_bb1_shr_i241_0_valid_out_NO_SHIFT_REG;
 logic rnode_134to136_bb1_shr_i241_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_134to136_bb1_shr_i241_0_NO_SHIFT_REG;
 logic rnode_134to136_bb1_shr_i241_0_reg_136_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_134to136_bb1_shr_i241_0_reg_136_NO_SHIFT_REG;
 logic rnode_134to136_bb1_shr_i241_0_valid_out_reg_136_NO_SHIFT_REG;
 logic rnode_134to136_bb1_shr_i241_0_stall_in_reg_136_NO_SHIFT_REG;
 logic rnode_134to136_bb1_shr_i241_0_stall_out_reg_136_NO_SHIFT_REG;

acl_data_fifo rnode_134to136_bb1_shr_i241_0_reg_136_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_134to136_bb1_shr_i241_0_reg_136_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_134to136_bb1_shr_i241_0_stall_in_reg_136_NO_SHIFT_REG),
	.valid_out(rnode_134to136_bb1_shr_i241_0_valid_out_reg_136_NO_SHIFT_REG),
	.stall_out(rnode_134to136_bb1_shr_i241_0_stall_out_reg_136_NO_SHIFT_REG),
	.data_in((local_bb1_shr_i241 & 32'h1FF)),
	.data_out(rnode_134to136_bb1_shr_i241_0_reg_136_NO_SHIFT_REG)
);

defparam rnode_134to136_bb1_shr_i241_0_reg_136_fifo.DEPTH = 2;
defparam rnode_134to136_bb1_shr_i241_0_reg_136_fifo.DATA_WIDTH = 32;
defparam rnode_134to136_bb1_shr_i241_0_reg_136_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_134to136_bb1_shr_i241_0_reg_136_fifo.IMPL = "shift_reg";

assign rnode_134to136_bb1_shr_i241_0_reg_136_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_shr_i241_stall_in = 1'b0;
assign rnode_134to136_bb1_shr_i241_0_NO_SHIFT_REG = rnode_134to136_bb1_shr_i241_0_reg_136_NO_SHIFT_REG;
assign rnode_134to136_bb1_shr_i241_0_stall_in_reg_136_NO_SHIFT_REG = 1'b0;
assign rnode_134to136_bb1_shr_i241_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_134to135_bb1_and4_i244_0_valid_out_NO_SHIFT_REG;
 logic rnode_134to135_bb1_and4_i244_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_134to135_bb1_and4_i244_0_NO_SHIFT_REG;
 logic rnode_134to135_bb1_and4_i244_0_reg_135_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_134to135_bb1_and4_i244_0_reg_135_NO_SHIFT_REG;
 logic rnode_134to135_bb1_and4_i244_0_valid_out_reg_135_NO_SHIFT_REG;
 logic rnode_134to135_bb1_and4_i244_0_stall_in_reg_135_NO_SHIFT_REG;
 logic rnode_134to135_bb1_and4_i244_0_stall_out_reg_135_NO_SHIFT_REG;

acl_data_fifo rnode_134to135_bb1_and4_i244_0_reg_135_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_134to135_bb1_and4_i244_0_reg_135_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_134to135_bb1_and4_i244_0_stall_in_reg_135_NO_SHIFT_REG),
	.valid_out(rnode_134to135_bb1_and4_i244_0_valid_out_reg_135_NO_SHIFT_REG),
	.stall_out(rnode_134to135_bb1_and4_i244_0_stall_out_reg_135_NO_SHIFT_REG),
	.data_in((local_bb1_and4_i244 & 32'h80000000)),
	.data_out(rnode_134to135_bb1_and4_i244_0_reg_135_NO_SHIFT_REG)
);

defparam rnode_134to135_bb1_and4_i244_0_reg_135_fifo.DEPTH = 1;
defparam rnode_134to135_bb1_and4_i244_0_reg_135_fifo.DATA_WIDTH = 32;
defparam rnode_134to135_bb1_and4_i244_0_reg_135_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_134to135_bb1_and4_i244_0_reg_135_fifo.IMPL = "shift_reg";

assign rnode_134to135_bb1_and4_i244_0_reg_135_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_and4_i244_stall_in = 1'b0;
assign rnode_134to135_bb1_and4_i244_0_NO_SHIFT_REG = rnode_134to135_bb1_and4_i244_0_reg_135_NO_SHIFT_REG;
assign rnode_134to135_bb1_and4_i244_0_stall_in_reg_135_NO_SHIFT_REG = 1'b0;
assign rnode_134to135_bb1_and4_i244_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 2
//  * capacity = 2
 logic rnode_134to136_bb1_shr_i9_0_valid_out_NO_SHIFT_REG;
 logic rnode_134to136_bb1_shr_i9_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_134to136_bb1_shr_i9_0_NO_SHIFT_REG;
 logic rnode_134to136_bb1_shr_i9_0_reg_136_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_134to136_bb1_shr_i9_0_reg_136_NO_SHIFT_REG;
 logic rnode_134to136_bb1_shr_i9_0_valid_out_reg_136_NO_SHIFT_REG;
 logic rnode_134to136_bb1_shr_i9_0_stall_in_reg_136_NO_SHIFT_REG;
 logic rnode_134to136_bb1_shr_i9_0_stall_out_reg_136_NO_SHIFT_REG;

acl_data_fifo rnode_134to136_bb1_shr_i9_0_reg_136_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_134to136_bb1_shr_i9_0_reg_136_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_134to136_bb1_shr_i9_0_stall_in_reg_136_NO_SHIFT_REG),
	.valid_out(rnode_134to136_bb1_shr_i9_0_valid_out_reg_136_NO_SHIFT_REG),
	.stall_out(rnode_134to136_bb1_shr_i9_0_stall_out_reg_136_NO_SHIFT_REG),
	.data_in((local_bb1_shr_i9 & 32'h1FF)),
	.data_out(rnode_134to136_bb1_shr_i9_0_reg_136_NO_SHIFT_REG)
);

defparam rnode_134to136_bb1_shr_i9_0_reg_136_fifo.DEPTH = 2;
defparam rnode_134to136_bb1_shr_i9_0_reg_136_fifo.DATA_WIDTH = 32;
defparam rnode_134to136_bb1_shr_i9_0_reg_136_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_134to136_bb1_shr_i9_0_reg_136_fifo.IMPL = "shift_reg";

assign rnode_134to136_bb1_shr_i9_0_reg_136_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_shr_i9_stall_in = 1'b0;
assign rnode_134to136_bb1_shr_i9_0_NO_SHIFT_REG = rnode_134to136_bb1_shr_i9_0_reg_136_NO_SHIFT_REG;
assign rnode_134to136_bb1_shr_i9_0_stall_in_reg_136_NO_SHIFT_REG = 1'b0;
assign rnode_134to136_bb1_shr_i9_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_134to135_bb1_and4_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_134to135_bb1_and4_i_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_134to135_bb1_and4_i_0_NO_SHIFT_REG;
 logic rnode_134to135_bb1_and4_i_0_reg_135_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_134to135_bb1_and4_i_0_reg_135_NO_SHIFT_REG;
 logic rnode_134to135_bb1_and4_i_0_valid_out_reg_135_NO_SHIFT_REG;
 logic rnode_134to135_bb1_and4_i_0_stall_in_reg_135_NO_SHIFT_REG;
 logic rnode_134to135_bb1_and4_i_0_stall_out_reg_135_NO_SHIFT_REG;

acl_data_fifo rnode_134to135_bb1_and4_i_0_reg_135_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_134to135_bb1_and4_i_0_reg_135_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_134to135_bb1_and4_i_0_stall_in_reg_135_NO_SHIFT_REG),
	.valid_out(rnode_134to135_bb1_and4_i_0_valid_out_reg_135_NO_SHIFT_REG),
	.stall_out(rnode_134to135_bb1_and4_i_0_stall_out_reg_135_NO_SHIFT_REG),
	.data_in((local_bb1_and4_i & 32'h80000000)),
	.data_out(rnode_134to135_bb1_and4_i_0_reg_135_NO_SHIFT_REG)
);

defparam rnode_134to135_bb1_and4_i_0_reg_135_fifo.DEPTH = 1;
defparam rnode_134to135_bb1_and4_i_0_reg_135_fifo.DATA_WIDTH = 32;
defparam rnode_134to135_bb1_and4_i_0_reg_135_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_134to135_bb1_and4_i_0_reg_135_fifo.IMPL = "shift_reg";

assign rnode_134to135_bb1_and4_i_0_reg_135_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_and4_i_stall_in = 1'b0;
assign rnode_134to135_bb1_and4_i_0_NO_SHIFT_REG = rnode_134to135_bb1_and4_i_0_reg_135_NO_SHIFT_REG;
assign rnode_134to135_bb1_and4_i_0_stall_in_reg_135_NO_SHIFT_REG = 1'b0;
assign rnode_134to135_bb1_and4_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_134to135_bb1_lnot14_not_i248_0_valid_out_NO_SHIFT_REG;
 logic rnode_134to135_bb1_lnot14_not_i248_0_stall_in_NO_SHIFT_REG;
 logic rnode_134to135_bb1_lnot14_not_i248_0_NO_SHIFT_REG;
 logic rnode_134to135_bb1_lnot14_not_i248_0_reg_135_inputs_ready_NO_SHIFT_REG;
 logic rnode_134to135_bb1_lnot14_not_i248_0_reg_135_NO_SHIFT_REG;
 logic rnode_134to135_bb1_lnot14_not_i248_0_valid_out_reg_135_NO_SHIFT_REG;
 logic rnode_134to135_bb1_lnot14_not_i248_0_stall_in_reg_135_NO_SHIFT_REG;
 logic rnode_134to135_bb1_lnot14_not_i248_0_stall_out_reg_135_NO_SHIFT_REG;

acl_data_fifo rnode_134to135_bb1_lnot14_not_i248_0_reg_135_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_134to135_bb1_lnot14_not_i248_0_reg_135_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_134to135_bb1_lnot14_not_i248_0_stall_in_reg_135_NO_SHIFT_REG),
	.valid_out(rnode_134to135_bb1_lnot14_not_i248_0_valid_out_reg_135_NO_SHIFT_REG),
	.stall_out(rnode_134to135_bb1_lnot14_not_i248_0_stall_out_reg_135_NO_SHIFT_REG),
	.data_in(local_bb1_lnot14_not_i248),
	.data_out(rnode_134to135_bb1_lnot14_not_i248_0_reg_135_NO_SHIFT_REG)
);

defparam rnode_134to135_bb1_lnot14_not_i248_0_reg_135_fifo.DEPTH = 1;
defparam rnode_134to135_bb1_lnot14_not_i248_0_reg_135_fifo.DATA_WIDTH = 1;
defparam rnode_134to135_bb1_lnot14_not_i248_0_reg_135_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_134to135_bb1_lnot14_not_i248_0_reg_135_fifo.IMPL = "shift_reg";

assign rnode_134to135_bb1_lnot14_not_i248_0_reg_135_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_lnot14_not_i248_stall_in = 1'b0;
assign rnode_134to135_bb1_lnot14_not_i248_0_NO_SHIFT_REG = rnode_134to135_bb1_lnot14_not_i248_0_reg_135_NO_SHIFT_REG;
assign rnode_134to135_bb1_lnot14_not_i248_0_stall_in_reg_135_NO_SHIFT_REG = 1'b0;
assign rnode_134to135_bb1_lnot14_not_i248_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_134to135_bb1_lnot14_not_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_134to135_bb1_lnot14_not_i_0_stall_in_NO_SHIFT_REG;
 logic rnode_134to135_bb1_lnot14_not_i_0_NO_SHIFT_REG;
 logic rnode_134to135_bb1_lnot14_not_i_0_reg_135_inputs_ready_NO_SHIFT_REG;
 logic rnode_134to135_bb1_lnot14_not_i_0_reg_135_NO_SHIFT_REG;
 logic rnode_134to135_bb1_lnot14_not_i_0_valid_out_reg_135_NO_SHIFT_REG;
 logic rnode_134to135_bb1_lnot14_not_i_0_stall_in_reg_135_NO_SHIFT_REG;
 logic rnode_134to135_bb1_lnot14_not_i_0_stall_out_reg_135_NO_SHIFT_REG;

acl_data_fifo rnode_134to135_bb1_lnot14_not_i_0_reg_135_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_134to135_bb1_lnot14_not_i_0_reg_135_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_134to135_bb1_lnot14_not_i_0_stall_in_reg_135_NO_SHIFT_REG),
	.valid_out(rnode_134to135_bb1_lnot14_not_i_0_valid_out_reg_135_NO_SHIFT_REG),
	.stall_out(rnode_134to135_bb1_lnot14_not_i_0_stall_out_reg_135_NO_SHIFT_REG),
	.data_in(local_bb1_lnot14_not_i),
	.data_out(rnode_134to135_bb1_lnot14_not_i_0_reg_135_NO_SHIFT_REG)
);

defparam rnode_134to135_bb1_lnot14_not_i_0_reg_135_fifo.DEPTH = 1;
defparam rnode_134to135_bb1_lnot14_not_i_0_reg_135_fifo.DATA_WIDTH = 1;
defparam rnode_134to135_bb1_lnot14_not_i_0_reg_135_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_134to135_bb1_lnot14_not_i_0_reg_135_fifo.IMPL = "shift_reg";

assign rnode_134to135_bb1_lnot14_not_i_0_reg_135_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_lnot14_not_i_stall_in = 1'b0;
assign rnode_134to135_bb1_lnot14_not_i_0_NO_SHIFT_REG = rnode_134to135_bb1_lnot14_not_i_0_reg_135_NO_SHIFT_REG;
assign rnode_134to135_bb1_lnot14_not_i_0_stall_in_reg_135_NO_SHIFT_REG = 1'b0;
assign rnode_134to135_bb1_lnot14_not_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements a registered operation.
// 
wire local_bb1_mul_i_i258_inputs_ready;
 reg local_bb1_mul_i_i258_valid_out_0_NO_SHIFT_REG;
wire local_bb1_mul_i_i258_stall_in_0;
 reg local_bb1_mul_i_i258_valid_out_1_NO_SHIFT_REG;
wire local_bb1_mul_i_i258_stall_in_1;
wire local_bb1_mul_i_i258_output_regs_ready;
wire [63:0] local_bb1_mul_i_i258;
 reg local_bb1_mul_i_i258_valid_pipe_0_NO_SHIFT_REG;
 reg local_bb1_mul_i_i258_valid_pipe_1_NO_SHIFT_REG;
wire local_bb1_mul_i_i258_causedstall;

acl_int_mult int_module_local_bb1_mul_i_i258 (
	.clock(clock),
	.dataa(((local_bb1_conv_i_i257 & 64'hFFFFFF) | 64'h800000)),
	.datab(64'hAAAAAB),
	.enable(local_bb1_mul_i_i258_output_regs_ready),
	.result(local_bb1_mul_i_i258)
);

defparam int_module_local_bb1_mul_i_i258.INPUT1_WIDTH = 24;
defparam int_module_local_bb1_mul_i_i258.INPUT2_WIDTH = 24;
defparam int_module_local_bb1_mul_i_i258.OUTPUT_WIDTH = 64;
defparam int_module_local_bb1_mul_i_i258.LATENCY = 3;
defparam int_module_local_bb1_mul_i_i258.SIGNED = 0;

assign local_bb1_mul_i_i258_inputs_ready = 1'b1;
assign local_bb1_mul_i_i258_output_regs_ready = 1'b1;
assign local_bb1_conv_i_i257_stall_in = 1'b0;
assign local_bb1_mul_i_i258_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb1_mul_i_i258_valid_pipe_0_NO_SHIFT_REG <= 1'b0;
		local_bb1_mul_i_i258_valid_pipe_1_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (local_bb1_mul_i_i258_output_regs_ready)
		begin
			local_bb1_mul_i_i258_valid_pipe_0_NO_SHIFT_REG <= 1'b1;
			local_bb1_mul_i_i258_valid_pipe_1_NO_SHIFT_REG <= local_bb1_mul_i_i258_valid_pipe_0_NO_SHIFT_REG;
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb1_mul_i_i258_valid_out_0_NO_SHIFT_REG <= 1'b0;
		local_bb1_mul_i_i258_valid_out_1_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (local_bb1_mul_i_i258_output_regs_ready)
		begin
			local_bb1_mul_i_i258_valid_out_0_NO_SHIFT_REG <= 1'b1;
			local_bb1_mul_i_i258_valid_out_1_NO_SHIFT_REG <= 1'b1;
		end
		else
		begin
			if (~(local_bb1_mul_i_i258_stall_in_0))
			begin
				local_bb1_mul_i_i258_valid_out_0_NO_SHIFT_REG <= 1'b0;
			end
			if (~(local_bb1_mul_i_i258_stall_in_1))
			begin
				local_bb1_mul_i_i258_valid_out_1_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end


// This section implements a registered operation.
// 
wire local_bb1_mul_i_i_inputs_ready;
 reg local_bb1_mul_i_i_valid_out_0_NO_SHIFT_REG;
wire local_bb1_mul_i_i_stall_in_0;
 reg local_bb1_mul_i_i_valid_out_1_NO_SHIFT_REG;
wire local_bb1_mul_i_i_stall_in_1;
wire local_bb1_mul_i_i_output_regs_ready;
wire [63:0] local_bb1_mul_i_i;
 reg local_bb1_mul_i_i_valid_pipe_0_NO_SHIFT_REG;
 reg local_bb1_mul_i_i_valid_pipe_1_NO_SHIFT_REG;
wire local_bb1_mul_i_i_causedstall;

acl_int_mult int_module_local_bb1_mul_i_i (
	.clock(clock),
	.dataa(((local_bb1_conv_i_i & 64'hFFFFFF) | 64'h800000)),
	.datab(64'hAAAAAB),
	.enable(local_bb1_mul_i_i_output_regs_ready),
	.result(local_bb1_mul_i_i)
);

defparam int_module_local_bb1_mul_i_i.INPUT1_WIDTH = 24;
defparam int_module_local_bb1_mul_i_i.INPUT2_WIDTH = 24;
defparam int_module_local_bb1_mul_i_i.OUTPUT_WIDTH = 64;
defparam int_module_local_bb1_mul_i_i.LATENCY = 3;
defparam int_module_local_bb1_mul_i_i.SIGNED = 0;

assign local_bb1_mul_i_i_inputs_ready = 1'b1;
assign local_bb1_mul_i_i_output_regs_ready = 1'b1;
assign local_bb1_conv_i_i_stall_in = 1'b0;
assign local_bb1_mul_i_i_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb1_mul_i_i_valid_pipe_0_NO_SHIFT_REG <= 1'b0;
		local_bb1_mul_i_i_valid_pipe_1_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (local_bb1_mul_i_i_output_regs_ready)
		begin
			local_bb1_mul_i_i_valid_pipe_0_NO_SHIFT_REG <= 1'b1;
			local_bb1_mul_i_i_valid_pipe_1_NO_SHIFT_REG <= local_bb1_mul_i_i_valid_pipe_0_NO_SHIFT_REG;
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb1_mul_i_i_valid_out_0_NO_SHIFT_REG <= 1'b0;
		local_bb1_mul_i_i_valid_out_1_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (local_bb1_mul_i_i_output_regs_ready)
		begin
			local_bb1_mul_i_i_valid_out_0_NO_SHIFT_REG <= 1'b1;
			local_bb1_mul_i_i_valid_out_1_NO_SHIFT_REG <= 1'b1;
		end
		else
		begin
			if (~(local_bb1_mul_i_i_stall_in_0))
			begin
				local_bb1_mul_i_i_valid_out_0_NO_SHIFT_REG <= 1'b0;
			end
			if (~(local_bb1_mul_i_i_stall_in_1))
			begin
				local_bb1_mul_i_i_valid_out_1_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end


// This section implements a registered operation.
// 
wire SFC_1_VALID_139_140_0_inputs_ready;
 reg SFC_1_VALID_139_140_0_valid_out_NO_SHIFT_REG;
wire SFC_1_VALID_139_140_0_stall_in;
wire SFC_1_VALID_139_140_0_output_regs_ready;
 reg SFC_1_VALID_139_140_0_NO_SHIFT_REG /* synthesis  preserve  */;
wire SFC_1_VALID_139_140_0_causedstall;

assign SFC_1_VALID_139_140_0_inputs_ready = 1'b1;
assign SFC_1_VALID_139_140_0_output_regs_ready = 1'b1;
assign SFC_1_VALID_138_139_0_stall_in = 1'b0;
assign SFC_1_VALID_139_140_0_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		SFC_1_VALID_139_140_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (SFC_1_VALID_139_140_0_output_regs_ready)
		begin
			SFC_1_VALID_139_140_0_NO_SHIFT_REG <= SFC_1_VALID_138_139_0_NO_SHIFT_REG;
		end
	end
end


// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_135to136_bb1_memcoalesce_inputArray_extrValue_111_0_valid_out_NO_SHIFT_REG;
 logic rnode_135to136_bb1_memcoalesce_inputArray_extrValue_111_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_135to136_bb1_memcoalesce_inputArray_extrValue_111_0_NO_SHIFT_REG;
 logic rnode_135to136_bb1_memcoalesce_inputArray_extrValue_111_0_reg_136_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_135to136_bb1_memcoalesce_inputArray_extrValue_111_0_reg_136_NO_SHIFT_REG;
 logic rnode_135to136_bb1_memcoalesce_inputArray_extrValue_111_0_valid_out_reg_136_NO_SHIFT_REG;
 logic rnode_135to136_bb1_memcoalesce_inputArray_extrValue_111_0_stall_in_reg_136_NO_SHIFT_REG;
 logic rnode_135to136_bb1_memcoalesce_inputArray_extrValue_111_0_stall_out_reg_136_NO_SHIFT_REG;

acl_data_fifo rnode_135to136_bb1_memcoalesce_inputArray_extrValue_111_0_reg_136_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_135to136_bb1_memcoalesce_inputArray_extrValue_111_0_reg_136_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_135to136_bb1_memcoalesce_inputArray_extrValue_111_0_stall_in_reg_136_NO_SHIFT_REG),
	.valid_out(rnode_135to136_bb1_memcoalesce_inputArray_extrValue_111_0_valid_out_reg_136_NO_SHIFT_REG),
	.stall_out(rnode_135to136_bb1_memcoalesce_inputArray_extrValue_111_0_stall_out_reg_136_NO_SHIFT_REG),
	.data_in(rnode_134to135_bb1_memcoalesce_inputArray_extrValue_111_0_NO_SHIFT_REG),
	.data_out(rnode_135to136_bb1_memcoalesce_inputArray_extrValue_111_0_reg_136_NO_SHIFT_REG)
);

defparam rnode_135to136_bb1_memcoalesce_inputArray_extrValue_111_0_reg_136_fifo.DEPTH = 1;
defparam rnode_135to136_bb1_memcoalesce_inputArray_extrValue_111_0_reg_136_fifo.DATA_WIDTH = 32;
defparam rnode_135to136_bb1_memcoalesce_inputArray_extrValue_111_0_reg_136_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_135to136_bb1_memcoalesce_inputArray_extrValue_111_0_reg_136_fifo.IMPL = "shift_reg";

assign rnode_135to136_bb1_memcoalesce_inputArray_extrValue_111_0_reg_136_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_134to135_bb1_memcoalesce_inputArray_extrValue_111_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_135to136_bb1_memcoalesce_inputArray_extrValue_111_0_NO_SHIFT_REG = rnode_135to136_bb1_memcoalesce_inputArray_extrValue_111_0_reg_136_NO_SHIFT_REG;
assign rnode_135to136_bb1_memcoalesce_inputArray_extrValue_111_0_stall_in_reg_136_NO_SHIFT_REG = 1'b0;
assign rnode_135to136_bb1_memcoalesce_inputArray_extrValue_111_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb1_and_i242_stall_local;
wire [31:0] local_bb1_and_i242;

assign local_bb1_and_i242 = ((rnode_134to136_bb1_shr_i241_0_NO_SHIFT_REG & 32'h1FF) & 32'hFF);

// Register node:
//  * latency = 2
//  * capacity = 2
 logic rnode_135to137_bb1_and4_i244_0_valid_out_NO_SHIFT_REG;
 logic rnode_135to137_bb1_and4_i244_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_135to137_bb1_and4_i244_0_NO_SHIFT_REG;
 logic rnode_135to137_bb1_and4_i244_0_reg_137_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_135to137_bb1_and4_i244_0_reg_137_NO_SHIFT_REG;
 logic rnode_135to137_bb1_and4_i244_0_valid_out_reg_137_NO_SHIFT_REG;
 logic rnode_135to137_bb1_and4_i244_0_stall_in_reg_137_NO_SHIFT_REG;
 logic rnode_135to137_bb1_and4_i244_0_stall_out_reg_137_NO_SHIFT_REG;

acl_data_fifo rnode_135to137_bb1_and4_i244_0_reg_137_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_135to137_bb1_and4_i244_0_reg_137_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_135to137_bb1_and4_i244_0_stall_in_reg_137_NO_SHIFT_REG),
	.valid_out(rnode_135to137_bb1_and4_i244_0_valid_out_reg_137_NO_SHIFT_REG),
	.stall_out(rnode_135to137_bb1_and4_i244_0_stall_out_reg_137_NO_SHIFT_REG),
	.data_in((rnode_134to135_bb1_and4_i244_0_NO_SHIFT_REG & 32'h80000000)),
	.data_out(rnode_135to137_bb1_and4_i244_0_reg_137_NO_SHIFT_REG)
);

defparam rnode_135to137_bb1_and4_i244_0_reg_137_fifo.DEPTH = 2;
defparam rnode_135to137_bb1_and4_i244_0_reg_137_fifo.DATA_WIDTH = 32;
defparam rnode_135to137_bb1_and4_i244_0_reg_137_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_135to137_bb1_and4_i244_0_reg_137_fifo.IMPL = "shift_reg";

assign rnode_135to137_bb1_and4_i244_0_reg_137_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_134to135_bb1_and4_i244_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_135to137_bb1_and4_i244_0_NO_SHIFT_REG = rnode_135to137_bb1_and4_i244_0_reg_137_NO_SHIFT_REG;
assign rnode_135to137_bb1_and4_i244_0_stall_in_reg_137_NO_SHIFT_REG = 1'b0;
assign rnode_135to137_bb1_and4_i244_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb1_and_i10_stall_local;
wire [31:0] local_bb1_and_i10;

assign local_bb1_and_i10 = ((rnode_134to136_bb1_shr_i9_0_NO_SHIFT_REG & 32'h1FF) & 32'hFF);

// Register node:
//  * latency = 2
//  * capacity = 2
 logic rnode_135to137_bb1_and4_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_135to137_bb1_and4_i_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_135to137_bb1_and4_i_0_NO_SHIFT_REG;
 logic rnode_135to137_bb1_and4_i_0_reg_137_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_135to137_bb1_and4_i_0_reg_137_NO_SHIFT_REG;
 logic rnode_135to137_bb1_and4_i_0_valid_out_reg_137_NO_SHIFT_REG;
 logic rnode_135to137_bb1_and4_i_0_stall_in_reg_137_NO_SHIFT_REG;
 logic rnode_135to137_bb1_and4_i_0_stall_out_reg_137_NO_SHIFT_REG;

acl_data_fifo rnode_135to137_bb1_and4_i_0_reg_137_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_135to137_bb1_and4_i_0_reg_137_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_135to137_bb1_and4_i_0_stall_in_reg_137_NO_SHIFT_REG),
	.valid_out(rnode_135to137_bb1_and4_i_0_valid_out_reg_137_NO_SHIFT_REG),
	.stall_out(rnode_135to137_bb1_and4_i_0_stall_out_reg_137_NO_SHIFT_REG),
	.data_in((rnode_134to135_bb1_and4_i_0_NO_SHIFT_REG & 32'h80000000)),
	.data_out(rnode_135to137_bb1_and4_i_0_reg_137_NO_SHIFT_REG)
);

defparam rnode_135to137_bb1_and4_i_0_reg_137_fifo.DEPTH = 2;
defparam rnode_135to137_bb1_and4_i_0_reg_137_fifo.DATA_WIDTH = 32;
defparam rnode_135to137_bb1_and4_i_0_reg_137_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_135to137_bb1_and4_i_0_reg_137_fifo.IMPL = "shift_reg";

assign rnode_135to137_bb1_and4_i_0_reg_137_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_134to135_bb1_and4_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_135to137_bb1_and4_i_0_NO_SHIFT_REG = rnode_135to137_bb1_and4_i_0_reg_137_NO_SHIFT_REG;
assign rnode_135to137_bb1_and4_i_0_stall_in_reg_137_NO_SHIFT_REG = 1'b0;
assign rnode_135to137_bb1_and4_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 2
//  * capacity = 2
 logic rnode_135to137_bb1_lnot14_not_i248_0_valid_out_NO_SHIFT_REG;
 logic rnode_135to137_bb1_lnot14_not_i248_0_stall_in_NO_SHIFT_REG;
 logic rnode_135to137_bb1_lnot14_not_i248_0_NO_SHIFT_REG;
 logic rnode_135to137_bb1_lnot14_not_i248_0_reg_137_inputs_ready_NO_SHIFT_REG;
 logic rnode_135to137_bb1_lnot14_not_i248_0_reg_137_NO_SHIFT_REG;
 logic rnode_135to137_bb1_lnot14_not_i248_0_valid_out_reg_137_NO_SHIFT_REG;
 logic rnode_135to137_bb1_lnot14_not_i248_0_stall_in_reg_137_NO_SHIFT_REG;
 logic rnode_135to137_bb1_lnot14_not_i248_0_stall_out_reg_137_NO_SHIFT_REG;

acl_data_fifo rnode_135to137_bb1_lnot14_not_i248_0_reg_137_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_135to137_bb1_lnot14_not_i248_0_reg_137_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_135to137_bb1_lnot14_not_i248_0_stall_in_reg_137_NO_SHIFT_REG),
	.valid_out(rnode_135to137_bb1_lnot14_not_i248_0_valid_out_reg_137_NO_SHIFT_REG),
	.stall_out(rnode_135to137_bb1_lnot14_not_i248_0_stall_out_reg_137_NO_SHIFT_REG),
	.data_in(rnode_134to135_bb1_lnot14_not_i248_0_NO_SHIFT_REG),
	.data_out(rnode_135to137_bb1_lnot14_not_i248_0_reg_137_NO_SHIFT_REG)
);

defparam rnode_135to137_bb1_lnot14_not_i248_0_reg_137_fifo.DEPTH = 2;
defparam rnode_135to137_bb1_lnot14_not_i248_0_reg_137_fifo.DATA_WIDTH = 1;
defparam rnode_135to137_bb1_lnot14_not_i248_0_reg_137_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_135to137_bb1_lnot14_not_i248_0_reg_137_fifo.IMPL = "shift_reg";

assign rnode_135to137_bb1_lnot14_not_i248_0_reg_137_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_134to135_bb1_lnot14_not_i248_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_135to137_bb1_lnot14_not_i248_0_NO_SHIFT_REG = rnode_135to137_bb1_lnot14_not_i248_0_reg_137_NO_SHIFT_REG;
assign rnode_135to137_bb1_lnot14_not_i248_0_stall_in_reg_137_NO_SHIFT_REG = 1'b0;
assign rnode_135to137_bb1_lnot14_not_i248_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_135to136_bb1_lnot14_not_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_135to136_bb1_lnot14_not_i_0_stall_in_NO_SHIFT_REG;
 logic rnode_135to136_bb1_lnot14_not_i_0_NO_SHIFT_REG;
 logic rnode_135to136_bb1_lnot14_not_i_0_reg_136_inputs_ready_NO_SHIFT_REG;
 logic rnode_135to136_bb1_lnot14_not_i_0_reg_136_NO_SHIFT_REG;
 logic rnode_135to136_bb1_lnot14_not_i_0_valid_out_reg_136_NO_SHIFT_REG;
 logic rnode_135to136_bb1_lnot14_not_i_0_stall_in_reg_136_NO_SHIFT_REG;
 logic rnode_135to136_bb1_lnot14_not_i_0_stall_out_reg_136_NO_SHIFT_REG;

acl_data_fifo rnode_135to136_bb1_lnot14_not_i_0_reg_136_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_135to136_bb1_lnot14_not_i_0_reg_136_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_135to136_bb1_lnot14_not_i_0_stall_in_reg_136_NO_SHIFT_REG),
	.valid_out(rnode_135to136_bb1_lnot14_not_i_0_valid_out_reg_136_NO_SHIFT_REG),
	.stall_out(rnode_135to136_bb1_lnot14_not_i_0_stall_out_reg_136_NO_SHIFT_REG),
	.data_in(rnode_134to135_bb1_lnot14_not_i_0_NO_SHIFT_REG),
	.data_out(rnode_135to136_bb1_lnot14_not_i_0_reg_136_NO_SHIFT_REG)
);

defparam rnode_135to136_bb1_lnot14_not_i_0_reg_136_fifo.DEPTH = 1;
defparam rnode_135to136_bb1_lnot14_not_i_0_reg_136_fifo.DATA_WIDTH = 1;
defparam rnode_135to136_bb1_lnot14_not_i_0_reg_136_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_135to136_bb1_lnot14_not_i_0_reg_136_fifo.IMPL = "shift_reg";

assign rnode_135to136_bb1_lnot14_not_i_0_reg_136_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_134to135_bb1_lnot14_not_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_135to136_bb1_lnot14_not_i_0_NO_SHIFT_REG = rnode_135to136_bb1_lnot14_not_i_0_reg_136_NO_SHIFT_REG;
assign rnode_135to136_bb1_lnot14_not_i_0_stall_in_reg_136_NO_SHIFT_REG = 1'b0;
assign rnode_135to136_bb1_lnot14_not_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb1_conv3_i_i259_stall_local;
wire [31:0] local_bb1_conv3_i_i259;
wire [63:0] local_bb1_conv3_i_i259$ps;

assign local_bb1_conv3_i_i259$ps = (local_bb1_mul_i_i258 & 64'hFFFFFFFFFFFF);
assign local_bb1_conv3_i_i259 = local_bb1_conv3_i_i259$ps[31:0];

// This section implements an unregistered operation.
// 
wire local_bb1_var__u2_stall_local;
wire [63:0] local_bb1_var__u2;

assign local_bb1_var__u2 = ((local_bb1_mul_i_i258 & 64'hFFFFFFFFFFFF) >> 64'h18);

// This section implements an unregistered operation.
// 
wire local_bb1_conv3_i_i_stall_local;
wire [31:0] local_bb1_conv3_i_i;
wire [63:0] local_bb1_conv3_i_i$ps;

assign local_bb1_conv3_i_i$ps = (local_bb1_mul_i_i & 64'hFFFFFFFFFFFF);
assign local_bb1_conv3_i_i = local_bb1_conv3_i_i$ps[31:0];

// This section implements an unregistered operation.
// 
wire local_bb1_var__u3_stall_local;
wire [63:0] local_bb1_var__u3;

assign local_bb1_var__u3 = ((local_bb1_mul_i_i & 64'hFFFFFFFFFFFF) >> 64'h18);

// This section implements a registered operation.
// 
wire SFC_1_VALID_140_141_0_inputs_ready;
 reg SFC_1_VALID_140_141_0_valid_out_NO_SHIFT_REG;
wire SFC_1_VALID_140_141_0_stall_in;
wire SFC_1_VALID_140_141_0_output_regs_ready;
 reg SFC_1_VALID_140_141_0_NO_SHIFT_REG /* synthesis  preserve  */;
wire SFC_1_VALID_140_141_0_causedstall;

assign SFC_1_VALID_140_141_0_inputs_ready = 1'b1;
assign SFC_1_VALID_140_141_0_output_regs_ready = 1'b1;
assign SFC_1_VALID_139_140_0_stall_in = 1'b0;
assign SFC_1_VALID_140_141_0_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		SFC_1_VALID_140_141_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (SFC_1_VALID_140_141_0_output_regs_ready)
		begin
			SFC_1_VALID_140_141_0_NO_SHIFT_REG <= SFC_1_VALID_139_140_0_NO_SHIFT_REG;
		end
	end
end


// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_136to137_bb1_memcoalesce_inputArray_extrValue_111_0_valid_out_NO_SHIFT_REG;
 logic rnode_136to137_bb1_memcoalesce_inputArray_extrValue_111_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_136to137_bb1_memcoalesce_inputArray_extrValue_111_0_NO_SHIFT_REG;
 logic rnode_136to137_bb1_memcoalesce_inputArray_extrValue_111_0_reg_137_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_136to137_bb1_memcoalesce_inputArray_extrValue_111_0_reg_137_NO_SHIFT_REG;
 logic rnode_136to137_bb1_memcoalesce_inputArray_extrValue_111_0_valid_out_reg_137_NO_SHIFT_REG;
 logic rnode_136to137_bb1_memcoalesce_inputArray_extrValue_111_0_stall_in_reg_137_NO_SHIFT_REG;
 logic rnode_136to137_bb1_memcoalesce_inputArray_extrValue_111_0_stall_out_reg_137_NO_SHIFT_REG;

acl_data_fifo rnode_136to137_bb1_memcoalesce_inputArray_extrValue_111_0_reg_137_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_136to137_bb1_memcoalesce_inputArray_extrValue_111_0_reg_137_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_136to137_bb1_memcoalesce_inputArray_extrValue_111_0_stall_in_reg_137_NO_SHIFT_REG),
	.valid_out(rnode_136to137_bb1_memcoalesce_inputArray_extrValue_111_0_valid_out_reg_137_NO_SHIFT_REG),
	.stall_out(rnode_136to137_bb1_memcoalesce_inputArray_extrValue_111_0_stall_out_reg_137_NO_SHIFT_REG),
	.data_in(rnode_135to136_bb1_memcoalesce_inputArray_extrValue_111_0_NO_SHIFT_REG),
	.data_out(rnode_136to137_bb1_memcoalesce_inputArray_extrValue_111_0_reg_137_NO_SHIFT_REG)
);

defparam rnode_136to137_bb1_memcoalesce_inputArray_extrValue_111_0_reg_137_fifo.DEPTH = 1;
defparam rnode_136to137_bb1_memcoalesce_inputArray_extrValue_111_0_reg_137_fifo.DATA_WIDTH = 32;
defparam rnode_136to137_bb1_memcoalesce_inputArray_extrValue_111_0_reg_137_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_136to137_bb1_memcoalesce_inputArray_extrValue_111_0_reg_137_fifo.IMPL = "shift_reg";

assign rnode_136to137_bb1_memcoalesce_inputArray_extrValue_111_0_reg_137_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_135to136_bb1_memcoalesce_inputArray_extrValue_111_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_136to137_bb1_memcoalesce_inputArray_extrValue_111_0_NO_SHIFT_REG = rnode_136to137_bb1_memcoalesce_inputArray_extrValue_111_0_reg_137_NO_SHIFT_REG;
assign rnode_136to137_bb1_memcoalesce_inputArray_extrValue_111_0_stall_in_reg_137_NO_SHIFT_REG = 1'b0;
assign rnode_136to137_bb1_memcoalesce_inputArray_extrValue_111_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb1_and_i242_valid_out_1;
wire local_bb1_and_i242_stall_in_1;
wire local_bb1_add_i265_valid_out;
wire local_bb1_add_i265_stall_in;
wire local_bb1_add_i265_inputs_ready;
wire local_bb1_add_i265_stall_local;
wire [31:0] local_bb1_add_i265;

assign local_bb1_add_i265_inputs_ready = rnode_134to136_bb1_shr_i241_0_valid_out_NO_SHIFT_REG;
assign local_bb1_add_i265 = ((local_bb1_and_i242 & 32'hFF) + 32'h7D);
assign local_bb1_and_i242_valid_out_1 = 1'b1;
assign local_bb1_add_i265_valid_out = 1'b1;
assign rnode_134to136_bb1_shr_i241_0_stall_in_NO_SHIFT_REG = 1'b0;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_137to138_bb1_and4_i244_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_137to138_bb1_and4_i244_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_137to138_bb1_and4_i244_0_NO_SHIFT_REG;
 logic rnode_137to138_bb1_and4_i244_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_137to138_bb1_and4_i244_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_137to138_bb1_and4_i244_1_NO_SHIFT_REG;
 logic rnode_137to138_bb1_and4_i244_0_reg_138_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_137to138_bb1_and4_i244_0_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_and4_i244_0_valid_out_0_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_and4_i244_0_stall_in_0_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_and4_i244_0_stall_out_reg_138_NO_SHIFT_REG;

acl_data_fifo rnode_137to138_bb1_and4_i244_0_reg_138_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_137to138_bb1_and4_i244_0_reg_138_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_137to138_bb1_and4_i244_0_stall_in_0_reg_138_NO_SHIFT_REG),
	.valid_out(rnode_137to138_bb1_and4_i244_0_valid_out_0_reg_138_NO_SHIFT_REG),
	.stall_out(rnode_137to138_bb1_and4_i244_0_stall_out_reg_138_NO_SHIFT_REG),
	.data_in((rnode_135to137_bb1_and4_i244_0_NO_SHIFT_REG & 32'h80000000)),
	.data_out(rnode_137to138_bb1_and4_i244_0_reg_138_NO_SHIFT_REG)
);

defparam rnode_137to138_bb1_and4_i244_0_reg_138_fifo.DEPTH = 1;
defparam rnode_137to138_bb1_and4_i244_0_reg_138_fifo.DATA_WIDTH = 32;
defparam rnode_137to138_bb1_and4_i244_0_reg_138_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_137to138_bb1_and4_i244_0_reg_138_fifo.IMPL = "shift_reg";

assign rnode_137to138_bb1_and4_i244_0_reg_138_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_135to137_bb1_and4_i244_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1_and4_i244_0_stall_in_0_reg_138_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1_and4_i244_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_137to138_bb1_and4_i244_0_NO_SHIFT_REG = rnode_137to138_bb1_and4_i244_0_reg_138_NO_SHIFT_REG;
assign rnode_137to138_bb1_and4_i244_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_137to138_bb1_and4_i244_1_NO_SHIFT_REG = rnode_137to138_bb1_and4_i244_0_reg_138_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb1_and_i10_valid_out_1;
wire local_bb1_and_i10_stall_in_1;
wire local_bb1_add_i18_valid_out;
wire local_bb1_add_i18_stall_in;
wire local_bb1_add_i18_inputs_ready;
wire local_bb1_add_i18_stall_local;
wire [31:0] local_bb1_add_i18;

assign local_bb1_add_i18_inputs_ready = rnode_134to136_bb1_shr_i9_0_valid_out_NO_SHIFT_REG;
assign local_bb1_add_i18 = ((local_bb1_and_i10 & 32'hFF) + 32'h7C);
assign local_bb1_and_i10_valid_out_1 = 1'b1;
assign local_bb1_add_i18_valid_out = 1'b1;
assign rnode_134to136_bb1_shr_i9_0_stall_in_NO_SHIFT_REG = 1'b0;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_137to138_bb1_and4_i_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_137to138_bb1_and4_i_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_137to138_bb1_and4_i_0_NO_SHIFT_REG;
 logic rnode_137to138_bb1_and4_i_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_137to138_bb1_and4_i_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_137to138_bb1_and4_i_1_NO_SHIFT_REG;
 logic rnode_137to138_bb1_and4_i_0_reg_138_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_137to138_bb1_and4_i_0_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_and4_i_0_valid_out_0_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_and4_i_0_stall_in_0_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_and4_i_0_stall_out_reg_138_NO_SHIFT_REG;

acl_data_fifo rnode_137to138_bb1_and4_i_0_reg_138_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_137to138_bb1_and4_i_0_reg_138_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_137to138_bb1_and4_i_0_stall_in_0_reg_138_NO_SHIFT_REG),
	.valid_out(rnode_137to138_bb1_and4_i_0_valid_out_0_reg_138_NO_SHIFT_REG),
	.stall_out(rnode_137to138_bb1_and4_i_0_stall_out_reg_138_NO_SHIFT_REG),
	.data_in((rnode_135to137_bb1_and4_i_0_NO_SHIFT_REG & 32'h80000000)),
	.data_out(rnode_137to138_bb1_and4_i_0_reg_138_NO_SHIFT_REG)
);

defparam rnode_137to138_bb1_and4_i_0_reg_138_fifo.DEPTH = 1;
defparam rnode_137to138_bb1_and4_i_0_reg_138_fifo.DATA_WIDTH = 32;
defparam rnode_137to138_bb1_and4_i_0_reg_138_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_137to138_bb1_and4_i_0_reg_138_fifo.IMPL = "shift_reg";

assign rnode_137to138_bb1_and4_i_0_reg_138_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_135to137_bb1_and4_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1_and4_i_0_stall_in_0_reg_138_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1_and4_i_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_137to138_bb1_and4_i_0_NO_SHIFT_REG = rnode_137to138_bb1_and4_i_0_reg_138_NO_SHIFT_REG;
assign rnode_137to138_bb1_and4_i_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_137to138_bb1_and4_i_1_NO_SHIFT_REG = rnode_137to138_bb1_and4_i_0_reg_138_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_137to138_bb1_lnot14_not_i248_0_valid_out_NO_SHIFT_REG;
 logic rnode_137to138_bb1_lnot14_not_i248_0_stall_in_NO_SHIFT_REG;
 logic rnode_137to138_bb1_lnot14_not_i248_0_NO_SHIFT_REG;
 logic rnode_137to138_bb1_lnot14_not_i248_0_reg_138_inputs_ready_NO_SHIFT_REG;
 logic rnode_137to138_bb1_lnot14_not_i248_0_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_lnot14_not_i248_0_valid_out_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_lnot14_not_i248_0_stall_in_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_lnot14_not_i248_0_stall_out_reg_138_NO_SHIFT_REG;

acl_data_fifo rnode_137to138_bb1_lnot14_not_i248_0_reg_138_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_137to138_bb1_lnot14_not_i248_0_reg_138_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_137to138_bb1_lnot14_not_i248_0_stall_in_reg_138_NO_SHIFT_REG),
	.valid_out(rnode_137to138_bb1_lnot14_not_i248_0_valid_out_reg_138_NO_SHIFT_REG),
	.stall_out(rnode_137to138_bb1_lnot14_not_i248_0_stall_out_reg_138_NO_SHIFT_REG),
	.data_in(rnode_135to137_bb1_lnot14_not_i248_0_NO_SHIFT_REG),
	.data_out(rnode_137to138_bb1_lnot14_not_i248_0_reg_138_NO_SHIFT_REG)
);

defparam rnode_137to138_bb1_lnot14_not_i248_0_reg_138_fifo.DEPTH = 1;
defparam rnode_137to138_bb1_lnot14_not_i248_0_reg_138_fifo.DATA_WIDTH = 1;
defparam rnode_137to138_bb1_lnot14_not_i248_0_reg_138_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_137to138_bb1_lnot14_not_i248_0_reg_138_fifo.IMPL = "shift_reg";

assign rnode_137to138_bb1_lnot14_not_i248_0_reg_138_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_135to137_bb1_lnot14_not_i248_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1_lnot14_not_i248_0_NO_SHIFT_REG = rnode_137to138_bb1_lnot14_not_i248_0_reg_138_NO_SHIFT_REG;
assign rnode_137to138_bb1_lnot14_not_i248_0_stall_in_reg_138_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1_lnot14_not_i248_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_136to137_bb1_lnot14_not_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_136to137_bb1_lnot14_not_i_0_stall_in_NO_SHIFT_REG;
 logic rnode_136to137_bb1_lnot14_not_i_0_NO_SHIFT_REG;
 logic rnode_136to137_bb1_lnot14_not_i_0_reg_137_inputs_ready_NO_SHIFT_REG;
 logic rnode_136to137_bb1_lnot14_not_i_0_reg_137_NO_SHIFT_REG;
 logic rnode_136to137_bb1_lnot14_not_i_0_valid_out_reg_137_NO_SHIFT_REG;
 logic rnode_136to137_bb1_lnot14_not_i_0_stall_in_reg_137_NO_SHIFT_REG;
 logic rnode_136to137_bb1_lnot14_not_i_0_stall_out_reg_137_NO_SHIFT_REG;

acl_data_fifo rnode_136to137_bb1_lnot14_not_i_0_reg_137_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_136to137_bb1_lnot14_not_i_0_reg_137_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_136to137_bb1_lnot14_not_i_0_stall_in_reg_137_NO_SHIFT_REG),
	.valid_out(rnode_136to137_bb1_lnot14_not_i_0_valid_out_reg_137_NO_SHIFT_REG),
	.stall_out(rnode_136to137_bb1_lnot14_not_i_0_stall_out_reg_137_NO_SHIFT_REG),
	.data_in(rnode_135to136_bb1_lnot14_not_i_0_NO_SHIFT_REG),
	.data_out(rnode_136to137_bb1_lnot14_not_i_0_reg_137_NO_SHIFT_REG)
);

defparam rnode_136to137_bb1_lnot14_not_i_0_reg_137_fifo.DEPTH = 1;
defparam rnode_136to137_bb1_lnot14_not_i_0_reg_137_fifo.DATA_WIDTH = 1;
defparam rnode_136to137_bb1_lnot14_not_i_0_reg_137_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_136to137_bb1_lnot14_not_i_0_reg_137_fifo.IMPL = "shift_reg";

assign rnode_136to137_bb1_lnot14_not_i_0_reg_137_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_135to136_bb1_lnot14_not_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_136to137_bb1_lnot14_not_i_0_NO_SHIFT_REG = rnode_136to137_bb1_lnot14_not_i_0_reg_137_NO_SHIFT_REG;
assign rnode_136to137_bb1_lnot14_not_i_0_stall_in_reg_137_NO_SHIFT_REG = 1'b0;
assign rnode_136to137_bb1_lnot14_not_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb1_shr_i2_i262_stall_local;
wire [31:0] local_bb1_shr_i2_i262;

assign local_bb1_shr_i2_i262 = (local_bb1_conv3_i_i259 >> 32'h18);

// This section implements an unregistered operation.
// 
wire local_bb1_shl1_i4_i264_stall_local;
wire [31:0] local_bb1_shl1_i4_i264;

assign local_bb1_shl1_i4_i264 = (local_bb1_conv3_i_i259 << 32'h8);

// This section implements an unregistered operation.
// 
wire local_bb1_var__u4_stall_local;
wire [31:0] local_bb1_var__u4;

assign local_bb1_var__u4 = (local_bb1_conv3_i_i259 >> 32'h17);

// This section implements an unregistered operation.
// 
wire local_bb1_shl1_i_i273_stall_local;
wire [31:0] local_bb1_shl1_i_i273;

assign local_bb1_shl1_i_i273 = (local_bb1_conv3_i_i259 << 32'h9);

// This section implements an unregistered operation.
// 
wire local_bb1__tr_i260_stall_local;
wire [31:0] local_bb1__tr_i260;
wire [63:0] local_bb1__tr_i260$ps;

assign local_bb1__tr_i260$ps = (local_bb1_var__u2 & 64'hFFFFFF);
assign local_bb1__tr_i260 = local_bb1__tr_i260$ps[31:0];

// This section implements an unregistered operation.
// 
wire local_bb1_shr_i2_i_stall_local;
wire [31:0] local_bb1_shr_i2_i;

assign local_bb1_shr_i2_i = (local_bb1_conv3_i_i >> 32'h18);

// This section implements an unregistered operation.
// 
wire local_bb1_shl1_i4_i_stall_local;
wire [31:0] local_bb1_shl1_i4_i;

assign local_bb1_shl1_i4_i = (local_bb1_conv3_i_i << 32'h8);

// This section implements an unregistered operation.
// 
wire local_bb1_var__u5_stall_local;
wire [31:0] local_bb1_var__u5;

assign local_bb1_var__u5 = (local_bb1_conv3_i_i >> 32'h17);

// This section implements an unregistered operation.
// 
wire local_bb1_shl1_i_i_stall_local;
wire [31:0] local_bb1_shl1_i_i;

assign local_bb1_shl1_i_i = (local_bb1_conv3_i_i << 32'h9);

// This section implements an unregistered operation.
// 
wire local_bb1__tr_i_stall_local;
wire [31:0] local_bb1__tr_i;
wire [63:0] local_bb1__tr_i$ps;

assign local_bb1__tr_i$ps = (local_bb1_var__u3 & 64'hFFFFFF);
assign local_bb1__tr_i = local_bb1__tr_i$ps[31:0];

// This section implements a registered operation.
// 
wire SFC_1_VALID_141_142_0_inputs_ready;
 reg SFC_1_VALID_141_142_0_valid_out_NO_SHIFT_REG;
wire SFC_1_VALID_141_142_0_stall_in;
wire SFC_1_VALID_141_142_0_output_regs_ready;
 reg SFC_1_VALID_141_142_0_NO_SHIFT_REG /* synthesis  preserve  */;
wire SFC_1_VALID_141_142_0_causedstall;

assign SFC_1_VALID_141_142_0_inputs_ready = 1'b1;
assign SFC_1_VALID_141_142_0_output_regs_ready = 1'b1;
assign SFC_1_VALID_140_141_0_stall_in = 1'b0;
assign SFC_1_VALID_141_142_0_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		SFC_1_VALID_141_142_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (SFC_1_VALID_141_142_0_output_regs_ready)
		begin
			SFC_1_VALID_141_142_0_NO_SHIFT_REG <= SFC_1_VALID_140_141_0_NO_SHIFT_REG;
		end
	end
end


// This section implements an unregistered operation.
// 
wire local_bb1_var__u6_stall_local;
wire [31:0] local_bb1_var__u6;

assign local_bb1_var__u6 = rnode_136to137_bb1_memcoalesce_inputArray_extrValue_111_0_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_136to137_bb1_and_i242_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_136to137_bb1_and_i242_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_136to137_bb1_and_i242_0_NO_SHIFT_REG;
 logic rnode_136to137_bb1_and_i242_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_136to137_bb1_and_i242_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_136to137_bb1_and_i242_1_NO_SHIFT_REG;
 logic rnode_136to137_bb1_and_i242_0_valid_out_2_NO_SHIFT_REG;
 logic rnode_136to137_bb1_and_i242_0_stall_in_2_NO_SHIFT_REG;
 logic [31:0] rnode_136to137_bb1_and_i242_2_NO_SHIFT_REG;
 logic rnode_136to137_bb1_and_i242_0_reg_137_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_136to137_bb1_and_i242_0_reg_137_NO_SHIFT_REG;
 logic rnode_136to137_bb1_and_i242_0_valid_out_0_reg_137_NO_SHIFT_REG;
 logic rnode_136to137_bb1_and_i242_0_stall_in_0_reg_137_NO_SHIFT_REG;
 logic rnode_136to137_bb1_and_i242_0_stall_out_reg_137_NO_SHIFT_REG;

acl_data_fifo rnode_136to137_bb1_and_i242_0_reg_137_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_136to137_bb1_and_i242_0_reg_137_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_136to137_bb1_and_i242_0_stall_in_0_reg_137_NO_SHIFT_REG),
	.valid_out(rnode_136to137_bb1_and_i242_0_valid_out_0_reg_137_NO_SHIFT_REG),
	.stall_out(rnode_136to137_bb1_and_i242_0_stall_out_reg_137_NO_SHIFT_REG),
	.data_in((local_bb1_and_i242 & 32'hFF)),
	.data_out(rnode_136to137_bb1_and_i242_0_reg_137_NO_SHIFT_REG)
);

defparam rnode_136to137_bb1_and_i242_0_reg_137_fifo.DEPTH = 1;
defparam rnode_136to137_bb1_and_i242_0_reg_137_fifo.DATA_WIDTH = 32;
defparam rnode_136to137_bb1_and_i242_0_reg_137_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_136to137_bb1_and_i242_0_reg_137_fifo.IMPL = "shift_reg";

assign rnode_136to137_bb1_and_i242_0_reg_137_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_and_i242_stall_in_1 = 1'b0;
assign rnode_136to137_bb1_and_i242_0_stall_in_0_reg_137_NO_SHIFT_REG = 1'b0;
assign rnode_136to137_bb1_and_i242_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_136to137_bb1_and_i242_0_NO_SHIFT_REG = rnode_136to137_bb1_and_i242_0_reg_137_NO_SHIFT_REG;
assign rnode_136to137_bb1_and_i242_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_136to137_bb1_and_i242_1_NO_SHIFT_REG = rnode_136to137_bb1_and_i242_0_reg_137_NO_SHIFT_REG;
assign rnode_136to137_bb1_and_i242_0_valid_out_2_NO_SHIFT_REG = 1'b1;
assign rnode_136to137_bb1_and_i242_2_NO_SHIFT_REG = rnode_136to137_bb1_and_i242_0_reg_137_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_136to137_bb1_add_i265_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_136to137_bb1_add_i265_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_136to137_bb1_add_i265_0_NO_SHIFT_REG;
 logic rnode_136to137_bb1_add_i265_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_136to137_bb1_add_i265_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_136to137_bb1_add_i265_1_NO_SHIFT_REG;
 logic rnode_136to137_bb1_add_i265_0_reg_137_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_136to137_bb1_add_i265_0_reg_137_NO_SHIFT_REG;
 logic rnode_136to137_bb1_add_i265_0_valid_out_0_reg_137_NO_SHIFT_REG;
 logic rnode_136to137_bb1_add_i265_0_stall_in_0_reg_137_NO_SHIFT_REG;
 logic rnode_136to137_bb1_add_i265_0_stall_out_reg_137_NO_SHIFT_REG;

acl_data_fifo rnode_136to137_bb1_add_i265_0_reg_137_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_136to137_bb1_add_i265_0_reg_137_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_136to137_bb1_add_i265_0_stall_in_0_reg_137_NO_SHIFT_REG),
	.valid_out(rnode_136to137_bb1_add_i265_0_valid_out_0_reg_137_NO_SHIFT_REG),
	.stall_out(rnode_136to137_bb1_add_i265_0_stall_out_reg_137_NO_SHIFT_REG),
	.data_in((local_bb1_add_i265 & 32'h1FF)),
	.data_out(rnode_136to137_bb1_add_i265_0_reg_137_NO_SHIFT_REG)
);

defparam rnode_136to137_bb1_add_i265_0_reg_137_fifo.DEPTH = 1;
defparam rnode_136to137_bb1_add_i265_0_reg_137_fifo.DATA_WIDTH = 32;
defparam rnode_136to137_bb1_add_i265_0_reg_137_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_136to137_bb1_add_i265_0_reg_137_fifo.IMPL = "shift_reg";

assign rnode_136to137_bb1_add_i265_0_reg_137_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_add_i265_stall_in = 1'b0;
assign rnode_136to137_bb1_add_i265_0_stall_in_0_reg_137_NO_SHIFT_REG = 1'b0;
assign rnode_136to137_bb1_add_i265_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_136to137_bb1_add_i265_0_NO_SHIFT_REG = rnode_136to137_bb1_add_i265_0_reg_137_NO_SHIFT_REG;
assign rnode_136to137_bb1_add_i265_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_136to137_bb1_add_i265_1_NO_SHIFT_REG = rnode_136to137_bb1_add_i265_0_reg_137_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_136to137_bb1_and_i10_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_136to137_bb1_and_i10_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_136to137_bb1_and_i10_0_NO_SHIFT_REG;
 logic rnode_136to137_bb1_and_i10_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_136to137_bb1_and_i10_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_136to137_bb1_and_i10_1_NO_SHIFT_REG;
 logic rnode_136to137_bb1_and_i10_0_valid_out_2_NO_SHIFT_REG;
 logic rnode_136to137_bb1_and_i10_0_stall_in_2_NO_SHIFT_REG;
 logic [31:0] rnode_136to137_bb1_and_i10_2_NO_SHIFT_REG;
 logic rnode_136to137_bb1_and_i10_0_reg_137_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_136to137_bb1_and_i10_0_reg_137_NO_SHIFT_REG;
 logic rnode_136to137_bb1_and_i10_0_valid_out_0_reg_137_NO_SHIFT_REG;
 logic rnode_136to137_bb1_and_i10_0_stall_in_0_reg_137_NO_SHIFT_REG;
 logic rnode_136to137_bb1_and_i10_0_stall_out_reg_137_NO_SHIFT_REG;

acl_data_fifo rnode_136to137_bb1_and_i10_0_reg_137_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_136to137_bb1_and_i10_0_reg_137_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_136to137_bb1_and_i10_0_stall_in_0_reg_137_NO_SHIFT_REG),
	.valid_out(rnode_136to137_bb1_and_i10_0_valid_out_0_reg_137_NO_SHIFT_REG),
	.stall_out(rnode_136to137_bb1_and_i10_0_stall_out_reg_137_NO_SHIFT_REG),
	.data_in((local_bb1_and_i10 & 32'hFF)),
	.data_out(rnode_136to137_bb1_and_i10_0_reg_137_NO_SHIFT_REG)
);

defparam rnode_136to137_bb1_and_i10_0_reg_137_fifo.DEPTH = 1;
defparam rnode_136to137_bb1_and_i10_0_reg_137_fifo.DATA_WIDTH = 32;
defparam rnode_136to137_bb1_and_i10_0_reg_137_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_136to137_bb1_and_i10_0_reg_137_fifo.IMPL = "shift_reg";

assign rnode_136to137_bb1_and_i10_0_reg_137_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_and_i10_stall_in_1 = 1'b0;
assign rnode_136to137_bb1_and_i10_0_stall_in_0_reg_137_NO_SHIFT_REG = 1'b0;
assign rnode_136to137_bb1_and_i10_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_136to137_bb1_and_i10_0_NO_SHIFT_REG = rnode_136to137_bb1_and_i10_0_reg_137_NO_SHIFT_REG;
assign rnode_136to137_bb1_and_i10_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_136to137_bb1_and_i10_1_NO_SHIFT_REG = rnode_136to137_bb1_and_i10_0_reg_137_NO_SHIFT_REG;
assign rnode_136to137_bb1_and_i10_0_valid_out_2_NO_SHIFT_REG = 1'b1;
assign rnode_136to137_bb1_and_i10_2_NO_SHIFT_REG = rnode_136to137_bb1_and_i10_0_reg_137_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_136to137_bb1_add_i18_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_136to137_bb1_add_i18_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_136to137_bb1_add_i18_0_NO_SHIFT_REG;
 logic rnode_136to137_bb1_add_i18_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_136to137_bb1_add_i18_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_136to137_bb1_add_i18_1_NO_SHIFT_REG;
 logic rnode_136to137_bb1_add_i18_0_reg_137_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_136to137_bb1_add_i18_0_reg_137_NO_SHIFT_REG;
 logic rnode_136to137_bb1_add_i18_0_valid_out_0_reg_137_NO_SHIFT_REG;
 logic rnode_136to137_bb1_add_i18_0_stall_in_0_reg_137_NO_SHIFT_REG;
 logic rnode_136to137_bb1_add_i18_0_stall_out_reg_137_NO_SHIFT_REG;

acl_data_fifo rnode_136to137_bb1_add_i18_0_reg_137_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_136to137_bb1_add_i18_0_reg_137_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_136to137_bb1_add_i18_0_stall_in_0_reg_137_NO_SHIFT_REG),
	.valid_out(rnode_136to137_bb1_add_i18_0_valid_out_0_reg_137_NO_SHIFT_REG),
	.stall_out(rnode_136to137_bb1_add_i18_0_stall_out_reg_137_NO_SHIFT_REG),
	.data_in((local_bb1_add_i18 & 32'h1FF)),
	.data_out(rnode_136to137_bb1_add_i18_0_reg_137_NO_SHIFT_REG)
);

defparam rnode_136to137_bb1_add_i18_0_reg_137_fifo.DEPTH = 1;
defparam rnode_136to137_bb1_add_i18_0_reg_137_fifo.DATA_WIDTH = 32;
defparam rnode_136to137_bb1_add_i18_0_reg_137_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_136to137_bb1_add_i18_0_reg_137_fifo.IMPL = "shift_reg";

assign rnode_136to137_bb1_add_i18_0_reg_137_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_add_i18_stall_in = 1'b0;
assign rnode_136to137_bb1_add_i18_0_stall_in_0_reg_137_NO_SHIFT_REG = 1'b0;
assign rnode_136to137_bb1_add_i18_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_136to137_bb1_add_i18_0_NO_SHIFT_REG = rnode_136to137_bb1_add_i18_0_reg_137_NO_SHIFT_REG;
assign rnode_136to137_bb1_add_i18_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_136to137_bb1_add_i18_1_NO_SHIFT_REG = rnode_136to137_bb1_add_i18_0_reg_137_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb1_shr_i_i271_stall_local;
wire [31:0] local_bb1_shr_i_i271;

assign local_bb1_shr_i_i271 = ((local_bb1_var__u4 & 32'h1FF) & 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb1_shl_i1_i261_stall_local;
wire [31:0] local_bb1_shl_i1_i261;

assign local_bb1_shl_i1_i261 = ((local_bb1__tr_i260 & 32'hFFFFFF) & 32'hFFFF00);

// This section implements an unregistered operation.
// 
wire local_bb1_and48_i266_stall_local;
wire [31:0] local_bb1_and48_i266;

assign local_bb1_and48_i266 = ((local_bb1__tr_i260 & 32'hFFFFFF) & 32'h800000);

// This section implements an unregistered operation.
// 
wire local_bb1_shr_i_i19_stall_local;
wire [31:0] local_bb1_shr_i_i19;

assign local_bb1_shr_i_i19 = ((local_bb1_var__u5 & 32'h1FF) & 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb1_shl_i1_i_stall_local;
wire [31:0] local_bb1_shl_i1_i;

assign local_bb1_shl_i1_i = ((local_bb1__tr_i & 32'hFFFFFF) & 32'hFFFF00);

// This section implements an unregistered operation.
// 
wire local_bb1_and48_i_stall_local;
wire [31:0] local_bb1_and48_i;

assign local_bb1_and48_i = ((local_bb1__tr_i & 32'hFFFFFF) & 32'h800000);

// This section implements a registered operation.
// 
wire SFC_1_VALID_142_143_0_inputs_ready;
 reg SFC_1_VALID_142_143_0_valid_out_NO_SHIFT_REG;
wire SFC_1_VALID_142_143_0_stall_in;
wire SFC_1_VALID_142_143_0_output_regs_ready;
 reg SFC_1_VALID_142_143_0_NO_SHIFT_REG /* synthesis  preserve  */;
wire SFC_1_VALID_142_143_0_causedstall;

assign SFC_1_VALID_142_143_0_inputs_ready = 1'b1;
assign SFC_1_VALID_142_143_0_output_regs_ready = 1'b1;
assign SFC_1_VALID_141_142_0_stall_in = 1'b0;
assign SFC_1_VALID_142_143_0_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		SFC_1_VALID_142_143_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (SFC_1_VALID_142_143_0_output_regs_ready)
		begin
			SFC_1_VALID_142_143_0_NO_SHIFT_REG <= SFC_1_VALID_141_142_0_NO_SHIFT_REG;
		end
	end
end


// This section implements an unregistered operation.
// 
wire local_bb1_shr_i213_stall_local;
wire [31:0] local_bb1_shr_i213;

assign local_bb1_shr_i213 = (local_bb1_var__u6 >> 32'h17);

// This section implements an unregistered operation.
// 
wire local_bb1_and2_i216_stall_local;
wire [31:0] local_bb1_and2_i216;

assign local_bb1_and2_i216 = (local_bb1_var__u6 & 32'h7FFFFF);

// This section implements an unregistered operation.
// 
wire local_bb1_and28_i230_stall_local;
wire [31:0] local_bb1_and28_i230;

assign local_bb1_and28_i230 = (local_bb1_var__u6 & 32'h807FFFFF);

// This section implements an unregistered operation.
// 
wire local_bb1_lnot_i246_valid_out;
wire local_bb1_lnot_i246_stall_in;
wire local_bb1_lnot_i246_inputs_ready;
wire local_bb1_lnot_i246_stall_local;
wire local_bb1_lnot_i246;

assign local_bb1_lnot_i246_inputs_ready = rnode_136to137_bb1_and_i242_0_valid_out_0_NO_SHIFT_REG;
assign local_bb1_lnot_i246 = ((rnode_136to137_bb1_and_i242_0_NO_SHIFT_REG & 32'hFF) == 32'h0);
assign local_bb1_lnot_i246_valid_out = 1'b1;
assign rnode_136to137_bb1_and_i242_0_stall_in_0_NO_SHIFT_REG = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb1_cmp_i247_valid_out;
wire local_bb1_cmp_i247_stall_in;
wire local_bb1_cmp_i247_inputs_ready;
wire local_bb1_cmp_i247_stall_local;
wire local_bb1_cmp_i247;

assign local_bb1_cmp_i247_inputs_ready = rnode_136to137_bb1_and_i242_0_valid_out_1_NO_SHIFT_REG;
assign local_bb1_cmp_i247 = ((rnode_136to137_bb1_and_i242_1_NO_SHIFT_REG & 32'hFF) == 32'hFF);
assign local_bb1_cmp_i247_valid_out = 1'b1;
assign rnode_136to137_bb1_and_i242_0_stall_in_1_NO_SHIFT_REG = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb1_inc_i269_stall_local;
wire [31:0] local_bb1_inc_i269;

assign local_bb1_inc_i269 = ((rnode_136to137_bb1_and_i242_2_NO_SHIFT_REG & 32'hFF) + 32'h7E);

// This section implements an unregistered operation.
// 
wire local_bb1_cmp50_not_i268_stall_local;
wire local_bb1_cmp50_not_i268;

assign local_bb1_cmp50_not_i268 = ((rnode_136to137_bb1_add_i265_0_NO_SHIFT_REG & 32'h1FF) != 32'h7F);

// This section implements an unregistered operation.
// 
wire local_bb1_lnot_i12_valid_out;
wire local_bb1_lnot_i12_stall_in;
wire local_bb1_lnot_i12_inputs_ready;
wire local_bb1_lnot_i12_stall_local;
wire local_bb1_lnot_i12;

assign local_bb1_lnot_i12_inputs_ready = rnode_136to137_bb1_and_i10_0_valid_out_0_NO_SHIFT_REG;
assign local_bb1_lnot_i12 = ((rnode_136to137_bb1_and_i10_0_NO_SHIFT_REG & 32'hFF) == 32'h0);
assign local_bb1_lnot_i12_valid_out = 1'b1;
assign rnode_136to137_bb1_and_i10_0_stall_in_0_NO_SHIFT_REG = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb1_cmp_i13_stall_local;
wire local_bb1_cmp_i13;

assign local_bb1_cmp_i13 = ((rnode_136to137_bb1_and_i10_1_NO_SHIFT_REG & 32'hFF) == 32'hFF);

// This section implements an unregistered operation.
// 
wire local_bb1_inc_i_stall_local;
wire [31:0] local_bb1_inc_i;

assign local_bb1_inc_i = ((rnode_136to137_bb1_and_i10_2_NO_SHIFT_REG & 32'hFF) + 32'h7D);

// This section implements an unregistered operation.
// 
wire local_bb1_cmp50_not_i_stall_local;
wire local_bb1_cmp50_not_i;

assign local_bb1_cmp50_not_i = ((rnode_136to137_bb1_add_i18_0_NO_SHIFT_REG & 32'h1FF) != 32'h7F);

// This section implements an unregistered operation.
// 
wire local_bb1_or_i3_i263_stall_local;
wire [31:0] local_bb1_or_i3_i263;

assign local_bb1_or_i3_i263 = ((local_bb1_shl_i1_i261 & 32'hFFFF00) | (local_bb1_shr_i2_i262 & 32'hFF));

// This section implements an unregistered operation.
// 
wire local_bb1_tobool49_i267_stall_local;
wire local_bb1_tobool49_i267;

assign local_bb1_tobool49_i267 = ((local_bb1_and48_i266 & 32'h800000) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_or_i3_i_stall_local;
wire [31:0] local_bb1_or_i3_i;

assign local_bb1_or_i3_i = ((local_bb1_shl_i1_i & 32'hFFFF00) | (local_bb1_shr_i2_i & 32'hFF));

// This section implements an unregistered operation.
// 
wire local_bb1_tobool49_i_stall_local;
wire local_bb1_tobool49_i;

assign local_bb1_tobool49_i = ((local_bb1_and48_i & 32'h800000) == 32'h0);

// This section implements a registered operation.
// 
wire SFC_1_VALID_143_144_0_inputs_ready;
 reg SFC_1_VALID_143_144_0_valid_out_NO_SHIFT_REG;
wire SFC_1_VALID_143_144_0_stall_in;
wire SFC_1_VALID_143_144_0_output_regs_ready;
 reg SFC_1_VALID_143_144_0_NO_SHIFT_REG /* synthesis  preserve  */;
wire SFC_1_VALID_143_144_0_causedstall;

assign SFC_1_VALID_143_144_0_inputs_ready = 1'b1;
assign SFC_1_VALID_143_144_0_output_regs_ready = 1'b1;
assign SFC_1_VALID_142_143_0_stall_in = 1'b0;
assign SFC_1_VALID_143_144_0_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		SFC_1_VALID_143_144_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (SFC_1_VALID_143_144_0_output_regs_ready)
		begin
			SFC_1_VALID_143_144_0_NO_SHIFT_REG <= SFC_1_VALID_142_143_0_NO_SHIFT_REG;
		end
	end
end


// This section implements an unregistered operation.
// 
wire local_bb1_and1_i214_stall_local;
wire [31:0] local_bb1_and1_i214;

assign local_bb1_and1_i214 = ((local_bb1_shr_i213 & 32'h1FF) & 32'hFF);

// This section implements an unregistered operation.
// 
wire local_bb1_lnot6_i217_stall_local;
wire local_bb1_lnot6_i217;

assign local_bb1_lnot6_i217 = ((local_bb1_and2_i216 & 32'h7FFFFF) != 32'h0);

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_137to138_bb1_lnot_i246_0_valid_out_NO_SHIFT_REG;
 logic rnode_137to138_bb1_lnot_i246_0_stall_in_NO_SHIFT_REG;
 logic rnode_137to138_bb1_lnot_i246_0_NO_SHIFT_REG;
 logic rnode_137to138_bb1_lnot_i246_0_reg_138_inputs_ready_NO_SHIFT_REG;
 logic rnode_137to138_bb1_lnot_i246_0_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_lnot_i246_0_valid_out_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_lnot_i246_0_stall_in_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_lnot_i246_0_stall_out_reg_138_NO_SHIFT_REG;

acl_data_fifo rnode_137to138_bb1_lnot_i246_0_reg_138_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_137to138_bb1_lnot_i246_0_reg_138_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_137to138_bb1_lnot_i246_0_stall_in_reg_138_NO_SHIFT_REG),
	.valid_out(rnode_137to138_bb1_lnot_i246_0_valid_out_reg_138_NO_SHIFT_REG),
	.stall_out(rnode_137to138_bb1_lnot_i246_0_stall_out_reg_138_NO_SHIFT_REG),
	.data_in(local_bb1_lnot_i246),
	.data_out(rnode_137to138_bb1_lnot_i246_0_reg_138_NO_SHIFT_REG)
);

defparam rnode_137to138_bb1_lnot_i246_0_reg_138_fifo.DEPTH = 1;
defparam rnode_137to138_bb1_lnot_i246_0_reg_138_fifo.DATA_WIDTH = 1;
defparam rnode_137to138_bb1_lnot_i246_0_reg_138_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_137to138_bb1_lnot_i246_0_reg_138_fifo.IMPL = "shift_reg";

assign rnode_137to138_bb1_lnot_i246_0_reg_138_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_lnot_i246_stall_in = 1'b0;
assign rnode_137to138_bb1_lnot_i246_0_NO_SHIFT_REG = rnode_137to138_bb1_lnot_i246_0_reg_138_NO_SHIFT_REG;
assign rnode_137to138_bb1_lnot_i246_0_stall_in_reg_138_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1_lnot_i246_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_137to138_bb1_cmp_i247_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_137to138_bb1_cmp_i247_0_stall_in_0_NO_SHIFT_REG;
 logic rnode_137to138_bb1_cmp_i247_0_NO_SHIFT_REG;
 logic rnode_137to138_bb1_cmp_i247_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_137to138_bb1_cmp_i247_0_stall_in_1_NO_SHIFT_REG;
 logic rnode_137to138_bb1_cmp_i247_1_NO_SHIFT_REG;
 logic rnode_137to138_bb1_cmp_i247_0_reg_138_inputs_ready_NO_SHIFT_REG;
 logic rnode_137to138_bb1_cmp_i247_0_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_cmp_i247_0_valid_out_0_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_cmp_i247_0_stall_in_0_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_cmp_i247_0_stall_out_reg_138_NO_SHIFT_REG;

acl_data_fifo rnode_137to138_bb1_cmp_i247_0_reg_138_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_137to138_bb1_cmp_i247_0_reg_138_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_137to138_bb1_cmp_i247_0_stall_in_0_reg_138_NO_SHIFT_REG),
	.valid_out(rnode_137to138_bb1_cmp_i247_0_valid_out_0_reg_138_NO_SHIFT_REG),
	.stall_out(rnode_137to138_bb1_cmp_i247_0_stall_out_reg_138_NO_SHIFT_REG),
	.data_in(local_bb1_cmp_i247),
	.data_out(rnode_137to138_bb1_cmp_i247_0_reg_138_NO_SHIFT_REG)
);

defparam rnode_137to138_bb1_cmp_i247_0_reg_138_fifo.DEPTH = 1;
defparam rnode_137to138_bb1_cmp_i247_0_reg_138_fifo.DATA_WIDTH = 1;
defparam rnode_137to138_bb1_cmp_i247_0_reg_138_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_137to138_bb1_cmp_i247_0_reg_138_fifo.IMPL = "shift_reg";

assign rnode_137to138_bb1_cmp_i247_0_reg_138_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_cmp_i247_stall_in = 1'b0;
assign rnode_137to138_bb1_cmp_i247_0_stall_in_0_reg_138_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1_cmp_i247_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_137to138_bb1_cmp_i247_0_NO_SHIFT_REG = rnode_137to138_bb1_cmp_i247_0_reg_138_NO_SHIFT_REG;
assign rnode_137to138_bb1_cmp_i247_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_137to138_bb1_cmp_i247_1_NO_SHIFT_REG = rnode_137to138_bb1_cmp_i247_0_reg_138_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_137to138_bb1_lnot_i12_0_valid_out_NO_SHIFT_REG;
 logic rnode_137to138_bb1_lnot_i12_0_stall_in_NO_SHIFT_REG;
 logic rnode_137to138_bb1_lnot_i12_0_NO_SHIFT_REG;
 logic rnode_137to138_bb1_lnot_i12_0_reg_138_inputs_ready_NO_SHIFT_REG;
 logic rnode_137to138_bb1_lnot_i12_0_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_lnot_i12_0_valid_out_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_lnot_i12_0_stall_in_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_lnot_i12_0_stall_out_reg_138_NO_SHIFT_REG;

acl_data_fifo rnode_137to138_bb1_lnot_i12_0_reg_138_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_137to138_bb1_lnot_i12_0_reg_138_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_137to138_bb1_lnot_i12_0_stall_in_reg_138_NO_SHIFT_REG),
	.valid_out(rnode_137to138_bb1_lnot_i12_0_valid_out_reg_138_NO_SHIFT_REG),
	.stall_out(rnode_137to138_bb1_lnot_i12_0_stall_out_reg_138_NO_SHIFT_REG),
	.data_in(local_bb1_lnot_i12),
	.data_out(rnode_137to138_bb1_lnot_i12_0_reg_138_NO_SHIFT_REG)
);

defparam rnode_137to138_bb1_lnot_i12_0_reg_138_fifo.DEPTH = 1;
defparam rnode_137to138_bb1_lnot_i12_0_reg_138_fifo.DATA_WIDTH = 1;
defparam rnode_137to138_bb1_lnot_i12_0_reg_138_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_137to138_bb1_lnot_i12_0_reg_138_fifo.IMPL = "shift_reg";

assign rnode_137to138_bb1_lnot_i12_0_reg_138_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_lnot_i12_stall_in = 1'b0;
assign rnode_137to138_bb1_lnot_i12_0_NO_SHIFT_REG = rnode_137to138_bb1_lnot_i12_0_reg_138_NO_SHIFT_REG;
assign rnode_137to138_bb1_lnot_i12_0_stall_in_reg_138_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1_lnot_i12_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb1__22_i_stall_local;
wire local_bb1__22_i;

assign local_bb1__22_i = (local_bb1_cmp_i13 & rnode_136to137_bb1_lnot14_not_i_0_NO_SHIFT_REG);

// This section implements an unregistered operation.
// 
wire local_bb1_shl_i_i270_stall_local;
wire [31:0] local_bb1_shl_i_i270;

assign local_bb1_shl_i_i270 = ((local_bb1_or_i3_i263 & 32'hFFFFFF) << 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb1__25_i274_stall_local;
wire local_bb1__25_i274;

assign local_bb1__25_i274 = (local_bb1_tobool49_i267 & local_bb1_cmp50_not_i268);

// This section implements an unregistered operation.
// 
wire local_bb1_shl_i_i_stall_local;
wire [31:0] local_bb1_shl_i_i;

assign local_bb1_shl_i_i = ((local_bb1_or_i3_i & 32'hFFFFFF) << 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb1__25_i_stall_local;
wire local_bb1__25_i;

assign local_bb1__25_i = (local_bb1_tobool49_i & local_bb1_cmp50_not_i);

// This section implements a registered operation.
// 
wire SFC_1_VALID_144_145_0_inputs_ready;
 reg SFC_1_VALID_144_145_0_valid_out_NO_SHIFT_REG;
wire SFC_1_VALID_144_145_0_stall_in;
wire SFC_1_VALID_144_145_0_output_regs_ready;
 reg SFC_1_VALID_144_145_0_NO_SHIFT_REG /* synthesis  preserve  */;
wire SFC_1_VALID_144_145_0_causedstall;

assign SFC_1_VALID_144_145_0_inputs_ready = 1'b1;
assign SFC_1_VALID_144_145_0_output_regs_ready = 1'b1;
assign SFC_1_VALID_143_144_0_stall_in = 1'b0;
assign SFC_1_VALID_144_145_0_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		SFC_1_VALID_144_145_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (SFC_1_VALID_144_145_0_output_regs_ready)
		begin
			SFC_1_VALID_144_145_0_NO_SHIFT_REG <= SFC_1_VALID_143_144_0_NO_SHIFT_REG;
		end
	end
end


// This section implements an unregistered operation.
// 
wire local_bb1_cmp_i215_stall_local;
wire local_bb1_cmp_i215;

assign local_bb1_cmp_i215 = ((local_bb1_and1_i214 & 32'hFF) == 32'hFF);

// This section implements an unregistered operation.
// 
wire local_bb1_cmp10_i219_stall_local;
wire local_bb1_cmp10_i219;

assign local_bb1_cmp10_i219 = ((local_bb1_and1_i214 & 32'hFF) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1__22_i254_stall_local;
wire local_bb1__22_i254;

assign local_bb1__22_i254 = (rnode_137to138_bb1_cmp_i247_0_NO_SHIFT_REG & rnode_137to138_bb1_lnot14_not_i248_0_NO_SHIFT_REG);

// This section implements an unregistered operation.
// 
wire local_bb1_or_i_i272_stall_local;
wire [31:0] local_bb1_or_i_i272;

assign local_bb1_or_i_i272 = ((local_bb1_shl_i_i270 & 32'h1FFFFFE) | (local_bb1_shr_i_i271 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb1__28_i277_stall_local;
wire [31:0] local_bb1__28_i277;

assign local_bb1__28_i277 = (local_bb1__25_i274 ? (local_bb1_shl1_i_i273 & 32'hFFFFFE00) : (local_bb1_shl1_i4_i264 & 32'hFFFFFF00));

// This section implements an unregistered operation.
// 
wire local_bb1__30_i279_stall_local;
wire [31:0] local_bb1__30_i279;

assign local_bb1__30_i279 = (local_bb1__25_i274 ? (rnode_136to137_bb1_add_i265_1_NO_SHIFT_REG & 32'h1FF) : 32'h7F);

// This section implements an unregistered operation.
// 
wire local_bb1_or_i_i20_stall_local;
wire [31:0] local_bb1_or_i_i20;

assign local_bb1_or_i_i20 = ((local_bb1_shl_i_i & 32'h1FFFFFE) | (local_bb1_shr_i_i19 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb1__28_i_stall_local;
wire [31:0] local_bb1__28_i;

assign local_bb1__28_i = (local_bb1__25_i ? (local_bb1_shl1_i_i & 32'hFFFFFE00) : (local_bb1_shl1_i4_i & 32'hFFFFFF00));

// This section implements an unregistered operation.
// 
wire local_bb1__30_i24_stall_local;
wire [31:0] local_bb1__30_i24;

assign local_bb1__30_i24 = (local_bb1__25_i ? (rnode_136to137_bb1_add_i18_1_NO_SHIFT_REG & 32'h1FF) : 32'h7F);

// This section implements a registered operation.
// 
wire SFC_1_VALID_145_146_0_inputs_ready;
 reg SFC_1_VALID_145_146_0_valid_out_NO_SHIFT_REG;
wire SFC_1_VALID_145_146_0_stall_in;
wire SFC_1_VALID_145_146_0_output_regs_ready;
 reg SFC_1_VALID_145_146_0_NO_SHIFT_REG /* synthesis  preserve  */;
wire SFC_1_VALID_145_146_0_causedstall;

assign SFC_1_VALID_145_146_0_inputs_ready = 1'b1;
assign SFC_1_VALID_145_146_0_output_regs_ready = 1'b1;
assign SFC_1_VALID_144_145_0_stall_in = 1'b0;
assign SFC_1_VALID_145_146_0_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		SFC_1_VALID_145_146_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (SFC_1_VALID_145_146_0_output_regs_ready)
		begin
			SFC_1_VALID_145_146_0_NO_SHIFT_REG <= SFC_1_VALID_144_145_0_NO_SHIFT_REG;
		end
	end
end


// This section implements an unregistered operation.
// 
wire local_bb1_not_cmp10_i219_stall_local;
wire local_bb1_not_cmp10_i219;

assign local_bb1_not_cmp10_i219 = (local_bb1_cmp10_i219 ^ 1'b1);

// This section implements an unregistered operation.
// 
wire local_bb1__26_i275_stall_local;
wire [31:0] local_bb1__26_i275;

assign local_bb1__26_i275 = (local_bb1__25_i274 ? (local_bb1_or_i_i272 & 32'h1FFFFFF) : (local_bb1_or_i3_i263 & 32'hFFFFFF));

// This section implements an unregistered operation.
// 
wire local_bb1__29_i278_stall_local;
wire [31:0] local_bb1__29_i278;

assign local_bb1__29_i278 = (local_bb1_tobool49_i267 ? (local_bb1__28_i277 & 32'hFFFFFF00) : (local_bb1_shl1_i4_i264 & 32'hFFFFFF00));

// This section implements an unregistered operation.
// 
wire local_bb1__31_i280_stall_local;
wire [31:0] local_bb1__31_i280;

assign local_bb1__31_i280 = (local_bb1_tobool49_i267 ? (local_bb1__30_i279 & 32'h1FF) : (local_bb1_inc_i269 & 32'h1FF));

// This section implements an unregistered operation.
// 
wire local_bb1__26_i21_stall_local;
wire [31:0] local_bb1__26_i21;

assign local_bb1__26_i21 = (local_bb1__25_i ? (local_bb1_or_i_i20 & 32'h1FFFFFF) : (local_bb1_or_i3_i & 32'hFFFFFF));

// This section implements an unregistered operation.
// 
wire local_bb1__29_i23_stall_local;
wire [31:0] local_bb1__29_i23;

assign local_bb1__29_i23 = (local_bb1_tobool49_i ? (local_bb1__28_i & 32'hFFFFFF00) : (local_bb1_shl1_i4_i & 32'hFFFFFF00));

// This section implements an unregistered operation.
// 
wire local_bb1__31_i25_stall_local;
wire [31:0] local_bb1__31_i25;

assign local_bb1__31_i25 = (local_bb1_tobool49_i ? (local_bb1__30_i24 & 32'h1FF) : (local_bb1_inc_i & 32'h1FF));

// This section implements a registered operation.
// 
wire SFC_1_VALID_146_147_0_inputs_ready;
 reg SFC_1_VALID_146_147_0_valid_out_NO_SHIFT_REG;
wire SFC_1_VALID_146_147_0_stall_in;
wire SFC_1_VALID_146_147_0_output_regs_ready;
 reg SFC_1_VALID_146_147_0_NO_SHIFT_REG /* synthesis  preserve  */;
wire SFC_1_VALID_146_147_0_causedstall;

assign SFC_1_VALID_146_147_0_inputs_ready = 1'b1;
assign SFC_1_VALID_146_147_0_output_regs_ready = 1'b1;
assign SFC_1_VALID_145_146_0_stall_in = 1'b0;
assign SFC_1_VALID_146_147_0_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		SFC_1_VALID_146_147_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (SFC_1_VALID_146_147_0_output_regs_ready)
		begin
			SFC_1_VALID_146_147_0_NO_SHIFT_REG <= SFC_1_VALID_145_146_0_NO_SHIFT_REG;
		end
	end
end


// This section implements an unregistered operation.
// 
wire local_bb1__3_i223_stall_local;
wire [31:0] local_bb1__3_i223;

assign local_bb1__3_i223[1] = local_bb1_not_cmp10_i219;
assign local_bb1__3_i223[2] = local_bb1_not_cmp10_i219;
assign local_bb1__3_i223[3] = local_bb1_not_cmp10_i219;
assign local_bb1__3_i223[4] = local_bb1_not_cmp10_i219;
assign local_bb1__3_i223[5] = local_bb1_not_cmp10_i219;
assign local_bb1__3_i223[6] = local_bb1_not_cmp10_i219;
assign local_bb1__3_i223[7] = local_bb1_not_cmp10_i219;
assign local_bb1__3_i223[8] = local_bb1_not_cmp10_i219;
assign local_bb1__3_i223[9] = local_bb1_not_cmp10_i219;
assign local_bb1__3_i223[10] = local_bb1_not_cmp10_i219;
assign local_bb1__3_i223[11] = local_bb1_not_cmp10_i219;
assign local_bb1__3_i223[12] = local_bb1_not_cmp10_i219;
assign local_bb1__3_i223[13] = local_bb1_not_cmp10_i219;
assign local_bb1__3_i223[14] = local_bb1_not_cmp10_i219;
assign local_bb1__3_i223[15] = local_bb1_not_cmp10_i219;
assign local_bb1__3_i223[16] = local_bb1_not_cmp10_i219;
assign local_bb1__3_i223[17] = local_bb1_not_cmp10_i219;
assign local_bb1__3_i223[18] = local_bb1_not_cmp10_i219;
assign local_bb1__3_i223[19] = local_bb1_not_cmp10_i219;
assign local_bb1__3_i223[20] = local_bb1_not_cmp10_i219;
assign local_bb1__3_i223[21] = local_bb1_not_cmp10_i219;
assign local_bb1__3_i223[22] = local_bb1_not_cmp10_i219;
assign local_bb1__3_i223[23] = local_bb1_not_cmp10_i219;
assign local_bb1__3_i223[24] = local_bb1_not_cmp10_i219;
assign local_bb1__3_i223[25] = local_bb1_not_cmp10_i219;
assign local_bb1__3_i223[26] = local_bb1_not_cmp10_i219;
assign local_bb1__3_i223[27] = local_bb1_not_cmp10_i219;
assign local_bb1__3_i223[28] = local_bb1_not_cmp10_i219;
assign local_bb1__3_i223[29] = local_bb1_not_cmp10_i219;
assign local_bb1__3_i223[30] = local_bb1_not_cmp10_i219;
assign local_bb1__3_i223[31] = local_bb1_not_cmp10_i219;
assign local_bb1__3_i223[0] = local_bb1_not_cmp10_i219;

// This section implements an unregistered operation.
// 
wire local_bb1__27_i276_stall_local;
wire [31:0] local_bb1__27_i276;

assign local_bb1__27_i276 = (local_bb1_tobool49_i267 ? (local_bb1__26_i275 & 32'h1FFFFFF) : (local_bb1_or_i3_i263 & 32'hFFFFFF));

// This section implements an unregistered operation.
// 
wire local_bb1_cmp70_i289_stall_local;
wire local_bb1_cmp70_i289;

assign local_bb1_cmp70_i289 = ((local_bb1__29_i278 & 32'hFFFFFF00) > 32'h80000000);

// This section implements an unregistered operation.
// 
wire local_bb1_var__u7_stall_local;
wire local_bb1_var__u7;

assign local_bb1_var__u7 = ($signed((local_bb1__29_i278 & 32'hFFFFFF00)) < $signed(32'h0));

// This section implements an unregistered operation.
// 
wire local_bb1__27_i22_stall_local;
wire [31:0] local_bb1__27_i22;

assign local_bb1__27_i22 = (local_bb1_tobool49_i ? (local_bb1__26_i21 & 32'h1FFFFFF) : (local_bb1_or_i3_i & 32'hFFFFFF));

// This section implements an unregistered operation.
// 
wire local_bb1_cmp70_i_stall_local;
wire local_bb1_cmp70_i;

assign local_bb1_cmp70_i = ((local_bb1__29_i23 & 32'hFFFFFF00) > 32'h80000000);

// This section implements an unregistered operation.
// 
wire local_bb1_var__u8_stall_local;
wire local_bb1_var__u8;

assign local_bb1_var__u8 = ($signed((local_bb1__29_i23 & 32'hFFFFFF00)) < $signed(32'h0));

// This section implements an unregistered operation.
// 
wire local_bb1_cmp53_i_stall_local;
wire local_bb1_cmp53_i;

assign local_bb1_cmp53_i = ((local_bb1__31_i25 & 32'h1FF) > 32'h17D);

// This section implements a registered operation.
// 
wire SFC_1_VALID_147_148_0_inputs_ready;
 reg SFC_1_VALID_147_148_0_valid_out_NO_SHIFT_REG;
wire SFC_1_VALID_147_148_0_stall_in;
wire SFC_1_VALID_147_148_0_output_regs_ready;
 reg SFC_1_VALID_147_148_0_NO_SHIFT_REG /* synthesis  preserve  */;
wire SFC_1_VALID_147_148_0_causedstall;

assign SFC_1_VALID_147_148_0_inputs_ready = 1'b1;
assign SFC_1_VALID_147_148_0_output_regs_ready = 1'b1;
assign SFC_1_VALID_146_147_0_stall_in = 1'b0;
assign SFC_1_VALID_147_148_0_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		SFC_1_VALID_147_148_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (SFC_1_VALID_147_148_0_output_regs_ready)
		begin
			SFC_1_VALID_147_148_0_NO_SHIFT_REG <= SFC_1_VALID_146_147_0_NO_SHIFT_REG;
		end
	end
end


// This section implements an unregistered operation.
// 
wire local_bb1_add_i224_stall_local;
wire [31:0] local_bb1_add_i224;

assign local_bb1_add_i224 = (local_bb1__3_i223 + (local_bb1_and1_i214 & 32'hFF));

// This section implements an unregistered operation.
// 
wire local_bb1_fold_i229_stall_local;
wire [31:0] local_bb1_fold_i229;

assign local_bb1_fold_i229 = (local_bb1__3_i223 + (local_bb1_shr_i213 & 32'h1FF));

// This section implements an unregistered operation.
// 
wire local_bb1_and68_i284_stall_local;
wire [31:0] local_bb1_and68_i284;

assign local_bb1_and68_i284 = ((local_bb1__27_i276 & 32'h1FFFFFF) & 32'h7FFFFF);

// This section implements an unregistered operation.
// 
wire local_bb1_and74_i290_stall_local;
wire [31:0] local_bb1_and74_i290;

assign local_bb1_and74_i290 = ((local_bb1__27_i276 & 32'h1FFFFFF) & 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb1_and68_i26_stall_local;
wire [31:0] local_bb1_and68_i26;

assign local_bb1_and68_i26 = ((local_bb1__27_i22 & 32'h1FFFFFF) & 32'h7FFFFF);

// This section implements an unregistered operation.
// 
wire local_bb1_and74_i_stall_local;
wire [31:0] local_bb1_and74_i;

assign local_bb1_and74_i = ((local_bb1__27_i22 & 32'h1FFFFFF) & 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb1_or57_i_stall_local;
wire local_bb1_or57_i;

assign local_bb1_or57_i = (local_bb1_cmp_i13 | local_bb1_cmp53_i);

// This section implements a registered operation.
// 
wire SFC_1_VALID_148_149_0_inputs_ready;
 reg SFC_1_VALID_148_149_0_valid_out_NO_SHIFT_REG;
wire SFC_1_VALID_148_149_0_stall_in;
wire SFC_1_VALID_148_149_0_output_regs_ready;
 reg SFC_1_VALID_148_149_0_NO_SHIFT_REG /* synthesis  preserve  */;
wire SFC_1_VALID_148_149_0_causedstall;

assign SFC_1_VALID_148_149_0_inputs_ready = 1'b1;
assign SFC_1_VALID_148_149_0_output_regs_ready = 1'b1;
assign SFC_1_VALID_147_148_0_stall_in = 1'b0;
assign SFC_1_VALID_148_149_0_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		SFC_1_VALID_148_149_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (SFC_1_VALID_148_149_0_output_regs_ready)
		begin
			SFC_1_VALID_148_149_0_NO_SHIFT_REG <= SFC_1_VALID_147_148_0_NO_SHIFT_REG;
		end
	end
end


// This section implements an unregistered operation.
// 
wire local_bb1_and28_i230_valid_out;
wire local_bb1_and28_i230_stall_in;
wire local_bb1_lnot6_i217_valid_out;
wire local_bb1_lnot6_i217_stall_in;
wire local_bb1_cmp_i215_valid_out;
wire local_bb1_cmp_i215_stall_in;
wire local_bb1_cmp10_i219_valid_out_1;
wire local_bb1_cmp10_i219_stall_in_1;
wire local_bb1_add_i224_valid_out;
wire local_bb1_add_i224_stall_in;
wire local_bb1_and27_i231_valid_out;
wire local_bb1_and27_i231_stall_in;
wire local_bb1_and27_i231_inputs_ready;
wire local_bb1_and27_i231_stall_local;
wire [31:0] local_bb1_and27_i231;

assign local_bb1_and27_i231_inputs_ready = rnode_136to137_bb1_memcoalesce_inputArray_extrValue_111_0_valid_out_NO_SHIFT_REG;
assign local_bb1_and27_i231 = (local_bb1_fold_i229 << 32'h17);
assign local_bb1_and28_i230_valid_out = 1'b1;
assign local_bb1_lnot6_i217_valid_out = 1'b1;
assign local_bb1_cmp_i215_valid_out = 1'b1;
assign local_bb1_cmp10_i219_valid_out_1 = 1'b1;
assign local_bb1_add_i224_valid_out = 1'b1;
assign local_bb1_and27_i231_valid_out = 1'b1;
assign rnode_136to137_bb1_memcoalesce_inputArray_extrValue_111_0_stall_in_NO_SHIFT_REG = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb1_tobool75_i291_stall_local;
wire local_bb1_tobool75_i291;

assign local_bb1_tobool75_i291 = ((local_bb1_and74_i290 & 32'h1) != 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_tobool75_i_stall_local;
wire local_bb1_tobool75_i;

assign local_bb1_tobool75_i = ((local_bb1_and74_i & 32'h1) != 32'h0);

// This section implements a registered operation.
// 
wire SFC_1_VALID_149_150_0_inputs_ready;
 reg SFC_1_VALID_149_150_0_valid_out_NO_SHIFT_REG;
wire SFC_1_VALID_149_150_0_stall_in;
wire SFC_1_VALID_149_150_0_output_regs_ready;
 reg SFC_1_VALID_149_150_0_NO_SHIFT_REG /* synthesis  preserve  */;
wire SFC_1_VALID_149_150_0_causedstall;

assign SFC_1_VALID_149_150_0_inputs_ready = 1'b1;
assign SFC_1_VALID_149_150_0_output_regs_ready = 1'b1;
assign SFC_1_VALID_148_149_0_stall_in = 1'b0;
assign SFC_1_VALID_149_150_0_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		SFC_1_VALID_149_150_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (SFC_1_VALID_149_150_0_output_regs_ready)
		begin
			SFC_1_VALID_149_150_0_NO_SHIFT_REG <= SFC_1_VALID_148_149_0_NO_SHIFT_REG;
		end
	end
end


// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_137to138_bb1_and28_i230_0_valid_out_NO_SHIFT_REG;
 logic rnode_137to138_bb1_and28_i230_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_137to138_bb1_and28_i230_0_NO_SHIFT_REG;
 logic rnode_137to138_bb1_and28_i230_0_reg_138_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_137to138_bb1_and28_i230_0_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_and28_i230_0_valid_out_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_and28_i230_0_stall_in_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_and28_i230_0_stall_out_reg_138_NO_SHIFT_REG;

acl_data_fifo rnode_137to138_bb1_and28_i230_0_reg_138_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_137to138_bb1_and28_i230_0_reg_138_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_137to138_bb1_and28_i230_0_stall_in_reg_138_NO_SHIFT_REG),
	.valid_out(rnode_137to138_bb1_and28_i230_0_valid_out_reg_138_NO_SHIFT_REG),
	.stall_out(rnode_137to138_bb1_and28_i230_0_stall_out_reg_138_NO_SHIFT_REG),
	.data_in((local_bb1_and28_i230 & 32'h807FFFFF)),
	.data_out(rnode_137to138_bb1_and28_i230_0_reg_138_NO_SHIFT_REG)
);

defparam rnode_137to138_bb1_and28_i230_0_reg_138_fifo.DEPTH = 1;
defparam rnode_137to138_bb1_and28_i230_0_reg_138_fifo.DATA_WIDTH = 32;
defparam rnode_137to138_bb1_and28_i230_0_reg_138_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_137to138_bb1_and28_i230_0_reg_138_fifo.IMPL = "shift_reg";

assign rnode_137to138_bb1_and28_i230_0_reg_138_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_and28_i230_stall_in = 1'b0;
assign rnode_137to138_bb1_and28_i230_0_NO_SHIFT_REG = rnode_137to138_bb1_and28_i230_0_reg_138_NO_SHIFT_REG;
assign rnode_137to138_bb1_and28_i230_0_stall_in_reg_138_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1_and28_i230_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_137to138_bb1_lnot6_i217_0_valid_out_NO_SHIFT_REG;
 logic rnode_137to138_bb1_lnot6_i217_0_stall_in_NO_SHIFT_REG;
 logic rnode_137to138_bb1_lnot6_i217_0_NO_SHIFT_REG;
 logic rnode_137to138_bb1_lnot6_i217_0_reg_138_inputs_ready_NO_SHIFT_REG;
 logic rnode_137to138_bb1_lnot6_i217_0_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_lnot6_i217_0_valid_out_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_lnot6_i217_0_stall_in_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_lnot6_i217_0_stall_out_reg_138_NO_SHIFT_REG;

acl_data_fifo rnode_137to138_bb1_lnot6_i217_0_reg_138_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_137to138_bb1_lnot6_i217_0_reg_138_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_137to138_bb1_lnot6_i217_0_stall_in_reg_138_NO_SHIFT_REG),
	.valid_out(rnode_137to138_bb1_lnot6_i217_0_valid_out_reg_138_NO_SHIFT_REG),
	.stall_out(rnode_137to138_bb1_lnot6_i217_0_stall_out_reg_138_NO_SHIFT_REG),
	.data_in(local_bb1_lnot6_i217),
	.data_out(rnode_137to138_bb1_lnot6_i217_0_reg_138_NO_SHIFT_REG)
);

defparam rnode_137to138_bb1_lnot6_i217_0_reg_138_fifo.DEPTH = 1;
defparam rnode_137to138_bb1_lnot6_i217_0_reg_138_fifo.DATA_WIDTH = 1;
defparam rnode_137to138_bb1_lnot6_i217_0_reg_138_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_137to138_bb1_lnot6_i217_0_reg_138_fifo.IMPL = "shift_reg";

assign rnode_137to138_bb1_lnot6_i217_0_reg_138_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_lnot6_i217_stall_in = 1'b0;
assign rnode_137to138_bb1_lnot6_i217_0_NO_SHIFT_REG = rnode_137to138_bb1_lnot6_i217_0_reg_138_NO_SHIFT_REG;
assign rnode_137to138_bb1_lnot6_i217_0_stall_in_reg_138_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1_lnot6_i217_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_137to138_bb1_cmp_i215_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_137to138_bb1_cmp_i215_0_stall_in_0_NO_SHIFT_REG;
 logic rnode_137to138_bb1_cmp_i215_0_NO_SHIFT_REG;
 logic rnode_137to138_bb1_cmp_i215_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_137to138_bb1_cmp_i215_0_stall_in_1_NO_SHIFT_REG;
 logic rnode_137to138_bb1_cmp_i215_1_NO_SHIFT_REG;
 logic rnode_137to138_bb1_cmp_i215_0_reg_138_inputs_ready_NO_SHIFT_REG;
 logic rnode_137to138_bb1_cmp_i215_0_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_cmp_i215_0_valid_out_0_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_cmp_i215_0_stall_in_0_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_cmp_i215_0_stall_out_reg_138_NO_SHIFT_REG;

acl_data_fifo rnode_137to138_bb1_cmp_i215_0_reg_138_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_137to138_bb1_cmp_i215_0_reg_138_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_137to138_bb1_cmp_i215_0_stall_in_0_reg_138_NO_SHIFT_REG),
	.valid_out(rnode_137to138_bb1_cmp_i215_0_valid_out_0_reg_138_NO_SHIFT_REG),
	.stall_out(rnode_137to138_bb1_cmp_i215_0_stall_out_reg_138_NO_SHIFT_REG),
	.data_in(local_bb1_cmp_i215),
	.data_out(rnode_137to138_bb1_cmp_i215_0_reg_138_NO_SHIFT_REG)
);

defparam rnode_137to138_bb1_cmp_i215_0_reg_138_fifo.DEPTH = 1;
defparam rnode_137to138_bb1_cmp_i215_0_reg_138_fifo.DATA_WIDTH = 1;
defparam rnode_137to138_bb1_cmp_i215_0_reg_138_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_137to138_bb1_cmp_i215_0_reg_138_fifo.IMPL = "shift_reg";

assign rnode_137to138_bb1_cmp_i215_0_reg_138_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_cmp_i215_stall_in = 1'b0;
assign rnode_137to138_bb1_cmp_i215_0_stall_in_0_reg_138_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1_cmp_i215_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_137to138_bb1_cmp_i215_0_NO_SHIFT_REG = rnode_137to138_bb1_cmp_i215_0_reg_138_NO_SHIFT_REG;
assign rnode_137to138_bb1_cmp_i215_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_137to138_bb1_cmp_i215_1_NO_SHIFT_REG = rnode_137to138_bb1_cmp_i215_0_reg_138_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_137to138_bb1_cmp10_i219_0_valid_out_NO_SHIFT_REG;
 logic rnode_137to138_bb1_cmp10_i219_0_stall_in_NO_SHIFT_REG;
 logic rnode_137to138_bb1_cmp10_i219_0_NO_SHIFT_REG;
 logic rnode_137to138_bb1_cmp10_i219_0_reg_138_inputs_ready_NO_SHIFT_REG;
 logic rnode_137to138_bb1_cmp10_i219_0_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_cmp10_i219_0_valid_out_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_cmp10_i219_0_stall_in_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_cmp10_i219_0_stall_out_reg_138_NO_SHIFT_REG;

acl_data_fifo rnode_137to138_bb1_cmp10_i219_0_reg_138_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_137to138_bb1_cmp10_i219_0_reg_138_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_137to138_bb1_cmp10_i219_0_stall_in_reg_138_NO_SHIFT_REG),
	.valid_out(rnode_137to138_bb1_cmp10_i219_0_valid_out_reg_138_NO_SHIFT_REG),
	.stall_out(rnode_137to138_bb1_cmp10_i219_0_stall_out_reg_138_NO_SHIFT_REG),
	.data_in(local_bb1_cmp10_i219),
	.data_out(rnode_137to138_bb1_cmp10_i219_0_reg_138_NO_SHIFT_REG)
);

defparam rnode_137to138_bb1_cmp10_i219_0_reg_138_fifo.DEPTH = 1;
defparam rnode_137to138_bb1_cmp10_i219_0_reg_138_fifo.DATA_WIDTH = 1;
defparam rnode_137to138_bb1_cmp10_i219_0_reg_138_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_137to138_bb1_cmp10_i219_0_reg_138_fifo.IMPL = "shift_reg";

assign rnode_137to138_bb1_cmp10_i219_0_reg_138_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_cmp10_i219_stall_in_1 = 1'b0;
assign rnode_137to138_bb1_cmp10_i219_0_NO_SHIFT_REG = rnode_137to138_bb1_cmp10_i219_0_reg_138_NO_SHIFT_REG;
assign rnode_137to138_bb1_cmp10_i219_0_stall_in_reg_138_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1_cmp10_i219_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_137to138_bb1_add_i224_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_137to138_bb1_add_i224_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_137to138_bb1_add_i224_0_NO_SHIFT_REG;
 logic rnode_137to138_bb1_add_i224_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_137to138_bb1_add_i224_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_137to138_bb1_add_i224_1_NO_SHIFT_REG;
 logic rnode_137to138_bb1_add_i224_0_reg_138_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_137to138_bb1_add_i224_0_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_add_i224_0_valid_out_0_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_add_i224_0_stall_in_0_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_add_i224_0_stall_out_reg_138_NO_SHIFT_REG;

acl_data_fifo rnode_137to138_bb1_add_i224_0_reg_138_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_137to138_bb1_add_i224_0_reg_138_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_137to138_bb1_add_i224_0_stall_in_0_reg_138_NO_SHIFT_REG),
	.valid_out(rnode_137to138_bb1_add_i224_0_valid_out_0_reg_138_NO_SHIFT_REG),
	.stall_out(rnode_137to138_bb1_add_i224_0_stall_out_reg_138_NO_SHIFT_REG),
	.data_in(local_bb1_add_i224),
	.data_out(rnode_137to138_bb1_add_i224_0_reg_138_NO_SHIFT_REG)
);

defparam rnode_137to138_bb1_add_i224_0_reg_138_fifo.DEPTH = 1;
defparam rnode_137to138_bb1_add_i224_0_reg_138_fifo.DATA_WIDTH = 32;
defparam rnode_137to138_bb1_add_i224_0_reg_138_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_137to138_bb1_add_i224_0_reg_138_fifo.IMPL = "shift_reg";

assign rnode_137to138_bb1_add_i224_0_reg_138_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_add_i224_stall_in = 1'b0;
assign rnode_137to138_bb1_add_i224_0_stall_in_0_reg_138_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1_add_i224_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_137to138_bb1_add_i224_0_NO_SHIFT_REG = rnode_137to138_bb1_add_i224_0_reg_138_NO_SHIFT_REG;
assign rnode_137to138_bb1_add_i224_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_137to138_bb1_add_i224_1_NO_SHIFT_REG = rnode_137to138_bb1_add_i224_0_reg_138_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_137to138_bb1_and27_i231_0_valid_out_NO_SHIFT_REG;
 logic rnode_137to138_bb1_and27_i231_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_137to138_bb1_and27_i231_0_NO_SHIFT_REG;
 logic rnode_137to138_bb1_and27_i231_0_reg_138_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_137to138_bb1_and27_i231_0_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_and27_i231_0_valid_out_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_and27_i231_0_stall_in_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_and27_i231_0_stall_out_reg_138_NO_SHIFT_REG;

acl_data_fifo rnode_137to138_bb1_and27_i231_0_reg_138_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_137to138_bb1_and27_i231_0_reg_138_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_137to138_bb1_and27_i231_0_stall_in_reg_138_NO_SHIFT_REG),
	.valid_out(rnode_137to138_bb1_and27_i231_0_valid_out_reg_138_NO_SHIFT_REG),
	.stall_out(rnode_137to138_bb1_and27_i231_0_stall_out_reg_138_NO_SHIFT_REG),
	.data_in((local_bb1_and27_i231 & 32'hFF800000)),
	.data_out(rnode_137to138_bb1_and27_i231_0_reg_138_NO_SHIFT_REG)
);

defparam rnode_137to138_bb1_and27_i231_0_reg_138_fifo.DEPTH = 1;
defparam rnode_137to138_bb1_and27_i231_0_reg_138_fifo.DATA_WIDTH = 32;
defparam rnode_137to138_bb1_and27_i231_0_reg_138_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_137to138_bb1_and27_i231_0_reg_138_fifo.IMPL = "shift_reg";

assign rnode_137to138_bb1_and27_i231_0_reg_138_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_and27_i231_stall_in = 1'b0;
assign rnode_137to138_bb1_and27_i231_0_NO_SHIFT_REG = rnode_137to138_bb1_and27_i231_0_reg_138_NO_SHIFT_REG;
assign rnode_137to138_bb1_and27_i231_0_stall_in_reg_138_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1_and27_i231_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb1__31_i280_valid_out;
wire local_bb1__31_i280_stall_in;
wire local_bb1_cmp70_i289_valid_out;
wire local_bb1_cmp70_i289_stall_in;
wire local_bb1_and68_i284_valid_out;
wire local_bb1_and68_i284_stall_in;
wire local_bb1__33_i292_valid_out;
wire local_bb1__33_i292_stall_in;
wire local_bb1__33_i292_inputs_ready;
wire local_bb1__33_i292_stall_local;
wire local_bb1__33_i292;

assign local_bb1__33_i292_inputs_ready = (rnode_136to137_bb1_and_i242_0_valid_out_2_NO_SHIFT_REG & rnode_136to137_bb1_add_i265_0_valid_out_1_NO_SHIFT_REG & local_bb1_mul_i_i258_valid_out_0_NO_SHIFT_REG & rnode_136to137_bb1_add_i265_0_valid_out_0_NO_SHIFT_REG & local_bb1_mul_i_i258_valid_out_1_NO_SHIFT_REG);
assign local_bb1__33_i292 = (local_bb1_tobool75_i291 & local_bb1_var__u7);
assign local_bb1__31_i280_valid_out = 1'b1;
assign local_bb1_cmp70_i289_valid_out = 1'b1;
assign local_bb1_and68_i284_valid_out = 1'b1;
assign local_bb1__33_i292_valid_out = 1'b1;
assign rnode_136to137_bb1_and_i242_0_stall_in_2_NO_SHIFT_REG = 1'b0;
assign rnode_136to137_bb1_add_i265_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign local_bb1_mul_i_i258_stall_in_0 = 1'b0;
assign rnode_136to137_bb1_add_i265_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign local_bb1_mul_i_i258_stall_in_1 = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb1__22_i_valid_out;
wire local_bb1__22_i_stall_in;
wire local_bb1_or57_i_valid_out;
wire local_bb1_or57_i_stall_in;
wire local_bb1__31_i25_valid_out_1;
wire local_bb1__31_i25_stall_in_1;
wire local_bb1_cmp70_i_valid_out;
wire local_bb1_cmp70_i_stall_in;
wire local_bb1_and68_i26_valid_out;
wire local_bb1_and68_i26_stall_in;
wire local_bb1__33_i_valid_out;
wire local_bb1__33_i_stall_in;
wire local_bb1__33_i_inputs_ready;
wire local_bb1__33_i_stall_local;
wire local_bb1__33_i;

assign local_bb1__33_i_inputs_ready = (rnode_136to137_bb1_and_i10_0_valid_out_1_NO_SHIFT_REG & rnode_136to137_bb1_lnot14_not_i_0_valid_out_NO_SHIFT_REG & rnode_136to137_bb1_and_i10_0_valid_out_2_NO_SHIFT_REG & rnode_136to137_bb1_add_i18_0_valid_out_1_NO_SHIFT_REG & local_bb1_mul_i_i_valid_out_0_NO_SHIFT_REG & rnode_136to137_bb1_add_i18_0_valid_out_0_NO_SHIFT_REG & local_bb1_mul_i_i_valid_out_1_NO_SHIFT_REG);
assign local_bb1__33_i = (local_bb1_tobool75_i & local_bb1_var__u8);
assign local_bb1__22_i_valid_out = 1'b1;
assign local_bb1_or57_i_valid_out = 1'b1;
assign local_bb1__31_i25_valid_out_1 = 1'b1;
assign local_bb1_cmp70_i_valid_out = 1'b1;
assign local_bb1_and68_i26_valid_out = 1'b1;
assign local_bb1__33_i_valid_out = 1'b1;
assign rnode_136to137_bb1_and_i10_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_136to137_bb1_lnot14_not_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_136to137_bb1_and_i10_0_stall_in_2_NO_SHIFT_REG = 1'b0;
assign rnode_136to137_bb1_add_i18_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign local_bb1_mul_i_i_stall_in_0 = 1'b0;
assign rnode_136to137_bb1_add_i18_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign local_bb1_mul_i_i_stall_in_1 = 1'b0;

// This section implements a registered operation.
// 
wire SFC_1_VALID_150_151_0_inputs_ready;
 reg SFC_1_VALID_150_151_0_valid_out_NO_SHIFT_REG;
wire SFC_1_VALID_150_151_0_stall_in;
wire SFC_1_VALID_150_151_0_output_regs_ready;
 reg SFC_1_VALID_150_151_0_NO_SHIFT_REG /* synthesis  preserve  */;
wire SFC_1_VALID_150_151_0_causedstall;

assign SFC_1_VALID_150_151_0_inputs_ready = 1'b1;
assign SFC_1_VALID_150_151_0_output_regs_ready = 1'b1;
assign SFC_1_VALID_149_150_0_stall_in = 1'b0;
assign SFC_1_VALID_150_151_0_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		SFC_1_VALID_150_151_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (SFC_1_VALID_150_151_0_output_regs_ready)
		begin
			SFC_1_VALID_150_151_0_NO_SHIFT_REG <= SFC_1_VALID_149_150_0_NO_SHIFT_REG;
		end
	end
end


// This section implements an unregistered operation.
// 
wire local_bb1___i218_valid_out;
wire local_bb1___i218_stall_in;
wire local_bb1___i218_inputs_ready;
wire local_bb1___i218_stall_local;
wire local_bb1___i218;

assign local_bb1___i218_inputs_ready = (rnode_137to138_bb1_lnot6_i217_0_valid_out_NO_SHIFT_REG & rnode_137to138_bb1_cmp_i215_0_valid_out_0_NO_SHIFT_REG);
assign local_bb1___i218 = (rnode_137to138_bb1_lnot6_i217_0_NO_SHIFT_REG & rnode_137to138_bb1_cmp_i215_0_NO_SHIFT_REG);
assign local_bb1___i218_valid_out = 1'b1;
assign rnode_137to138_bb1_lnot6_i217_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1_cmp_i215_0_stall_in_0_NO_SHIFT_REG = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb1_cmp20_i225_stall_local;
wire local_bb1_cmp20_i225;

assign local_bb1_cmp20_i225 = ($signed(rnode_137to138_bb1_add_i224_0_NO_SHIFT_REG) > $signed(32'hFE));

// This section implements an unregistered operation.
// 
wire local_bb1_cmp23_i227_stall_local;
wire local_bb1_cmp23_i227;

assign local_bb1_cmp23_i227 = ($signed(rnode_137to138_bb1_add_i224_1_NO_SHIFT_REG) < $signed(32'h1));

// This section implements an unregistered operation.
// 
wire local_bb1_shl_i232_stall_local;
wire [31:0] local_bb1_shl_i232;

assign local_bb1_shl_i232 = ((rnode_137to138_bb1_and27_i231_0_NO_SHIFT_REG & 32'hFF800000) & 32'h7F800000);

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_137to138_bb1__31_i280_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_137to138_bb1__31_i280_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_137to138_bb1__31_i280_0_NO_SHIFT_REG;
 logic rnode_137to138_bb1__31_i280_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_137to138_bb1__31_i280_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_137to138_bb1__31_i280_1_NO_SHIFT_REG;
 logic rnode_137to138_bb1__31_i280_0_valid_out_2_NO_SHIFT_REG;
 logic rnode_137to138_bb1__31_i280_0_stall_in_2_NO_SHIFT_REG;
 logic [31:0] rnode_137to138_bb1__31_i280_2_NO_SHIFT_REG;
 logic rnode_137to138_bb1__31_i280_0_valid_out_3_NO_SHIFT_REG;
 logic rnode_137to138_bb1__31_i280_0_stall_in_3_NO_SHIFT_REG;
 logic [31:0] rnode_137to138_bb1__31_i280_3_NO_SHIFT_REG;
 logic rnode_137to138_bb1__31_i280_0_reg_138_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_137to138_bb1__31_i280_0_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1__31_i280_0_valid_out_0_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1__31_i280_0_stall_in_0_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1__31_i280_0_stall_out_reg_138_NO_SHIFT_REG;

acl_data_fifo rnode_137to138_bb1__31_i280_0_reg_138_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_137to138_bb1__31_i280_0_reg_138_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_137to138_bb1__31_i280_0_stall_in_0_reg_138_NO_SHIFT_REG),
	.valid_out(rnode_137to138_bb1__31_i280_0_valid_out_0_reg_138_NO_SHIFT_REG),
	.stall_out(rnode_137to138_bb1__31_i280_0_stall_out_reg_138_NO_SHIFT_REG),
	.data_in((local_bb1__31_i280 & 32'h1FF)),
	.data_out(rnode_137to138_bb1__31_i280_0_reg_138_NO_SHIFT_REG)
);

defparam rnode_137to138_bb1__31_i280_0_reg_138_fifo.DEPTH = 1;
defparam rnode_137to138_bb1__31_i280_0_reg_138_fifo.DATA_WIDTH = 32;
defparam rnode_137to138_bb1__31_i280_0_reg_138_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_137to138_bb1__31_i280_0_reg_138_fifo.IMPL = "shift_reg";

assign rnode_137to138_bb1__31_i280_0_reg_138_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1__31_i280_stall_in = 1'b0;
assign rnode_137to138_bb1__31_i280_0_stall_in_0_reg_138_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1__31_i280_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_137to138_bb1__31_i280_0_NO_SHIFT_REG = rnode_137to138_bb1__31_i280_0_reg_138_NO_SHIFT_REG;
assign rnode_137to138_bb1__31_i280_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_137to138_bb1__31_i280_1_NO_SHIFT_REG = rnode_137to138_bb1__31_i280_0_reg_138_NO_SHIFT_REG;
assign rnode_137to138_bb1__31_i280_0_valid_out_2_NO_SHIFT_REG = 1'b1;
assign rnode_137to138_bb1__31_i280_2_NO_SHIFT_REG = rnode_137to138_bb1__31_i280_0_reg_138_NO_SHIFT_REG;
assign rnode_137to138_bb1__31_i280_0_valid_out_3_NO_SHIFT_REG = 1'b1;
assign rnode_137to138_bb1__31_i280_3_NO_SHIFT_REG = rnode_137to138_bb1__31_i280_0_reg_138_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_137to138_bb1_cmp70_i289_0_valid_out_NO_SHIFT_REG;
 logic rnode_137to138_bb1_cmp70_i289_0_stall_in_NO_SHIFT_REG;
 logic rnode_137to138_bb1_cmp70_i289_0_NO_SHIFT_REG;
 logic rnode_137to138_bb1_cmp70_i289_0_reg_138_inputs_ready_NO_SHIFT_REG;
 logic rnode_137to138_bb1_cmp70_i289_0_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_cmp70_i289_0_valid_out_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_cmp70_i289_0_stall_in_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_cmp70_i289_0_stall_out_reg_138_NO_SHIFT_REG;

acl_data_fifo rnode_137to138_bb1_cmp70_i289_0_reg_138_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_137to138_bb1_cmp70_i289_0_reg_138_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_137to138_bb1_cmp70_i289_0_stall_in_reg_138_NO_SHIFT_REG),
	.valid_out(rnode_137to138_bb1_cmp70_i289_0_valid_out_reg_138_NO_SHIFT_REG),
	.stall_out(rnode_137to138_bb1_cmp70_i289_0_stall_out_reg_138_NO_SHIFT_REG),
	.data_in(local_bb1_cmp70_i289),
	.data_out(rnode_137to138_bb1_cmp70_i289_0_reg_138_NO_SHIFT_REG)
);

defparam rnode_137to138_bb1_cmp70_i289_0_reg_138_fifo.DEPTH = 1;
defparam rnode_137to138_bb1_cmp70_i289_0_reg_138_fifo.DATA_WIDTH = 1;
defparam rnode_137to138_bb1_cmp70_i289_0_reg_138_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_137to138_bb1_cmp70_i289_0_reg_138_fifo.IMPL = "shift_reg";

assign rnode_137to138_bb1_cmp70_i289_0_reg_138_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_cmp70_i289_stall_in = 1'b0;
assign rnode_137to138_bb1_cmp70_i289_0_NO_SHIFT_REG = rnode_137to138_bb1_cmp70_i289_0_reg_138_NO_SHIFT_REG;
assign rnode_137to138_bb1_cmp70_i289_0_stall_in_reg_138_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1_cmp70_i289_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_137to138_bb1_and68_i284_0_valid_out_NO_SHIFT_REG;
 logic rnode_137to138_bb1_and68_i284_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_137to138_bb1_and68_i284_0_NO_SHIFT_REG;
 logic rnode_137to138_bb1_and68_i284_0_reg_138_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_137to138_bb1_and68_i284_0_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_and68_i284_0_valid_out_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_and68_i284_0_stall_in_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_and68_i284_0_stall_out_reg_138_NO_SHIFT_REG;

acl_data_fifo rnode_137to138_bb1_and68_i284_0_reg_138_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_137to138_bb1_and68_i284_0_reg_138_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_137to138_bb1_and68_i284_0_stall_in_reg_138_NO_SHIFT_REG),
	.valid_out(rnode_137to138_bb1_and68_i284_0_valid_out_reg_138_NO_SHIFT_REG),
	.stall_out(rnode_137to138_bb1_and68_i284_0_stall_out_reg_138_NO_SHIFT_REG),
	.data_in((local_bb1_and68_i284 & 32'h7FFFFF)),
	.data_out(rnode_137to138_bb1_and68_i284_0_reg_138_NO_SHIFT_REG)
);

defparam rnode_137to138_bb1_and68_i284_0_reg_138_fifo.DEPTH = 1;
defparam rnode_137to138_bb1_and68_i284_0_reg_138_fifo.DATA_WIDTH = 32;
defparam rnode_137to138_bb1_and68_i284_0_reg_138_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_137to138_bb1_and68_i284_0_reg_138_fifo.IMPL = "shift_reg";

assign rnode_137to138_bb1_and68_i284_0_reg_138_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_and68_i284_stall_in = 1'b0;
assign rnode_137to138_bb1_and68_i284_0_NO_SHIFT_REG = rnode_137to138_bb1_and68_i284_0_reg_138_NO_SHIFT_REG;
assign rnode_137to138_bb1_and68_i284_0_stall_in_reg_138_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1_and68_i284_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_137to138_bb1__33_i292_0_valid_out_NO_SHIFT_REG;
 logic rnode_137to138_bb1__33_i292_0_stall_in_NO_SHIFT_REG;
 logic rnode_137to138_bb1__33_i292_0_NO_SHIFT_REG;
 logic rnode_137to138_bb1__33_i292_0_reg_138_inputs_ready_NO_SHIFT_REG;
 logic rnode_137to138_bb1__33_i292_0_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1__33_i292_0_valid_out_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1__33_i292_0_stall_in_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1__33_i292_0_stall_out_reg_138_NO_SHIFT_REG;

acl_data_fifo rnode_137to138_bb1__33_i292_0_reg_138_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_137to138_bb1__33_i292_0_reg_138_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_137to138_bb1__33_i292_0_stall_in_reg_138_NO_SHIFT_REG),
	.valid_out(rnode_137to138_bb1__33_i292_0_valid_out_reg_138_NO_SHIFT_REG),
	.stall_out(rnode_137to138_bb1__33_i292_0_stall_out_reg_138_NO_SHIFT_REG),
	.data_in(local_bb1__33_i292),
	.data_out(rnode_137to138_bb1__33_i292_0_reg_138_NO_SHIFT_REG)
);

defparam rnode_137to138_bb1__33_i292_0_reg_138_fifo.DEPTH = 1;
defparam rnode_137to138_bb1__33_i292_0_reg_138_fifo.DATA_WIDTH = 1;
defparam rnode_137to138_bb1__33_i292_0_reg_138_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_137to138_bb1__33_i292_0_reg_138_fifo.IMPL = "shift_reg";

assign rnode_137to138_bb1__33_i292_0_reg_138_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1__33_i292_stall_in = 1'b0;
assign rnode_137to138_bb1__33_i292_0_NO_SHIFT_REG = rnode_137to138_bb1__33_i292_0_reg_138_NO_SHIFT_REG;
assign rnode_137to138_bb1__33_i292_0_stall_in_reg_138_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1__33_i292_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_137to138_bb1__22_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_137to138_bb1__22_i_0_stall_in_NO_SHIFT_REG;
 logic rnode_137to138_bb1__22_i_0_NO_SHIFT_REG;
 logic rnode_137to138_bb1__22_i_0_reg_138_inputs_ready_NO_SHIFT_REG;
 logic rnode_137to138_bb1__22_i_0_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1__22_i_0_valid_out_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1__22_i_0_stall_in_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1__22_i_0_stall_out_reg_138_NO_SHIFT_REG;

acl_data_fifo rnode_137to138_bb1__22_i_0_reg_138_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_137to138_bb1__22_i_0_reg_138_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_137to138_bb1__22_i_0_stall_in_reg_138_NO_SHIFT_REG),
	.valid_out(rnode_137to138_bb1__22_i_0_valid_out_reg_138_NO_SHIFT_REG),
	.stall_out(rnode_137to138_bb1__22_i_0_stall_out_reg_138_NO_SHIFT_REG),
	.data_in(local_bb1__22_i),
	.data_out(rnode_137to138_bb1__22_i_0_reg_138_NO_SHIFT_REG)
);

defparam rnode_137to138_bb1__22_i_0_reg_138_fifo.DEPTH = 1;
defparam rnode_137to138_bb1__22_i_0_reg_138_fifo.DATA_WIDTH = 1;
defparam rnode_137to138_bb1__22_i_0_reg_138_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_137to138_bb1__22_i_0_reg_138_fifo.IMPL = "shift_reg";

assign rnode_137to138_bb1__22_i_0_reg_138_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1__22_i_stall_in = 1'b0;
assign rnode_137to138_bb1__22_i_0_NO_SHIFT_REG = rnode_137to138_bb1__22_i_0_reg_138_NO_SHIFT_REG;
assign rnode_137to138_bb1__22_i_0_stall_in_reg_138_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1__22_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_137to138_bb1_or57_i_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_137to138_bb1_or57_i_0_stall_in_0_NO_SHIFT_REG;
 logic rnode_137to138_bb1_or57_i_0_NO_SHIFT_REG;
 logic rnode_137to138_bb1_or57_i_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_137to138_bb1_or57_i_0_stall_in_1_NO_SHIFT_REG;
 logic rnode_137to138_bb1_or57_i_1_NO_SHIFT_REG;
 logic rnode_137to138_bb1_or57_i_0_reg_138_inputs_ready_NO_SHIFT_REG;
 logic rnode_137to138_bb1_or57_i_0_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_or57_i_0_valid_out_0_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_or57_i_0_stall_in_0_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_or57_i_0_stall_out_reg_138_NO_SHIFT_REG;

acl_data_fifo rnode_137to138_bb1_or57_i_0_reg_138_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_137to138_bb1_or57_i_0_reg_138_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_137to138_bb1_or57_i_0_stall_in_0_reg_138_NO_SHIFT_REG),
	.valid_out(rnode_137to138_bb1_or57_i_0_valid_out_0_reg_138_NO_SHIFT_REG),
	.stall_out(rnode_137to138_bb1_or57_i_0_stall_out_reg_138_NO_SHIFT_REG),
	.data_in(local_bb1_or57_i),
	.data_out(rnode_137to138_bb1_or57_i_0_reg_138_NO_SHIFT_REG)
);

defparam rnode_137to138_bb1_or57_i_0_reg_138_fifo.DEPTH = 1;
defparam rnode_137to138_bb1_or57_i_0_reg_138_fifo.DATA_WIDTH = 1;
defparam rnode_137to138_bb1_or57_i_0_reg_138_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_137to138_bb1_or57_i_0_reg_138_fifo.IMPL = "shift_reg";

assign rnode_137to138_bb1_or57_i_0_reg_138_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_or57_i_stall_in = 1'b0;
assign rnode_137to138_bb1_or57_i_0_stall_in_0_reg_138_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1_or57_i_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_137to138_bb1_or57_i_0_NO_SHIFT_REG = rnode_137to138_bb1_or57_i_0_reg_138_NO_SHIFT_REG;
assign rnode_137to138_bb1_or57_i_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_137to138_bb1_or57_i_1_NO_SHIFT_REG = rnode_137to138_bb1_or57_i_0_reg_138_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_137to138_bb1__31_i25_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_137to138_bb1__31_i25_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_137to138_bb1__31_i25_0_NO_SHIFT_REG;
 logic rnode_137to138_bb1__31_i25_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_137to138_bb1__31_i25_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_137to138_bb1__31_i25_1_NO_SHIFT_REG;
 logic rnode_137to138_bb1__31_i25_0_valid_out_2_NO_SHIFT_REG;
 logic rnode_137to138_bb1__31_i25_0_stall_in_2_NO_SHIFT_REG;
 logic [31:0] rnode_137to138_bb1__31_i25_2_NO_SHIFT_REG;
 logic rnode_137to138_bb1__31_i25_0_reg_138_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_137to138_bb1__31_i25_0_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1__31_i25_0_valid_out_0_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1__31_i25_0_stall_in_0_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1__31_i25_0_stall_out_reg_138_NO_SHIFT_REG;

acl_data_fifo rnode_137to138_bb1__31_i25_0_reg_138_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_137to138_bb1__31_i25_0_reg_138_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_137to138_bb1__31_i25_0_stall_in_0_reg_138_NO_SHIFT_REG),
	.valid_out(rnode_137to138_bb1__31_i25_0_valid_out_0_reg_138_NO_SHIFT_REG),
	.stall_out(rnode_137to138_bb1__31_i25_0_stall_out_reg_138_NO_SHIFT_REG),
	.data_in((local_bb1__31_i25 & 32'h1FF)),
	.data_out(rnode_137to138_bb1__31_i25_0_reg_138_NO_SHIFT_REG)
);

defparam rnode_137to138_bb1__31_i25_0_reg_138_fifo.DEPTH = 1;
defparam rnode_137to138_bb1__31_i25_0_reg_138_fifo.DATA_WIDTH = 32;
defparam rnode_137to138_bb1__31_i25_0_reg_138_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_137to138_bb1__31_i25_0_reg_138_fifo.IMPL = "shift_reg";

assign rnode_137to138_bb1__31_i25_0_reg_138_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1__31_i25_stall_in_1 = 1'b0;
assign rnode_137to138_bb1__31_i25_0_stall_in_0_reg_138_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1__31_i25_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_137to138_bb1__31_i25_0_NO_SHIFT_REG = rnode_137to138_bb1__31_i25_0_reg_138_NO_SHIFT_REG;
assign rnode_137to138_bb1__31_i25_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_137to138_bb1__31_i25_1_NO_SHIFT_REG = rnode_137to138_bb1__31_i25_0_reg_138_NO_SHIFT_REG;
assign rnode_137to138_bb1__31_i25_0_valid_out_2_NO_SHIFT_REG = 1'b1;
assign rnode_137to138_bb1__31_i25_2_NO_SHIFT_REG = rnode_137to138_bb1__31_i25_0_reg_138_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_137to138_bb1_cmp70_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_137to138_bb1_cmp70_i_0_stall_in_NO_SHIFT_REG;
 logic rnode_137to138_bb1_cmp70_i_0_NO_SHIFT_REG;
 logic rnode_137to138_bb1_cmp70_i_0_reg_138_inputs_ready_NO_SHIFT_REG;
 logic rnode_137to138_bb1_cmp70_i_0_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_cmp70_i_0_valid_out_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_cmp70_i_0_stall_in_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_cmp70_i_0_stall_out_reg_138_NO_SHIFT_REG;

acl_data_fifo rnode_137to138_bb1_cmp70_i_0_reg_138_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_137to138_bb1_cmp70_i_0_reg_138_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_137to138_bb1_cmp70_i_0_stall_in_reg_138_NO_SHIFT_REG),
	.valid_out(rnode_137to138_bb1_cmp70_i_0_valid_out_reg_138_NO_SHIFT_REG),
	.stall_out(rnode_137to138_bb1_cmp70_i_0_stall_out_reg_138_NO_SHIFT_REG),
	.data_in(local_bb1_cmp70_i),
	.data_out(rnode_137to138_bb1_cmp70_i_0_reg_138_NO_SHIFT_REG)
);

defparam rnode_137to138_bb1_cmp70_i_0_reg_138_fifo.DEPTH = 1;
defparam rnode_137to138_bb1_cmp70_i_0_reg_138_fifo.DATA_WIDTH = 1;
defparam rnode_137to138_bb1_cmp70_i_0_reg_138_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_137to138_bb1_cmp70_i_0_reg_138_fifo.IMPL = "shift_reg";

assign rnode_137to138_bb1_cmp70_i_0_reg_138_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_cmp70_i_stall_in = 1'b0;
assign rnode_137to138_bb1_cmp70_i_0_NO_SHIFT_REG = rnode_137to138_bb1_cmp70_i_0_reg_138_NO_SHIFT_REG;
assign rnode_137to138_bb1_cmp70_i_0_stall_in_reg_138_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1_cmp70_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_137to138_bb1_and68_i26_0_valid_out_NO_SHIFT_REG;
 logic rnode_137to138_bb1_and68_i26_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_137to138_bb1_and68_i26_0_NO_SHIFT_REG;
 logic rnode_137to138_bb1_and68_i26_0_reg_138_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_137to138_bb1_and68_i26_0_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_and68_i26_0_valid_out_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_and68_i26_0_stall_in_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1_and68_i26_0_stall_out_reg_138_NO_SHIFT_REG;

acl_data_fifo rnode_137to138_bb1_and68_i26_0_reg_138_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_137to138_bb1_and68_i26_0_reg_138_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_137to138_bb1_and68_i26_0_stall_in_reg_138_NO_SHIFT_REG),
	.valid_out(rnode_137to138_bb1_and68_i26_0_valid_out_reg_138_NO_SHIFT_REG),
	.stall_out(rnode_137to138_bb1_and68_i26_0_stall_out_reg_138_NO_SHIFT_REG),
	.data_in((local_bb1_and68_i26 & 32'h7FFFFF)),
	.data_out(rnode_137to138_bb1_and68_i26_0_reg_138_NO_SHIFT_REG)
);

defparam rnode_137to138_bb1_and68_i26_0_reg_138_fifo.DEPTH = 1;
defparam rnode_137to138_bb1_and68_i26_0_reg_138_fifo.DATA_WIDTH = 32;
defparam rnode_137to138_bb1_and68_i26_0_reg_138_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_137to138_bb1_and68_i26_0_reg_138_fifo.IMPL = "shift_reg";

assign rnode_137to138_bb1_and68_i26_0_reg_138_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_and68_i26_stall_in = 1'b0;
assign rnode_137to138_bb1_and68_i26_0_NO_SHIFT_REG = rnode_137to138_bb1_and68_i26_0_reg_138_NO_SHIFT_REG;
assign rnode_137to138_bb1_and68_i26_0_stall_in_reg_138_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1_and68_i26_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_137to138_bb1__33_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_137to138_bb1__33_i_0_stall_in_NO_SHIFT_REG;
 logic rnode_137to138_bb1__33_i_0_NO_SHIFT_REG;
 logic rnode_137to138_bb1__33_i_0_reg_138_inputs_ready_NO_SHIFT_REG;
 logic rnode_137to138_bb1__33_i_0_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1__33_i_0_valid_out_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1__33_i_0_stall_in_reg_138_NO_SHIFT_REG;
 logic rnode_137to138_bb1__33_i_0_stall_out_reg_138_NO_SHIFT_REG;

acl_data_fifo rnode_137to138_bb1__33_i_0_reg_138_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_137to138_bb1__33_i_0_reg_138_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_137to138_bb1__33_i_0_stall_in_reg_138_NO_SHIFT_REG),
	.valid_out(rnode_137to138_bb1__33_i_0_valid_out_reg_138_NO_SHIFT_REG),
	.stall_out(rnode_137to138_bb1__33_i_0_stall_out_reg_138_NO_SHIFT_REG),
	.data_in(local_bb1__33_i),
	.data_out(rnode_137to138_bb1__33_i_0_reg_138_NO_SHIFT_REG)
);

defparam rnode_137to138_bb1__33_i_0_reg_138_fifo.DEPTH = 1;
defparam rnode_137to138_bb1__33_i_0_reg_138_fifo.DATA_WIDTH = 1;
defparam rnode_137to138_bb1__33_i_0_reg_138_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_137to138_bb1__33_i_0_reg_138_fifo.IMPL = "shift_reg";

assign rnode_137to138_bb1__33_i_0_reg_138_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1__33_i_stall_in = 1'b0;
assign rnode_137to138_bb1__33_i_0_NO_SHIFT_REG = rnode_137to138_bb1__33_i_0_reg_138_NO_SHIFT_REG;
assign rnode_137to138_bb1__33_i_0_stall_in_reg_138_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1__33_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements a registered operation.
// 
wire SFC_1_VALID_151_152_0_inputs_ready;
 reg SFC_1_VALID_151_152_0_valid_out_NO_SHIFT_REG;
wire SFC_1_VALID_151_152_0_stall_in;
wire SFC_1_VALID_151_152_0_output_regs_ready;
 reg SFC_1_VALID_151_152_0_NO_SHIFT_REG /* synthesis  preserve  */;
wire SFC_1_VALID_151_152_0_causedstall;

assign SFC_1_VALID_151_152_0_inputs_ready = 1'b1;
assign SFC_1_VALID_151_152_0_output_regs_ready = 1'b1;
assign SFC_1_VALID_150_151_0_stall_in = 1'b0;
assign SFC_1_VALID_151_152_0_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		SFC_1_VALID_151_152_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (SFC_1_VALID_151_152_0_output_regs_ready)
		begin
			SFC_1_VALID_151_152_0_NO_SHIFT_REG <= SFC_1_VALID_150_151_0_NO_SHIFT_REG;
		end
	end
end


// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_138to139_bb1___i218_0_valid_out_NO_SHIFT_REG;
 logic rnode_138to139_bb1___i218_0_stall_in_NO_SHIFT_REG;
 logic rnode_138to139_bb1___i218_0_NO_SHIFT_REG;
 logic rnode_138to139_bb1___i218_0_reg_139_inputs_ready_NO_SHIFT_REG;
 logic rnode_138to139_bb1___i218_0_reg_139_NO_SHIFT_REG;
 logic rnode_138to139_bb1___i218_0_valid_out_reg_139_NO_SHIFT_REG;
 logic rnode_138to139_bb1___i218_0_stall_in_reg_139_NO_SHIFT_REG;
 logic rnode_138to139_bb1___i218_0_stall_out_reg_139_NO_SHIFT_REG;

acl_data_fifo rnode_138to139_bb1___i218_0_reg_139_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_138to139_bb1___i218_0_reg_139_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_138to139_bb1___i218_0_stall_in_reg_139_NO_SHIFT_REG),
	.valid_out(rnode_138to139_bb1___i218_0_valid_out_reg_139_NO_SHIFT_REG),
	.stall_out(rnode_138to139_bb1___i218_0_stall_out_reg_139_NO_SHIFT_REG),
	.data_in(local_bb1___i218),
	.data_out(rnode_138to139_bb1___i218_0_reg_139_NO_SHIFT_REG)
);

defparam rnode_138to139_bb1___i218_0_reg_139_fifo.DEPTH = 1;
defparam rnode_138to139_bb1___i218_0_reg_139_fifo.DATA_WIDTH = 1;
defparam rnode_138to139_bb1___i218_0_reg_139_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_138to139_bb1___i218_0_reg_139_fifo.IMPL = "shift_reg";

assign rnode_138to139_bb1___i218_0_reg_139_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1___i218_stall_in = 1'b0;
assign rnode_138to139_bb1___i218_0_NO_SHIFT_REG = rnode_138to139_bb1___i218_0_reg_139_NO_SHIFT_REG;
assign rnode_138to139_bb1___i218_0_stall_in_reg_139_NO_SHIFT_REG = 1'b0;
assign rnode_138to139_bb1___i218_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb1_or_i226_stall_local;
wire local_bb1_or_i226;

assign local_bb1_or_i226 = (rnode_137to138_bb1_cmp_i215_1_NO_SHIFT_REG | local_bb1_cmp20_i225);

// This section implements an unregistered operation.
// 
wire local_bb1_or25_i228_stall_local;
wire local_bb1_or25_i228;

assign local_bb1_or25_i228 = (rnode_137to138_bb1_cmp10_i219_0_NO_SHIFT_REG | local_bb1_cmp23_i227);

// This section implements an unregistered operation.
// 
wire local_bb1_or29_i233_stall_local;
wire [31:0] local_bb1_or29_i233;

assign local_bb1_or29_i233 = ((local_bb1_shl_i232 & 32'h7F800000) | (rnode_137to138_bb1_and28_i230_0_NO_SHIFT_REG & 32'h807FFFFF));

// This section implements an unregistered operation.
// 
wire local_bb1_cmp53_i281_stall_local;
wire local_bb1_cmp53_i281;

assign local_bb1_cmp53_i281 = ((rnode_137to138_bb1__31_i280_0_NO_SHIFT_REG & 32'h1FF) > 32'h17D);

// This section implements an unregistered operation.
// 
wire local_bb1_cmp63_i283_stall_local;
wire local_bb1_cmp63_i283;

assign local_bb1_cmp63_i283 = ((rnode_137to138_bb1__31_i280_1_NO_SHIFT_REG & 32'h1FF) < 32'h80);

// This section implements an unregistered operation.
// 
wire local_bb1_sub_i285_stall_local;
wire [31:0] local_bb1_sub_i285;

assign local_bb1_sub_i285 = ((rnode_137to138_bb1__31_i280_2_NO_SHIFT_REG & 32'h1FF) << 32'h17);

// This section implements an unregistered operation.
// 
wire local_bb1_cmp65_not_i300_stall_local;
wire local_bb1_cmp65_not_i300;

assign local_bb1_cmp65_not_i300 = ((rnode_137to138_bb1__31_i280_3_NO_SHIFT_REG & 32'h1FF) != 32'h7F);

// This section implements an unregistered operation.
// 
wire local_bb1__34_i293_stall_local;
wire local_bb1__34_i293;

assign local_bb1__34_i293 = (rnode_137to138_bb1_cmp70_i289_0_NO_SHIFT_REG | rnode_137to138_bb1__33_i292_0_NO_SHIFT_REG);

// This section implements an unregistered operation.
// 
wire local_bb1_cond95_i_stall_local;
wire [31:0] local_bb1_cond95_i;

assign local_bb1_cond95_i = (rnode_137to138_bb1_or57_i_1_NO_SHIFT_REG ? 32'h7F800000 : 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_cmp63_i_stall_local;
wire local_bb1_cmp63_i;

assign local_bb1_cmp63_i = ((rnode_137to138_bb1__31_i25_0_NO_SHIFT_REG & 32'h1FF) < 32'h80);

// This section implements an unregistered operation.
// 
wire local_bb1_sub_i27_stall_local;
wire [31:0] local_bb1_sub_i27;

assign local_bb1_sub_i27 = ((rnode_137to138_bb1__31_i25_1_NO_SHIFT_REG & 32'h1FF) << 32'h17);

// This section implements an unregistered operation.
// 
wire local_bb1_cmp65_not_i_stall_local;
wire local_bb1_cmp65_not_i;

assign local_bb1_cmp65_not_i = ((rnode_137to138_bb1__31_i25_2_NO_SHIFT_REG & 32'h1FF) != 32'h7F);

// This section implements an unregistered operation.
// 
wire local_bb1__34_i_stall_local;
wire local_bb1__34_i;

assign local_bb1__34_i = (rnode_137to138_bb1_cmp70_i_0_NO_SHIFT_REG | rnode_137to138_bb1__33_i_0_NO_SHIFT_REG);

// This section implements an unregistered operation.
// 
wire local_bb1_cond38_i237_stall_local;
wire [31:0] local_bb1_cond38_i237;

assign local_bb1_cond38_i237 = (rnode_138to139_bb1___i218_0_NO_SHIFT_REG ? 32'h400000 : 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_or32_i234_stall_local;
wire local_bb1_or32_i234;

assign local_bb1_or32_i234 = (local_bb1_or25_i228 | local_bb1_or_i226);

// This section implements an unregistered operation.
// 
wire local_bb1_or57_i282_stall_local;
wire local_bb1_or57_i282;

assign local_bb1_or57_i282 = (rnode_137to138_bb1_cmp_i247_1_NO_SHIFT_REG | local_bb1_cmp53_i281);

// This section implements an unregistered operation.
// 
wire local_bb1_and67_i286_stall_local;
wire [31:0] local_bb1_and67_i286;

assign local_bb1_and67_i286 = ((local_bb1_sub_i285 & 32'hFF800000) + 32'h40800000);

// This section implements an unregistered operation.
// 
wire local_bb1_cond_i294_stall_local;
wire [31:0] local_bb1_cond_i294;

assign local_bb1_cond_i294[31:1] = 31'h0;
assign local_bb1_cond_i294[0] = local_bb1__34_i293;

// This section implements an unregistered operation.
// 
wire local_bb1_and67_i_stall_local;
wire [31:0] local_bb1_and67_i;

assign local_bb1_and67_i = ((local_bb1_sub_i27 & 32'hFF800000) + 32'h40800000);

// This section implements an unregistered operation.
// 
wire local_bb1_cond_i29_stall_local;
wire [31:0] local_bb1_cond_i29;

assign local_bb1_cond_i29[31:1] = 31'h0;
assign local_bb1_cond_i29[0] = local_bb1__34_i;

// This section implements an unregistered operation.
// 
wire local_bb1_cond_i235_stall_local;
wire [31:0] local_bb1_cond_i235;

assign local_bb1_cond_i235 = (local_bb1_or32_i234 ? 32'h80000000 : 32'hFFFFFFFF);

// This section implements an unregistered operation.
// 
wire local_bb1_cond95_i308_stall_local;
wire [31:0] local_bb1_cond95_i308;

assign local_bb1_cond95_i308 = (local_bb1_or57_i282 ? 32'h7F800000 : 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_shl_i287_stall_local;
wire [31:0] local_bb1_shl_i287;

assign local_bb1_shl_i287 = ((local_bb1_and67_i286 & 32'hFF800000) & 32'h7F800000);

// This section implements an unregistered operation.
// 
wire local_bb1_shl_i28_stall_local;
wire [31:0] local_bb1_shl_i28;

assign local_bb1_shl_i28 = ((local_bb1_and67_i & 32'hFF800000) & 32'h7F800000);

// This section implements an unregistered operation.
// 
wire local_bb1_and39_i238_valid_out;
wire local_bb1_and39_i238_stall_in;
wire local_bb1_or_i226_valid_out_1;
wire local_bb1_or_i226_stall_in_1;
wire local_bb1_and39_i238_inputs_ready;
wire local_bb1_and39_i238_stall_local;
wire [31:0] local_bb1_and39_i238;

assign local_bb1_and39_i238_inputs_ready = (rnode_137to138_bb1_and28_i230_0_valid_out_NO_SHIFT_REG & rnode_137to138_bb1_and27_i231_0_valid_out_NO_SHIFT_REG & rnode_137to138_bb1_cmp_i215_0_valid_out_1_NO_SHIFT_REG & rnode_137to138_bb1_cmp10_i219_0_valid_out_NO_SHIFT_REG & rnode_137to138_bb1_add_i224_0_valid_out_0_NO_SHIFT_REG & rnode_137to138_bb1_add_i224_0_valid_out_1_NO_SHIFT_REG);
assign local_bb1_and39_i238 = ((local_bb1_cond_i235 | 32'h80000000) & local_bb1_or29_i233);
assign local_bb1_and39_i238_valid_out = 1'b1;
assign local_bb1_or_i226_valid_out_1 = 1'b1;
assign rnode_137to138_bb1_and28_i230_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1_and27_i231_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1_cmp_i215_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1_cmp10_i219_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1_add_i224_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1_add_i224_0_stall_in_1_NO_SHIFT_REG = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb1_or69_i288_stall_local;
wire [31:0] local_bb1_or69_i288;

assign local_bb1_or69_i288 = ((local_bb1_shl_i287 & 32'h7F800000) | (rnode_137to138_bb1_and68_i284_0_NO_SHIFT_REG & 32'h7FFFFF));

// This section implements an unregistered operation.
// 
wire local_bb1_or69_i_stall_local;
wire [31:0] local_bb1_or69_i;

assign local_bb1_or69_i = ((local_bb1_shl_i28 & 32'h7F800000) | (rnode_137to138_bb1_and68_i26_0_NO_SHIFT_REG & 32'h7FFFFF));

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_138to139_bb1_and39_i238_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_138to139_bb1_and39_i238_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_138to139_bb1_and39_i238_0_NO_SHIFT_REG;
 logic rnode_138to139_bb1_and39_i238_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_138to139_bb1_and39_i238_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_138to139_bb1_and39_i238_1_NO_SHIFT_REG;
 logic rnode_138to139_bb1_and39_i238_0_reg_139_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_138to139_bb1_and39_i238_0_reg_139_NO_SHIFT_REG;
 logic rnode_138to139_bb1_and39_i238_0_valid_out_0_reg_139_NO_SHIFT_REG;
 logic rnode_138to139_bb1_and39_i238_0_stall_in_0_reg_139_NO_SHIFT_REG;
 logic rnode_138to139_bb1_and39_i238_0_stall_out_reg_139_NO_SHIFT_REG;

acl_data_fifo rnode_138to139_bb1_and39_i238_0_reg_139_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_138to139_bb1_and39_i238_0_reg_139_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_138to139_bb1_and39_i238_0_stall_in_0_reg_139_NO_SHIFT_REG),
	.valid_out(rnode_138to139_bb1_and39_i238_0_valid_out_0_reg_139_NO_SHIFT_REG),
	.stall_out(rnode_138to139_bb1_and39_i238_0_stall_out_reg_139_NO_SHIFT_REG),
	.data_in(local_bb1_and39_i238),
	.data_out(rnode_138to139_bb1_and39_i238_0_reg_139_NO_SHIFT_REG)
);

defparam rnode_138to139_bb1_and39_i238_0_reg_139_fifo.DEPTH = 1;
defparam rnode_138to139_bb1_and39_i238_0_reg_139_fifo.DATA_WIDTH = 32;
defparam rnode_138to139_bb1_and39_i238_0_reg_139_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_138to139_bb1_and39_i238_0_reg_139_fifo.IMPL = "shift_reg";

assign rnode_138to139_bb1_and39_i238_0_reg_139_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_and39_i238_stall_in = 1'b0;
assign rnode_138to139_bb1_and39_i238_0_stall_in_0_reg_139_NO_SHIFT_REG = 1'b0;
assign rnode_138to139_bb1_and39_i238_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_138to139_bb1_and39_i238_0_NO_SHIFT_REG = rnode_138to139_bb1_and39_i238_0_reg_139_NO_SHIFT_REG;
assign rnode_138to139_bb1_and39_i238_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_138to139_bb1_and39_i238_1_NO_SHIFT_REG = rnode_138to139_bb1_and39_i238_0_reg_139_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_138to139_bb1_or_i226_0_valid_out_NO_SHIFT_REG;
 logic rnode_138to139_bb1_or_i226_0_stall_in_NO_SHIFT_REG;
 logic rnode_138to139_bb1_or_i226_0_NO_SHIFT_REG;
 logic rnode_138to139_bb1_or_i226_0_reg_139_inputs_ready_NO_SHIFT_REG;
 logic rnode_138to139_bb1_or_i226_0_reg_139_NO_SHIFT_REG;
 logic rnode_138to139_bb1_or_i226_0_valid_out_reg_139_NO_SHIFT_REG;
 logic rnode_138to139_bb1_or_i226_0_stall_in_reg_139_NO_SHIFT_REG;
 logic rnode_138to139_bb1_or_i226_0_stall_out_reg_139_NO_SHIFT_REG;

acl_data_fifo rnode_138to139_bb1_or_i226_0_reg_139_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_138to139_bb1_or_i226_0_reg_139_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_138to139_bb1_or_i226_0_stall_in_reg_139_NO_SHIFT_REG),
	.valid_out(rnode_138to139_bb1_or_i226_0_valid_out_reg_139_NO_SHIFT_REG),
	.stall_out(rnode_138to139_bb1_or_i226_0_stall_out_reg_139_NO_SHIFT_REG),
	.data_in(local_bb1_or_i226),
	.data_out(rnode_138to139_bb1_or_i226_0_reg_139_NO_SHIFT_REG)
);

defparam rnode_138to139_bb1_or_i226_0_reg_139_fifo.DEPTH = 1;
defparam rnode_138to139_bb1_or_i226_0_reg_139_fifo.DATA_WIDTH = 1;
defparam rnode_138to139_bb1_or_i226_0_reg_139_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_138to139_bb1_or_i226_0_reg_139_fifo.IMPL = "shift_reg";

assign rnode_138to139_bb1_or_i226_0_reg_139_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_or_i226_stall_in_1 = 1'b0;
assign rnode_138to139_bb1_or_i226_0_NO_SHIFT_REG = rnode_138to139_bb1_or_i226_0_reg_139_NO_SHIFT_REG;
assign rnode_138to139_bb1_or_i226_0_stall_in_reg_139_NO_SHIFT_REG = 1'b0;
assign rnode_138to139_bb1_or_i226_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb1_add78_i295_stall_local;
wire [31:0] local_bb1_add78_i295;

assign local_bb1_add78_i295 = ((local_bb1_cond_i294 & 32'h1) + (local_bb1_or69_i288 & 32'h7FFFFFFF));

// This section implements an unregistered operation.
// 
wire local_bb1_add78_i_stall_local;
wire [31:0] local_bb1_add78_i;

assign local_bb1_add78_i = ((local_bb1_cond_i29 & 32'h1) + (local_bb1_or69_i & 32'h7FFFFFFF));

// This section implements an unregistered operation.
// 
wire local_bb1_and10_i40_stall_local;
wire [31:0] local_bb1_and10_i40;

assign local_bb1_and10_i40 = (rnode_138to139_bb1_and39_i238_1_NO_SHIFT_REG & 32'hFFFF);

// This section implements an unregistered operation.
// 
wire local_bb1_cond36_i236_stall_local;
wire [31:0] local_bb1_cond36_i236;

assign local_bb1_cond36_i236 = (rnode_138to139_bb1_or_i226_0_NO_SHIFT_REG ? 32'h7F800000 : 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_and79_i296_stall_local;
wire [31:0] local_bb1_and79_i296;

assign local_bb1_and79_i296 = (local_bb1_add78_i295 & 32'h7FFFFFFF);

// This section implements an unregistered operation.
// 
wire local_bb1_and81_i298_stall_local;
wire [31:0] local_bb1_and81_i298;

assign local_bb1_and81_i298 = (local_bb1_add78_i295 & 32'h800000);

// This section implements an unregistered operation.
// 
wire local_bb1_and79_i_stall_local;
wire [31:0] local_bb1_and79_i;

assign local_bb1_and79_i = (local_bb1_add78_i & 32'h7FFFFFFF);

// This section implements an unregistered operation.
// 
wire local_bb1_and81_i_stall_local;
wire [31:0] local_bb1_and81_i;

assign local_bb1_and81_i = (local_bb1_add78_i & 32'h800000);

// This section implements an unregistered operation.
// 
wire local_bb1_or40_i239_stall_local;
wire [31:0] local_bb1_or40_i239;

assign local_bb1_or40_i239 = ((local_bb1_cond36_i236 & 32'h7F800000) | (local_bb1_cond38_i237 & 32'h400000));

// This section implements an unregistered operation.
// 
wire local_bb1_or80_i297_stall_local;
wire [31:0] local_bb1_or80_i297;

assign local_bb1_or80_i297 = ((local_bb1_and79_i296 & 32'h7FFFFFFF) | (rnode_137to138_bb1_and4_i244_0_NO_SHIFT_REG & 32'h80000000));

// This section implements an unregistered operation.
// 
wire local_bb1_cmp82_i299_stall_local;
wire local_bb1_cmp82_i299;

assign local_bb1_cmp82_i299 = ((local_bb1_and81_i298 & 32'h800000) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_or80_i_stall_local;
wire [31:0] local_bb1_or80_i;

assign local_bb1_or80_i = ((local_bb1_and79_i & 32'h7FFFFFFF) | (rnode_137to138_bb1_and4_i_0_NO_SHIFT_REG & 32'h80000000));

// This section implements an unregistered operation.
// 
wire local_bb1_cmp82_i_stall_local;
wire local_bb1_cmp82_i;

assign local_bb1_cmp82_i = ((local_bb1_and81_i & 32'h800000) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_or41_i240_stall_local;
wire [31:0] local_bb1_or41_i240;

assign local_bb1_or41_i240 = ((local_bb1_or40_i239 & 32'h7FC00000) | rnode_138to139_bb1_and39_i238_0_NO_SHIFT_REG);

// This section implements an unregistered operation.
// 
wire local_bb1_brmerge16_i301_stall_local;
wire local_bb1_brmerge16_i301;

assign local_bb1_brmerge16_i301 = (local_bb1_cmp82_i299 | local_bb1_cmp65_not_i300);

// This section implements an unregistered operation.
// 
wire local_bb1_brmerge16_i_stall_local;
wire local_bb1_brmerge16_i;

assign local_bb1_brmerge16_i = (local_bb1_cmp82_i | local_bb1_cmp65_not_i);

// This section implements an unregistered operation.
// 
wire local_bb1_and_i34_stall_local;
wire [31:0] local_bb1_and_i34;

assign local_bb1_and_i34 = (local_bb1_or41_i240 >> 32'h10);

// This section implements an unregistered operation.
// 
wire local_bb1_tobool87_i302_stall_local;
wire local_bb1_tobool87_i302;

assign local_bb1_tobool87_i302 = (local_bb1_brmerge16_i301 & local_bb1_cmp63_i283);

// This section implements an unregistered operation.
// 
wire local_bb1_tobool87_i_stall_local;
wire local_bb1_tobool87_i;

assign local_bb1_tobool87_i = (local_bb1_brmerge16_i & local_bb1_cmp63_i);

// This section implements an unregistered operation.
// 
wire local_bb1_shr_i35_stall_local;
wire [31:0] local_bb1_shr_i35;

assign local_bb1_shr_i35 = ((local_bb1_and_i34 & 32'hFFFF) & 32'h7FFF);

// This section implements an unregistered operation.
// 
wire local_bb1_reduction_5_i304_stall_local;
wire local_bb1_reduction_5_i304;

assign local_bb1_reduction_5_i304 = (local_bb1_tobool87_i302 | rnode_137to138_bb1_lnot_i246_0_NO_SHIFT_REG);

// This section implements an unregistered operation.
// 
wire local_bb1_reduction_5_i31_stall_local;
wire local_bb1_reduction_5_i31;

assign local_bb1_reduction_5_i31 = (local_bb1_tobool87_i | rnode_137to138_bb1_lnot_i12_0_NO_SHIFT_REG);

// This section implements an unregistered operation.
// 
wire local_bb1_reduction_6_i305_stall_local;
wire local_bb1_reduction_6_i305;

assign local_bb1_reduction_6_i305 = (local_bb1_or57_i282 | local_bb1_reduction_5_i304);

// This section implements an unregistered operation.
// 
wire local_bb1_reduction_6_i32_stall_local;
wire local_bb1_reduction_6_i32;

assign local_bb1_reduction_6_i32 = (rnode_137to138_bb1_or57_i_0_NO_SHIFT_REG | local_bb1_reduction_5_i31);

// This section implements an unregistered operation.
// 
wire local_bb1_and4__i306_stall_local;
wire [31:0] local_bb1_and4__i306;

assign local_bb1_and4__i306 = (local_bb1_reduction_6_i305 ? (rnode_137to138_bb1_and4_i244_1_NO_SHIFT_REG & 32'h80000000) : 32'hFFFFFFFF);

// This section implements an unregistered operation.
// 
wire local_bb1_and4__i_stall_local;
wire [31:0] local_bb1_and4__i;

assign local_bb1_and4__i = (local_bb1_reduction_6_i32 ? (rnode_137to138_bb1_and4_i_1_NO_SHIFT_REG & 32'h80000000) : 32'hFFFFFFFF);

// This section implements an unregistered operation.
// 
wire local_bb1_and93_i307_stall_local;
wire [31:0] local_bb1_and93_i307;

assign local_bb1_and93_i307 = (local_bb1_and4__i306 & local_bb1_or80_i297);

// This section implements an unregistered operation.
// 
wire local_bb1_and93_i33_stall_local;
wire [31:0] local_bb1_and93_i33;

assign local_bb1_and93_i33 = (local_bb1_and4__i & local_bb1_or80_i);

// This section implements an unregistered operation.
// 
wire local_bb1_or96_i309_stall_local;
wire [31:0] local_bb1_or96_i309;

assign local_bb1_or96_i309 = (local_bb1_and93_i307 | (local_bb1_cond95_i308 & 32'h7F800000));

// This section implements an unregistered operation.
// 
wire local_bb1_or96_i_stall_local;
wire [31:0] local_bb1_or96_i;

assign local_bb1_or96_i = (local_bb1_and93_i33 | (local_bb1_cond95_i & 32'h7F800000));

// This section implements an unregistered operation.
// 
wire local_bb1_var__u9_valid_out;
wire local_bb1_var__u9_stall_in;
wire local_bb1_var__u9_inputs_ready;
wire local_bb1_var__u9_stall_local;
wire [31:0] local_bb1_var__u9;

assign local_bb1_var__u9_inputs_ready = (rnode_137to138_bb1_and4_i244_0_valid_out_0_NO_SHIFT_REG & rnode_137to138_bb1_and4_i244_0_valid_out_1_NO_SHIFT_REG & rnode_137to138_bb1_cmp_i247_0_valid_out_0_NO_SHIFT_REG & rnode_137to138_bb1_lnot14_not_i248_0_valid_out_NO_SHIFT_REG & rnode_137to138_bb1_lnot_i246_0_valid_out_NO_SHIFT_REG & rnode_137to138_bb1_cmp_i247_0_valid_out_1_NO_SHIFT_REG & rnode_137to138_bb1__31_i280_0_valid_out_0_NO_SHIFT_REG & rnode_137to138_bb1__31_i280_0_valid_out_1_NO_SHIFT_REG & rnode_137to138_bb1__31_i280_0_valid_out_3_NO_SHIFT_REG & rnode_137to138_bb1__31_i280_0_valid_out_2_NO_SHIFT_REG & rnode_137to138_bb1_and68_i284_0_valid_out_NO_SHIFT_REG & rnode_137to138_bb1_cmp70_i289_0_valid_out_NO_SHIFT_REG & rnode_137to138_bb1__33_i292_0_valid_out_NO_SHIFT_REG);
assign local_bb1_var__u9 = (local_bb1__22_i254 ? 32'h7FC00000 : local_bb1_or96_i309);
assign local_bb1_var__u9_valid_out = 1'b1;
assign rnode_137to138_bb1_and4_i244_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1_and4_i244_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1_cmp_i247_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1_lnot14_not_i248_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1_lnot_i246_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1_cmp_i247_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1__31_i280_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1__31_i280_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1__31_i280_0_stall_in_3_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1__31_i280_0_stall_in_2_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1_and68_i284_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1_cmp70_i289_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1__33_i292_0_stall_in_NO_SHIFT_REG = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb1_var__u10_valid_out;
wire local_bb1_var__u10_stall_in;
wire local_bb1_var__u10_inputs_ready;
wire local_bb1_var__u10_stall_local;
wire [31:0] local_bb1_var__u10;

assign local_bb1_var__u10_inputs_ready = (rnode_137to138_bb1_and4_i_0_valid_out_0_NO_SHIFT_REG & rnode_137to138_bb1_and4_i_0_valid_out_1_NO_SHIFT_REG & rnode_137to138_bb1__22_i_0_valid_out_NO_SHIFT_REG & rnode_137to138_bb1_lnot_i12_0_valid_out_NO_SHIFT_REG & rnode_137to138_bb1_or57_i_0_valid_out_0_NO_SHIFT_REG & rnode_137to138_bb1_or57_i_0_valid_out_1_NO_SHIFT_REG & rnode_137to138_bb1__31_i25_0_valid_out_0_NO_SHIFT_REG & rnode_137to138_bb1__31_i25_0_valid_out_2_NO_SHIFT_REG & rnode_137to138_bb1__31_i25_0_valid_out_1_NO_SHIFT_REG & rnode_137to138_bb1_and68_i26_0_valid_out_NO_SHIFT_REG & rnode_137to138_bb1_cmp70_i_0_valid_out_NO_SHIFT_REG & rnode_137to138_bb1__33_i_0_valid_out_NO_SHIFT_REG);
assign local_bb1_var__u10 = (rnode_137to138_bb1__22_i_0_NO_SHIFT_REG ? 32'h7FC00000 : local_bb1_or96_i);
assign local_bb1_var__u10_valid_out = 1'b1;
assign rnode_137to138_bb1_and4_i_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1_and4_i_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1__22_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1_lnot_i12_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1_or57_i_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1_or57_i_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1__31_i25_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1__31_i25_0_stall_in_2_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1__31_i25_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1_and68_i26_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1_cmp70_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_137to138_bb1__33_i_0_stall_in_NO_SHIFT_REG = 1'b0;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_138to139_bb1_var__u9_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_138to139_bb1_var__u9_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_138to139_bb1_var__u9_0_NO_SHIFT_REG;
 logic rnode_138to139_bb1_var__u9_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_138to139_bb1_var__u9_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_138to139_bb1_var__u9_1_NO_SHIFT_REG;
 logic rnode_138to139_bb1_var__u9_0_valid_out_2_NO_SHIFT_REG;
 logic rnode_138to139_bb1_var__u9_0_stall_in_2_NO_SHIFT_REG;
 logic [31:0] rnode_138to139_bb1_var__u9_2_NO_SHIFT_REG;
 logic rnode_138to139_bb1_var__u9_0_valid_out_3_NO_SHIFT_REG;
 logic rnode_138to139_bb1_var__u9_0_stall_in_3_NO_SHIFT_REG;
 logic [31:0] rnode_138to139_bb1_var__u9_3_NO_SHIFT_REG;
 logic rnode_138to139_bb1_var__u9_0_reg_139_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_138to139_bb1_var__u9_0_reg_139_NO_SHIFT_REG;
 logic rnode_138to139_bb1_var__u9_0_valid_out_0_reg_139_NO_SHIFT_REG;
 logic rnode_138to139_bb1_var__u9_0_stall_in_0_reg_139_NO_SHIFT_REG;
 logic rnode_138to139_bb1_var__u9_0_stall_out_reg_139_NO_SHIFT_REG;

acl_data_fifo rnode_138to139_bb1_var__u9_0_reg_139_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_138to139_bb1_var__u9_0_reg_139_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_138to139_bb1_var__u9_0_stall_in_0_reg_139_NO_SHIFT_REG),
	.valid_out(rnode_138to139_bb1_var__u9_0_valid_out_0_reg_139_NO_SHIFT_REG),
	.stall_out(rnode_138to139_bb1_var__u9_0_stall_out_reg_139_NO_SHIFT_REG),
	.data_in(local_bb1_var__u9),
	.data_out(rnode_138to139_bb1_var__u9_0_reg_139_NO_SHIFT_REG)
);

defparam rnode_138to139_bb1_var__u9_0_reg_139_fifo.DEPTH = 1;
defparam rnode_138to139_bb1_var__u9_0_reg_139_fifo.DATA_WIDTH = 32;
defparam rnode_138to139_bb1_var__u9_0_reg_139_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_138to139_bb1_var__u9_0_reg_139_fifo.IMPL = "shift_reg";

assign rnode_138to139_bb1_var__u9_0_reg_139_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_var__u9_stall_in = 1'b0;
assign rnode_138to139_bb1_var__u9_0_stall_in_0_reg_139_NO_SHIFT_REG = 1'b0;
assign rnode_138to139_bb1_var__u9_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_138to139_bb1_var__u9_0_NO_SHIFT_REG = rnode_138to139_bb1_var__u9_0_reg_139_NO_SHIFT_REG;
assign rnode_138to139_bb1_var__u9_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_138to139_bb1_var__u9_1_NO_SHIFT_REG = rnode_138to139_bb1_var__u9_0_reg_139_NO_SHIFT_REG;
assign rnode_138to139_bb1_var__u9_0_valid_out_2_NO_SHIFT_REG = 1'b1;
assign rnode_138to139_bb1_var__u9_2_NO_SHIFT_REG = rnode_138to139_bb1_var__u9_0_reg_139_NO_SHIFT_REG;
assign rnode_138to139_bb1_var__u9_0_valid_out_3_NO_SHIFT_REG = 1'b1;
assign rnode_138to139_bb1_var__u9_3_NO_SHIFT_REG = rnode_138to139_bb1_var__u9_0_reg_139_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_138to139_bb1_var__u10_0_valid_out_NO_SHIFT_REG;
 logic rnode_138to139_bb1_var__u10_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_138to139_bb1_var__u10_0_NO_SHIFT_REG;
 logic rnode_138to139_bb1_var__u10_0_reg_139_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_138to139_bb1_var__u10_0_reg_139_NO_SHIFT_REG;
 logic rnode_138to139_bb1_var__u10_0_valid_out_reg_139_NO_SHIFT_REG;
 logic rnode_138to139_bb1_var__u10_0_stall_in_reg_139_NO_SHIFT_REG;
 logic rnode_138to139_bb1_var__u10_0_stall_out_reg_139_NO_SHIFT_REG;

acl_data_fifo rnode_138to139_bb1_var__u10_0_reg_139_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_138to139_bb1_var__u10_0_reg_139_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_138to139_bb1_var__u10_0_stall_in_reg_139_NO_SHIFT_REG),
	.valid_out(rnode_138to139_bb1_var__u10_0_valid_out_reg_139_NO_SHIFT_REG),
	.stall_out(rnode_138to139_bb1_var__u10_0_stall_out_reg_139_NO_SHIFT_REG),
	.data_in(local_bb1_var__u10),
	.data_out(rnode_138to139_bb1_var__u10_0_reg_139_NO_SHIFT_REG)
);

defparam rnode_138to139_bb1_var__u10_0_reg_139_fifo.DEPTH = 1;
defparam rnode_138to139_bb1_var__u10_0_reg_139_fifo.DATA_WIDTH = 32;
defparam rnode_138to139_bb1_var__u10_0_reg_139_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_138to139_bb1_var__u10_0_reg_139_fifo.IMPL = "shift_reg";

assign rnode_138to139_bb1_var__u10_0_reg_139_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_var__u10_stall_in = 1'b0;
assign rnode_138to139_bb1_var__u10_0_NO_SHIFT_REG = rnode_138to139_bb1_var__u10_0_reg_139_NO_SHIFT_REG;
assign rnode_138to139_bb1_var__u10_0_stall_in_reg_139_NO_SHIFT_REG = 1'b0;
assign rnode_138to139_bb1_var__u10_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb1_and2_i36_stall_local;
wire [31:0] local_bb1_and2_i36;

assign local_bb1_and2_i36 = (rnode_138to139_bb1_var__u9_0_NO_SHIFT_REG >> 32'h10);

// This section implements an unregistered operation.
// 
wire local_bb1_and12_i41_stall_local;
wire [31:0] local_bb1_and12_i41;

assign local_bb1_and12_i41 = (rnode_138to139_bb1_var__u9_1_NO_SHIFT_REG & 32'hFFFF);

// Register node:
//  * latency = 6
//  * capacity = 6
 logic rnode_139to145_bb1_var__u10_0_valid_out_NO_SHIFT_REG;
 logic rnode_139to145_bb1_var__u10_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_139to145_bb1_var__u10_0_NO_SHIFT_REG;
 logic rnode_139to145_bb1_var__u10_0_reg_145_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_139to145_bb1_var__u10_0_reg_145_NO_SHIFT_REG;
 logic rnode_139to145_bb1_var__u10_0_valid_out_reg_145_NO_SHIFT_REG;
 logic rnode_139to145_bb1_var__u10_0_stall_in_reg_145_NO_SHIFT_REG;
 logic rnode_139to145_bb1_var__u10_0_stall_out_reg_145_NO_SHIFT_REG;

acl_data_fifo rnode_139to145_bb1_var__u10_0_reg_145_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_139to145_bb1_var__u10_0_reg_145_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_139to145_bb1_var__u10_0_stall_in_reg_145_NO_SHIFT_REG),
	.valid_out(rnode_139to145_bb1_var__u10_0_valid_out_reg_145_NO_SHIFT_REG),
	.stall_out(rnode_139to145_bb1_var__u10_0_stall_out_reg_145_NO_SHIFT_REG),
	.data_in(rnode_138to139_bb1_var__u10_0_NO_SHIFT_REG),
	.data_out(rnode_139to145_bb1_var__u10_0_reg_145_NO_SHIFT_REG)
);

defparam rnode_139to145_bb1_var__u10_0_reg_145_fifo.DEPTH = 6;
defparam rnode_139to145_bb1_var__u10_0_reg_145_fifo.DATA_WIDTH = 32;
defparam rnode_139to145_bb1_var__u10_0_reg_145_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_139to145_bb1_var__u10_0_reg_145_fifo.IMPL = "shift_reg";

assign rnode_139to145_bb1_var__u10_0_reg_145_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_138to139_bb1_var__u10_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_139to145_bb1_var__u10_0_NO_SHIFT_REG = rnode_139to145_bb1_var__u10_0_reg_145_NO_SHIFT_REG;
assign rnode_139to145_bb1_var__u10_0_stall_in_reg_145_NO_SHIFT_REG = 1'b0;
assign rnode_139to145_bb1_var__u10_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb1_shr3_i37_stall_local;
wire [31:0] local_bb1_shr3_i37;

assign local_bb1_shr3_i37 = ((local_bb1_and2_i36 & 32'hFFFF) & 32'h7FFF);

// This section implements an unregistered operation.
// 
wire local_bb1_cmp13_i42_stall_local;
wire local_bb1_cmp13_i42;

assign local_bb1_cmp13_i42 = ((local_bb1_and10_i40 & 32'hFFFF) > (local_bb1_and12_i41 & 32'hFFFF));

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_145to146_bb1_var__u10_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_145to146_bb1_var__u10_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_145to146_bb1_var__u10_0_NO_SHIFT_REG;
 logic rnode_145to146_bb1_var__u10_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_145to146_bb1_var__u10_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_145to146_bb1_var__u10_1_NO_SHIFT_REG;
 logic rnode_145to146_bb1_var__u10_0_valid_out_2_NO_SHIFT_REG;
 logic rnode_145to146_bb1_var__u10_0_stall_in_2_NO_SHIFT_REG;
 logic [31:0] rnode_145to146_bb1_var__u10_2_NO_SHIFT_REG;
 logic rnode_145to146_bb1_var__u10_0_reg_146_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_145to146_bb1_var__u10_0_reg_146_NO_SHIFT_REG;
 logic rnode_145to146_bb1_var__u10_0_valid_out_0_reg_146_NO_SHIFT_REG;
 logic rnode_145to146_bb1_var__u10_0_stall_in_0_reg_146_NO_SHIFT_REG;
 logic rnode_145to146_bb1_var__u10_0_stall_out_reg_146_NO_SHIFT_REG;

acl_data_fifo rnode_145to146_bb1_var__u10_0_reg_146_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_145to146_bb1_var__u10_0_reg_146_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_145to146_bb1_var__u10_0_stall_in_0_reg_146_NO_SHIFT_REG),
	.valid_out(rnode_145to146_bb1_var__u10_0_valid_out_0_reg_146_NO_SHIFT_REG),
	.stall_out(rnode_145to146_bb1_var__u10_0_stall_out_reg_146_NO_SHIFT_REG),
	.data_in(rnode_139to145_bb1_var__u10_0_NO_SHIFT_REG),
	.data_out(rnode_145to146_bb1_var__u10_0_reg_146_NO_SHIFT_REG)
);

defparam rnode_145to146_bb1_var__u10_0_reg_146_fifo.DEPTH = 1;
defparam rnode_145to146_bb1_var__u10_0_reg_146_fifo.DATA_WIDTH = 32;
defparam rnode_145to146_bb1_var__u10_0_reg_146_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_145to146_bb1_var__u10_0_reg_146_fifo.IMPL = "shift_reg";

assign rnode_145to146_bb1_var__u10_0_reg_146_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_139to145_bb1_var__u10_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_145to146_bb1_var__u10_0_stall_in_0_reg_146_NO_SHIFT_REG = 1'b0;
assign rnode_145to146_bb1_var__u10_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_145to146_bb1_var__u10_0_NO_SHIFT_REG = rnode_145to146_bb1_var__u10_0_reg_146_NO_SHIFT_REG;
assign rnode_145to146_bb1_var__u10_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_145to146_bb1_var__u10_1_NO_SHIFT_REG = rnode_145to146_bb1_var__u10_0_reg_146_NO_SHIFT_REG;
assign rnode_145to146_bb1_var__u10_0_valid_out_2_NO_SHIFT_REG = 1'b1;
assign rnode_145to146_bb1_var__u10_2_NO_SHIFT_REG = rnode_145to146_bb1_var__u10_0_reg_146_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb1_cmp_i38_stall_local;
wire local_bb1_cmp_i38;

assign local_bb1_cmp_i38 = ((local_bb1_shr_i35 & 32'h7FFF) > (local_bb1_shr3_i37 & 32'h7FFF));

// This section implements an unregistered operation.
// 
wire local_bb1_cmp8_i39_stall_local;
wire local_bb1_cmp8_i39;

assign local_bb1_cmp8_i39 = ((local_bb1_shr_i35 & 32'h7FFF) == (local_bb1_shr3_i37 & 32'h7FFF));

// This section implements an unregistered operation.
// 
wire local_bb1_and_i_stall_local;
wire [31:0] local_bb1_and_i;

assign local_bb1_and_i = (rnode_145to146_bb1_var__u10_0_NO_SHIFT_REG >> 32'h10);

// This section implements an unregistered operation.
// 
wire local_bb1_and10_i_stall_local;
wire [31:0] local_bb1_and10_i;

assign local_bb1_and10_i = (rnode_145to146_bb1_var__u10_1_NO_SHIFT_REG & 32'hFFFF);

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_146to147_bb1_var__u10_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_146to147_bb1_var__u10_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_146to147_bb1_var__u10_0_NO_SHIFT_REG;
 logic rnode_146to147_bb1_var__u10_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_146to147_bb1_var__u10_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_146to147_bb1_var__u10_1_NO_SHIFT_REG;
 logic rnode_146to147_bb1_var__u10_0_reg_147_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_146to147_bb1_var__u10_0_reg_147_NO_SHIFT_REG;
 logic rnode_146to147_bb1_var__u10_0_valid_out_0_reg_147_NO_SHIFT_REG;
 logic rnode_146to147_bb1_var__u10_0_stall_in_0_reg_147_NO_SHIFT_REG;
 logic rnode_146to147_bb1_var__u10_0_stall_out_reg_147_NO_SHIFT_REG;

acl_data_fifo rnode_146to147_bb1_var__u10_0_reg_147_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_146to147_bb1_var__u10_0_reg_147_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_146to147_bb1_var__u10_0_stall_in_0_reg_147_NO_SHIFT_REG),
	.valid_out(rnode_146to147_bb1_var__u10_0_valid_out_0_reg_147_NO_SHIFT_REG),
	.stall_out(rnode_146to147_bb1_var__u10_0_stall_out_reg_147_NO_SHIFT_REG),
	.data_in(rnode_145to146_bb1_var__u10_2_NO_SHIFT_REG),
	.data_out(rnode_146to147_bb1_var__u10_0_reg_147_NO_SHIFT_REG)
);

defparam rnode_146to147_bb1_var__u10_0_reg_147_fifo.DEPTH = 1;
defparam rnode_146to147_bb1_var__u10_0_reg_147_fifo.DATA_WIDTH = 32;
defparam rnode_146to147_bb1_var__u10_0_reg_147_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_146to147_bb1_var__u10_0_reg_147_fifo.IMPL = "shift_reg";

assign rnode_146to147_bb1_var__u10_0_reg_147_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_145to146_bb1_var__u10_0_stall_in_2_NO_SHIFT_REG = 1'b0;
assign rnode_146to147_bb1_var__u10_0_stall_in_0_reg_147_NO_SHIFT_REG = 1'b0;
assign rnode_146to147_bb1_var__u10_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_146to147_bb1_var__u10_0_NO_SHIFT_REG = rnode_146to147_bb1_var__u10_0_reg_147_NO_SHIFT_REG;
assign rnode_146to147_bb1_var__u10_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_146to147_bb1_var__u10_1_NO_SHIFT_REG = rnode_146to147_bb1_var__u10_0_reg_147_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb1___i43_stall_local;
wire local_bb1___i43;

assign local_bb1___i43 = (local_bb1_cmp8_i39 & local_bb1_cmp13_i42);

// This section implements an unregistered operation.
// 
wire local_bb1_shr_i1_stall_local;
wire [31:0] local_bb1_shr_i1;

assign local_bb1_shr_i1 = ((local_bb1_and_i & 32'hFFFF) & 32'h7FFF);

// This section implements an unregistered operation.
// 
wire local_bb1__8_i44_stall_local;
wire local_bb1__8_i44;

assign local_bb1__8_i44 = (local_bb1_cmp_i38 | local_bb1___i43);

// This section implements an unregistered operation.
// 
wire local_bb1__9_i45_stall_local;
wire [31:0] local_bb1__9_i45;

assign local_bb1__9_i45 = (local_bb1__8_i44 ? rnode_138to139_bb1_var__u9_2_NO_SHIFT_REG : local_bb1_or41_i240);

// This section implements an unregistered operation.
// 
wire local_bb1__9_i45_valid_out;
wire local_bb1__9_i45_stall_in;
wire local_bb1__10_i46_valid_out;
wire local_bb1__10_i46_stall_in;
wire local_bb1__10_i46_inputs_ready;
wire local_bb1__10_i46_stall_local;
wire [31:0] local_bb1__10_i46;

assign local_bb1__10_i46_inputs_ready = (rnode_138to139_bb1_var__u9_0_valid_out_0_NO_SHIFT_REG & rnode_138to139_bb1_var__u9_0_valid_out_1_NO_SHIFT_REG & rnode_138to139_bb1_and39_i238_0_valid_out_1_NO_SHIFT_REG & rnode_138to139_bb1_var__u9_0_valid_out_2_NO_SHIFT_REG & rnode_138to139_bb1_and39_i238_0_valid_out_0_NO_SHIFT_REG & rnode_138to139_bb1_var__u9_0_valid_out_3_NO_SHIFT_REG & rnode_138to139_bb1___i218_0_valid_out_NO_SHIFT_REG & rnode_138to139_bb1_or_i226_0_valid_out_NO_SHIFT_REG);
assign local_bb1__10_i46 = (local_bb1__8_i44 ? local_bb1_or41_i240 : rnode_138to139_bb1_var__u9_3_NO_SHIFT_REG);
assign local_bb1__9_i45_valid_out = 1'b1;
assign local_bb1__10_i46_valid_out = 1'b1;
assign rnode_138to139_bb1_var__u9_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_138to139_bb1_var__u9_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_138to139_bb1_and39_i238_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_138to139_bb1_var__u9_0_stall_in_2_NO_SHIFT_REG = 1'b0;
assign rnode_138to139_bb1_and39_i238_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_138to139_bb1_var__u9_0_stall_in_3_NO_SHIFT_REG = 1'b0;
assign rnode_138to139_bb1___i218_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_138to139_bb1_or_i226_0_stall_in_NO_SHIFT_REG = 1'b0;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_139to140_bb1__9_i45_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_139to140_bb1__9_i45_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_139to140_bb1__9_i45_0_NO_SHIFT_REG;
 logic rnode_139to140_bb1__9_i45_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_139to140_bb1__9_i45_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_139to140_bb1__9_i45_1_NO_SHIFT_REG;
 logic rnode_139to140_bb1__9_i45_0_valid_out_2_NO_SHIFT_REG;
 logic rnode_139to140_bb1__9_i45_0_stall_in_2_NO_SHIFT_REG;
 logic [31:0] rnode_139to140_bb1__9_i45_2_NO_SHIFT_REG;
 logic rnode_139to140_bb1__9_i45_0_reg_140_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_139to140_bb1__9_i45_0_reg_140_NO_SHIFT_REG;
 logic rnode_139to140_bb1__9_i45_0_valid_out_0_reg_140_NO_SHIFT_REG;
 logic rnode_139to140_bb1__9_i45_0_stall_in_0_reg_140_NO_SHIFT_REG;
 logic rnode_139to140_bb1__9_i45_0_stall_out_reg_140_NO_SHIFT_REG;

acl_data_fifo rnode_139to140_bb1__9_i45_0_reg_140_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_139to140_bb1__9_i45_0_reg_140_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_139to140_bb1__9_i45_0_stall_in_0_reg_140_NO_SHIFT_REG),
	.valid_out(rnode_139to140_bb1__9_i45_0_valid_out_0_reg_140_NO_SHIFT_REG),
	.stall_out(rnode_139to140_bb1__9_i45_0_stall_out_reg_140_NO_SHIFT_REG),
	.data_in(local_bb1__9_i45),
	.data_out(rnode_139to140_bb1__9_i45_0_reg_140_NO_SHIFT_REG)
);

defparam rnode_139to140_bb1__9_i45_0_reg_140_fifo.DEPTH = 1;
defparam rnode_139to140_bb1__9_i45_0_reg_140_fifo.DATA_WIDTH = 32;
defparam rnode_139to140_bb1__9_i45_0_reg_140_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_139to140_bb1__9_i45_0_reg_140_fifo.IMPL = "shift_reg";

assign rnode_139to140_bb1__9_i45_0_reg_140_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1__9_i45_stall_in = 1'b0;
assign rnode_139to140_bb1__9_i45_0_stall_in_0_reg_140_NO_SHIFT_REG = 1'b0;
assign rnode_139to140_bb1__9_i45_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_139to140_bb1__9_i45_0_NO_SHIFT_REG = rnode_139to140_bb1__9_i45_0_reg_140_NO_SHIFT_REG;
assign rnode_139to140_bb1__9_i45_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_139to140_bb1__9_i45_1_NO_SHIFT_REG = rnode_139to140_bb1__9_i45_0_reg_140_NO_SHIFT_REG;
assign rnode_139to140_bb1__9_i45_0_valid_out_2_NO_SHIFT_REG = 1'b1;
assign rnode_139to140_bb1__9_i45_2_NO_SHIFT_REG = rnode_139to140_bb1__9_i45_0_reg_140_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_139to140_bb1__10_i46_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_139to140_bb1__10_i46_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_139to140_bb1__10_i46_0_NO_SHIFT_REG;
 logic rnode_139to140_bb1__10_i46_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_139to140_bb1__10_i46_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_139to140_bb1__10_i46_1_NO_SHIFT_REG;
 logic rnode_139to140_bb1__10_i46_0_valid_out_2_NO_SHIFT_REG;
 logic rnode_139to140_bb1__10_i46_0_stall_in_2_NO_SHIFT_REG;
 logic [31:0] rnode_139to140_bb1__10_i46_2_NO_SHIFT_REG;
 logic rnode_139to140_bb1__10_i46_0_valid_out_3_NO_SHIFT_REG;
 logic rnode_139to140_bb1__10_i46_0_stall_in_3_NO_SHIFT_REG;
 logic [31:0] rnode_139to140_bb1__10_i46_3_NO_SHIFT_REG;
 logic rnode_139to140_bb1__10_i46_0_reg_140_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_139to140_bb1__10_i46_0_reg_140_NO_SHIFT_REG;
 logic rnode_139to140_bb1__10_i46_0_valid_out_0_reg_140_NO_SHIFT_REG;
 logic rnode_139to140_bb1__10_i46_0_stall_in_0_reg_140_NO_SHIFT_REG;
 logic rnode_139to140_bb1__10_i46_0_stall_out_reg_140_NO_SHIFT_REG;

acl_data_fifo rnode_139to140_bb1__10_i46_0_reg_140_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_139to140_bb1__10_i46_0_reg_140_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_139to140_bb1__10_i46_0_stall_in_0_reg_140_NO_SHIFT_REG),
	.valid_out(rnode_139to140_bb1__10_i46_0_valid_out_0_reg_140_NO_SHIFT_REG),
	.stall_out(rnode_139to140_bb1__10_i46_0_stall_out_reg_140_NO_SHIFT_REG),
	.data_in(local_bb1__10_i46),
	.data_out(rnode_139to140_bb1__10_i46_0_reg_140_NO_SHIFT_REG)
);

defparam rnode_139to140_bb1__10_i46_0_reg_140_fifo.DEPTH = 1;
defparam rnode_139to140_bb1__10_i46_0_reg_140_fifo.DATA_WIDTH = 32;
defparam rnode_139to140_bb1__10_i46_0_reg_140_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_139to140_bb1__10_i46_0_reg_140_fifo.IMPL = "shift_reg";

assign rnode_139to140_bb1__10_i46_0_reg_140_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1__10_i46_stall_in = 1'b0;
assign rnode_139to140_bb1__10_i46_0_stall_in_0_reg_140_NO_SHIFT_REG = 1'b0;
assign rnode_139to140_bb1__10_i46_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_139to140_bb1__10_i46_0_NO_SHIFT_REG = rnode_139to140_bb1__10_i46_0_reg_140_NO_SHIFT_REG;
assign rnode_139to140_bb1__10_i46_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_139to140_bb1__10_i46_1_NO_SHIFT_REG = rnode_139to140_bb1__10_i46_0_reg_140_NO_SHIFT_REG;
assign rnode_139to140_bb1__10_i46_0_valid_out_2_NO_SHIFT_REG = 1'b1;
assign rnode_139to140_bb1__10_i46_2_NO_SHIFT_REG = rnode_139to140_bb1__10_i46_0_reg_140_NO_SHIFT_REG;
assign rnode_139to140_bb1__10_i46_0_valid_out_3_NO_SHIFT_REG = 1'b1;
assign rnode_139to140_bb1__10_i46_3_NO_SHIFT_REG = rnode_139to140_bb1__10_i46_0_reg_140_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb1_shr18_i49_stall_local;
wire [31:0] local_bb1_shr18_i49;

assign local_bb1_shr18_i49 = (rnode_139to140_bb1__9_i45_0_NO_SHIFT_REG >> 32'h17);

// This section implements an unregistered operation.
// 
wire local_bb1_and21_i52_stall_local;
wire [31:0] local_bb1_and21_i52;

assign local_bb1_and21_i52 = (rnode_139to140_bb1__9_i45_1_NO_SHIFT_REG & 32'h7FFFFF);

// This section implements an unregistered operation.
// 
wire local_bb1_shr16_i47_stall_local;
wire [31:0] local_bb1_shr16_i47;

assign local_bb1_shr16_i47 = (rnode_139to140_bb1__10_i46_0_NO_SHIFT_REG >> 32'h17);

// This section implements an unregistered operation.
// 
wire local_bb1_and20_i51_valid_out;
wire local_bb1_and20_i51_stall_in;
wire local_bb1_and20_i51_inputs_ready;
wire local_bb1_and20_i51_stall_local;
wire [31:0] local_bb1_and20_i51;

assign local_bb1_and20_i51_inputs_ready = rnode_139to140_bb1__10_i46_0_valid_out_1_NO_SHIFT_REG;
assign local_bb1_and20_i51 = (rnode_139to140_bb1__10_i46_1_NO_SHIFT_REG & 32'h7FFFFF);
assign local_bb1_and20_i51_valid_out = 1'b1;
assign rnode_139to140_bb1__10_i46_0_stall_in_1_NO_SHIFT_REG = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb1_and35_i57_valid_out;
wire local_bb1_and35_i57_stall_in;
wire local_bb1_and35_i57_inputs_ready;
wire local_bb1_and35_i57_stall_local;
wire [31:0] local_bb1_and35_i57;

assign local_bb1_and35_i57_inputs_ready = rnode_139to140_bb1__10_i46_0_valid_out_2_NO_SHIFT_REG;
assign local_bb1_and35_i57 = (rnode_139to140_bb1__10_i46_2_NO_SHIFT_REG & 32'h80000000);
assign local_bb1_and35_i57_valid_out = 1'b1;
assign rnode_139to140_bb1__10_i46_0_stall_in_2_NO_SHIFT_REG = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb1_xor_i58_valid_out;
wire local_bb1_xor_i58_stall_in;
wire local_bb1_xor_i58_inputs_ready;
wire local_bb1_xor_i58_stall_local;
wire [31:0] local_bb1_xor_i58;

assign local_bb1_xor_i58_inputs_ready = (rnode_139to140_bb1__10_i46_0_valid_out_3_NO_SHIFT_REG & rnode_139to140_bb1__9_i45_0_valid_out_2_NO_SHIFT_REG);
assign local_bb1_xor_i58 = (rnode_139to140_bb1__10_i46_3_NO_SHIFT_REG ^ rnode_139to140_bb1__9_i45_2_NO_SHIFT_REG);
assign local_bb1_xor_i58_valid_out = 1'b1;
assign rnode_139to140_bb1__10_i46_0_stall_in_3_NO_SHIFT_REG = 1'b0;
assign rnode_139to140_bb1__9_i45_0_stall_in_2_NO_SHIFT_REG = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb1_and19_i50_stall_local;
wire [31:0] local_bb1_and19_i50;

assign local_bb1_and19_i50 = ((local_bb1_shr18_i49 & 32'h1FF) & 32'hFF);

// This section implements an unregistered operation.
// 
wire local_bb1_lnot33_not_i65_stall_local;
wire local_bb1_lnot33_not_i65;

assign local_bb1_lnot33_not_i65 = ((local_bb1_and21_i52 & 32'h7FFFFF) != 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_or64_i75_stall_local;
wire [31:0] local_bb1_or64_i75;

assign local_bb1_or64_i75 = ((local_bb1_and21_i52 & 32'h7FFFFF) << 32'h3);

// This section implements an unregistered operation.
// 
wire local_bb1_var__u11_stall_local;
wire [31:0] local_bb1_var__u11;

assign local_bb1_var__u11 = ((local_bb1_shr18_i49 & 32'h1FF) & (local_bb1_shr16_i47 & 32'h1FF));

// This section implements an unregistered operation.
// 
wire local_bb1_sub_i78_stall_local;
wire [31:0] local_bb1_sub_i78;

assign local_bb1_sub_i78 = ((local_bb1_shr16_i47 & 32'h1FF) - (local_bb1_shr18_i49 & 32'h1FF));

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_140to141_bb1_and20_i51_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_140to141_bb1_and20_i51_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_140to141_bb1_and20_i51_0_NO_SHIFT_REG;
 logic rnode_140to141_bb1_and20_i51_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_140to141_bb1_and20_i51_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_140to141_bb1_and20_i51_1_NO_SHIFT_REG;
 logic rnode_140to141_bb1_and20_i51_0_reg_141_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_140to141_bb1_and20_i51_0_reg_141_NO_SHIFT_REG;
 logic rnode_140to141_bb1_and20_i51_0_valid_out_0_reg_141_NO_SHIFT_REG;
 logic rnode_140to141_bb1_and20_i51_0_stall_in_0_reg_141_NO_SHIFT_REG;
 logic rnode_140to141_bb1_and20_i51_0_stall_out_reg_141_NO_SHIFT_REG;

acl_data_fifo rnode_140to141_bb1_and20_i51_0_reg_141_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_140to141_bb1_and20_i51_0_reg_141_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_140to141_bb1_and20_i51_0_stall_in_0_reg_141_NO_SHIFT_REG),
	.valid_out(rnode_140to141_bb1_and20_i51_0_valid_out_0_reg_141_NO_SHIFT_REG),
	.stall_out(rnode_140to141_bb1_and20_i51_0_stall_out_reg_141_NO_SHIFT_REG),
	.data_in((local_bb1_and20_i51 & 32'h7FFFFF)),
	.data_out(rnode_140to141_bb1_and20_i51_0_reg_141_NO_SHIFT_REG)
);

defparam rnode_140to141_bb1_and20_i51_0_reg_141_fifo.DEPTH = 1;
defparam rnode_140to141_bb1_and20_i51_0_reg_141_fifo.DATA_WIDTH = 32;
defparam rnode_140to141_bb1_and20_i51_0_reg_141_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_140to141_bb1_and20_i51_0_reg_141_fifo.IMPL = "shift_reg";

assign rnode_140to141_bb1_and20_i51_0_reg_141_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_and20_i51_stall_in = 1'b0;
assign rnode_140to141_bb1_and20_i51_0_stall_in_0_reg_141_NO_SHIFT_REG = 1'b0;
assign rnode_140to141_bb1_and20_i51_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_140to141_bb1_and20_i51_0_NO_SHIFT_REG = rnode_140to141_bb1_and20_i51_0_reg_141_NO_SHIFT_REG;
assign rnode_140to141_bb1_and20_i51_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_140to141_bb1_and20_i51_1_NO_SHIFT_REG = rnode_140to141_bb1_and20_i51_0_reg_141_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_140to141_bb1_and35_i57_0_valid_out_NO_SHIFT_REG;
 logic rnode_140to141_bb1_and35_i57_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_140to141_bb1_and35_i57_0_NO_SHIFT_REG;
 logic rnode_140to141_bb1_and35_i57_0_reg_141_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_140to141_bb1_and35_i57_0_reg_141_NO_SHIFT_REG;
 logic rnode_140to141_bb1_and35_i57_0_valid_out_reg_141_NO_SHIFT_REG;
 logic rnode_140to141_bb1_and35_i57_0_stall_in_reg_141_NO_SHIFT_REG;
 logic rnode_140to141_bb1_and35_i57_0_stall_out_reg_141_NO_SHIFT_REG;

acl_data_fifo rnode_140to141_bb1_and35_i57_0_reg_141_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_140to141_bb1_and35_i57_0_reg_141_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_140to141_bb1_and35_i57_0_stall_in_reg_141_NO_SHIFT_REG),
	.valid_out(rnode_140to141_bb1_and35_i57_0_valid_out_reg_141_NO_SHIFT_REG),
	.stall_out(rnode_140to141_bb1_and35_i57_0_stall_out_reg_141_NO_SHIFT_REG),
	.data_in((local_bb1_and35_i57 & 32'h80000000)),
	.data_out(rnode_140to141_bb1_and35_i57_0_reg_141_NO_SHIFT_REG)
);

defparam rnode_140to141_bb1_and35_i57_0_reg_141_fifo.DEPTH = 1;
defparam rnode_140to141_bb1_and35_i57_0_reg_141_fifo.DATA_WIDTH = 32;
defparam rnode_140to141_bb1_and35_i57_0_reg_141_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_140to141_bb1_and35_i57_0_reg_141_fifo.IMPL = "shift_reg";

assign rnode_140to141_bb1_and35_i57_0_reg_141_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_and35_i57_stall_in = 1'b0;
assign rnode_140to141_bb1_and35_i57_0_NO_SHIFT_REG = rnode_140to141_bb1_and35_i57_0_reg_141_NO_SHIFT_REG;
assign rnode_140to141_bb1_and35_i57_0_stall_in_reg_141_NO_SHIFT_REG = 1'b0;
assign rnode_140to141_bb1_and35_i57_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_140to141_bb1_xor_i58_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_140to141_bb1_xor_i58_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_140to141_bb1_xor_i58_0_NO_SHIFT_REG;
 logic rnode_140to141_bb1_xor_i58_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_140to141_bb1_xor_i58_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_140to141_bb1_xor_i58_1_NO_SHIFT_REG;
 logic rnode_140to141_bb1_xor_i58_0_valid_out_2_NO_SHIFT_REG;
 logic rnode_140to141_bb1_xor_i58_0_stall_in_2_NO_SHIFT_REG;
 logic [31:0] rnode_140to141_bb1_xor_i58_2_NO_SHIFT_REG;
 logic rnode_140to141_bb1_xor_i58_0_reg_141_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_140to141_bb1_xor_i58_0_reg_141_NO_SHIFT_REG;
 logic rnode_140to141_bb1_xor_i58_0_valid_out_0_reg_141_NO_SHIFT_REG;
 logic rnode_140to141_bb1_xor_i58_0_stall_in_0_reg_141_NO_SHIFT_REG;
 logic rnode_140to141_bb1_xor_i58_0_stall_out_reg_141_NO_SHIFT_REG;

acl_data_fifo rnode_140to141_bb1_xor_i58_0_reg_141_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_140to141_bb1_xor_i58_0_reg_141_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_140to141_bb1_xor_i58_0_stall_in_0_reg_141_NO_SHIFT_REG),
	.valid_out(rnode_140to141_bb1_xor_i58_0_valid_out_0_reg_141_NO_SHIFT_REG),
	.stall_out(rnode_140to141_bb1_xor_i58_0_stall_out_reg_141_NO_SHIFT_REG),
	.data_in(local_bb1_xor_i58),
	.data_out(rnode_140to141_bb1_xor_i58_0_reg_141_NO_SHIFT_REG)
);

defparam rnode_140to141_bb1_xor_i58_0_reg_141_fifo.DEPTH = 1;
defparam rnode_140to141_bb1_xor_i58_0_reg_141_fifo.DATA_WIDTH = 32;
defparam rnode_140to141_bb1_xor_i58_0_reg_141_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_140to141_bb1_xor_i58_0_reg_141_fifo.IMPL = "shift_reg";

assign rnode_140to141_bb1_xor_i58_0_reg_141_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_xor_i58_stall_in = 1'b0;
assign rnode_140to141_bb1_xor_i58_0_stall_in_0_reg_141_NO_SHIFT_REG = 1'b0;
assign rnode_140to141_bb1_xor_i58_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_140to141_bb1_xor_i58_0_NO_SHIFT_REG = rnode_140to141_bb1_xor_i58_0_reg_141_NO_SHIFT_REG;
assign rnode_140to141_bb1_xor_i58_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_140to141_bb1_xor_i58_1_NO_SHIFT_REG = rnode_140to141_bb1_xor_i58_0_reg_141_NO_SHIFT_REG;
assign rnode_140to141_bb1_xor_i58_0_valid_out_2_NO_SHIFT_REG = 1'b1;
assign rnode_140to141_bb1_xor_i58_2_NO_SHIFT_REG = rnode_140to141_bb1_xor_i58_0_reg_141_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb1_lnot23_i54_stall_local;
wire local_bb1_lnot23_i54;

assign local_bb1_lnot23_i54 = ((local_bb1_and19_i50 & 32'hFF) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_cmp27_i56_stall_local;
wire local_bb1_cmp27_i56;

assign local_bb1_cmp27_i56 = ((local_bb1_and19_i50 & 32'hFF) == 32'hFF);

// This section implements an unregistered operation.
// 
wire local_bb1_shl65_i76_stall_local;
wire [31:0] local_bb1_shl65_i76;

assign local_bb1_shl65_i76 = ((local_bb1_or64_i75 & 32'h3FFFFF8) | 32'h4000000);

// This section implements an unregistered operation.
// 
wire local_bb1_var__u12_stall_local;
wire [31:0] local_bb1_var__u12;

assign local_bb1_var__u12 = ((local_bb1_var__u11 & 32'h1FF) & 32'hFF);

// This section implements an unregistered operation.
// 
wire local_bb1_and68_i79_stall_local;
wire [31:0] local_bb1_and68_i79;

assign local_bb1_and68_i79 = (local_bb1_sub_i78 & 32'hFF);

// This section implements an unregistered operation.
// 
wire local_bb1_lnot30_i61_stall_local;
wire local_bb1_lnot30_i61;

assign local_bb1_lnot30_i61 = ((rnode_140to141_bb1_and20_i51_0_NO_SHIFT_REG & 32'h7FFFFF) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_or_i72_stall_local;
wire [31:0] local_bb1_or_i72;

assign local_bb1_or_i72 = ((rnode_140to141_bb1_and20_i51_1_NO_SHIFT_REG & 32'h7FFFFF) << 32'h3);

// Register node:
//  * latency = 2
//  * capacity = 2
 logic rnode_141to143_bb1_and35_i57_0_valid_out_NO_SHIFT_REG;
 logic rnode_141to143_bb1_and35_i57_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_141to143_bb1_and35_i57_0_NO_SHIFT_REG;
 logic rnode_141to143_bb1_and35_i57_0_reg_143_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_141to143_bb1_and35_i57_0_reg_143_NO_SHIFT_REG;
 logic rnode_141to143_bb1_and35_i57_0_valid_out_reg_143_NO_SHIFT_REG;
 logic rnode_141to143_bb1_and35_i57_0_stall_in_reg_143_NO_SHIFT_REG;
 logic rnode_141to143_bb1_and35_i57_0_stall_out_reg_143_NO_SHIFT_REG;

acl_data_fifo rnode_141to143_bb1_and35_i57_0_reg_143_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_141to143_bb1_and35_i57_0_reg_143_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_141to143_bb1_and35_i57_0_stall_in_reg_143_NO_SHIFT_REG),
	.valid_out(rnode_141to143_bb1_and35_i57_0_valid_out_reg_143_NO_SHIFT_REG),
	.stall_out(rnode_141to143_bb1_and35_i57_0_stall_out_reg_143_NO_SHIFT_REG),
	.data_in((rnode_140to141_bb1_and35_i57_0_NO_SHIFT_REG & 32'h80000000)),
	.data_out(rnode_141to143_bb1_and35_i57_0_reg_143_NO_SHIFT_REG)
);

defparam rnode_141to143_bb1_and35_i57_0_reg_143_fifo.DEPTH = 2;
defparam rnode_141to143_bb1_and35_i57_0_reg_143_fifo.DATA_WIDTH = 32;
defparam rnode_141to143_bb1_and35_i57_0_reg_143_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_141to143_bb1_and35_i57_0_reg_143_fifo.IMPL = "shift_reg";

assign rnode_141to143_bb1_and35_i57_0_reg_143_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_140to141_bb1_and35_i57_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_141to143_bb1_and35_i57_0_NO_SHIFT_REG = rnode_141to143_bb1_and35_i57_0_reg_143_NO_SHIFT_REG;
assign rnode_141to143_bb1_and35_i57_0_stall_in_reg_143_NO_SHIFT_REG = 1'b0;
assign rnode_141to143_bb1_and35_i57_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb1_cmp37_i59_stall_local;
wire local_bb1_cmp37_i59;

assign local_bb1_cmp37_i59 = ($signed(rnode_140to141_bb1_xor_i58_0_NO_SHIFT_REG) < $signed(32'h0));

// This section implements an unregistered operation.
// 
wire local_bb1_xor_lobit_i133_stall_local;
wire [31:0] local_bb1_xor_lobit_i133;

assign local_bb1_xor_lobit_i133 = ($signed(rnode_140to141_bb1_xor_i58_1_NO_SHIFT_REG) >>> 32'h1F);

// This section implements an unregistered operation.
// 
wire local_bb1_and36_lobit_i135_stall_local;
wire [31:0] local_bb1_and36_lobit_i135;

assign local_bb1_and36_lobit_i135 = (rnode_140to141_bb1_xor_i58_2_NO_SHIFT_REG >> 32'h1F);

// This section implements an unregistered operation.
// 
wire local_bb1__15_i77_stall_local;
wire [31:0] local_bb1__15_i77;

assign local_bb1__15_i77 = (local_bb1_lnot23_i54 ? 32'h0 : ((local_bb1_shl65_i76 & 32'h7FFFFF8) | 32'h4000000));

// This section implements an unregistered operation.
// 
wire local_bb1_var__u13_stall_local;
wire local_bb1_var__u13;

assign local_bb1_var__u13 = ((local_bb1_var__u12 & 32'hFF) == 32'hFF);

// This section implements an unregistered operation.
// 
wire local_bb1_cmp69_i80_stall_local;
wire local_bb1_cmp69_i80;

assign local_bb1_cmp69_i80 = ((local_bb1_and68_i79 & 32'hFF) > 32'h1F);

// This section implements an unregistered operation.
// 
wire local_bb1_lnot30_not_i63_stall_local;
wire local_bb1_lnot30_not_i63;

assign local_bb1_lnot30_not_i63 = (local_bb1_lnot30_i61 ^ 1'b1);

// This section implements an unregistered operation.
// 
wire local_bb1_shl_i73_stall_local;
wire [31:0] local_bb1_shl_i73;

assign local_bb1_shl_i73 = ((local_bb1_or_i72 & 32'h3FFFFF8) | 32'h4000000);

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_143to144_bb1_and35_i57_0_valid_out_NO_SHIFT_REG;
 logic rnode_143to144_bb1_and35_i57_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_143to144_bb1_and35_i57_0_NO_SHIFT_REG;
 logic rnode_143to144_bb1_and35_i57_0_reg_144_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_143to144_bb1_and35_i57_0_reg_144_NO_SHIFT_REG;
 logic rnode_143to144_bb1_and35_i57_0_valid_out_reg_144_NO_SHIFT_REG;
 logic rnode_143to144_bb1_and35_i57_0_stall_in_reg_144_NO_SHIFT_REG;
 logic rnode_143to144_bb1_and35_i57_0_stall_out_reg_144_NO_SHIFT_REG;

acl_data_fifo rnode_143to144_bb1_and35_i57_0_reg_144_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_143to144_bb1_and35_i57_0_reg_144_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_143to144_bb1_and35_i57_0_stall_in_reg_144_NO_SHIFT_REG),
	.valid_out(rnode_143to144_bb1_and35_i57_0_valid_out_reg_144_NO_SHIFT_REG),
	.stall_out(rnode_143to144_bb1_and35_i57_0_stall_out_reg_144_NO_SHIFT_REG),
	.data_in((rnode_141to143_bb1_and35_i57_0_NO_SHIFT_REG & 32'h80000000)),
	.data_out(rnode_143to144_bb1_and35_i57_0_reg_144_NO_SHIFT_REG)
);

defparam rnode_143to144_bb1_and35_i57_0_reg_144_fifo.DEPTH = 1;
defparam rnode_143to144_bb1_and35_i57_0_reg_144_fifo.DATA_WIDTH = 32;
defparam rnode_143to144_bb1_and35_i57_0_reg_144_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_143to144_bb1_and35_i57_0_reg_144_fifo.IMPL = "shift_reg";

assign rnode_143to144_bb1_and35_i57_0_reg_144_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_141to143_bb1_and35_i57_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_143to144_bb1_and35_i57_0_NO_SHIFT_REG = rnode_143to144_bb1_and35_i57_0_reg_144_NO_SHIFT_REG;
assign rnode_143to144_bb1_and35_i57_0_stall_in_reg_144_NO_SHIFT_REG = 1'b0;
assign rnode_143to144_bb1_and35_i57_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb1_and72_i82_stall_local;
wire [31:0] local_bb1_and72_i82;

assign local_bb1_and72_i82 = ((local_bb1__15_i77 & 32'h7FFFFF8) >> 32'h3);

// This section implements an unregistered operation.
// 
wire local_bb1_and75_i85_stall_local;
wire [31:0] local_bb1_and75_i85;

assign local_bb1_and75_i85 = ((local_bb1__15_i77 & 32'h7FFFFF8) & 32'hF0);

// This section implements an unregistered operation.
// 
wire local_bb1_and78_i87_stall_local;
wire [31:0] local_bb1_and78_i87;

assign local_bb1_and78_i87 = ((local_bb1__15_i77 & 32'h7FFFFF8) & 32'hF00);

// This section implements an unregistered operation.
// 
wire local_bb1_and90_i93_stall_local;
wire [31:0] local_bb1_and90_i93;

assign local_bb1_and90_i93 = ((local_bb1__15_i77 & 32'h7FFFFF8) & 32'h7000000);

// This section implements an unregistered operation.
// 
wire local_bb1_and87_i94_stall_local;
wire [31:0] local_bb1_and87_i94;

assign local_bb1_and87_i94 = ((local_bb1__15_i77 & 32'h7FFFFF8) & 32'hF00000);

// This section implements an unregistered operation.
// 
wire local_bb1_and84_i95_stall_local;
wire [31:0] local_bb1_and84_i95;

assign local_bb1_and84_i95 = ((local_bb1__15_i77 & 32'h7FFFFF8) & 32'hF0000);

// This section implements an unregistered operation.
// 
wire local_bb1_var__u14_stall_local;
wire [31:0] local_bb1_var__u14;

assign local_bb1_var__u14 = ((local_bb1__15_i77 & 32'h7FFFFF8) & 32'hFFF8);

// This section implements an unregistered operation.
// 
wire local_bb1_align_0_i81_stall_local;
wire [31:0] local_bb1_align_0_i81;

assign local_bb1_align_0_i81 = (local_bb1_cmp69_i80 ? 32'h1F : (local_bb1_and68_i79 & 32'hFF));

// This section implements an unregistered operation.
// 
wire local_bb1_and72_tr_i83_stall_local;
wire [7:0] local_bb1_and72_tr_i83;
wire [31:0] local_bb1_and72_tr_i83$ps;

assign local_bb1_and72_tr_i83$ps = (local_bb1_and72_i82 & 32'hFFFFFF);
assign local_bb1_and72_tr_i83 = local_bb1_and72_tr_i83$ps[7:0];

// This section implements an unregistered operation.
// 
wire local_bb1_cmp76_i86_stall_local;
wire local_bb1_cmp76_i86;

assign local_bb1_cmp76_i86 = ((local_bb1_and75_i85 & 32'hF0) != 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_cmp79_i88_stall_local;
wire local_bb1_cmp79_i88;

assign local_bb1_cmp79_i88 = ((local_bb1_and78_i87 & 32'hF00) != 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_cmp91_i96_stall_local;
wire local_bb1_cmp91_i96;

assign local_bb1_cmp91_i96 = ((local_bb1_and90_i93 & 32'h7000000) != 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_cmp88_i97_stall_local;
wire local_bb1_cmp88_i97;

assign local_bb1_cmp88_i97 = ((local_bb1_and87_i94 & 32'hF00000) != 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_cmp85_i98_stall_local;
wire local_bb1_cmp85_i98;

assign local_bb1_cmp85_i98 = ((local_bb1_and84_i95 & 32'hF0000) != 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_var__u15_stall_local;
wire local_bb1_var__u15;

assign local_bb1_var__u15 = ((local_bb1_var__u14 & 32'hFFF8) != 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_and93_i89_stall_local;
wire [31:0] local_bb1_and93_i89;

assign local_bb1_and93_i89 = ((local_bb1_align_0_i81 & 32'hFF) & 32'h1C);

// This section implements an unregistered operation.
// 
wire local_bb1_and95_i91_stall_local;
wire [31:0] local_bb1_and95_i91;

assign local_bb1_and95_i91 = ((local_bb1_align_0_i81 & 32'hFF) & 32'h10);

// This section implements an unregistered operation.
// 
wire local_bb1_and112_i107_stall_local;
wire [31:0] local_bb1_and112_i107;

assign local_bb1_and112_i107 = ((local_bb1_align_0_i81 & 32'hFF) & 32'h8);

// This section implements an unregistered operation.
// 
wire local_bb1_and125_i112_stall_local;
wire [31:0] local_bb1_and125_i112;

assign local_bb1_and125_i112 = ((local_bb1_align_0_i81 & 32'hFF) & 32'h4);

// This section implements an unregistered operation.
// 
wire local_bb1_and143_i117_stall_local;
wire [31:0] local_bb1_and143_i117;

assign local_bb1_and143_i117 = ((local_bb1_align_0_i81 & 32'hFF) & 32'h3);

// This section implements an unregistered operation.
// 
wire local_bb1_frombool74_i84_stall_local;
wire [7:0] local_bb1_frombool74_i84;

assign local_bb1_frombool74_i84 = (local_bb1_and72_tr_i83 & 8'h1);

// This section implements an unregistered operation.
// 
wire local_bb1_frombool106_i100_stall_local;
wire [7:0] local_bb1_frombool106_i100;

assign local_bb1_frombool106_i100[7:1] = 7'h0;
assign local_bb1_frombool106_i100[0] = local_bb1_cmp85_i98;

// This section implements an unregistered operation.
// 
wire local_bb1_conv_i99_stall_local;
wire [31:0] local_bb1_conv_i99;

assign local_bb1_conv_i99[31:1] = 31'h0;
assign local_bb1_conv_i99[0] = local_bb1_var__u15;

// This section implements an unregistered operation.
// 
wire local_bb1_cmp96_i92_stall_local;
wire local_bb1_cmp96_i92;

assign local_bb1_cmp96_i92 = ((local_bb1_and95_i91 & 32'h10) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_cmp113_i108_stall_local;
wire local_bb1_cmp113_i108;

assign local_bb1_cmp113_i108 = ((local_bb1_and112_i107 & 32'h8) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_cmp126_not_i113_stall_local;
wire local_bb1_cmp126_not_i113;

assign local_bb1_cmp126_not_i113 = ((local_bb1_and125_i112 & 32'h4) != 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1__16_i101_stall_local;
wire [7:0] local_bb1__16_i101;

assign local_bb1__16_i101 = (local_bb1_cmp96_i92 ? (local_bb1_frombool74_i84 & 8'h1) : (local_bb1_frombool106_i100 & 8'h1));

// This section implements an unregistered operation.
// 
wire local_bb1__17_v_i102_stall_local;
wire local_bb1__17_v_i102;

assign local_bb1__17_v_i102 = (local_bb1_cmp96_i92 ? local_bb1_cmp76_i86 : local_bb1_cmp88_i97);

// This section implements an unregistered operation.
// 
wire local_bb1__18_v_i104_stall_local;
wire local_bb1__18_v_i104;

assign local_bb1__18_v_i104 = (local_bb1_cmp96_i92 ? local_bb1_cmp79_i88 : local_bb1_cmp91_i96);

// This section implements an unregistered operation.
// 
wire local_bb1__19_i106_stall_local;
wire [31:0] local_bb1__19_i106;

assign local_bb1__19_i106 = (local_bb1_cmp96_i92 ? 32'h0 : (local_bb1_conv_i99 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb1__17_i103_stall_local;
wire [7:0] local_bb1__17_i103;

assign local_bb1__17_i103[7:1] = 7'h0;
assign local_bb1__17_i103[0] = local_bb1__17_v_i102;

// This section implements an unregistered operation.
// 
wire local_bb1__18_i105_stall_local;
wire [7:0] local_bb1__18_i105;

assign local_bb1__18_i105[7:1] = 7'h0;
assign local_bb1__18_i105[0] = local_bb1__18_v_i104;

// This section implements an unregistered operation.
// 
wire local_bb1_var__u16_stall_local;
wire [7:0] local_bb1_var__u16;

assign local_bb1_var__u16 = ((local_bb1__17_i103 & 8'h1) | (local_bb1__16_i101 & 8'h1));

// This section implements an unregistered operation.
// 
wire local_bb1__20_i110_stall_local;
wire [7:0] local_bb1__20_i110;

assign local_bb1__20_i110 = (local_bb1_cmp113_i108 ? (local_bb1__16_i101 & 8'h1) : (local_bb1__18_i105 & 8'h1));

// This section implements an unregistered operation.
// 
wire local_bb1_conv118_i109_stall_local;
wire [31:0] local_bb1_conv118_i109;

assign local_bb1_conv118_i109[31:8] = 24'h0;
assign local_bb1_conv118_i109[7:0] = (local_bb1_var__u16 & 8'h1);

// This section implements an unregistered operation.
// 
wire local_bb1_var__u17_stall_local;
wire [7:0] local_bb1_var__u17;

assign local_bb1_var__u17 = ((local_bb1__20_i110 & 8'h1) & 8'h1);

// This section implements an unregistered operation.
// 
wire local_bb1_or119_i111_stall_local;
wire [31:0] local_bb1_or119_i111;

assign local_bb1_or119_i111 = (local_bb1_cmp113_i108 ? 32'h0 : (local_bb1_conv118_i109 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb1_conv129_i114_stall_local;
wire [31:0] local_bb1_conv129_i114;

assign local_bb1_conv129_i114[31:8] = 24'h0;
assign local_bb1_conv129_i114[7:0] = (local_bb1_var__u17 & 8'h1);

// This section implements an unregistered operation.
// 
wire local_bb1_reduction_3_i127_stall_local;
wire [31:0] local_bb1_reduction_3_i127;

assign local_bb1_reduction_3_i127 = ((local_bb1__19_i106 & 32'h1) | (local_bb1_or119_i111 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb1_shr16_i47_valid_out_2;
wire local_bb1_shr16_i47_stall_in_2;
wire local_bb1_cmp27_i56_valid_out;
wire local_bb1_cmp27_i56_stall_in;
wire local_bb1__15_i77_valid_out_7;
wire local_bb1__15_i77_stall_in_7;
wire local_bb1_var__u13_valid_out;
wire local_bb1_var__u13_stall_in;
wire local_bb1_lnot33_not_i65_valid_out;
wire local_bb1_lnot33_not_i65_stall_in;
wire local_bb1_and93_i89_valid_out;
wire local_bb1_and93_i89_stall_in;
wire local_bb1_and143_i117_valid_out;
wire local_bb1_and143_i117_stall_in;
wire local_bb1_or130_i115_valid_out;
wire local_bb1_or130_i115_stall_in;
wire local_bb1_reduction_3_i127_valid_out;
wire local_bb1_reduction_3_i127_stall_in;
wire local_bb1_or130_i115_inputs_ready;
wire local_bb1_or130_i115_stall_local;
wire [31:0] local_bb1_or130_i115;

assign local_bb1_or130_i115_inputs_ready = (rnode_139to140_bb1__9_i45_0_valid_out_0_NO_SHIFT_REG & rnode_139to140_bb1__10_i46_0_valid_out_0_NO_SHIFT_REG & rnode_139to140_bb1__9_i45_0_valid_out_1_NO_SHIFT_REG);
assign local_bb1_or130_i115 = (local_bb1_cmp126_not_i113 ? (local_bb1_conv129_i114 & 32'h1) : 32'h0);
assign local_bb1_shr16_i47_valid_out_2 = 1'b1;
assign local_bb1_cmp27_i56_valid_out = 1'b1;
assign local_bb1__15_i77_valid_out_7 = 1'b1;
assign local_bb1_var__u13_valid_out = 1'b1;
assign local_bb1_lnot33_not_i65_valid_out = 1'b1;
assign local_bb1_and93_i89_valid_out = 1'b1;
assign local_bb1_and143_i117_valid_out = 1'b1;
assign local_bb1_or130_i115_valid_out = 1'b1;
assign local_bb1_reduction_3_i127_valid_out = 1'b1;
assign rnode_139to140_bb1__9_i45_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_139to140_bb1__10_i46_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_139to140_bb1__9_i45_0_stall_in_1_NO_SHIFT_REG = 1'b0;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_140to141_bb1_shr16_i47_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_140to141_bb1_shr16_i47_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_140to141_bb1_shr16_i47_0_NO_SHIFT_REG;
 logic rnode_140to141_bb1_shr16_i47_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_140to141_bb1_shr16_i47_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_140to141_bb1_shr16_i47_1_NO_SHIFT_REG;
 logic rnode_140to141_bb1_shr16_i47_0_reg_141_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_140to141_bb1_shr16_i47_0_reg_141_NO_SHIFT_REG;
 logic rnode_140to141_bb1_shr16_i47_0_valid_out_0_reg_141_NO_SHIFT_REG;
 logic rnode_140to141_bb1_shr16_i47_0_stall_in_0_reg_141_NO_SHIFT_REG;
 logic rnode_140to141_bb1_shr16_i47_0_stall_out_reg_141_NO_SHIFT_REG;

acl_data_fifo rnode_140to141_bb1_shr16_i47_0_reg_141_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_140to141_bb1_shr16_i47_0_reg_141_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_140to141_bb1_shr16_i47_0_stall_in_0_reg_141_NO_SHIFT_REG),
	.valid_out(rnode_140to141_bb1_shr16_i47_0_valid_out_0_reg_141_NO_SHIFT_REG),
	.stall_out(rnode_140to141_bb1_shr16_i47_0_stall_out_reg_141_NO_SHIFT_REG),
	.data_in((local_bb1_shr16_i47 & 32'h1FF)),
	.data_out(rnode_140to141_bb1_shr16_i47_0_reg_141_NO_SHIFT_REG)
);

defparam rnode_140to141_bb1_shr16_i47_0_reg_141_fifo.DEPTH = 1;
defparam rnode_140to141_bb1_shr16_i47_0_reg_141_fifo.DATA_WIDTH = 32;
defparam rnode_140to141_bb1_shr16_i47_0_reg_141_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_140to141_bb1_shr16_i47_0_reg_141_fifo.IMPL = "shift_reg";

assign rnode_140to141_bb1_shr16_i47_0_reg_141_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_shr16_i47_stall_in_2 = 1'b0;
assign rnode_140to141_bb1_shr16_i47_0_stall_in_0_reg_141_NO_SHIFT_REG = 1'b0;
assign rnode_140to141_bb1_shr16_i47_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_140to141_bb1_shr16_i47_0_NO_SHIFT_REG = rnode_140to141_bb1_shr16_i47_0_reg_141_NO_SHIFT_REG;
assign rnode_140to141_bb1_shr16_i47_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_140to141_bb1_shr16_i47_1_NO_SHIFT_REG = rnode_140to141_bb1_shr16_i47_0_reg_141_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_140to141_bb1_cmp27_i56_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_140to141_bb1_cmp27_i56_0_stall_in_0_NO_SHIFT_REG;
 logic rnode_140to141_bb1_cmp27_i56_0_NO_SHIFT_REG;
 logic rnode_140to141_bb1_cmp27_i56_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_140to141_bb1_cmp27_i56_0_stall_in_1_NO_SHIFT_REG;
 logic rnode_140to141_bb1_cmp27_i56_1_NO_SHIFT_REG;
 logic rnode_140to141_bb1_cmp27_i56_0_reg_141_inputs_ready_NO_SHIFT_REG;
 logic rnode_140to141_bb1_cmp27_i56_0_reg_141_NO_SHIFT_REG;
 logic rnode_140to141_bb1_cmp27_i56_0_valid_out_0_reg_141_NO_SHIFT_REG;
 logic rnode_140to141_bb1_cmp27_i56_0_stall_in_0_reg_141_NO_SHIFT_REG;
 logic rnode_140to141_bb1_cmp27_i56_0_stall_out_reg_141_NO_SHIFT_REG;

acl_data_fifo rnode_140to141_bb1_cmp27_i56_0_reg_141_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_140to141_bb1_cmp27_i56_0_reg_141_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_140to141_bb1_cmp27_i56_0_stall_in_0_reg_141_NO_SHIFT_REG),
	.valid_out(rnode_140to141_bb1_cmp27_i56_0_valid_out_0_reg_141_NO_SHIFT_REG),
	.stall_out(rnode_140to141_bb1_cmp27_i56_0_stall_out_reg_141_NO_SHIFT_REG),
	.data_in(local_bb1_cmp27_i56),
	.data_out(rnode_140to141_bb1_cmp27_i56_0_reg_141_NO_SHIFT_REG)
);

defparam rnode_140to141_bb1_cmp27_i56_0_reg_141_fifo.DEPTH = 1;
defparam rnode_140to141_bb1_cmp27_i56_0_reg_141_fifo.DATA_WIDTH = 1;
defparam rnode_140to141_bb1_cmp27_i56_0_reg_141_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_140to141_bb1_cmp27_i56_0_reg_141_fifo.IMPL = "shift_reg";

assign rnode_140to141_bb1_cmp27_i56_0_reg_141_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_cmp27_i56_stall_in = 1'b0;
assign rnode_140to141_bb1_cmp27_i56_0_stall_in_0_reg_141_NO_SHIFT_REG = 1'b0;
assign rnode_140to141_bb1_cmp27_i56_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_140to141_bb1_cmp27_i56_0_NO_SHIFT_REG = rnode_140to141_bb1_cmp27_i56_0_reg_141_NO_SHIFT_REG;
assign rnode_140to141_bb1_cmp27_i56_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_140to141_bb1_cmp27_i56_1_NO_SHIFT_REG = rnode_140to141_bb1_cmp27_i56_0_reg_141_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_140to141_bb1__15_i77_0_valid_out_NO_SHIFT_REG;
 logic rnode_140to141_bb1__15_i77_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_140to141_bb1__15_i77_0_NO_SHIFT_REG;
 logic rnode_140to141_bb1__15_i77_0_reg_141_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_140to141_bb1__15_i77_0_reg_141_NO_SHIFT_REG;
 logic rnode_140to141_bb1__15_i77_0_valid_out_reg_141_NO_SHIFT_REG;
 logic rnode_140to141_bb1__15_i77_0_stall_in_reg_141_NO_SHIFT_REG;
 logic rnode_140to141_bb1__15_i77_0_stall_out_reg_141_NO_SHIFT_REG;

acl_data_fifo rnode_140to141_bb1__15_i77_0_reg_141_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_140to141_bb1__15_i77_0_reg_141_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_140to141_bb1__15_i77_0_stall_in_reg_141_NO_SHIFT_REG),
	.valid_out(rnode_140to141_bb1__15_i77_0_valid_out_reg_141_NO_SHIFT_REG),
	.stall_out(rnode_140to141_bb1__15_i77_0_stall_out_reg_141_NO_SHIFT_REG),
	.data_in((local_bb1__15_i77 & 32'h7FFFFF8)),
	.data_out(rnode_140to141_bb1__15_i77_0_reg_141_NO_SHIFT_REG)
);

defparam rnode_140to141_bb1__15_i77_0_reg_141_fifo.DEPTH = 1;
defparam rnode_140to141_bb1__15_i77_0_reg_141_fifo.DATA_WIDTH = 32;
defparam rnode_140to141_bb1__15_i77_0_reg_141_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_140to141_bb1__15_i77_0_reg_141_fifo.IMPL = "shift_reg";

assign rnode_140to141_bb1__15_i77_0_reg_141_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1__15_i77_stall_in_7 = 1'b0;
assign rnode_140to141_bb1__15_i77_0_NO_SHIFT_REG = rnode_140to141_bb1__15_i77_0_reg_141_NO_SHIFT_REG;
assign rnode_140to141_bb1__15_i77_0_stall_in_reg_141_NO_SHIFT_REG = 1'b0;
assign rnode_140to141_bb1__15_i77_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_140to141_bb1_var__u13_0_valid_out_NO_SHIFT_REG;
 logic rnode_140to141_bb1_var__u13_0_stall_in_NO_SHIFT_REG;
 logic rnode_140to141_bb1_var__u13_0_NO_SHIFT_REG;
 logic rnode_140to141_bb1_var__u13_0_reg_141_inputs_ready_NO_SHIFT_REG;
 logic rnode_140to141_bb1_var__u13_0_reg_141_NO_SHIFT_REG;
 logic rnode_140to141_bb1_var__u13_0_valid_out_reg_141_NO_SHIFT_REG;
 logic rnode_140to141_bb1_var__u13_0_stall_in_reg_141_NO_SHIFT_REG;
 logic rnode_140to141_bb1_var__u13_0_stall_out_reg_141_NO_SHIFT_REG;

acl_data_fifo rnode_140to141_bb1_var__u13_0_reg_141_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_140to141_bb1_var__u13_0_reg_141_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_140to141_bb1_var__u13_0_stall_in_reg_141_NO_SHIFT_REG),
	.valid_out(rnode_140to141_bb1_var__u13_0_valid_out_reg_141_NO_SHIFT_REG),
	.stall_out(rnode_140to141_bb1_var__u13_0_stall_out_reg_141_NO_SHIFT_REG),
	.data_in(local_bb1_var__u13),
	.data_out(rnode_140to141_bb1_var__u13_0_reg_141_NO_SHIFT_REG)
);

defparam rnode_140to141_bb1_var__u13_0_reg_141_fifo.DEPTH = 1;
defparam rnode_140to141_bb1_var__u13_0_reg_141_fifo.DATA_WIDTH = 1;
defparam rnode_140to141_bb1_var__u13_0_reg_141_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_140to141_bb1_var__u13_0_reg_141_fifo.IMPL = "shift_reg";

assign rnode_140to141_bb1_var__u13_0_reg_141_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_var__u13_stall_in = 1'b0;
assign rnode_140to141_bb1_var__u13_0_NO_SHIFT_REG = rnode_140to141_bb1_var__u13_0_reg_141_NO_SHIFT_REG;
assign rnode_140to141_bb1_var__u13_0_stall_in_reg_141_NO_SHIFT_REG = 1'b0;
assign rnode_140to141_bb1_var__u13_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_140to141_bb1_lnot33_not_i65_0_valid_out_NO_SHIFT_REG;
 logic rnode_140to141_bb1_lnot33_not_i65_0_stall_in_NO_SHIFT_REG;
 logic rnode_140to141_bb1_lnot33_not_i65_0_NO_SHIFT_REG;
 logic rnode_140to141_bb1_lnot33_not_i65_0_reg_141_inputs_ready_NO_SHIFT_REG;
 logic rnode_140to141_bb1_lnot33_not_i65_0_reg_141_NO_SHIFT_REG;
 logic rnode_140to141_bb1_lnot33_not_i65_0_valid_out_reg_141_NO_SHIFT_REG;
 logic rnode_140to141_bb1_lnot33_not_i65_0_stall_in_reg_141_NO_SHIFT_REG;
 logic rnode_140to141_bb1_lnot33_not_i65_0_stall_out_reg_141_NO_SHIFT_REG;

acl_data_fifo rnode_140to141_bb1_lnot33_not_i65_0_reg_141_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_140to141_bb1_lnot33_not_i65_0_reg_141_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_140to141_bb1_lnot33_not_i65_0_stall_in_reg_141_NO_SHIFT_REG),
	.valid_out(rnode_140to141_bb1_lnot33_not_i65_0_valid_out_reg_141_NO_SHIFT_REG),
	.stall_out(rnode_140to141_bb1_lnot33_not_i65_0_stall_out_reg_141_NO_SHIFT_REG),
	.data_in(local_bb1_lnot33_not_i65),
	.data_out(rnode_140to141_bb1_lnot33_not_i65_0_reg_141_NO_SHIFT_REG)
);

defparam rnode_140to141_bb1_lnot33_not_i65_0_reg_141_fifo.DEPTH = 1;
defparam rnode_140to141_bb1_lnot33_not_i65_0_reg_141_fifo.DATA_WIDTH = 1;
defparam rnode_140to141_bb1_lnot33_not_i65_0_reg_141_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_140to141_bb1_lnot33_not_i65_0_reg_141_fifo.IMPL = "shift_reg";

assign rnode_140to141_bb1_lnot33_not_i65_0_reg_141_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_lnot33_not_i65_stall_in = 1'b0;
assign rnode_140to141_bb1_lnot33_not_i65_0_NO_SHIFT_REG = rnode_140to141_bb1_lnot33_not_i65_0_reg_141_NO_SHIFT_REG;
assign rnode_140to141_bb1_lnot33_not_i65_0_stall_in_reg_141_NO_SHIFT_REG = 1'b0;
assign rnode_140to141_bb1_lnot33_not_i65_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_140to141_bb1_and93_i89_0_valid_out_NO_SHIFT_REG;
 logic rnode_140to141_bb1_and93_i89_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_140to141_bb1_and93_i89_0_NO_SHIFT_REG;
 logic rnode_140to141_bb1_and93_i89_0_reg_141_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_140to141_bb1_and93_i89_0_reg_141_NO_SHIFT_REG;
 logic rnode_140to141_bb1_and93_i89_0_valid_out_reg_141_NO_SHIFT_REG;
 logic rnode_140to141_bb1_and93_i89_0_stall_in_reg_141_NO_SHIFT_REG;
 logic rnode_140to141_bb1_and93_i89_0_stall_out_reg_141_NO_SHIFT_REG;

acl_data_fifo rnode_140to141_bb1_and93_i89_0_reg_141_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_140to141_bb1_and93_i89_0_reg_141_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_140to141_bb1_and93_i89_0_stall_in_reg_141_NO_SHIFT_REG),
	.valid_out(rnode_140to141_bb1_and93_i89_0_valid_out_reg_141_NO_SHIFT_REG),
	.stall_out(rnode_140to141_bb1_and93_i89_0_stall_out_reg_141_NO_SHIFT_REG),
	.data_in((local_bb1_and93_i89 & 32'h1C)),
	.data_out(rnode_140to141_bb1_and93_i89_0_reg_141_NO_SHIFT_REG)
);

defparam rnode_140to141_bb1_and93_i89_0_reg_141_fifo.DEPTH = 1;
defparam rnode_140to141_bb1_and93_i89_0_reg_141_fifo.DATA_WIDTH = 32;
defparam rnode_140to141_bb1_and93_i89_0_reg_141_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_140to141_bb1_and93_i89_0_reg_141_fifo.IMPL = "shift_reg";

assign rnode_140to141_bb1_and93_i89_0_reg_141_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_and93_i89_stall_in = 1'b0;
assign rnode_140to141_bb1_and93_i89_0_NO_SHIFT_REG = rnode_140to141_bb1_and93_i89_0_reg_141_NO_SHIFT_REG;
assign rnode_140to141_bb1_and93_i89_0_stall_in_reg_141_NO_SHIFT_REG = 1'b0;
assign rnode_140to141_bb1_and93_i89_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_140to141_bb1_and143_i117_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_140to141_bb1_and143_i117_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_140to141_bb1_and143_i117_0_NO_SHIFT_REG;
 logic rnode_140to141_bb1_and143_i117_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_140to141_bb1_and143_i117_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_140to141_bb1_and143_i117_1_NO_SHIFT_REG;
 logic rnode_140to141_bb1_and143_i117_0_valid_out_2_NO_SHIFT_REG;
 logic rnode_140to141_bb1_and143_i117_0_stall_in_2_NO_SHIFT_REG;
 logic [31:0] rnode_140to141_bb1_and143_i117_2_NO_SHIFT_REG;
 logic rnode_140to141_bb1_and143_i117_0_valid_out_3_NO_SHIFT_REG;
 logic rnode_140to141_bb1_and143_i117_0_stall_in_3_NO_SHIFT_REG;
 logic [31:0] rnode_140to141_bb1_and143_i117_3_NO_SHIFT_REG;
 logic rnode_140to141_bb1_and143_i117_0_reg_141_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_140to141_bb1_and143_i117_0_reg_141_NO_SHIFT_REG;
 logic rnode_140to141_bb1_and143_i117_0_valid_out_0_reg_141_NO_SHIFT_REG;
 logic rnode_140to141_bb1_and143_i117_0_stall_in_0_reg_141_NO_SHIFT_REG;
 logic rnode_140to141_bb1_and143_i117_0_stall_out_reg_141_NO_SHIFT_REG;

acl_data_fifo rnode_140to141_bb1_and143_i117_0_reg_141_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_140to141_bb1_and143_i117_0_reg_141_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_140to141_bb1_and143_i117_0_stall_in_0_reg_141_NO_SHIFT_REG),
	.valid_out(rnode_140to141_bb1_and143_i117_0_valid_out_0_reg_141_NO_SHIFT_REG),
	.stall_out(rnode_140to141_bb1_and143_i117_0_stall_out_reg_141_NO_SHIFT_REG),
	.data_in((local_bb1_and143_i117 & 32'h3)),
	.data_out(rnode_140to141_bb1_and143_i117_0_reg_141_NO_SHIFT_REG)
);

defparam rnode_140to141_bb1_and143_i117_0_reg_141_fifo.DEPTH = 1;
defparam rnode_140to141_bb1_and143_i117_0_reg_141_fifo.DATA_WIDTH = 32;
defparam rnode_140to141_bb1_and143_i117_0_reg_141_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_140to141_bb1_and143_i117_0_reg_141_fifo.IMPL = "shift_reg";

assign rnode_140to141_bb1_and143_i117_0_reg_141_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_and143_i117_stall_in = 1'b0;
assign rnode_140to141_bb1_and143_i117_0_stall_in_0_reg_141_NO_SHIFT_REG = 1'b0;
assign rnode_140to141_bb1_and143_i117_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_140to141_bb1_and143_i117_0_NO_SHIFT_REG = rnode_140to141_bb1_and143_i117_0_reg_141_NO_SHIFT_REG;
assign rnode_140to141_bb1_and143_i117_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_140to141_bb1_and143_i117_1_NO_SHIFT_REG = rnode_140to141_bb1_and143_i117_0_reg_141_NO_SHIFT_REG;
assign rnode_140to141_bb1_and143_i117_0_valid_out_2_NO_SHIFT_REG = 1'b1;
assign rnode_140to141_bb1_and143_i117_2_NO_SHIFT_REG = rnode_140to141_bb1_and143_i117_0_reg_141_NO_SHIFT_REG;
assign rnode_140to141_bb1_and143_i117_0_valid_out_3_NO_SHIFT_REG = 1'b1;
assign rnode_140to141_bb1_and143_i117_3_NO_SHIFT_REG = rnode_140to141_bb1_and143_i117_0_reg_141_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_140to141_bb1_or130_i115_0_valid_out_NO_SHIFT_REG;
 logic rnode_140to141_bb1_or130_i115_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_140to141_bb1_or130_i115_0_NO_SHIFT_REG;
 logic rnode_140to141_bb1_or130_i115_0_reg_141_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_140to141_bb1_or130_i115_0_reg_141_NO_SHIFT_REG;
 logic rnode_140to141_bb1_or130_i115_0_valid_out_reg_141_NO_SHIFT_REG;
 logic rnode_140to141_bb1_or130_i115_0_stall_in_reg_141_NO_SHIFT_REG;
 logic rnode_140to141_bb1_or130_i115_0_stall_out_reg_141_NO_SHIFT_REG;

acl_data_fifo rnode_140to141_bb1_or130_i115_0_reg_141_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_140to141_bb1_or130_i115_0_reg_141_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_140to141_bb1_or130_i115_0_stall_in_reg_141_NO_SHIFT_REG),
	.valid_out(rnode_140to141_bb1_or130_i115_0_valid_out_reg_141_NO_SHIFT_REG),
	.stall_out(rnode_140to141_bb1_or130_i115_0_stall_out_reg_141_NO_SHIFT_REG),
	.data_in((local_bb1_or130_i115 & 32'h1)),
	.data_out(rnode_140to141_bb1_or130_i115_0_reg_141_NO_SHIFT_REG)
);

defparam rnode_140to141_bb1_or130_i115_0_reg_141_fifo.DEPTH = 1;
defparam rnode_140to141_bb1_or130_i115_0_reg_141_fifo.DATA_WIDTH = 32;
defparam rnode_140to141_bb1_or130_i115_0_reg_141_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_140to141_bb1_or130_i115_0_reg_141_fifo.IMPL = "shift_reg";

assign rnode_140to141_bb1_or130_i115_0_reg_141_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_or130_i115_stall_in = 1'b0;
assign rnode_140to141_bb1_or130_i115_0_NO_SHIFT_REG = rnode_140to141_bb1_or130_i115_0_reg_141_NO_SHIFT_REG;
assign rnode_140to141_bb1_or130_i115_0_stall_in_reg_141_NO_SHIFT_REG = 1'b0;
assign rnode_140to141_bb1_or130_i115_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_140to141_bb1_reduction_3_i127_0_valid_out_NO_SHIFT_REG;
 logic rnode_140to141_bb1_reduction_3_i127_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_140to141_bb1_reduction_3_i127_0_NO_SHIFT_REG;
 logic rnode_140to141_bb1_reduction_3_i127_0_reg_141_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_140to141_bb1_reduction_3_i127_0_reg_141_NO_SHIFT_REG;
 logic rnode_140to141_bb1_reduction_3_i127_0_valid_out_reg_141_NO_SHIFT_REG;
 logic rnode_140to141_bb1_reduction_3_i127_0_stall_in_reg_141_NO_SHIFT_REG;
 logic rnode_140to141_bb1_reduction_3_i127_0_stall_out_reg_141_NO_SHIFT_REG;

acl_data_fifo rnode_140to141_bb1_reduction_3_i127_0_reg_141_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_140to141_bb1_reduction_3_i127_0_reg_141_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_140to141_bb1_reduction_3_i127_0_stall_in_reg_141_NO_SHIFT_REG),
	.valid_out(rnode_140to141_bb1_reduction_3_i127_0_valid_out_reg_141_NO_SHIFT_REG),
	.stall_out(rnode_140to141_bb1_reduction_3_i127_0_stall_out_reg_141_NO_SHIFT_REG),
	.data_in((local_bb1_reduction_3_i127 & 32'h1)),
	.data_out(rnode_140to141_bb1_reduction_3_i127_0_reg_141_NO_SHIFT_REG)
);

defparam rnode_140to141_bb1_reduction_3_i127_0_reg_141_fifo.DEPTH = 1;
defparam rnode_140to141_bb1_reduction_3_i127_0_reg_141_fifo.DATA_WIDTH = 32;
defparam rnode_140to141_bb1_reduction_3_i127_0_reg_141_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_140to141_bb1_reduction_3_i127_0_reg_141_fifo.IMPL = "shift_reg";

assign rnode_140to141_bb1_reduction_3_i127_0_reg_141_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_reduction_3_i127_stall_in = 1'b0;
assign rnode_140to141_bb1_reduction_3_i127_0_NO_SHIFT_REG = rnode_140to141_bb1_reduction_3_i127_0_reg_141_NO_SHIFT_REG;
assign rnode_140to141_bb1_reduction_3_i127_0_stall_in_reg_141_NO_SHIFT_REG = 1'b0;
assign rnode_140to141_bb1_reduction_3_i127_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb1_and17_i48_stall_local;
wire [31:0] local_bb1_and17_i48;

assign local_bb1_and17_i48 = ((rnode_140to141_bb1_shr16_i47_0_NO_SHIFT_REG & 32'h1FF) & 32'hFF);

// Register node:
//  * latency = 2
//  * capacity = 2
 logic rnode_141to143_bb1_shr16_i47_0_valid_out_NO_SHIFT_REG;
 logic rnode_141to143_bb1_shr16_i47_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_141to143_bb1_shr16_i47_0_NO_SHIFT_REG;
 logic rnode_141to143_bb1_shr16_i47_0_reg_143_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_141to143_bb1_shr16_i47_0_reg_143_NO_SHIFT_REG;
 logic rnode_141to143_bb1_shr16_i47_0_valid_out_reg_143_NO_SHIFT_REG;
 logic rnode_141to143_bb1_shr16_i47_0_stall_in_reg_143_NO_SHIFT_REG;
 logic rnode_141to143_bb1_shr16_i47_0_stall_out_reg_143_NO_SHIFT_REG;

acl_data_fifo rnode_141to143_bb1_shr16_i47_0_reg_143_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_141to143_bb1_shr16_i47_0_reg_143_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_141to143_bb1_shr16_i47_0_stall_in_reg_143_NO_SHIFT_REG),
	.valid_out(rnode_141to143_bb1_shr16_i47_0_valid_out_reg_143_NO_SHIFT_REG),
	.stall_out(rnode_141to143_bb1_shr16_i47_0_stall_out_reg_143_NO_SHIFT_REG),
	.data_in((rnode_140to141_bb1_shr16_i47_1_NO_SHIFT_REG & 32'h1FF)),
	.data_out(rnode_141to143_bb1_shr16_i47_0_reg_143_NO_SHIFT_REG)
);

defparam rnode_141to143_bb1_shr16_i47_0_reg_143_fifo.DEPTH = 2;
defparam rnode_141to143_bb1_shr16_i47_0_reg_143_fifo.DATA_WIDTH = 32;
defparam rnode_141to143_bb1_shr16_i47_0_reg_143_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_141to143_bb1_shr16_i47_0_reg_143_fifo.IMPL = "shift_reg";

assign rnode_141to143_bb1_shr16_i47_0_reg_143_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_140to141_bb1_shr16_i47_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_141to143_bb1_shr16_i47_0_NO_SHIFT_REG = rnode_141to143_bb1_shr16_i47_0_reg_143_NO_SHIFT_REG;
assign rnode_141to143_bb1_shr16_i47_0_stall_in_reg_143_NO_SHIFT_REG = 1'b0;
assign rnode_141to143_bb1_shr16_i47_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb1_brmerge_not_i66_stall_local;
wire local_bb1_brmerge_not_i66;

assign local_bb1_brmerge_not_i66 = (rnode_140to141_bb1_cmp27_i56_0_NO_SHIFT_REG & rnode_140to141_bb1_lnot33_not_i65_0_NO_SHIFT_REG);

// This section implements an unregistered operation.
// 
wire local_bb1_shr94_i90_stall_local;
wire [31:0] local_bb1_shr94_i90;

assign local_bb1_shr94_i90 = ((rnode_140to141_bb1__15_i77_0_NO_SHIFT_REG & 32'h7FFFFF8) >> (rnode_140to141_bb1_and93_i89_0_NO_SHIFT_REG & 32'h1C));

// This section implements an unregistered operation.
// 
wire local_bb1_cmp146_i119_stall_local;
wire local_bb1_cmp146_i119;

assign local_bb1_cmp146_i119 = ((rnode_140to141_bb1_and143_i117_1_NO_SHIFT_REG & 32'h3) == 32'h3);

// This section implements an unregistered operation.
// 
wire local_bb1_cmp157_i123_stall_local;
wire local_bb1_cmp157_i123;

assign local_bb1_cmp157_i123 = ((rnode_140to141_bb1_and143_i117_2_NO_SHIFT_REG & 32'h3) == 32'h2);

// This section implements an unregistered operation.
// 
wire local_bb1_cmp166_i125_stall_local;
wire local_bb1_cmp166_i125;

assign local_bb1_cmp166_i125 = ((rnode_140to141_bb1_and143_i117_3_NO_SHIFT_REG & 32'h3) == 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb1_lnot_i53_stall_local;
wire local_bb1_lnot_i53;

assign local_bb1_lnot_i53 = ((local_bb1_and17_i48 & 32'hFF) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_cmp25_i55_stall_local;
wire local_bb1_cmp25_i55;

assign local_bb1_cmp25_i55 = ((local_bb1_and17_i48 & 32'hFF) == 32'hFF);

// This section implements an unregistered operation.
// 
wire local_bb1_brmerge_not_not_i67_stall_local;
wire local_bb1_brmerge_not_not_i67;

assign local_bb1_brmerge_not_not_i67 = (local_bb1_brmerge_not_i66 ^ 1'b1);

// This section implements an unregistered operation.
// 
wire local_bb1_and136_i116_stall_local;
wire [31:0] local_bb1_and136_i116;

assign local_bb1_and136_i116 = (local_bb1_shr94_i90 >> 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb1_shr144_i118_stall_local;
wire [31:0] local_bb1_shr144_i118;

assign local_bb1_shr144_i118 = (local_bb1_shr94_i90 >> (rnode_140to141_bb1_and143_i117_0_NO_SHIFT_REG & 32'h3));

// This section implements an unregistered operation.
// 
wire local_bb1_and140_i120_stall_local;
wire [31:0] local_bb1_and140_i120;

assign local_bb1_and140_i120 = (local_bb1_shr94_i90 & 32'h4);

// This section implements an unregistered operation.
// 
wire local_bb1_var__u18_stall_local;
wire [31:0] local_bb1_var__u18;

assign local_bb1_var__u18 = (local_bb1_shr94_i90 & 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb1__14_i74_stall_local;
wire [31:0] local_bb1__14_i74;

assign local_bb1__14_i74 = (local_bb1_lnot_i53 ? 32'h0 : ((local_bb1_shl_i73 & 32'h7FFFFF8) | 32'h4000000));

// This section implements an unregistered operation.
// 
wire local_bb1_cmp25_not_i60_stall_local;
wire local_bb1_cmp25_not_i60;

assign local_bb1_cmp25_not_i60 = (local_bb1_cmp25_i55 ^ 1'b1);

// This section implements an unregistered operation.
// 
wire local_bb1_or_cond2_not_i64_stall_local;
wire local_bb1_or_cond2_not_i64;

assign local_bb1_or_cond2_not_i64 = (local_bb1_cmp25_i55 & local_bb1_lnot30_not_i63);

// This section implements an unregistered operation.
// 
wire local_bb1_var__u19_stall_local;
wire local_bb1_var__u19;

assign local_bb1_var__u19 = (local_bb1_cmp25_i55 | rnode_140to141_bb1_cmp27_i56_1_NO_SHIFT_REG);

// This section implements an unregistered operation.
// 
wire local_bb1_var__u20_stall_local;
wire [31:0] local_bb1_var__u20;

assign local_bb1_var__u20 = ((local_bb1_and136_i116 & 32'h7FFFFFFF) | local_bb1_shr94_i90);

// This section implements an unregistered operation.
// 
wire local_bb1_or170_i126_stall_local;
wire [31:0] local_bb1_or170_i126;

assign local_bb1_or170_i126 = (local_bb1_cmp166_i125 ? (local_bb1_var__u18 & 32'h1) : 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_add_i136_stall_local;
wire [31:0] local_bb1_add_i136;

assign local_bb1_add_i136 = ((local_bb1__14_i74 & 32'h7FFFFF8) | (local_bb1_and36_lobit_i135 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb1_or_cond2_i62_stall_local;
wire local_bb1_or_cond2_i62;

assign local_bb1_or_cond2_i62 = (local_bb1_lnot30_i61 | local_bb1_cmp25_not_i60);

// This section implements an unregistered operation.
// 
wire local_bb1__11_i68_stall_local;
wire local_bb1__11_i68;

assign local_bb1__11_i68 = (local_bb1_or_cond2_not_i64 | local_bb1_brmerge_not_i66);

// This section implements an unregistered operation.
// 
wire local_bb1_var__u21_stall_local;
wire [31:0] local_bb1_var__u21;

assign local_bb1_var__u21 = (local_bb1_var__u20 & 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb1_reduction_1_i69_stall_local;
wire local_bb1_reduction_1_i69;

assign local_bb1_reduction_1_i69 = (local_bb1_or_cond2_i62 & local_bb1_brmerge_not_not_i67);

// This section implements an unregistered operation.
// 
wire local_bb1_var__u22_stall_local;
wire [31:0] local_bb1_var__u22;

assign local_bb1_var__u22 = ((local_bb1_var__u21 & 32'h1) | (local_bb1_and140_i120 & 32'h4));

// This section implements an unregistered operation.
// 
wire local_bb1_or163_i124_stall_local;
wire [31:0] local_bb1_or163_i124;

assign local_bb1_or163_i124 = (local_bb1_cmp157_i123 ? (local_bb1_var__u21 & 32'h1) : 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_reduction_2_i70_stall_local;
wire local_bb1_reduction_2_i70;

assign local_bb1_reduction_2_i70 = (rnode_140to141_bb1_var__u13_0_NO_SHIFT_REG & local_bb1_reduction_1_i69);

// This section implements an unregistered operation.
// 
wire local_bb1_var__u23_stall_local;
wire local_bb1_var__u23;

assign local_bb1_var__u23 = ((local_bb1_var__u22 & 32'h5) != 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_reduction_5_i129_stall_local;
wire [31:0] local_bb1_reduction_5_i129;

assign local_bb1_reduction_5_i129 = ((local_bb1_or163_i124 & 32'h1) | (local_bb1_or170_i126 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb1__13_i71_stall_local;
wire local_bb1__13_i71;

assign local_bb1__13_i71 = (local_bb1_reduction_2_i70 ? local_bb1_cmp37_i59 : local_bb1__11_i68);

// This section implements an unregistered operation.
// 
wire local_bb1_conv153_i121_stall_local;
wire [31:0] local_bb1_conv153_i121;

assign local_bb1_conv153_i121[31:1] = 31'h0;
assign local_bb1_conv153_i121[0] = local_bb1_var__u23;

// This section implements an unregistered operation.
// 
wire local_bb1_reduction_7_i131_stall_local;
wire [31:0] local_bb1_reduction_7_i131;

assign local_bb1_reduction_7_i131 = (local_bb1_shr144_i118 | (local_bb1_reduction_5_i129 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb1_or154_i122_stall_local;
wire [31:0] local_bb1_or154_i122;

assign local_bb1_or154_i122 = (local_bb1_cmp146_i119 ? (local_bb1_conv153_i121 & 32'h1) : 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_reduction_4_i128_stall_local;
wire [31:0] local_bb1_reduction_4_i128;

assign local_bb1_reduction_4_i128 = ((rnode_140to141_bb1_or130_i115_0_NO_SHIFT_REG & 32'h1) | (local_bb1_or154_i122 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb1_reduction_6_i130_stall_local;
wire [31:0] local_bb1_reduction_6_i130;

assign local_bb1_reduction_6_i130 = ((rnode_140to141_bb1_reduction_3_i127_0_NO_SHIFT_REG & 32'h1) | (local_bb1_reduction_4_i128 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb1_reduction_8_i132_stall_local;
wire [31:0] local_bb1_reduction_8_i132;

assign local_bb1_reduction_8_i132 = ((local_bb1_reduction_6_i130 & 32'h1) | local_bb1_reduction_7_i131);

// This section implements an unregistered operation.
// 
wire local_bb1_xor175_i134_stall_local;
wire [31:0] local_bb1_xor175_i134;

assign local_bb1_xor175_i134 = (local_bb1_reduction_8_i132 ^ local_bb1_xor_lobit_i133);

// This section implements an unregistered operation.
// 
wire local_bb1_cmp37_i59_valid_out_1;
wire local_bb1_cmp37_i59_stall_in_1;
wire local_bb1__13_i71_valid_out;
wire local_bb1__13_i71_stall_in;
wire local_bb1_and17_i48_valid_out_2;
wire local_bb1_and17_i48_stall_in_2;
wire local_bb1_var__u19_valid_out;
wire local_bb1_var__u19_stall_in;
wire local_bb1_add178_i137_valid_out;
wire local_bb1_add178_i137_stall_in;
wire local_bb1_add178_i137_inputs_ready;
wire local_bb1_add178_i137_stall_local;
wire [31:0] local_bb1_add178_i137;

assign local_bb1_add178_i137_inputs_ready = (rnode_140to141_bb1_xor_i58_0_valid_out_0_NO_SHIFT_REG & rnode_140to141_bb1_shr16_i47_0_valid_out_0_NO_SHIFT_REG & rnode_140to141_bb1_cmp27_i56_0_valid_out_1_NO_SHIFT_REG & rnode_140to141_bb1_and20_i51_0_valid_out_0_NO_SHIFT_REG & rnode_140to141_bb1_and20_i51_0_valid_out_1_NO_SHIFT_REG & rnode_140to141_bb1_cmp27_i56_0_valid_out_0_NO_SHIFT_REG & rnode_140to141_bb1_lnot33_not_i65_0_valid_out_NO_SHIFT_REG & rnode_140to141_bb1_xor_i58_0_valid_out_1_NO_SHIFT_REG & rnode_140to141_bb1_xor_i58_0_valid_out_2_NO_SHIFT_REG & rnode_140to141_bb1_var__u13_0_valid_out_NO_SHIFT_REG & rnode_140to141_bb1__15_i77_0_valid_out_NO_SHIFT_REG & rnode_140to141_bb1_and93_i89_0_valid_out_NO_SHIFT_REG & rnode_140to141_bb1_and143_i117_0_valid_out_0_NO_SHIFT_REG & rnode_140to141_bb1_and143_i117_0_valid_out_3_NO_SHIFT_REG & rnode_140to141_bb1_and143_i117_0_valid_out_2_NO_SHIFT_REG & rnode_140to141_bb1_and143_i117_0_valid_out_1_NO_SHIFT_REG & rnode_140to141_bb1_or130_i115_0_valid_out_NO_SHIFT_REG & rnode_140to141_bb1_reduction_3_i127_0_valid_out_NO_SHIFT_REG);
assign local_bb1_add178_i137 = ((local_bb1_add_i136 & 32'h7FFFFF9) + local_bb1_xor175_i134);
assign local_bb1_cmp37_i59_valid_out_1 = 1'b1;
assign local_bb1__13_i71_valid_out = 1'b1;
assign local_bb1_and17_i48_valid_out_2 = 1'b1;
assign local_bb1_var__u19_valid_out = 1'b1;
assign local_bb1_add178_i137_valid_out = 1'b1;
assign rnode_140to141_bb1_xor_i58_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_140to141_bb1_shr16_i47_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_140to141_bb1_cmp27_i56_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_140to141_bb1_and20_i51_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_140to141_bb1_and20_i51_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_140to141_bb1_cmp27_i56_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_140to141_bb1_lnot33_not_i65_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_140to141_bb1_xor_i58_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_140to141_bb1_xor_i58_0_stall_in_2_NO_SHIFT_REG = 1'b0;
assign rnode_140to141_bb1_var__u13_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_140to141_bb1__15_i77_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_140to141_bb1_and93_i89_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_140to141_bb1_and143_i117_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_140to141_bb1_and143_i117_0_stall_in_3_NO_SHIFT_REG = 1'b0;
assign rnode_140to141_bb1_and143_i117_0_stall_in_2_NO_SHIFT_REG = 1'b0;
assign rnode_140to141_bb1_and143_i117_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_140to141_bb1_or130_i115_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_140to141_bb1_reduction_3_i127_0_stall_in_NO_SHIFT_REG = 1'b0;

// Register node:
//  * latency = 2
//  * capacity = 2
 logic rnode_141to143_bb1_cmp37_i59_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_141to143_bb1_cmp37_i59_0_stall_in_0_NO_SHIFT_REG;
 logic rnode_141to143_bb1_cmp37_i59_0_NO_SHIFT_REG;
 logic rnode_141to143_bb1_cmp37_i59_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_141to143_bb1_cmp37_i59_0_stall_in_1_NO_SHIFT_REG;
 logic rnode_141to143_bb1_cmp37_i59_1_NO_SHIFT_REG;
 logic rnode_141to143_bb1_cmp37_i59_0_valid_out_2_NO_SHIFT_REG;
 logic rnode_141to143_bb1_cmp37_i59_0_stall_in_2_NO_SHIFT_REG;
 logic rnode_141to143_bb1_cmp37_i59_2_NO_SHIFT_REG;
 logic rnode_141to143_bb1_cmp37_i59_0_reg_143_inputs_ready_NO_SHIFT_REG;
 logic rnode_141to143_bb1_cmp37_i59_0_reg_143_NO_SHIFT_REG;
 logic rnode_141to143_bb1_cmp37_i59_0_valid_out_0_reg_143_NO_SHIFT_REG;
 logic rnode_141to143_bb1_cmp37_i59_0_stall_in_0_reg_143_NO_SHIFT_REG;
 logic rnode_141to143_bb1_cmp37_i59_0_stall_out_reg_143_NO_SHIFT_REG;

acl_data_fifo rnode_141to143_bb1_cmp37_i59_0_reg_143_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_141to143_bb1_cmp37_i59_0_reg_143_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_141to143_bb1_cmp37_i59_0_stall_in_0_reg_143_NO_SHIFT_REG),
	.valid_out(rnode_141to143_bb1_cmp37_i59_0_valid_out_0_reg_143_NO_SHIFT_REG),
	.stall_out(rnode_141to143_bb1_cmp37_i59_0_stall_out_reg_143_NO_SHIFT_REG),
	.data_in(local_bb1_cmp37_i59),
	.data_out(rnode_141to143_bb1_cmp37_i59_0_reg_143_NO_SHIFT_REG)
);

defparam rnode_141to143_bb1_cmp37_i59_0_reg_143_fifo.DEPTH = 2;
defparam rnode_141to143_bb1_cmp37_i59_0_reg_143_fifo.DATA_WIDTH = 1;
defparam rnode_141to143_bb1_cmp37_i59_0_reg_143_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_141to143_bb1_cmp37_i59_0_reg_143_fifo.IMPL = "shift_reg";

assign rnode_141to143_bb1_cmp37_i59_0_reg_143_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_cmp37_i59_stall_in_1 = 1'b0;
assign rnode_141to143_bb1_cmp37_i59_0_stall_in_0_reg_143_NO_SHIFT_REG = 1'b0;
assign rnode_141to143_bb1_cmp37_i59_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_141to143_bb1_cmp37_i59_0_NO_SHIFT_REG = rnode_141to143_bb1_cmp37_i59_0_reg_143_NO_SHIFT_REG;
assign rnode_141to143_bb1_cmp37_i59_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_141to143_bb1_cmp37_i59_1_NO_SHIFT_REG = rnode_141to143_bb1_cmp37_i59_0_reg_143_NO_SHIFT_REG;
assign rnode_141to143_bb1_cmp37_i59_0_valid_out_2_NO_SHIFT_REG = 1'b1;
assign rnode_141to143_bb1_cmp37_i59_2_NO_SHIFT_REG = rnode_141to143_bb1_cmp37_i59_0_reg_143_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_141to142_bb1__13_i71_0_valid_out_NO_SHIFT_REG;
 logic rnode_141to142_bb1__13_i71_0_stall_in_NO_SHIFT_REG;
 logic rnode_141to142_bb1__13_i71_0_NO_SHIFT_REG;
 logic rnode_141to142_bb1__13_i71_0_reg_142_inputs_ready_NO_SHIFT_REG;
 logic rnode_141to142_bb1__13_i71_0_reg_142_NO_SHIFT_REG;
 logic rnode_141to142_bb1__13_i71_0_valid_out_reg_142_NO_SHIFT_REG;
 logic rnode_141to142_bb1__13_i71_0_stall_in_reg_142_NO_SHIFT_REG;
 logic rnode_141to142_bb1__13_i71_0_stall_out_reg_142_NO_SHIFT_REG;

acl_data_fifo rnode_141to142_bb1__13_i71_0_reg_142_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_141to142_bb1__13_i71_0_reg_142_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_141to142_bb1__13_i71_0_stall_in_reg_142_NO_SHIFT_REG),
	.valid_out(rnode_141to142_bb1__13_i71_0_valid_out_reg_142_NO_SHIFT_REG),
	.stall_out(rnode_141to142_bb1__13_i71_0_stall_out_reg_142_NO_SHIFT_REG),
	.data_in(local_bb1__13_i71),
	.data_out(rnode_141to142_bb1__13_i71_0_reg_142_NO_SHIFT_REG)
);

defparam rnode_141to142_bb1__13_i71_0_reg_142_fifo.DEPTH = 1;
defparam rnode_141to142_bb1__13_i71_0_reg_142_fifo.DATA_WIDTH = 1;
defparam rnode_141to142_bb1__13_i71_0_reg_142_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_141to142_bb1__13_i71_0_reg_142_fifo.IMPL = "shift_reg";

assign rnode_141to142_bb1__13_i71_0_reg_142_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1__13_i71_stall_in = 1'b0;
assign rnode_141to142_bb1__13_i71_0_NO_SHIFT_REG = rnode_141to142_bb1__13_i71_0_reg_142_NO_SHIFT_REG;
assign rnode_141to142_bb1__13_i71_0_stall_in_reg_142_NO_SHIFT_REG = 1'b0;
assign rnode_141to142_bb1__13_i71_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 2
//  * capacity = 2
 logic rnode_141to143_bb1_and17_i48_0_valid_out_NO_SHIFT_REG;
 logic rnode_141to143_bb1_and17_i48_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_141to143_bb1_and17_i48_0_NO_SHIFT_REG;
 logic rnode_141to143_bb1_and17_i48_0_reg_143_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_141to143_bb1_and17_i48_0_reg_143_NO_SHIFT_REG;
 logic rnode_141to143_bb1_and17_i48_0_valid_out_reg_143_NO_SHIFT_REG;
 logic rnode_141to143_bb1_and17_i48_0_stall_in_reg_143_NO_SHIFT_REG;
 logic rnode_141to143_bb1_and17_i48_0_stall_out_reg_143_NO_SHIFT_REG;

acl_data_fifo rnode_141to143_bb1_and17_i48_0_reg_143_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_141to143_bb1_and17_i48_0_reg_143_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_141to143_bb1_and17_i48_0_stall_in_reg_143_NO_SHIFT_REG),
	.valid_out(rnode_141to143_bb1_and17_i48_0_valid_out_reg_143_NO_SHIFT_REG),
	.stall_out(rnode_141to143_bb1_and17_i48_0_stall_out_reg_143_NO_SHIFT_REG),
	.data_in((local_bb1_and17_i48 & 32'hFF)),
	.data_out(rnode_141to143_bb1_and17_i48_0_reg_143_NO_SHIFT_REG)
);

defparam rnode_141to143_bb1_and17_i48_0_reg_143_fifo.DEPTH = 2;
defparam rnode_141to143_bb1_and17_i48_0_reg_143_fifo.DATA_WIDTH = 32;
defparam rnode_141to143_bb1_and17_i48_0_reg_143_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_141to143_bb1_and17_i48_0_reg_143_fifo.IMPL = "shift_reg";

assign rnode_141to143_bb1_and17_i48_0_reg_143_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_and17_i48_stall_in_2 = 1'b0;
assign rnode_141to143_bb1_and17_i48_0_NO_SHIFT_REG = rnode_141to143_bb1_and17_i48_0_reg_143_NO_SHIFT_REG;
assign rnode_141to143_bb1_and17_i48_0_stall_in_reg_143_NO_SHIFT_REG = 1'b0;
assign rnode_141to143_bb1_and17_i48_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_141to142_bb1_var__u19_0_valid_out_NO_SHIFT_REG;
 logic rnode_141to142_bb1_var__u19_0_stall_in_NO_SHIFT_REG;
 logic rnode_141to142_bb1_var__u19_0_NO_SHIFT_REG;
 logic rnode_141to142_bb1_var__u19_0_reg_142_inputs_ready_NO_SHIFT_REG;
 logic rnode_141to142_bb1_var__u19_0_reg_142_NO_SHIFT_REG;
 logic rnode_141to142_bb1_var__u19_0_valid_out_reg_142_NO_SHIFT_REG;
 logic rnode_141to142_bb1_var__u19_0_stall_in_reg_142_NO_SHIFT_REG;
 logic rnode_141to142_bb1_var__u19_0_stall_out_reg_142_NO_SHIFT_REG;

acl_data_fifo rnode_141to142_bb1_var__u19_0_reg_142_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_141to142_bb1_var__u19_0_reg_142_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_141to142_bb1_var__u19_0_stall_in_reg_142_NO_SHIFT_REG),
	.valid_out(rnode_141to142_bb1_var__u19_0_valid_out_reg_142_NO_SHIFT_REG),
	.stall_out(rnode_141to142_bb1_var__u19_0_stall_out_reg_142_NO_SHIFT_REG),
	.data_in(local_bb1_var__u19),
	.data_out(rnode_141to142_bb1_var__u19_0_reg_142_NO_SHIFT_REG)
);

defparam rnode_141to142_bb1_var__u19_0_reg_142_fifo.DEPTH = 1;
defparam rnode_141to142_bb1_var__u19_0_reg_142_fifo.DATA_WIDTH = 1;
defparam rnode_141to142_bb1_var__u19_0_reg_142_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_141to142_bb1_var__u19_0_reg_142_fifo.IMPL = "shift_reg";

assign rnode_141to142_bb1_var__u19_0_reg_142_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_var__u19_stall_in = 1'b0;
assign rnode_141to142_bb1_var__u19_0_NO_SHIFT_REG = rnode_141to142_bb1_var__u19_0_reg_142_NO_SHIFT_REG;
assign rnode_141to142_bb1_var__u19_0_stall_in_reg_142_NO_SHIFT_REG = 1'b0;
assign rnode_141to142_bb1_var__u19_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_141to142_bb1_add178_i137_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_141to142_bb1_add178_i137_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_141to142_bb1_add178_i137_0_NO_SHIFT_REG;
 logic rnode_141to142_bb1_add178_i137_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_141to142_bb1_add178_i137_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_141to142_bb1_add178_i137_1_NO_SHIFT_REG;
 logic rnode_141to142_bb1_add178_i137_0_valid_out_2_NO_SHIFT_REG;
 logic rnode_141to142_bb1_add178_i137_0_stall_in_2_NO_SHIFT_REG;
 logic [31:0] rnode_141to142_bb1_add178_i137_2_NO_SHIFT_REG;
 logic rnode_141to142_bb1_add178_i137_0_valid_out_3_NO_SHIFT_REG;
 logic rnode_141to142_bb1_add178_i137_0_stall_in_3_NO_SHIFT_REG;
 logic [31:0] rnode_141to142_bb1_add178_i137_3_NO_SHIFT_REG;
 logic rnode_141to142_bb1_add178_i137_0_reg_142_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_141to142_bb1_add178_i137_0_reg_142_NO_SHIFT_REG;
 logic rnode_141to142_bb1_add178_i137_0_valid_out_0_reg_142_NO_SHIFT_REG;
 logic rnode_141to142_bb1_add178_i137_0_stall_in_0_reg_142_NO_SHIFT_REG;
 logic rnode_141to142_bb1_add178_i137_0_stall_out_reg_142_NO_SHIFT_REG;

acl_data_fifo rnode_141to142_bb1_add178_i137_0_reg_142_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_141to142_bb1_add178_i137_0_reg_142_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_141to142_bb1_add178_i137_0_stall_in_0_reg_142_NO_SHIFT_REG),
	.valid_out(rnode_141to142_bb1_add178_i137_0_valid_out_0_reg_142_NO_SHIFT_REG),
	.stall_out(rnode_141to142_bb1_add178_i137_0_stall_out_reg_142_NO_SHIFT_REG),
	.data_in(local_bb1_add178_i137),
	.data_out(rnode_141to142_bb1_add178_i137_0_reg_142_NO_SHIFT_REG)
);

defparam rnode_141to142_bb1_add178_i137_0_reg_142_fifo.DEPTH = 1;
defparam rnode_141to142_bb1_add178_i137_0_reg_142_fifo.DATA_WIDTH = 32;
defparam rnode_141to142_bb1_add178_i137_0_reg_142_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_141to142_bb1_add178_i137_0_reg_142_fifo.IMPL = "shift_reg";

assign rnode_141to142_bb1_add178_i137_0_reg_142_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_add178_i137_stall_in = 1'b0;
assign rnode_141to142_bb1_add178_i137_0_stall_in_0_reg_142_NO_SHIFT_REG = 1'b0;
assign rnode_141to142_bb1_add178_i137_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_141to142_bb1_add178_i137_0_NO_SHIFT_REG = rnode_141to142_bb1_add178_i137_0_reg_142_NO_SHIFT_REG;
assign rnode_141to142_bb1_add178_i137_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_141to142_bb1_add178_i137_1_NO_SHIFT_REG = rnode_141to142_bb1_add178_i137_0_reg_142_NO_SHIFT_REG;
assign rnode_141to142_bb1_add178_i137_0_valid_out_2_NO_SHIFT_REG = 1'b1;
assign rnode_141to142_bb1_add178_i137_2_NO_SHIFT_REG = rnode_141to142_bb1_add178_i137_0_reg_142_NO_SHIFT_REG;
assign rnode_141to142_bb1_add178_i137_0_valid_out_3_NO_SHIFT_REG = 1'b1;
assign rnode_141to142_bb1_add178_i137_3_NO_SHIFT_REG = rnode_141to142_bb1_add178_i137_0_reg_142_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb1_not_cmp37_i163_stall_local;
wire local_bb1_not_cmp37_i163;

assign local_bb1_not_cmp37_i163 = (rnode_141to143_bb1_cmp37_i59_0_NO_SHIFT_REG ^ 1'b1);

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_142to143_bb1__13_i71_0_valid_out_NO_SHIFT_REG;
 logic rnode_142to143_bb1__13_i71_0_stall_in_NO_SHIFT_REG;
 logic rnode_142to143_bb1__13_i71_0_NO_SHIFT_REG;
 logic rnode_142to143_bb1__13_i71_0_reg_143_inputs_ready_NO_SHIFT_REG;
 logic rnode_142to143_bb1__13_i71_0_reg_143_NO_SHIFT_REG;
 logic rnode_142to143_bb1__13_i71_0_valid_out_reg_143_NO_SHIFT_REG;
 logic rnode_142to143_bb1__13_i71_0_stall_in_reg_143_NO_SHIFT_REG;
 logic rnode_142to143_bb1__13_i71_0_stall_out_reg_143_NO_SHIFT_REG;

acl_data_fifo rnode_142to143_bb1__13_i71_0_reg_143_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_142to143_bb1__13_i71_0_reg_143_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_142to143_bb1__13_i71_0_stall_in_reg_143_NO_SHIFT_REG),
	.valid_out(rnode_142to143_bb1__13_i71_0_valid_out_reg_143_NO_SHIFT_REG),
	.stall_out(rnode_142to143_bb1__13_i71_0_stall_out_reg_143_NO_SHIFT_REG),
	.data_in(rnode_141to142_bb1__13_i71_0_NO_SHIFT_REG),
	.data_out(rnode_142to143_bb1__13_i71_0_reg_143_NO_SHIFT_REG)
);

defparam rnode_142to143_bb1__13_i71_0_reg_143_fifo.DEPTH = 1;
defparam rnode_142to143_bb1__13_i71_0_reg_143_fifo.DATA_WIDTH = 1;
defparam rnode_142to143_bb1__13_i71_0_reg_143_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_142to143_bb1__13_i71_0_reg_143_fifo.IMPL = "shift_reg";

assign rnode_142to143_bb1__13_i71_0_reg_143_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_141to142_bb1__13_i71_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_142to143_bb1__13_i71_0_NO_SHIFT_REG = rnode_142to143_bb1__13_i71_0_reg_143_NO_SHIFT_REG;
assign rnode_142to143_bb1__13_i71_0_stall_in_reg_143_NO_SHIFT_REG = 1'b0;
assign rnode_142to143_bb1__13_i71_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_142to143_bb1_var__u19_0_valid_out_NO_SHIFT_REG;
 logic rnode_142to143_bb1_var__u19_0_stall_in_NO_SHIFT_REG;
 logic rnode_142to143_bb1_var__u19_0_NO_SHIFT_REG;
 logic rnode_142to143_bb1_var__u19_0_reg_143_inputs_ready_NO_SHIFT_REG;
 logic rnode_142to143_bb1_var__u19_0_reg_143_NO_SHIFT_REG;
 logic rnode_142to143_bb1_var__u19_0_valid_out_reg_143_NO_SHIFT_REG;
 logic rnode_142to143_bb1_var__u19_0_stall_in_reg_143_NO_SHIFT_REG;
 logic rnode_142to143_bb1_var__u19_0_stall_out_reg_143_NO_SHIFT_REG;

acl_data_fifo rnode_142to143_bb1_var__u19_0_reg_143_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_142to143_bb1_var__u19_0_reg_143_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_142to143_bb1_var__u19_0_stall_in_reg_143_NO_SHIFT_REG),
	.valid_out(rnode_142to143_bb1_var__u19_0_valid_out_reg_143_NO_SHIFT_REG),
	.stall_out(rnode_142to143_bb1_var__u19_0_stall_out_reg_143_NO_SHIFT_REG),
	.data_in(rnode_141to142_bb1_var__u19_0_NO_SHIFT_REG),
	.data_out(rnode_142to143_bb1_var__u19_0_reg_143_NO_SHIFT_REG)
);

defparam rnode_142to143_bb1_var__u19_0_reg_143_fifo.DEPTH = 1;
defparam rnode_142to143_bb1_var__u19_0_reg_143_fifo.DATA_WIDTH = 1;
defparam rnode_142to143_bb1_var__u19_0_reg_143_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_142to143_bb1_var__u19_0_reg_143_fifo.IMPL = "shift_reg";

assign rnode_142to143_bb1_var__u19_0_reg_143_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_141to142_bb1_var__u19_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_142to143_bb1_var__u19_0_NO_SHIFT_REG = rnode_142to143_bb1_var__u19_0_reg_143_NO_SHIFT_REG;
assign rnode_142to143_bb1_var__u19_0_stall_in_reg_143_NO_SHIFT_REG = 1'b0;
assign rnode_142to143_bb1_var__u19_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb1_and179_i138_valid_out;
wire local_bb1_and179_i138_stall_in;
wire local_bb1_and179_i138_inputs_ready;
wire local_bb1_and179_i138_stall_local;
wire [31:0] local_bb1_and179_i138;

assign local_bb1_and179_i138_inputs_ready = rnode_141to142_bb1_add178_i137_0_valid_out_0_NO_SHIFT_REG;
assign local_bb1_and179_i138 = (rnode_141to142_bb1_add178_i137_0_NO_SHIFT_REG & 32'hFFFFFFF);
assign local_bb1_and179_i138_valid_out = 1'b1;
assign rnode_141to142_bb1_add178_i137_0_stall_in_0_NO_SHIFT_REG = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb1_and181_i139_valid_out;
wire local_bb1_and181_i139_stall_in;
wire local_bb1_and181_i139_inputs_ready;
wire local_bb1_and181_i139_stall_local;
wire [31:0] local_bb1_and181_i139;

assign local_bb1_and181_i139_inputs_ready = rnode_141to142_bb1_add178_i137_0_valid_out_1_NO_SHIFT_REG;
assign local_bb1_and181_i139 = (rnode_141to142_bb1_add178_i137_1_NO_SHIFT_REG >> 32'h1B);
assign local_bb1_and181_i139_valid_out = 1'b1;
assign rnode_141to142_bb1_add178_i137_0_stall_in_1_NO_SHIFT_REG = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb1_and184_i140_valid_out;
wire local_bb1_and184_i140_stall_in;
wire local_bb1_and184_i140_inputs_ready;
wire local_bb1_and184_i140_stall_local;
wire [31:0] local_bb1_and184_i140;

assign local_bb1_and184_i140_inputs_ready = rnode_141to142_bb1_add178_i137_0_valid_out_2_NO_SHIFT_REG;
assign local_bb1_and184_i140 = (rnode_141to142_bb1_add178_i137_2_NO_SHIFT_REG & 32'h1);
assign local_bb1_and184_i140_valid_out = 1'b1;
assign rnode_141to142_bb1_add178_i137_0_stall_in_2_NO_SHIFT_REG = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb1_and187_i141_stall_local;
wire [31:0] local_bb1_and187_i141;

assign local_bb1_and187_i141 = (rnode_141to142_bb1_add178_i137_3_NO_SHIFT_REG & 32'h7FFFFFF);

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_143to144_bb1__13_i71_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_143to144_bb1__13_i71_0_stall_in_0_NO_SHIFT_REG;
 logic rnode_143to144_bb1__13_i71_0_NO_SHIFT_REG;
 logic rnode_143to144_bb1__13_i71_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_143to144_bb1__13_i71_0_stall_in_1_NO_SHIFT_REG;
 logic rnode_143to144_bb1__13_i71_1_NO_SHIFT_REG;
 logic rnode_143to144_bb1__13_i71_0_valid_out_2_NO_SHIFT_REG;
 logic rnode_143to144_bb1__13_i71_0_stall_in_2_NO_SHIFT_REG;
 logic rnode_143to144_bb1__13_i71_2_NO_SHIFT_REG;
 logic rnode_143to144_bb1__13_i71_0_reg_144_inputs_ready_NO_SHIFT_REG;
 logic rnode_143to144_bb1__13_i71_0_reg_144_NO_SHIFT_REG;
 logic rnode_143to144_bb1__13_i71_0_valid_out_0_reg_144_NO_SHIFT_REG;
 logic rnode_143to144_bb1__13_i71_0_stall_in_0_reg_144_NO_SHIFT_REG;
 logic rnode_143to144_bb1__13_i71_0_stall_out_reg_144_NO_SHIFT_REG;

acl_data_fifo rnode_143to144_bb1__13_i71_0_reg_144_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_143to144_bb1__13_i71_0_reg_144_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_143to144_bb1__13_i71_0_stall_in_0_reg_144_NO_SHIFT_REG),
	.valid_out(rnode_143to144_bb1__13_i71_0_valid_out_0_reg_144_NO_SHIFT_REG),
	.stall_out(rnode_143to144_bb1__13_i71_0_stall_out_reg_144_NO_SHIFT_REG),
	.data_in(rnode_142to143_bb1__13_i71_0_NO_SHIFT_REG),
	.data_out(rnode_143to144_bb1__13_i71_0_reg_144_NO_SHIFT_REG)
);

defparam rnode_143to144_bb1__13_i71_0_reg_144_fifo.DEPTH = 1;
defparam rnode_143to144_bb1__13_i71_0_reg_144_fifo.DATA_WIDTH = 1;
defparam rnode_143to144_bb1__13_i71_0_reg_144_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_143to144_bb1__13_i71_0_reg_144_fifo.IMPL = "shift_reg";

assign rnode_143to144_bb1__13_i71_0_reg_144_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_142to143_bb1__13_i71_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_143to144_bb1__13_i71_0_stall_in_0_reg_144_NO_SHIFT_REG = 1'b0;
assign rnode_143to144_bb1__13_i71_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_143to144_bb1__13_i71_0_NO_SHIFT_REG = rnode_143to144_bb1__13_i71_0_reg_144_NO_SHIFT_REG;
assign rnode_143to144_bb1__13_i71_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_143to144_bb1__13_i71_1_NO_SHIFT_REG = rnode_143to144_bb1__13_i71_0_reg_144_NO_SHIFT_REG;
assign rnode_143to144_bb1__13_i71_0_valid_out_2_NO_SHIFT_REG = 1'b1;
assign rnode_143to144_bb1__13_i71_2_NO_SHIFT_REG = rnode_143to144_bb1__13_i71_0_reg_144_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_143to144_bb1_var__u19_0_valid_out_NO_SHIFT_REG;
 logic rnode_143to144_bb1_var__u19_0_stall_in_NO_SHIFT_REG;
 logic rnode_143to144_bb1_var__u19_0_NO_SHIFT_REG;
 logic rnode_143to144_bb1_var__u19_0_reg_144_inputs_ready_NO_SHIFT_REG;
 logic rnode_143to144_bb1_var__u19_0_reg_144_NO_SHIFT_REG;
 logic rnode_143to144_bb1_var__u19_0_valid_out_reg_144_NO_SHIFT_REG;
 logic rnode_143to144_bb1_var__u19_0_stall_in_reg_144_NO_SHIFT_REG;
 logic rnode_143to144_bb1_var__u19_0_stall_out_reg_144_NO_SHIFT_REG;

acl_data_fifo rnode_143to144_bb1_var__u19_0_reg_144_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_143to144_bb1_var__u19_0_reg_144_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_143to144_bb1_var__u19_0_stall_in_reg_144_NO_SHIFT_REG),
	.valid_out(rnode_143to144_bb1_var__u19_0_valid_out_reg_144_NO_SHIFT_REG),
	.stall_out(rnode_143to144_bb1_var__u19_0_stall_out_reg_144_NO_SHIFT_REG),
	.data_in(rnode_142to143_bb1_var__u19_0_NO_SHIFT_REG),
	.data_out(rnode_143to144_bb1_var__u19_0_reg_144_NO_SHIFT_REG)
);

defparam rnode_143to144_bb1_var__u19_0_reg_144_fifo.DEPTH = 1;
defparam rnode_143to144_bb1_var__u19_0_reg_144_fifo.DATA_WIDTH = 1;
defparam rnode_143to144_bb1_var__u19_0_reg_144_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_143to144_bb1_var__u19_0_reg_144_fifo.IMPL = "shift_reg";

assign rnode_143to144_bb1_var__u19_0_reg_144_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_142to143_bb1_var__u19_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_143to144_bb1_var__u19_0_NO_SHIFT_REG = rnode_143to144_bb1_var__u19_0_reg_144_NO_SHIFT_REG;
assign rnode_143to144_bb1_var__u19_0_stall_in_reg_144_NO_SHIFT_REG = 1'b0;
assign rnode_143to144_bb1_var__u19_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_142to143_bb1_and179_i138_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_142to143_bb1_and179_i138_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_142to143_bb1_and179_i138_0_NO_SHIFT_REG;
 logic rnode_142to143_bb1_and179_i138_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_142to143_bb1_and179_i138_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_142to143_bb1_and179_i138_1_NO_SHIFT_REG;
 logic rnode_142to143_bb1_and179_i138_0_valid_out_2_NO_SHIFT_REG;
 logic rnode_142to143_bb1_and179_i138_0_stall_in_2_NO_SHIFT_REG;
 logic [31:0] rnode_142to143_bb1_and179_i138_2_NO_SHIFT_REG;
 logic rnode_142to143_bb1_and179_i138_0_reg_143_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_142to143_bb1_and179_i138_0_reg_143_NO_SHIFT_REG;
 logic rnode_142to143_bb1_and179_i138_0_valid_out_0_reg_143_NO_SHIFT_REG;
 logic rnode_142to143_bb1_and179_i138_0_stall_in_0_reg_143_NO_SHIFT_REG;
 logic rnode_142to143_bb1_and179_i138_0_stall_out_reg_143_NO_SHIFT_REG;

acl_data_fifo rnode_142to143_bb1_and179_i138_0_reg_143_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_142to143_bb1_and179_i138_0_reg_143_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_142to143_bb1_and179_i138_0_stall_in_0_reg_143_NO_SHIFT_REG),
	.valid_out(rnode_142to143_bb1_and179_i138_0_valid_out_0_reg_143_NO_SHIFT_REG),
	.stall_out(rnode_142to143_bb1_and179_i138_0_stall_out_reg_143_NO_SHIFT_REG),
	.data_in((local_bb1_and179_i138 & 32'hFFFFFFF)),
	.data_out(rnode_142to143_bb1_and179_i138_0_reg_143_NO_SHIFT_REG)
);

defparam rnode_142to143_bb1_and179_i138_0_reg_143_fifo.DEPTH = 1;
defparam rnode_142to143_bb1_and179_i138_0_reg_143_fifo.DATA_WIDTH = 32;
defparam rnode_142to143_bb1_and179_i138_0_reg_143_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_142to143_bb1_and179_i138_0_reg_143_fifo.IMPL = "shift_reg";

assign rnode_142to143_bb1_and179_i138_0_reg_143_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_and179_i138_stall_in = 1'b0;
assign rnode_142to143_bb1_and179_i138_0_stall_in_0_reg_143_NO_SHIFT_REG = 1'b0;
assign rnode_142to143_bb1_and179_i138_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_142to143_bb1_and179_i138_0_NO_SHIFT_REG = rnode_142to143_bb1_and179_i138_0_reg_143_NO_SHIFT_REG;
assign rnode_142to143_bb1_and179_i138_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_142to143_bb1_and179_i138_1_NO_SHIFT_REG = rnode_142to143_bb1_and179_i138_0_reg_143_NO_SHIFT_REG;
assign rnode_142to143_bb1_and179_i138_0_valid_out_2_NO_SHIFT_REG = 1'b1;
assign rnode_142to143_bb1_and179_i138_2_NO_SHIFT_REG = rnode_142to143_bb1_and179_i138_0_reg_143_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_142to143_bb1_and181_i139_0_valid_out_NO_SHIFT_REG;
 logic rnode_142to143_bb1_and181_i139_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_142to143_bb1_and181_i139_0_NO_SHIFT_REG;
 logic rnode_142to143_bb1_and181_i139_0_reg_143_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_142to143_bb1_and181_i139_0_reg_143_NO_SHIFT_REG;
 logic rnode_142to143_bb1_and181_i139_0_valid_out_reg_143_NO_SHIFT_REG;
 logic rnode_142to143_bb1_and181_i139_0_stall_in_reg_143_NO_SHIFT_REG;
 logic rnode_142to143_bb1_and181_i139_0_stall_out_reg_143_NO_SHIFT_REG;

acl_data_fifo rnode_142to143_bb1_and181_i139_0_reg_143_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_142to143_bb1_and181_i139_0_reg_143_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_142to143_bb1_and181_i139_0_stall_in_reg_143_NO_SHIFT_REG),
	.valid_out(rnode_142to143_bb1_and181_i139_0_valid_out_reg_143_NO_SHIFT_REG),
	.stall_out(rnode_142to143_bb1_and181_i139_0_stall_out_reg_143_NO_SHIFT_REG),
	.data_in((local_bb1_and181_i139 & 32'h1F)),
	.data_out(rnode_142to143_bb1_and181_i139_0_reg_143_NO_SHIFT_REG)
);

defparam rnode_142to143_bb1_and181_i139_0_reg_143_fifo.DEPTH = 1;
defparam rnode_142to143_bb1_and181_i139_0_reg_143_fifo.DATA_WIDTH = 32;
defparam rnode_142to143_bb1_and181_i139_0_reg_143_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_142to143_bb1_and181_i139_0_reg_143_fifo.IMPL = "shift_reg";

assign rnode_142to143_bb1_and181_i139_0_reg_143_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_and181_i139_stall_in = 1'b0;
assign rnode_142to143_bb1_and181_i139_0_NO_SHIFT_REG = rnode_142to143_bb1_and181_i139_0_reg_143_NO_SHIFT_REG;
assign rnode_142to143_bb1_and181_i139_0_stall_in_reg_143_NO_SHIFT_REG = 1'b0;
assign rnode_142to143_bb1_and181_i139_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_142to143_bb1_and184_i140_0_valid_out_NO_SHIFT_REG;
 logic rnode_142to143_bb1_and184_i140_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_142to143_bb1_and184_i140_0_NO_SHIFT_REG;
 logic rnode_142to143_bb1_and184_i140_0_reg_143_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_142to143_bb1_and184_i140_0_reg_143_NO_SHIFT_REG;
 logic rnode_142to143_bb1_and184_i140_0_valid_out_reg_143_NO_SHIFT_REG;
 logic rnode_142to143_bb1_and184_i140_0_stall_in_reg_143_NO_SHIFT_REG;
 logic rnode_142to143_bb1_and184_i140_0_stall_out_reg_143_NO_SHIFT_REG;

acl_data_fifo rnode_142to143_bb1_and184_i140_0_reg_143_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_142to143_bb1_and184_i140_0_reg_143_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_142to143_bb1_and184_i140_0_stall_in_reg_143_NO_SHIFT_REG),
	.valid_out(rnode_142to143_bb1_and184_i140_0_valid_out_reg_143_NO_SHIFT_REG),
	.stall_out(rnode_142to143_bb1_and184_i140_0_stall_out_reg_143_NO_SHIFT_REG),
	.data_in((local_bb1_and184_i140 & 32'h1)),
	.data_out(rnode_142to143_bb1_and184_i140_0_reg_143_NO_SHIFT_REG)
);

defparam rnode_142to143_bb1_and184_i140_0_reg_143_fifo.DEPTH = 1;
defparam rnode_142to143_bb1_and184_i140_0_reg_143_fifo.DATA_WIDTH = 32;
defparam rnode_142to143_bb1_and184_i140_0_reg_143_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_142to143_bb1_and184_i140_0_reg_143_fifo.IMPL = "shift_reg";

assign rnode_142to143_bb1_and184_i140_0_reg_143_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_and184_i140_stall_in = 1'b0;
assign rnode_142to143_bb1_and184_i140_0_NO_SHIFT_REG = rnode_142to143_bb1_and184_i140_0_reg_143_NO_SHIFT_REG;
assign rnode_142to143_bb1_and184_i140_0_stall_in_reg_143_NO_SHIFT_REG = 1'b0;
assign rnode_142to143_bb1_and184_i140_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb1_shr_i_i142_stall_local;
wire [31:0] local_bb1_shr_i_i142;

assign local_bb1_shr_i_i142 = ((local_bb1_and187_i141 & 32'h7FFFFFF) >> 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb1_cond260_i196_stall_local;
wire [31:0] local_bb1_cond260_i196;

assign local_bb1_cond260_i196 = (rnode_143to144_bb1__13_i71_1_NO_SHIFT_REG ? 32'h400000 : 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_shr200_i161_stall_local;
wire [31:0] local_bb1_shr200_i161;

assign local_bb1_shr200_i161 = ((rnode_142to143_bb1_and179_i138_1_NO_SHIFT_REG & 32'hFFFFFFF) >> 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb1_var__u24_stall_local;
wire [31:0] local_bb1_var__u24;

assign local_bb1_var__u24 = ((rnode_142to143_bb1_and181_i139_0_NO_SHIFT_REG & 32'h1F) & 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb1_or_i_i143_stall_local;
wire [31:0] local_bb1_or_i_i143;

assign local_bb1_or_i_i143 = ((local_bb1_shr_i_i142 & 32'h3FFFFFF) | (local_bb1_and187_i141 & 32'h7FFFFFF));

// This section implements an unregistered operation.
// 
wire local_bb1_or203_i162_stall_local;
wire [31:0] local_bb1_or203_i162;

assign local_bb1_or203_i162 = ((local_bb1_shr200_i161 & 32'h7FFFFFF) | (rnode_142to143_bb1_and184_i140_0_NO_SHIFT_REG & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb1_tobool198_i160_stall_local;
wire local_bb1_tobool198_i160;

assign local_bb1_tobool198_i160 = ((local_bb1_var__u24 & 32'h1) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_shr1_i_i144_stall_local;
wire [31:0] local_bb1_shr1_i_i144;

assign local_bb1_shr1_i_i144 = ((local_bb1_or_i_i143 & 32'h7FFFFFF) >> 32'h2);

// This section implements an unregistered operation.
// 
wire local_bb1__26_i164_stall_local;
wire local_bb1__26_i164;

assign local_bb1__26_i164 = (local_bb1_tobool198_i160 & local_bb1_not_cmp37_i163);

// This section implements an unregistered operation.
// 
wire local_bb1_or2_i_i145_stall_local;
wire [31:0] local_bb1_or2_i_i145;

assign local_bb1_or2_i_i145 = ((local_bb1_shr1_i_i144 & 32'h1FFFFFF) | (local_bb1_or_i_i143 & 32'h7FFFFFF));

// This section implements an unregistered operation.
// 
wire local_bb1__27_i165_stall_local;
wire [31:0] local_bb1__27_i165;

assign local_bb1__27_i165 = (local_bb1__26_i164 ? 32'h0 : (local_bb1_var__u24 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb1__29_i166_stall_local;
wire [31:0] local_bb1__29_i166;

assign local_bb1__29_i166 = (local_bb1__26_i164 ? (rnode_142to143_bb1_and179_i138_2_NO_SHIFT_REG & 32'hFFFFFFF) : (local_bb1_or203_i162 & 32'h7FFFFFF));

// This section implements an unregistered operation.
// 
wire local_bb1_shr3_i_i146_stall_local;
wire [31:0] local_bb1_shr3_i_i146;

assign local_bb1_shr3_i_i146 = ((local_bb1_or2_i_i145 & 32'h7FFFFFF) >> 32'h4);

// This section implements an unregistered operation.
// 
wire local_bb1_or4_i_i147_stall_local;
wire [31:0] local_bb1_or4_i_i147;

assign local_bb1_or4_i_i147 = ((local_bb1_shr3_i_i146 & 32'h7FFFFF) | (local_bb1_or2_i_i145 & 32'h7FFFFFF));

// This section implements an unregistered operation.
// 
wire local_bb1_shr5_i_i148_stall_local;
wire [31:0] local_bb1_shr5_i_i148;

assign local_bb1_shr5_i_i148 = ((local_bb1_or4_i_i147 & 32'h7FFFFFF) >> 32'h8);

// This section implements an unregistered operation.
// 
wire local_bb1_or6_i_i149_stall_local;
wire [31:0] local_bb1_or6_i_i149;

assign local_bb1_or6_i_i149 = ((local_bb1_shr5_i_i148 & 32'h7FFFF) | (local_bb1_or4_i_i147 & 32'h7FFFFFF));

// This section implements an unregistered operation.
// 
wire local_bb1_shr7_i_i150_stall_local;
wire [31:0] local_bb1_shr7_i_i150;

assign local_bb1_shr7_i_i150 = ((local_bb1_or6_i_i149 & 32'h7FFFFFF) >> 32'h10);

// This section implements an unregistered operation.
// 
wire local_bb1_or8_i_i151_stall_local;
wire [31:0] local_bb1_or8_i_i151;

assign local_bb1_or8_i_i151 = ((local_bb1_shr7_i_i150 & 32'h7FF) | (local_bb1_or6_i_i149 & 32'h7FFFFFF));

// This section implements an unregistered operation.
// 
wire local_bb1_and_i_i152_stall_local;
wire [31:0] local_bb1_and_i_i152;

assign local_bb1_and_i_i152 = ((local_bb1_or8_i_i151 & 32'h7FFFFFF) ^ 32'h7FFFFFF);

// This section implements an unregistered operation.
// 
wire local_bb1__and_i_i152_valid_out;
wire local_bb1__and_i_i152_stall_in;
wire local_bb1__and_i_i152_inputs_ready;
wire local_bb1__and_i_i152_stall_local;
wire [31:0] local_bb1__and_i_i152;

thirtysix_six_comp local_bb1__and_i_i152_popcnt_instance (
	.data((local_bb1_and_i_i152 & 32'h1FFFFFFF)),
	.sum(local_bb1__and_i_i152)
);


assign local_bb1__and_i_i152_inputs_ready = rnode_141to142_bb1_add178_i137_0_valid_out_3_NO_SHIFT_REG;
assign local_bb1__and_i_i152_valid_out = 1'b1;
assign rnode_141to142_bb1_add178_i137_0_stall_in_3_NO_SHIFT_REG = 1'b0;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_142to143_bb1__and_i_i152_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_142to143_bb1__and_i_i152_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_142to143_bb1__and_i_i152_0_NO_SHIFT_REG;
 logic rnode_142to143_bb1__and_i_i152_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_142to143_bb1__and_i_i152_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_142to143_bb1__and_i_i152_1_NO_SHIFT_REG;
 logic rnode_142to143_bb1__and_i_i152_0_valid_out_2_NO_SHIFT_REG;
 logic rnode_142to143_bb1__and_i_i152_0_stall_in_2_NO_SHIFT_REG;
 logic [31:0] rnode_142to143_bb1__and_i_i152_2_NO_SHIFT_REG;
 logic rnode_142to143_bb1__and_i_i152_0_reg_143_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_142to143_bb1__and_i_i152_0_reg_143_NO_SHIFT_REG;
 logic rnode_142to143_bb1__and_i_i152_0_valid_out_0_reg_143_NO_SHIFT_REG;
 logic rnode_142to143_bb1__and_i_i152_0_stall_in_0_reg_143_NO_SHIFT_REG;
 logic rnode_142to143_bb1__and_i_i152_0_stall_out_reg_143_NO_SHIFT_REG;

acl_data_fifo rnode_142to143_bb1__and_i_i152_0_reg_143_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_142to143_bb1__and_i_i152_0_reg_143_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_142to143_bb1__and_i_i152_0_stall_in_0_reg_143_NO_SHIFT_REG),
	.valid_out(rnode_142to143_bb1__and_i_i152_0_valid_out_0_reg_143_NO_SHIFT_REG),
	.stall_out(rnode_142to143_bb1__and_i_i152_0_stall_out_reg_143_NO_SHIFT_REG),
	.data_in((local_bb1__and_i_i152 & 32'h3F)),
	.data_out(rnode_142to143_bb1__and_i_i152_0_reg_143_NO_SHIFT_REG)
);

defparam rnode_142to143_bb1__and_i_i152_0_reg_143_fifo.DEPTH = 1;
defparam rnode_142to143_bb1__and_i_i152_0_reg_143_fifo.DATA_WIDTH = 32;
defparam rnode_142to143_bb1__and_i_i152_0_reg_143_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_142to143_bb1__and_i_i152_0_reg_143_fifo.IMPL = "shift_reg";

assign rnode_142to143_bb1__and_i_i152_0_reg_143_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1__and_i_i152_stall_in = 1'b0;
assign rnode_142to143_bb1__and_i_i152_0_stall_in_0_reg_143_NO_SHIFT_REG = 1'b0;
assign rnode_142to143_bb1__and_i_i152_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_142to143_bb1__and_i_i152_0_NO_SHIFT_REG = rnode_142to143_bb1__and_i_i152_0_reg_143_NO_SHIFT_REG;
assign rnode_142to143_bb1__and_i_i152_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_142to143_bb1__and_i_i152_1_NO_SHIFT_REG = rnode_142to143_bb1__and_i_i152_0_reg_143_NO_SHIFT_REG;
assign rnode_142to143_bb1__and_i_i152_0_valid_out_2_NO_SHIFT_REG = 1'b1;
assign rnode_142to143_bb1__and_i_i152_2_NO_SHIFT_REG = rnode_142to143_bb1__and_i_i152_0_reg_143_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb1_and9_i_i153_stall_local;
wire [31:0] local_bb1_and9_i_i153;

assign local_bb1_and9_i_i153 = ((rnode_142to143_bb1__and_i_i152_0_NO_SHIFT_REG & 32'h3F) & 32'h1F);

// This section implements an unregistered operation.
// 
wire local_bb1_and189_i154_stall_local;
wire [31:0] local_bb1_and189_i154;

assign local_bb1_and189_i154 = ((rnode_142to143_bb1__and_i_i152_1_NO_SHIFT_REG & 32'h3F) & 32'h18);

// This section implements an unregistered operation.
// 
wire local_bb1_and192_i156_stall_local;
wire [31:0] local_bb1_and192_i156;

assign local_bb1_and192_i156 = ((rnode_142to143_bb1__and_i_i152_2_NO_SHIFT_REG & 32'h3F) & 32'h7);

// This section implements an unregistered operation.
// 
wire local_bb1_sub219_i173_stall_local;
wire [31:0] local_bb1_sub219_i173;

assign local_bb1_sub219_i173 = (32'h0 - (local_bb1_and9_i_i153 & 32'h1F));

// This section implements an unregistered operation.
// 
wire local_bb1_shl190_i155_stall_local;
wire [31:0] local_bb1_shl190_i155;

assign local_bb1_shl190_i155 = ((rnode_142to143_bb1_and179_i138_0_NO_SHIFT_REG & 32'hFFFFFFF) << (local_bb1_and189_i154 & 32'h18));

// This section implements an unregistered operation.
// 
wire local_bb1_cond224_i174_stall_local;
wire [31:0] local_bb1_cond224_i174;

assign local_bb1_cond224_i174 = (rnode_141to143_bb1_cmp37_i59_2_NO_SHIFT_REG ? local_bb1_sub219_i173 : (local_bb1__27_i165 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb1_and191_i157_stall_local;
wire [31:0] local_bb1_and191_i157;

assign local_bb1_and191_i157 = (local_bb1_shl190_i155 & 32'h7FFFFFF);

// This section implements an unregistered operation.
// 
wire local_bb1_add225_i175_stall_local;
wire [31:0] local_bb1_add225_i175;

assign local_bb1_add225_i175 = (local_bb1_cond224_i174 + (rnode_141to143_bb1_and17_i48_0_NO_SHIFT_REG & 32'hFF));

// This section implements an unregistered operation.
// 
wire local_bb1_fold_i178_stall_local;
wire [31:0] local_bb1_fold_i178;

assign local_bb1_fold_i178 = (local_bb1_cond224_i174 + (rnode_141to143_bb1_shr16_i47_0_NO_SHIFT_REG & 32'h1FF));

// This section implements an unregistered operation.
// 
wire local_bb1_shl193_i158_stall_local;
wire [31:0] local_bb1_shl193_i158;

assign local_bb1_shl193_i158 = ((local_bb1_and191_i157 & 32'h7FFFFFF) << (local_bb1_and192_i156 & 32'h7));

// This section implements an unregistered operation.
// 
wire local_bb1_and230_i179_stall_local;
wire [31:0] local_bb1_and230_i179;

assign local_bb1_and230_i179 = (local_bb1_fold_i178 & 32'hFF);

// This section implements an unregistered operation.
// 
wire local_bb1_and194_i159_stall_local;
wire [31:0] local_bb1_and194_i159;

assign local_bb1_and194_i159 = (local_bb1_shl193_i158 & 32'h7FFFFFF);

// This section implements an unregistered operation.
// 
wire local_bb1__30_i167_stall_local;
wire [31:0] local_bb1__30_i167;

assign local_bb1__30_i167 = (rnode_141to143_bb1_cmp37_i59_1_NO_SHIFT_REG ? (local_bb1_and194_i159 & 32'h7FFFFFF) : (local_bb1__29_i166 & 32'hFFFFFFF));

// This section implements an unregistered operation.
// 
wire local_bb1_and209_i168_stall_local;
wire [31:0] local_bb1_and209_i168;

assign local_bb1_and209_i168 = ((local_bb1__30_i167 & 32'hFFFFFFF) & 32'h7FFFFFF);

// This section implements an unregistered operation.
// 
wire local_bb1_and245_i186_stall_local;
wire [31:0] local_bb1_and245_i186;

assign local_bb1_and245_i186 = ((local_bb1__30_i167 & 32'hFFFFFFF) & 32'h7);

// This section implements an unregistered operation.
// 
wire local_bb1_shr246_i187_stall_local;
wire [31:0] local_bb1_shr246_i187;

assign local_bb1_shr246_i187 = ((local_bb1__30_i167 & 32'hFFFFFFF) >> 32'h3);

// This section implements an unregistered operation.
// 
wire local_bb1_cmp210_i169_stall_local;
wire local_bb1_cmp210_i169;

assign local_bb1_cmp210_i169 = ((local_bb1_and209_i168 & 32'h7FFFFFF) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_cmp264_i200_stall_local;
wire local_bb1_cmp264_i200;

assign local_bb1_cmp264_i200 = ((local_bb1_and245_i186 & 32'h7) > 32'h4);

// This section implements an unregistered operation.
// 
wire local_bb1_and230_i179_valid_out;
wire local_bb1_and230_i179_stall_in;
wire local_bb1_add225_i175_valid_out;
wire local_bb1_add225_i175_stall_in;
wire local_bb1_not_cmp37_i163_valid_out_1;
wire local_bb1_not_cmp37_i163_stall_in_1;
wire local_bb1_shr246_i187_valid_out;
wire local_bb1_shr246_i187_stall_in;
wire local_bb1_cmp210_i169_valid_out;
wire local_bb1_cmp210_i169_stall_in;
wire local_bb1_cmp264_i200_valid_out;
wire local_bb1_cmp264_i200_stall_in;
wire local_bb1_cmp266_i201_valid_out;
wire local_bb1_cmp266_i201_stall_in;
wire local_bb1_cmp266_i201_inputs_ready;
wire local_bb1_cmp266_i201_stall_local;
wire local_bb1_cmp266_i201;

assign local_bb1_cmp266_i201_inputs_ready = (rnode_141to143_bb1_shr16_i47_0_valid_out_NO_SHIFT_REG & rnode_141to143_bb1_cmp37_i59_0_valid_out_2_NO_SHIFT_REG & rnode_141to143_bb1_and17_i48_0_valid_out_NO_SHIFT_REG & rnode_141to143_bb1_cmp37_i59_0_valid_out_0_NO_SHIFT_REG & rnode_142to143_bb1_and179_i138_0_valid_out_2_NO_SHIFT_REG & rnode_141to143_bb1_cmp37_i59_0_valid_out_1_NO_SHIFT_REG & rnode_142to143_bb1_and181_i139_0_valid_out_NO_SHIFT_REG & rnode_142to143_bb1_and179_i138_0_valid_out_1_NO_SHIFT_REG & rnode_142to143_bb1_and184_i140_0_valid_out_NO_SHIFT_REG & rnode_142to143_bb1_and179_i138_0_valid_out_0_NO_SHIFT_REG & rnode_142to143_bb1__and_i_i152_0_valid_out_1_NO_SHIFT_REG & rnode_142to143_bb1__and_i_i152_0_valid_out_2_NO_SHIFT_REG & rnode_142to143_bb1__and_i_i152_0_valid_out_0_NO_SHIFT_REG);
assign local_bb1_cmp266_i201 = ((local_bb1_and245_i186 & 32'h7) == 32'h4);
assign local_bb1_and230_i179_valid_out = 1'b1;
assign local_bb1_add225_i175_valid_out = 1'b1;
assign local_bb1_not_cmp37_i163_valid_out_1 = 1'b1;
assign local_bb1_shr246_i187_valid_out = 1'b1;
assign local_bb1_cmp210_i169_valid_out = 1'b1;
assign local_bb1_cmp264_i200_valid_out = 1'b1;
assign local_bb1_cmp266_i201_valid_out = 1'b1;
assign rnode_141to143_bb1_shr16_i47_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_141to143_bb1_cmp37_i59_0_stall_in_2_NO_SHIFT_REG = 1'b0;
assign rnode_141to143_bb1_and17_i48_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_141to143_bb1_cmp37_i59_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_142to143_bb1_and179_i138_0_stall_in_2_NO_SHIFT_REG = 1'b0;
assign rnode_141to143_bb1_cmp37_i59_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_142to143_bb1_and181_i139_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_142to143_bb1_and179_i138_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_142to143_bb1_and184_i140_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_142to143_bb1_and179_i138_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_142to143_bb1__and_i_i152_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_142to143_bb1__and_i_i152_0_stall_in_2_NO_SHIFT_REG = 1'b0;
assign rnode_142to143_bb1__and_i_i152_0_stall_in_0_NO_SHIFT_REG = 1'b0;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_143to144_bb1_and230_i179_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_143to144_bb1_and230_i179_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_143to144_bb1_and230_i179_0_NO_SHIFT_REG;
 logic rnode_143to144_bb1_and230_i179_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_143to144_bb1_and230_i179_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_143to144_bb1_and230_i179_1_NO_SHIFT_REG;
 logic rnode_143to144_bb1_and230_i179_0_reg_144_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_143to144_bb1_and230_i179_0_reg_144_NO_SHIFT_REG;
 logic rnode_143to144_bb1_and230_i179_0_valid_out_0_reg_144_NO_SHIFT_REG;
 logic rnode_143to144_bb1_and230_i179_0_stall_in_0_reg_144_NO_SHIFT_REG;
 logic rnode_143to144_bb1_and230_i179_0_stall_out_reg_144_NO_SHIFT_REG;

acl_data_fifo rnode_143to144_bb1_and230_i179_0_reg_144_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_143to144_bb1_and230_i179_0_reg_144_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_143to144_bb1_and230_i179_0_stall_in_0_reg_144_NO_SHIFT_REG),
	.valid_out(rnode_143to144_bb1_and230_i179_0_valid_out_0_reg_144_NO_SHIFT_REG),
	.stall_out(rnode_143to144_bb1_and230_i179_0_stall_out_reg_144_NO_SHIFT_REG),
	.data_in((local_bb1_and230_i179 & 32'hFF)),
	.data_out(rnode_143to144_bb1_and230_i179_0_reg_144_NO_SHIFT_REG)
);

defparam rnode_143to144_bb1_and230_i179_0_reg_144_fifo.DEPTH = 1;
defparam rnode_143to144_bb1_and230_i179_0_reg_144_fifo.DATA_WIDTH = 32;
defparam rnode_143to144_bb1_and230_i179_0_reg_144_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_143to144_bb1_and230_i179_0_reg_144_fifo.IMPL = "shift_reg";

assign rnode_143to144_bb1_and230_i179_0_reg_144_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_and230_i179_stall_in = 1'b0;
assign rnode_143to144_bb1_and230_i179_0_stall_in_0_reg_144_NO_SHIFT_REG = 1'b0;
assign rnode_143to144_bb1_and230_i179_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_143to144_bb1_and230_i179_0_NO_SHIFT_REG = rnode_143to144_bb1_and230_i179_0_reg_144_NO_SHIFT_REG;
assign rnode_143to144_bb1_and230_i179_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_143to144_bb1_and230_i179_1_NO_SHIFT_REG = rnode_143to144_bb1_and230_i179_0_reg_144_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_143to144_bb1_add225_i175_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_143to144_bb1_add225_i175_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_143to144_bb1_add225_i175_0_NO_SHIFT_REG;
 logic rnode_143to144_bb1_add225_i175_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_143to144_bb1_add225_i175_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_143to144_bb1_add225_i175_1_NO_SHIFT_REG;
 logic rnode_143to144_bb1_add225_i175_0_reg_144_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_143to144_bb1_add225_i175_0_reg_144_NO_SHIFT_REG;
 logic rnode_143to144_bb1_add225_i175_0_valid_out_0_reg_144_NO_SHIFT_REG;
 logic rnode_143to144_bb1_add225_i175_0_stall_in_0_reg_144_NO_SHIFT_REG;
 logic rnode_143to144_bb1_add225_i175_0_stall_out_reg_144_NO_SHIFT_REG;

acl_data_fifo rnode_143to144_bb1_add225_i175_0_reg_144_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_143to144_bb1_add225_i175_0_reg_144_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_143to144_bb1_add225_i175_0_stall_in_0_reg_144_NO_SHIFT_REG),
	.valid_out(rnode_143to144_bb1_add225_i175_0_valid_out_0_reg_144_NO_SHIFT_REG),
	.stall_out(rnode_143to144_bb1_add225_i175_0_stall_out_reg_144_NO_SHIFT_REG),
	.data_in(local_bb1_add225_i175),
	.data_out(rnode_143to144_bb1_add225_i175_0_reg_144_NO_SHIFT_REG)
);

defparam rnode_143to144_bb1_add225_i175_0_reg_144_fifo.DEPTH = 1;
defparam rnode_143to144_bb1_add225_i175_0_reg_144_fifo.DATA_WIDTH = 32;
defparam rnode_143to144_bb1_add225_i175_0_reg_144_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_143to144_bb1_add225_i175_0_reg_144_fifo.IMPL = "shift_reg";

assign rnode_143to144_bb1_add225_i175_0_reg_144_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_add225_i175_stall_in = 1'b0;
assign rnode_143to144_bb1_add225_i175_0_stall_in_0_reg_144_NO_SHIFT_REG = 1'b0;
assign rnode_143to144_bb1_add225_i175_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_143to144_bb1_add225_i175_0_NO_SHIFT_REG = rnode_143to144_bb1_add225_i175_0_reg_144_NO_SHIFT_REG;
assign rnode_143to144_bb1_add225_i175_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_143to144_bb1_add225_i175_1_NO_SHIFT_REG = rnode_143to144_bb1_add225_i175_0_reg_144_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_143to144_bb1_not_cmp37_i163_0_valid_out_NO_SHIFT_REG;
 logic rnode_143to144_bb1_not_cmp37_i163_0_stall_in_NO_SHIFT_REG;
 logic rnode_143to144_bb1_not_cmp37_i163_0_NO_SHIFT_REG;
 logic rnode_143to144_bb1_not_cmp37_i163_0_reg_144_inputs_ready_NO_SHIFT_REG;
 logic rnode_143to144_bb1_not_cmp37_i163_0_reg_144_NO_SHIFT_REG;
 logic rnode_143to144_bb1_not_cmp37_i163_0_valid_out_reg_144_NO_SHIFT_REG;
 logic rnode_143to144_bb1_not_cmp37_i163_0_stall_in_reg_144_NO_SHIFT_REG;
 logic rnode_143to144_bb1_not_cmp37_i163_0_stall_out_reg_144_NO_SHIFT_REG;

acl_data_fifo rnode_143to144_bb1_not_cmp37_i163_0_reg_144_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_143to144_bb1_not_cmp37_i163_0_reg_144_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_143to144_bb1_not_cmp37_i163_0_stall_in_reg_144_NO_SHIFT_REG),
	.valid_out(rnode_143to144_bb1_not_cmp37_i163_0_valid_out_reg_144_NO_SHIFT_REG),
	.stall_out(rnode_143to144_bb1_not_cmp37_i163_0_stall_out_reg_144_NO_SHIFT_REG),
	.data_in(local_bb1_not_cmp37_i163),
	.data_out(rnode_143to144_bb1_not_cmp37_i163_0_reg_144_NO_SHIFT_REG)
);

defparam rnode_143to144_bb1_not_cmp37_i163_0_reg_144_fifo.DEPTH = 1;
defparam rnode_143to144_bb1_not_cmp37_i163_0_reg_144_fifo.DATA_WIDTH = 1;
defparam rnode_143to144_bb1_not_cmp37_i163_0_reg_144_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_143to144_bb1_not_cmp37_i163_0_reg_144_fifo.IMPL = "shift_reg";

assign rnode_143to144_bb1_not_cmp37_i163_0_reg_144_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_not_cmp37_i163_stall_in_1 = 1'b0;
assign rnode_143to144_bb1_not_cmp37_i163_0_NO_SHIFT_REG = rnode_143to144_bb1_not_cmp37_i163_0_reg_144_NO_SHIFT_REG;
assign rnode_143to144_bb1_not_cmp37_i163_0_stall_in_reg_144_NO_SHIFT_REG = 1'b0;
assign rnode_143to144_bb1_not_cmp37_i163_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_143to144_bb1_shr246_i187_0_valid_out_NO_SHIFT_REG;
 logic rnode_143to144_bb1_shr246_i187_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_143to144_bb1_shr246_i187_0_NO_SHIFT_REG;
 logic rnode_143to144_bb1_shr246_i187_0_reg_144_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_143to144_bb1_shr246_i187_0_reg_144_NO_SHIFT_REG;
 logic rnode_143to144_bb1_shr246_i187_0_valid_out_reg_144_NO_SHIFT_REG;
 logic rnode_143to144_bb1_shr246_i187_0_stall_in_reg_144_NO_SHIFT_REG;
 logic rnode_143to144_bb1_shr246_i187_0_stall_out_reg_144_NO_SHIFT_REG;

acl_data_fifo rnode_143to144_bb1_shr246_i187_0_reg_144_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_143to144_bb1_shr246_i187_0_reg_144_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_143to144_bb1_shr246_i187_0_stall_in_reg_144_NO_SHIFT_REG),
	.valid_out(rnode_143to144_bb1_shr246_i187_0_valid_out_reg_144_NO_SHIFT_REG),
	.stall_out(rnode_143to144_bb1_shr246_i187_0_stall_out_reg_144_NO_SHIFT_REG),
	.data_in((local_bb1_shr246_i187 & 32'h1FFFFFF)),
	.data_out(rnode_143to144_bb1_shr246_i187_0_reg_144_NO_SHIFT_REG)
);

defparam rnode_143to144_bb1_shr246_i187_0_reg_144_fifo.DEPTH = 1;
defparam rnode_143to144_bb1_shr246_i187_0_reg_144_fifo.DATA_WIDTH = 32;
defparam rnode_143to144_bb1_shr246_i187_0_reg_144_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_143to144_bb1_shr246_i187_0_reg_144_fifo.IMPL = "shift_reg";

assign rnode_143to144_bb1_shr246_i187_0_reg_144_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_shr246_i187_stall_in = 1'b0;
assign rnode_143to144_bb1_shr246_i187_0_NO_SHIFT_REG = rnode_143to144_bb1_shr246_i187_0_reg_144_NO_SHIFT_REG;
assign rnode_143to144_bb1_shr246_i187_0_stall_in_reg_144_NO_SHIFT_REG = 1'b0;
assign rnode_143to144_bb1_shr246_i187_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_143to144_bb1_cmp210_i169_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_143to144_bb1_cmp210_i169_0_stall_in_0_NO_SHIFT_REG;
 logic rnode_143to144_bb1_cmp210_i169_0_NO_SHIFT_REG;
 logic rnode_143to144_bb1_cmp210_i169_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_143to144_bb1_cmp210_i169_0_stall_in_1_NO_SHIFT_REG;
 logic rnode_143to144_bb1_cmp210_i169_1_NO_SHIFT_REG;
 logic rnode_143to144_bb1_cmp210_i169_0_reg_144_inputs_ready_NO_SHIFT_REG;
 logic rnode_143to144_bb1_cmp210_i169_0_reg_144_NO_SHIFT_REG;
 logic rnode_143to144_bb1_cmp210_i169_0_valid_out_0_reg_144_NO_SHIFT_REG;
 logic rnode_143to144_bb1_cmp210_i169_0_stall_in_0_reg_144_NO_SHIFT_REG;
 logic rnode_143to144_bb1_cmp210_i169_0_stall_out_reg_144_NO_SHIFT_REG;

acl_data_fifo rnode_143to144_bb1_cmp210_i169_0_reg_144_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_143to144_bb1_cmp210_i169_0_reg_144_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_143to144_bb1_cmp210_i169_0_stall_in_0_reg_144_NO_SHIFT_REG),
	.valid_out(rnode_143to144_bb1_cmp210_i169_0_valid_out_0_reg_144_NO_SHIFT_REG),
	.stall_out(rnode_143to144_bb1_cmp210_i169_0_stall_out_reg_144_NO_SHIFT_REG),
	.data_in(local_bb1_cmp210_i169),
	.data_out(rnode_143to144_bb1_cmp210_i169_0_reg_144_NO_SHIFT_REG)
);

defparam rnode_143to144_bb1_cmp210_i169_0_reg_144_fifo.DEPTH = 1;
defparam rnode_143to144_bb1_cmp210_i169_0_reg_144_fifo.DATA_WIDTH = 1;
defparam rnode_143to144_bb1_cmp210_i169_0_reg_144_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_143to144_bb1_cmp210_i169_0_reg_144_fifo.IMPL = "shift_reg";

assign rnode_143to144_bb1_cmp210_i169_0_reg_144_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_cmp210_i169_stall_in = 1'b0;
assign rnode_143to144_bb1_cmp210_i169_0_stall_in_0_reg_144_NO_SHIFT_REG = 1'b0;
assign rnode_143to144_bb1_cmp210_i169_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_143to144_bb1_cmp210_i169_0_NO_SHIFT_REG = rnode_143to144_bb1_cmp210_i169_0_reg_144_NO_SHIFT_REG;
assign rnode_143to144_bb1_cmp210_i169_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_143to144_bb1_cmp210_i169_1_NO_SHIFT_REG = rnode_143to144_bb1_cmp210_i169_0_reg_144_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_143to144_bb1_cmp264_i200_0_valid_out_NO_SHIFT_REG;
 logic rnode_143to144_bb1_cmp264_i200_0_stall_in_NO_SHIFT_REG;
 logic rnode_143to144_bb1_cmp264_i200_0_NO_SHIFT_REG;
 logic rnode_143to144_bb1_cmp264_i200_0_reg_144_inputs_ready_NO_SHIFT_REG;
 logic rnode_143to144_bb1_cmp264_i200_0_reg_144_NO_SHIFT_REG;
 logic rnode_143to144_bb1_cmp264_i200_0_valid_out_reg_144_NO_SHIFT_REG;
 logic rnode_143to144_bb1_cmp264_i200_0_stall_in_reg_144_NO_SHIFT_REG;
 logic rnode_143to144_bb1_cmp264_i200_0_stall_out_reg_144_NO_SHIFT_REG;

acl_data_fifo rnode_143to144_bb1_cmp264_i200_0_reg_144_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_143to144_bb1_cmp264_i200_0_reg_144_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_143to144_bb1_cmp264_i200_0_stall_in_reg_144_NO_SHIFT_REG),
	.valid_out(rnode_143to144_bb1_cmp264_i200_0_valid_out_reg_144_NO_SHIFT_REG),
	.stall_out(rnode_143to144_bb1_cmp264_i200_0_stall_out_reg_144_NO_SHIFT_REG),
	.data_in(local_bb1_cmp264_i200),
	.data_out(rnode_143to144_bb1_cmp264_i200_0_reg_144_NO_SHIFT_REG)
);

defparam rnode_143to144_bb1_cmp264_i200_0_reg_144_fifo.DEPTH = 1;
defparam rnode_143to144_bb1_cmp264_i200_0_reg_144_fifo.DATA_WIDTH = 1;
defparam rnode_143to144_bb1_cmp264_i200_0_reg_144_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_143to144_bb1_cmp264_i200_0_reg_144_fifo.IMPL = "shift_reg";

assign rnode_143to144_bb1_cmp264_i200_0_reg_144_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_cmp264_i200_stall_in = 1'b0;
assign rnode_143to144_bb1_cmp264_i200_0_NO_SHIFT_REG = rnode_143to144_bb1_cmp264_i200_0_reg_144_NO_SHIFT_REG;
assign rnode_143to144_bb1_cmp264_i200_0_stall_in_reg_144_NO_SHIFT_REG = 1'b0;
assign rnode_143to144_bb1_cmp264_i200_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_143to144_bb1_cmp266_i201_0_valid_out_NO_SHIFT_REG;
 logic rnode_143to144_bb1_cmp266_i201_0_stall_in_NO_SHIFT_REG;
 logic rnode_143to144_bb1_cmp266_i201_0_NO_SHIFT_REG;
 logic rnode_143to144_bb1_cmp266_i201_0_reg_144_inputs_ready_NO_SHIFT_REG;
 logic rnode_143to144_bb1_cmp266_i201_0_reg_144_NO_SHIFT_REG;
 logic rnode_143to144_bb1_cmp266_i201_0_valid_out_reg_144_NO_SHIFT_REG;
 logic rnode_143to144_bb1_cmp266_i201_0_stall_in_reg_144_NO_SHIFT_REG;
 logic rnode_143to144_bb1_cmp266_i201_0_stall_out_reg_144_NO_SHIFT_REG;

acl_data_fifo rnode_143to144_bb1_cmp266_i201_0_reg_144_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_143to144_bb1_cmp266_i201_0_reg_144_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_143to144_bb1_cmp266_i201_0_stall_in_reg_144_NO_SHIFT_REG),
	.valid_out(rnode_143to144_bb1_cmp266_i201_0_valid_out_reg_144_NO_SHIFT_REG),
	.stall_out(rnode_143to144_bb1_cmp266_i201_0_stall_out_reg_144_NO_SHIFT_REG),
	.data_in(local_bb1_cmp266_i201),
	.data_out(rnode_143to144_bb1_cmp266_i201_0_reg_144_NO_SHIFT_REG)
);

defparam rnode_143to144_bb1_cmp266_i201_0_reg_144_fifo.DEPTH = 1;
defparam rnode_143to144_bb1_cmp266_i201_0_reg_144_fifo.DATA_WIDTH = 1;
defparam rnode_143to144_bb1_cmp266_i201_0_reg_144_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_143to144_bb1_cmp266_i201_0_reg_144_fifo.IMPL = "shift_reg";

assign rnode_143to144_bb1_cmp266_i201_0_reg_144_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_cmp266_i201_stall_in = 1'b0;
assign rnode_143to144_bb1_cmp266_i201_0_NO_SHIFT_REG = rnode_143to144_bb1_cmp266_i201_0_reg_144_NO_SHIFT_REG;
assign rnode_143to144_bb1_cmp266_i201_0_stall_in_reg_144_NO_SHIFT_REG = 1'b0;
assign rnode_143to144_bb1_cmp266_i201_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb1_cmp231_i180_stall_local;
wire local_bb1_cmp231_i180;

assign local_bb1_cmp231_i180 = ((rnode_143to144_bb1_and230_i179_0_NO_SHIFT_REG & 32'hFF) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_shl248_i189_stall_local;
wire [31:0] local_bb1_shl248_i189;

assign local_bb1_shl248_i189 = ((rnode_143to144_bb1_and230_i179_1_NO_SHIFT_REG & 32'hFF) << 32'h17);

// This section implements an unregistered operation.
// 
wire local_bb1_and227_i176_stall_local;
wire [31:0] local_bb1_and227_i176;

assign local_bb1_and227_i176 = (rnode_143to144_bb1_add225_i175_0_NO_SHIFT_REG & 32'h100);

// This section implements an unregistered operation.
// 
wire local_bb1_cmp236_i183_stall_local;
wire local_bb1_cmp236_i183;

assign local_bb1_cmp236_i183 = ($signed(rnode_143to144_bb1_add225_i175_1_NO_SHIFT_REG) > $signed(32'hFE));

// This section implements an unregistered operation.
// 
wire local_bb1_and247_i188_stall_local;
wire [31:0] local_bb1_and247_i188;

assign local_bb1_and247_i188 = ((rnode_143to144_bb1_shr246_i187_0_NO_SHIFT_REG & 32'h1FFFFFF) & 32'h7FFFFF);

// This section implements an unregistered operation.
// 
wire local_bb1_cmp210_not_i170_stall_local;
wire local_bb1_cmp210_not_i170;

assign local_bb1_cmp210_not_i170 = (rnode_143to144_bb1_cmp210_i169_0_NO_SHIFT_REG ^ 1'b1);

// This section implements an unregistered operation.
// 
wire local_bb1_conv267_i202_stall_local;
wire [31:0] local_bb1_conv267_i202;

assign local_bb1_conv267_i202[31:1] = 31'h0;
assign local_bb1_conv267_i202[0] = rnode_143to144_bb1_cmp266_i201_0_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb1_tobool228_i177_stall_local;
wire local_bb1_tobool228_i177;

assign local_bb1_tobool228_i177 = ((local_bb1_and227_i176 & 32'h100) != 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_or249_i190_stall_local;
wire [31:0] local_bb1_or249_i190;

assign local_bb1_or249_i190 = ((local_bb1_and247_i188 & 32'h7FFFFF) | (local_bb1_shl248_i189 & 32'h7F800000));

// This section implements an unregistered operation.
// 
wire local_bb1_brmerge7_i171_stall_local;
wire local_bb1_brmerge7_i171;

assign local_bb1_brmerge7_i171 = (local_bb1_cmp210_not_i170 | rnode_143to144_bb1_not_cmp37_i163_0_NO_SHIFT_REG);

// This section implements an unregistered operation.
// 
wire local_bb1_lnot239__i184_stall_local;
wire local_bb1_lnot239__i184;

assign local_bb1_lnot239__i184 = (local_bb1_cmp236_i183 & local_bb1_cmp210_not_i170);

// This section implements an unregistered operation.
// 
wire local_bb1_or_cond_i181_stall_local;
wire local_bb1_or_cond_i181;

assign local_bb1_or_cond_i181 = (local_bb1_tobool228_i177 | local_bb1_cmp231_i180);

// This section implements an unregistered operation.
// 
wire local_bb1_resultSign_0_i172_stall_local;
wire [31:0] local_bb1_resultSign_0_i172;

assign local_bb1_resultSign_0_i172 = (local_bb1_brmerge7_i171 ? (rnode_143to144_bb1_and35_i57_0_NO_SHIFT_REG & 32'h80000000) : 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_or242_i185_stall_local;
wire local_bb1_or242_i185;

assign local_bb1_or242_i185 = (rnode_143to144_bb1_var__u19_0_NO_SHIFT_REG | local_bb1_lnot239__i184);

// This section implements an unregistered operation.
// 
wire local_bb1__31_i182_stall_local;
wire local_bb1__31_i182;

assign local_bb1__31_i182 = (local_bb1_or_cond_i181 | rnode_143to144_bb1_cmp210_i169_1_NO_SHIFT_REG);

// This section implements an unregistered operation.
// 
wire local_bb1_or250_i191_stall_local;
wire [31:0] local_bb1_or250_i191;

assign local_bb1_or250_i191 = ((local_bb1_or249_i190 & 32'h7FFFFFFF) | (local_bb1_resultSign_0_i172 & 32'h80000000));

// This section implements an unregistered operation.
// 
wire local_bb1_or257_i194_stall_local;
wire local_bb1_or257_i194;

assign local_bb1_or257_i194 = (local_bb1_or242_i185 | rnode_143to144_bb1__13_i71_0_NO_SHIFT_REG);

// This section implements an unregistered operation.
// 
wire local_bb1_reduction_9_demorgan_i207_stall_local;
wire local_bb1_reduction_9_demorgan_i207;

assign local_bb1_reduction_9_demorgan_i207 = (rnode_143to144_bb1__13_i71_2_NO_SHIFT_REG | local_bb1_or242_i185);

// This section implements an unregistered operation.
// 
wire local_bb1_or253_i192_stall_local;
wire local_bb1_or253_i192;

assign local_bb1_or253_i192 = (local_bb1__31_i182 | local_bb1_or242_i185);

// This section implements an unregistered operation.
// 
wire local_bb1_cond258_i195_stall_local;
wire [31:0] local_bb1_cond258_i195;

assign local_bb1_cond258_i195 = (local_bb1_or257_i194 ? 32'h7F800000 : 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_cond254_i193_stall_local;
wire [31:0] local_bb1_cond254_i193;

assign local_bb1_cond254_i193 = (local_bb1_or253_i192 ? 32'h80000000 : 32'hFFFFFFFF);

// This section implements an unregistered operation.
// 
wire local_bb1_or262_i198_stall_local;
wire [31:0] local_bb1_or262_i198;

assign local_bb1_or262_i198 = ((local_bb1_cond258_i195 & 32'h7F800000) | (local_bb1_cond260_i196 & 32'h400000));

// This section implements an unregistered operation.
// 
wire local_bb1_and261_i197_stall_local;
wire [31:0] local_bb1_and261_i197;

assign local_bb1_and261_i197 = ((local_bb1_cond254_i193 | 32'h80000000) & local_bb1_or250_i191);

// This section implements an unregistered operation.
// 
wire local_bb1_or263_i199_stall_local;
wire [31:0] local_bb1_or263_i199;

assign local_bb1_or263_i199 = ((local_bb1_or262_i198 & 32'h7FC00000) | local_bb1_and261_i197);

// This section implements an unregistered operation.
// 
wire local_bb1_and269_i203_stall_local;
wire [31:0] local_bb1_and269_i203;

assign local_bb1_and269_i203 = ((local_bb1_conv267_i202 & 32'h1) & local_bb1_and261_i197);

// This section implements an unregistered operation.
// 
wire local_bb1_tobool270_i204_stall_local;
wire local_bb1_tobool270_i204;

assign local_bb1_tobool270_i204 = ((local_bb1_and269_i203 & 32'h1) != 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_or263_i199_valid_out;
wire local_bb1_or263_i199_stall_in;
wire local_bb1_reduction_9_demorgan_i207_valid_out;
wire local_bb1_reduction_9_demorgan_i207_stall_in;
wire local_bb1__31_i182_valid_out_1;
wire local_bb1__31_i182_stall_in_1;
wire local_bb1__32_i205_valid_out;
wire local_bb1__32_i205_stall_in;
wire local_bb1__32_i205_inputs_ready;
wire local_bb1__32_i205_stall_local;
wire local_bb1__32_i205;

assign local_bb1__32_i205_inputs_ready = (rnode_143to144_bb1_and35_i57_0_valid_out_NO_SHIFT_REG & rnode_143to144_bb1_not_cmp37_i163_0_valid_out_NO_SHIFT_REG & rnode_143to144_bb1_and230_i179_0_valid_out_1_NO_SHIFT_REG & rnode_143to144_bb1_shr246_i187_0_valid_out_NO_SHIFT_REG & rnode_143to144_bb1_add225_i175_0_valid_out_1_NO_SHIFT_REG & rnode_143to144_bb1_var__u19_0_valid_out_NO_SHIFT_REG & rnode_143to144_bb1__13_i71_0_valid_out_0_NO_SHIFT_REG & rnode_143to144_bb1__13_i71_0_valid_out_2_NO_SHIFT_REG & rnode_143to144_bb1__13_i71_0_valid_out_1_NO_SHIFT_REG & rnode_143to144_bb1_cmp210_i169_0_valid_out_0_NO_SHIFT_REG & rnode_143to144_bb1_add225_i175_0_valid_out_0_NO_SHIFT_REG & rnode_143to144_bb1_and230_i179_0_valid_out_0_NO_SHIFT_REG & rnode_143to144_bb1_cmp210_i169_0_valid_out_1_NO_SHIFT_REG & rnode_143to144_bb1_cmp266_i201_0_valid_out_NO_SHIFT_REG & rnode_143to144_bb1_cmp264_i200_0_valid_out_NO_SHIFT_REG);
assign local_bb1__32_i205 = (rnode_143to144_bb1_cmp264_i200_0_NO_SHIFT_REG | local_bb1_tobool270_i204);
assign local_bb1_or263_i199_valid_out = 1'b1;
assign local_bb1_reduction_9_demorgan_i207_valid_out = 1'b1;
assign local_bb1__31_i182_valid_out_1 = 1'b1;
assign local_bb1__32_i205_valid_out = 1'b1;
assign rnode_143to144_bb1_and35_i57_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_143to144_bb1_not_cmp37_i163_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_143to144_bb1_and230_i179_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_143to144_bb1_shr246_i187_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_143to144_bb1_add225_i175_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_143to144_bb1_var__u19_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_143to144_bb1__13_i71_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_143to144_bb1__13_i71_0_stall_in_2_NO_SHIFT_REG = 1'b0;
assign rnode_143to144_bb1__13_i71_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_143to144_bb1_cmp210_i169_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_143to144_bb1_add225_i175_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_143to144_bb1_and230_i179_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_143to144_bb1_cmp210_i169_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_143to144_bb1_cmp266_i201_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_143to144_bb1_cmp264_i200_0_stall_in_NO_SHIFT_REG = 1'b0;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_144to145_bb1_or263_i199_0_valid_out_NO_SHIFT_REG;
 logic rnode_144to145_bb1_or263_i199_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_144to145_bb1_or263_i199_0_NO_SHIFT_REG;
 logic rnode_144to145_bb1_or263_i199_0_reg_145_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_144to145_bb1_or263_i199_0_reg_145_NO_SHIFT_REG;
 logic rnode_144to145_bb1_or263_i199_0_valid_out_reg_145_NO_SHIFT_REG;
 logic rnode_144to145_bb1_or263_i199_0_stall_in_reg_145_NO_SHIFT_REG;
 logic rnode_144to145_bb1_or263_i199_0_stall_out_reg_145_NO_SHIFT_REG;

acl_data_fifo rnode_144to145_bb1_or263_i199_0_reg_145_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_144to145_bb1_or263_i199_0_reg_145_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_144to145_bb1_or263_i199_0_stall_in_reg_145_NO_SHIFT_REG),
	.valid_out(rnode_144to145_bb1_or263_i199_0_valid_out_reg_145_NO_SHIFT_REG),
	.stall_out(rnode_144to145_bb1_or263_i199_0_stall_out_reg_145_NO_SHIFT_REG),
	.data_in(local_bb1_or263_i199),
	.data_out(rnode_144to145_bb1_or263_i199_0_reg_145_NO_SHIFT_REG)
);

defparam rnode_144to145_bb1_or263_i199_0_reg_145_fifo.DEPTH = 1;
defparam rnode_144to145_bb1_or263_i199_0_reg_145_fifo.DATA_WIDTH = 32;
defparam rnode_144to145_bb1_or263_i199_0_reg_145_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_144to145_bb1_or263_i199_0_reg_145_fifo.IMPL = "shift_reg";

assign rnode_144to145_bb1_or263_i199_0_reg_145_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_or263_i199_stall_in = 1'b0;
assign rnode_144to145_bb1_or263_i199_0_NO_SHIFT_REG = rnode_144to145_bb1_or263_i199_0_reg_145_NO_SHIFT_REG;
assign rnode_144to145_bb1_or263_i199_0_stall_in_reg_145_NO_SHIFT_REG = 1'b0;
assign rnode_144to145_bb1_or263_i199_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_144to145_bb1_reduction_9_demorgan_i207_0_valid_out_NO_SHIFT_REG;
 logic rnode_144to145_bb1_reduction_9_demorgan_i207_0_stall_in_NO_SHIFT_REG;
 logic rnode_144to145_bb1_reduction_9_demorgan_i207_0_NO_SHIFT_REG;
 logic rnode_144to145_bb1_reduction_9_demorgan_i207_0_reg_145_inputs_ready_NO_SHIFT_REG;
 logic rnode_144to145_bb1_reduction_9_demorgan_i207_0_reg_145_NO_SHIFT_REG;
 logic rnode_144to145_bb1_reduction_9_demorgan_i207_0_valid_out_reg_145_NO_SHIFT_REG;
 logic rnode_144to145_bb1_reduction_9_demorgan_i207_0_stall_in_reg_145_NO_SHIFT_REG;
 logic rnode_144to145_bb1_reduction_9_demorgan_i207_0_stall_out_reg_145_NO_SHIFT_REG;

acl_data_fifo rnode_144to145_bb1_reduction_9_demorgan_i207_0_reg_145_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_144to145_bb1_reduction_9_demorgan_i207_0_reg_145_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_144to145_bb1_reduction_9_demorgan_i207_0_stall_in_reg_145_NO_SHIFT_REG),
	.valid_out(rnode_144to145_bb1_reduction_9_demorgan_i207_0_valid_out_reg_145_NO_SHIFT_REG),
	.stall_out(rnode_144to145_bb1_reduction_9_demorgan_i207_0_stall_out_reg_145_NO_SHIFT_REG),
	.data_in(local_bb1_reduction_9_demorgan_i207),
	.data_out(rnode_144to145_bb1_reduction_9_demorgan_i207_0_reg_145_NO_SHIFT_REG)
);

defparam rnode_144to145_bb1_reduction_9_demorgan_i207_0_reg_145_fifo.DEPTH = 1;
defparam rnode_144to145_bb1_reduction_9_demorgan_i207_0_reg_145_fifo.DATA_WIDTH = 1;
defparam rnode_144to145_bb1_reduction_9_demorgan_i207_0_reg_145_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_144to145_bb1_reduction_9_demorgan_i207_0_reg_145_fifo.IMPL = "shift_reg";

assign rnode_144to145_bb1_reduction_9_demorgan_i207_0_reg_145_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_reduction_9_demorgan_i207_stall_in = 1'b0;
assign rnode_144to145_bb1_reduction_9_demorgan_i207_0_NO_SHIFT_REG = rnode_144to145_bb1_reduction_9_demorgan_i207_0_reg_145_NO_SHIFT_REG;
assign rnode_144to145_bb1_reduction_9_demorgan_i207_0_stall_in_reg_145_NO_SHIFT_REG = 1'b0;
assign rnode_144to145_bb1_reduction_9_demorgan_i207_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_144to145_bb1__31_i182_0_valid_out_NO_SHIFT_REG;
 logic rnode_144to145_bb1__31_i182_0_stall_in_NO_SHIFT_REG;
 logic rnode_144to145_bb1__31_i182_0_NO_SHIFT_REG;
 logic rnode_144to145_bb1__31_i182_0_reg_145_inputs_ready_NO_SHIFT_REG;
 logic rnode_144to145_bb1__31_i182_0_reg_145_NO_SHIFT_REG;
 logic rnode_144to145_bb1__31_i182_0_valid_out_reg_145_NO_SHIFT_REG;
 logic rnode_144to145_bb1__31_i182_0_stall_in_reg_145_NO_SHIFT_REG;
 logic rnode_144to145_bb1__31_i182_0_stall_out_reg_145_NO_SHIFT_REG;

acl_data_fifo rnode_144to145_bb1__31_i182_0_reg_145_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_144to145_bb1__31_i182_0_reg_145_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_144to145_bb1__31_i182_0_stall_in_reg_145_NO_SHIFT_REG),
	.valid_out(rnode_144to145_bb1__31_i182_0_valid_out_reg_145_NO_SHIFT_REG),
	.stall_out(rnode_144to145_bb1__31_i182_0_stall_out_reg_145_NO_SHIFT_REG),
	.data_in(local_bb1__31_i182),
	.data_out(rnode_144to145_bb1__31_i182_0_reg_145_NO_SHIFT_REG)
);

defparam rnode_144to145_bb1__31_i182_0_reg_145_fifo.DEPTH = 1;
defparam rnode_144to145_bb1__31_i182_0_reg_145_fifo.DATA_WIDTH = 1;
defparam rnode_144to145_bb1__31_i182_0_reg_145_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_144to145_bb1__31_i182_0_reg_145_fifo.IMPL = "shift_reg";

assign rnode_144to145_bb1__31_i182_0_reg_145_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1__31_i182_stall_in_1 = 1'b0;
assign rnode_144to145_bb1__31_i182_0_NO_SHIFT_REG = rnode_144to145_bb1__31_i182_0_reg_145_NO_SHIFT_REG;
assign rnode_144to145_bb1__31_i182_0_stall_in_reg_145_NO_SHIFT_REG = 1'b0;
assign rnode_144to145_bb1__31_i182_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_144to145_bb1__32_i205_0_valid_out_NO_SHIFT_REG;
 logic rnode_144to145_bb1__32_i205_0_stall_in_NO_SHIFT_REG;
 logic rnode_144to145_bb1__32_i205_0_NO_SHIFT_REG;
 logic rnode_144to145_bb1__32_i205_0_reg_145_inputs_ready_NO_SHIFT_REG;
 logic rnode_144to145_bb1__32_i205_0_reg_145_NO_SHIFT_REG;
 logic rnode_144to145_bb1__32_i205_0_valid_out_reg_145_NO_SHIFT_REG;
 logic rnode_144to145_bb1__32_i205_0_stall_in_reg_145_NO_SHIFT_REG;
 logic rnode_144to145_bb1__32_i205_0_stall_out_reg_145_NO_SHIFT_REG;

acl_data_fifo rnode_144to145_bb1__32_i205_0_reg_145_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_144to145_bb1__32_i205_0_reg_145_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_144to145_bb1__32_i205_0_stall_in_reg_145_NO_SHIFT_REG),
	.valid_out(rnode_144to145_bb1__32_i205_0_valid_out_reg_145_NO_SHIFT_REG),
	.stall_out(rnode_144to145_bb1__32_i205_0_stall_out_reg_145_NO_SHIFT_REG),
	.data_in(local_bb1__32_i205),
	.data_out(rnode_144to145_bb1__32_i205_0_reg_145_NO_SHIFT_REG)
);

defparam rnode_144to145_bb1__32_i205_0_reg_145_fifo.DEPTH = 1;
defparam rnode_144to145_bb1__32_i205_0_reg_145_fifo.DATA_WIDTH = 1;
defparam rnode_144to145_bb1__32_i205_0_reg_145_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_144to145_bb1__32_i205_0_reg_145_fifo.IMPL = "shift_reg";

assign rnode_144to145_bb1__32_i205_0_reg_145_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1__32_i205_stall_in = 1'b0;
assign rnode_144to145_bb1__32_i205_0_NO_SHIFT_REG = rnode_144to145_bb1__32_i205_0_reg_145_NO_SHIFT_REG;
assign rnode_144to145_bb1__32_i205_0_stall_in_reg_145_NO_SHIFT_REG = 1'b0;
assign rnode_144to145_bb1__32_i205_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb1_reduction_9_i208_stall_local;
wire local_bb1_reduction_9_i208;

assign local_bb1_reduction_9_i208 = (rnode_144to145_bb1_reduction_9_demorgan_i207_0_NO_SHIFT_REG ^ 1'b1);

// This section implements an unregistered operation.
// 
wire local_bb1_lnot279_i206_stall_local;
wire local_bb1_lnot279_i206;

assign local_bb1_lnot279_i206 = (rnode_144to145_bb1__31_i182_0_NO_SHIFT_REG ^ 1'b1);

// This section implements an unregistered operation.
// 
wire local_bb1_reduction_10_i209_stall_local;
wire local_bb1_reduction_10_i209;

assign local_bb1_reduction_10_i209 = (rnode_144to145_bb1__32_i205_0_NO_SHIFT_REG & local_bb1_lnot279_i206);

// This section implements an unregistered operation.
// 
wire local_bb1_reduction_11_i210_stall_local;
wire local_bb1_reduction_11_i210;

assign local_bb1_reduction_11_i210 = (local_bb1_reduction_10_i209 & local_bb1_reduction_9_i208);

// This section implements an unregistered operation.
// 
wire local_bb1_conv283_i211_stall_local;
wire [31:0] local_bb1_conv283_i211;

assign local_bb1_conv283_i211[31:1] = 31'h0;
assign local_bb1_conv283_i211[0] = local_bb1_reduction_11_i210;

// This section implements an unregistered operation.
// 
wire local_bb1_add284_i212_valid_out;
wire local_bb1_add284_i212_stall_in;
wire local_bb1_add284_i212_inputs_ready;
wire local_bb1_add284_i212_stall_local;
wire [31:0] local_bb1_add284_i212;

assign local_bb1_add284_i212_inputs_ready = (rnode_144to145_bb1_reduction_9_demorgan_i207_0_valid_out_NO_SHIFT_REG & rnode_144to145_bb1__31_i182_0_valid_out_NO_SHIFT_REG & rnode_144to145_bb1__32_i205_0_valid_out_NO_SHIFT_REG & rnode_144to145_bb1_or263_i199_0_valid_out_NO_SHIFT_REG);
assign local_bb1_add284_i212 = ((local_bb1_conv283_i211 & 32'h1) + rnode_144to145_bb1_or263_i199_0_NO_SHIFT_REG);
assign local_bb1_add284_i212_valid_out = 1'b1;
assign rnode_144to145_bb1_reduction_9_demorgan_i207_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_144to145_bb1__31_i182_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_144to145_bb1__32_i205_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_144to145_bb1_or263_i199_0_stall_in_NO_SHIFT_REG = 1'b0;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_145to146_bb1_add284_i212_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_145to146_bb1_add284_i212_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_145to146_bb1_add284_i212_0_NO_SHIFT_REG;
 logic rnode_145to146_bb1_add284_i212_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_145to146_bb1_add284_i212_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_145to146_bb1_add284_i212_1_NO_SHIFT_REG;
 logic rnode_145to146_bb1_add284_i212_0_valid_out_2_NO_SHIFT_REG;
 logic rnode_145to146_bb1_add284_i212_0_stall_in_2_NO_SHIFT_REG;
 logic [31:0] rnode_145to146_bb1_add284_i212_2_NO_SHIFT_REG;
 logic rnode_145to146_bb1_add284_i212_0_reg_146_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_145to146_bb1_add284_i212_0_reg_146_NO_SHIFT_REG;
 logic rnode_145to146_bb1_add284_i212_0_valid_out_0_reg_146_NO_SHIFT_REG;
 logic rnode_145to146_bb1_add284_i212_0_stall_in_0_reg_146_NO_SHIFT_REG;
 logic rnode_145to146_bb1_add284_i212_0_stall_out_reg_146_NO_SHIFT_REG;

acl_data_fifo rnode_145to146_bb1_add284_i212_0_reg_146_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_145to146_bb1_add284_i212_0_reg_146_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_145to146_bb1_add284_i212_0_stall_in_0_reg_146_NO_SHIFT_REG),
	.valid_out(rnode_145to146_bb1_add284_i212_0_valid_out_0_reg_146_NO_SHIFT_REG),
	.stall_out(rnode_145to146_bb1_add284_i212_0_stall_out_reg_146_NO_SHIFT_REG),
	.data_in(local_bb1_add284_i212),
	.data_out(rnode_145to146_bb1_add284_i212_0_reg_146_NO_SHIFT_REG)
);

defparam rnode_145to146_bb1_add284_i212_0_reg_146_fifo.DEPTH = 1;
defparam rnode_145to146_bb1_add284_i212_0_reg_146_fifo.DATA_WIDTH = 32;
defparam rnode_145to146_bb1_add284_i212_0_reg_146_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_145to146_bb1_add284_i212_0_reg_146_fifo.IMPL = "shift_reg";

assign rnode_145to146_bb1_add284_i212_0_reg_146_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_add284_i212_stall_in = 1'b0;
assign rnode_145to146_bb1_add284_i212_0_stall_in_0_reg_146_NO_SHIFT_REG = 1'b0;
assign rnode_145to146_bb1_add284_i212_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_145to146_bb1_add284_i212_0_NO_SHIFT_REG = rnode_145to146_bb1_add284_i212_0_reg_146_NO_SHIFT_REG;
assign rnode_145to146_bb1_add284_i212_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_145to146_bb1_add284_i212_1_NO_SHIFT_REG = rnode_145to146_bb1_add284_i212_0_reg_146_NO_SHIFT_REG;
assign rnode_145to146_bb1_add284_i212_0_valid_out_2_NO_SHIFT_REG = 1'b1;
assign rnode_145to146_bb1_add284_i212_2_NO_SHIFT_REG = rnode_145to146_bb1_add284_i212_0_reg_146_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb1_and2_i2_stall_local;
wire [31:0] local_bb1_and2_i2;

assign local_bb1_and2_i2 = (rnode_145to146_bb1_add284_i212_0_NO_SHIFT_REG >> 32'h10);

// This section implements an unregistered operation.
// 
wire local_bb1_and12_i_stall_local;
wire [31:0] local_bb1_and12_i;

assign local_bb1_and12_i = (rnode_145to146_bb1_add284_i212_1_NO_SHIFT_REG & 32'hFFFF);

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_146to147_bb1_add284_i212_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_146to147_bb1_add284_i212_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_146to147_bb1_add284_i212_0_NO_SHIFT_REG;
 logic rnode_146to147_bb1_add284_i212_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_146to147_bb1_add284_i212_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_146to147_bb1_add284_i212_1_NO_SHIFT_REG;
 logic rnode_146to147_bb1_add284_i212_0_valid_out_2_NO_SHIFT_REG;
 logic rnode_146to147_bb1_add284_i212_0_stall_in_2_NO_SHIFT_REG;
 logic [31:0] rnode_146to147_bb1_add284_i212_2_NO_SHIFT_REG;
 logic rnode_146to147_bb1_add284_i212_0_reg_147_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_146to147_bb1_add284_i212_0_reg_147_NO_SHIFT_REG;
 logic rnode_146to147_bb1_add284_i212_0_valid_out_0_reg_147_NO_SHIFT_REG;
 logic rnode_146to147_bb1_add284_i212_0_stall_in_0_reg_147_NO_SHIFT_REG;
 logic rnode_146to147_bb1_add284_i212_0_stall_out_reg_147_NO_SHIFT_REG;

acl_data_fifo rnode_146to147_bb1_add284_i212_0_reg_147_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_146to147_bb1_add284_i212_0_reg_147_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_146to147_bb1_add284_i212_0_stall_in_0_reg_147_NO_SHIFT_REG),
	.valid_out(rnode_146to147_bb1_add284_i212_0_valid_out_0_reg_147_NO_SHIFT_REG),
	.stall_out(rnode_146to147_bb1_add284_i212_0_stall_out_reg_147_NO_SHIFT_REG),
	.data_in(rnode_145to146_bb1_add284_i212_2_NO_SHIFT_REG),
	.data_out(rnode_146to147_bb1_add284_i212_0_reg_147_NO_SHIFT_REG)
);

defparam rnode_146to147_bb1_add284_i212_0_reg_147_fifo.DEPTH = 1;
defparam rnode_146to147_bb1_add284_i212_0_reg_147_fifo.DATA_WIDTH = 32;
defparam rnode_146to147_bb1_add284_i212_0_reg_147_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_146to147_bb1_add284_i212_0_reg_147_fifo.IMPL = "shift_reg";

assign rnode_146to147_bb1_add284_i212_0_reg_147_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_145to146_bb1_add284_i212_0_stall_in_2_NO_SHIFT_REG = 1'b0;
assign rnode_146to147_bb1_add284_i212_0_stall_in_0_reg_147_NO_SHIFT_REG = 1'b0;
assign rnode_146to147_bb1_add284_i212_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_146to147_bb1_add284_i212_0_NO_SHIFT_REG = rnode_146to147_bb1_add284_i212_0_reg_147_NO_SHIFT_REG;
assign rnode_146to147_bb1_add284_i212_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_146to147_bb1_add284_i212_1_NO_SHIFT_REG = rnode_146to147_bb1_add284_i212_0_reg_147_NO_SHIFT_REG;
assign rnode_146to147_bb1_add284_i212_0_valid_out_2_NO_SHIFT_REG = 1'b1;
assign rnode_146to147_bb1_add284_i212_2_NO_SHIFT_REG = rnode_146to147_bb1_add284_i212_0_reg_147_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb1_shr3_i_stall_local;
wire [31:0] local_bb1_shr3_i;

assign local_bb1_shr3_i = ((local_bb1_and2_i2 & 32'hFFFF) & 32'h7FFF);

// This section implements an unregistered operation.
// 
wire local_bb1_cmp13_i_stall_local;
wire local_bb1_cmp13_i;

assign local_bb1_cmp13_i = ((local_bb1_and10_i & 32'hFFFF) > (local_bb1_and12_i & 32'hFFFF));

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_147to148_bb1_add284_i212_0_valid_out_NO_SHIFT_REG;
 logic rnode_147to148_bb1_add284_i212_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_147to148_bb1_add284_i212_0_NO_SHIFT_REG;
 logic rnode_147to148_bb1_add284_i212_0_reg_148_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_147to148_bb1_add284_i212_0_reg_148_NO_SHIFT_REG;
 logic rnode_147to148_bb1_add284_i212_0_valid_out_reg_148_NO_SHIFT_REG;
 logic rnode_147to148_bb1_add284_i212_0_stall_in_reg_148_NO_SHIFT_REG;
 logic rnode_147to148_bb1_add284_i212_0_stall_out_reg_148_NO_SHIFT_REG;

acl_data_fifo rnode_147to148_bb1_add284_i212_0_reg_148_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_147to148_bb1_add284_i212_0_reg_148_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_147to148_bb1_add284_i212_0_stall_in_reg_148_NO_SHIFT_REG),
	.valid_out(rnode_147to148_bb1_add284_i212_0_valid_out_reg_148_NO_SHIFT_REG),
	.stall_out(rnode_147to148_bb1_add284_i212_0_stall_out_reg_148_NO_SHIFT_REG),
	.data_in(rnode_146to147_bb1_add284_i212_2_NO_SHIFT_REG),
	.data_out(rnode_147to148_bb1_add284_i212_0_reg_148_NO_SHIFT_REG)
);

defparam rnode_147to148_bb1_add284_i212_0_reg_148_fifo.DEPTH = 1;
defparam rnode_147to148_bb1_add284_i212_0_reg_148_fifo.DATA_WIDTH = 32;
defparam rnode_147to148_bb1_add284_i212_0_reg_148_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_147to148_bb1_add284_i212_0_reg_148_fifo.IMPL = "shift_reg";

assign rnode_147to148_bb1_add284_i212_0_reg_148_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_146to147_bb1_add284_i212_0_stall_in_2_NO_SHIFT_REG = 1'b0;
assign rnode_147to148_bb1_add284_i212_0_NO_SHIFT_REG = rnode_147to148_bb1_add284_i212_0_reg_148_NO_SHIFT_REG;
assign rnode_147to148_bb1_add284_i212_0_stall_in_reg_148_NO_SHIFT_REG = 1'b0;
assign rnode_147to148_bb1_add284_i212_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb1_cmp_i3_stall_local;
wire local_bb1_cmp_i3;

assign local_bb1_cmp_i3 = ((local_bb1_shr_i1 & 32'h7FFF) > (local_bb1_shr3_i & 32'h7FFF));

// This section implements an unregistered operation.
// 
wire local_bb1_cmp8_i_stall_local;
wire local_bb1_cmp8_i;

assign local_bb1_cmp8_i = ((local_bb1_shr_i1 & 32'h7FFF) == (local_bb1_shr3_i & 32'h7FFF));

// Register node:
//  * latency = 3
//  * capacity = 3
 logic rnode_148to151_bb1_add284_i212_0_valid_out_NO_SHIFT_REG;
 logic rnode_148to151_bb1_add284_i212_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_148to151_bb1_add284_i212_0_NO_SHIFT_REG;
 logic rnode_148to151_bb1_add284_i212_0_reg_151_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_148to151_bb1_add284_i212_0_reg_151_NO_SHIFT_REG;
 logic rnode_148to151_bb1_add284_i212_0_valid_out_reg_151_NO_SHIFT_REG;
 logic rnode_148to151_bb1_add284_i212_0_stall_in_reg_151_NO_SHIFT_REG;
 logic rnode_148to151_bb1_add284_i212_0_stall_out_reg_151_NO_SHIFT_REG;

acl_data_fifo rnode_148to151_bb1_add284_i212_0_reg_151_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_148to151_bb1_add284_i212_0_reg_151_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_148to151_bb1_add284_i212_0_stall_in_reg_151_NO_SHIFT_REG),
	.valid_out(rnode_148to151_bb1_add284_i212_0_valid_out_reg_151_NO_SHIFT_REG),
	.stall_out(rnode_148to151_bb1_add284_i212_0_stall_out_reg_151_NO_SHIFT_REG),
	.data_in(rnode_147to148_bb1_add284_i212_0_NO_SHIFT_REG),
	.data_out(rnode_148to151_bb1_add284_i212_0_reg_151_NO_SHIFT_REG)
);

defparam rnode_148to151_bb1_add284_i212_0_reg_151_fifo.DEPTH = 3;
defparam rnode_148to151_bb1_add284_i212_0_reg_151_fifo.DATA_WIDTH = 32;
defparam rnode_148to151_bb1_add284_i212_0_reg_151_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_148to151_bb1_add284_i212_0_reg_151_fifo.IMPL = "shift_reg";

assign rnode_148to151_bb1_add284_i212_0_reg_151_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_147to148_bb1_add284_i212_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_148to151_bb1_add284_i212_0_NO_SHIFT_REG = rnode_148to151_bb1_add284_i212_0_reg_151_NO_SHIFT_REG;
assign rnode_148to151_bb1_add284_i212_0_stall_in_reg_151_NO_SHIFT_REG = 1'b0;
assign rnode_148to151_bb1_add284_i212_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb1___i4_stall_local;
wire local_bb1___i4;

assign local_bb1___i4 = (local_bb1_cmp8_i & local_bb1_cmp13_i);

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_151to152_bb1_add284_i212_0_valid_out_NO_SHIFT_REG;
 logic rnode_151to152_bb1_add284_i212_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_151to152_bb1_add284_i212_0_NO_SHIFT_REG;
 logic rnode_151to152_bb1_add284_i212_0_reg_152_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_151to152_bb1_add284_i212_0_reg_152_NO_SHIFT_REG;
 logic rnode_151to152_bb1_add284_i212_0_valid_out_reg_152_NO_SHIFT_REG;
 logic rnode_151to152_bb1_add284_i212_0_stall_in_reg_152_NO_SHIFT_REG;
 logic rnode_151to152_bb1_add284_i212_0_stall_out_reg_152_NO_SHIFT_REG;

acl_data_fifo rnode_151to152_bb1_add284_i212_0_reg_152_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_151to152_bb1_add284_i212_0_reg_152_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_151to152_bb1_add284_i212_0_stall_in_reg_152_NO_SHIFT_REG),
	.valid_out(rnode_151to152_bb1_add284_i212_0_valid_out_reg_152_NO_SHIFT_REG),
	.stall_out(rnode_151to152_bb1_add284_i212_0_stall_out_reg_152_NO_SHIFT_REG),
	.data_in(rnode_148to151_bb1_add284_i212_0_NO_SHIFT_REG),
	.data_out(rnode_151to152_bb1_add284_i212_0_reg_152_NO_SHIFT_REG)
);

defparam rnode_151to152_bb1_add284_i212_0_reg_152_fifo.DEPTH = 1;
defparam rnode_151to152_bb1_add284_i212_0_reg_152_fifo.DATA_WIDTH = 32;
defparam rnode_151to152_bb1_add284_i212_0_reg_152_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_151to152_bb1_add284_i212_0_reg_152_fifo.IMPL = "shift_reg";

assign rnode_151to152_bb1_add284_i212_0_reg_152_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_148to151_bb1_add284_i212_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_151to152_bb1_add284_i212_0_NO_SHIFT_REG = rnode_151to152_bb1_add284_i212_0_reg_152_NO_SHIFT_REG;
assign rnode_151to152_bb1_add284_i212_0_stall_in_reg_152_NO_SHIFT_REG = 1'b0;
assign rnode_151to152_bb1_add284_i212_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb1__8_i_valid_out;
wire local_bb1__8_i_stall_in;
wire local_bb1__8_i_inputs_ready;
wire local_bb1__8_i_stall_local;
wire local_bb1__8_i;

assign local_bb1__8_i_inputs_ready = (rnode_145to146_bb1_var__u10_0_valid_out_0_NO_SHIFT_REG & rnode_145to146_bb1_var__u10_0_valid_out_1_NO_SHIFT_REG & rnode_145to146_bb1_add284_i212_0_valid_out_1_NO_SHIFT_REG & rnode_145to146_bb1_add284_i212_0_valid_out_0_NO_SHIFT_REG);
assign local_bb1__8_i = (local_bb1_cmp_i3 | local_bb1___i4);
assign local_bb1__8_i_valid_out = 1'b1;
assign rnode_145to146_bb1_var__u10_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_145to146_bb1_var__u10_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_145to146_bb1_add284_i212_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_145to146_bb1_add284_i212_0_stall_in_0_NO_SHIFT_REG = 1'b0;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_146to147_bb1__8_i_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_146to147_bb1__8_i_0_stall_in_0_NO_SHIFT_REG;
 logic rnode_146to147_bb1__8_i_0_NO_SHIFT_REG;
 logic rnode_146to147_bb1__8_i_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_146to147_bb1__8_i_0_stall_in_1_NO_SHIFT_REG;
 logic rnode_146to147_bb1__8_i_1_NO_SHIFT_REG;
 logic rnode_146to147_bb1__8_i_0_reg_147_inputs_ready_NO_SHIFT_REG;
 logic rnode_146to147_bb1__8_i_0_reg_147_NO_SHIFT_REG;
 logic rnode_146to147_bb1__8_i_0_valid_out_0_reg_147_NO_SHIFT_REG;
 logic rnode_146to147_bb1__8_i_0_stall_in_0_reg_147_NO_SHIFT_REG;
 logic rnode_146to147_bb1__8_i_0_stall_out_reg_147_NO_SHIFT_REG;

acl_data_fifo rnode_146to147_bb1__8_i_0_reg_147_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_146to147_bb1__8_i_0_reg_147_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_146to147_bb1__8_i_0_stall_in_0_reg_147_NO_SHIFT_REG),
	.valid_out(rnode_146to147_bb1__8_i_0_valid_out_0_reg_147_NO_SHIFT_REG),
	.stall_out(rnode_146to147_bb1__8_i_0_stall_out_reg_147_NO_SHIFT_REG),
	.data_in(local_bb1__8_i),
	.data_out(rnode_146to147_bb1__8_i_0_reg_147_NO_SHIFT_REG)
);

defparam rnode_146to147_bb1__8_i_0_reg_147_fifo.DEPTH = 1;
defparam rnode_146to147_bb1__8_i_0_reg_147_fifo.DATA_WIDTH = 1;
defparam rnode_146to147_bb1__8_i_0_reg_147_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_146to147_bb1__8_i_0_reg_147_fifo.IMPL = "shift_reg";

assign rnode_146to147_bb1__8_i_0_reg_147_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1__8_i_stall_in = 1'b0;
assign rnode_146to147_bb1__8_i_0_stall_in_0_reg_147_NO_SHIFT_REG = 1'b0;
assign rnode_146to147_bb1__8_i_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_146to147_bb1__8_i_0_NO_SHIFT_REG = rnode_146to147_bb1__8_i_0_reg_147_NO_SHIFT_REG;
assign rnode_146to147_bb1__8_i_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_146to147_bb1__8_i_1_NO_SHIFT_REG = rnode_146to147_bb1__8_i_0_reg_147_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb1__9_i_stall_local;
wire [31:0] local_bb1__9_i;

assign local_bb1__9_i = (rnode_146to147_bb1__8_i_0_NO_SHIFT_REG ? rnode_146to147_bb1_add284_i212_0_NO_SHIFT_REG : rnode_146to147_bb1_var__u10_0_NO_SHIFT_REG);

// This section implements an unregistered operation.
// 
wire local_bb1__10_i_stall_local;
wire [31:0] local_bb1__10_i;

assign local_bb1__10_i = (rnode_146to147_bb1__8_i_1_NO_SHIFT_REG ? rnode_146to147_bb1_var__u10_1_NO_SHIFT_REG : rnode_146to147_bb1_add284_i212_1_NO_SHIFT_REG);

// This section implements an unregistered operation.
// 
wire local_bb1_shr18_i_stall_local;
wire [31:0] local_bb1_shr18_i;

assign local_bb1_shr18_i = (local_bb1__9_i >> 32'h17);

// This section implements an unregistered operation.
// 
wire local_bb1_and21_i_stall_local;
wire [31:0] local_bb1_and21_i;

assign local_bb1_and21_i = (local_bb1__9_i & 32'h7FFFFF);

// This section implements an unregistered operation.
// 
wire local_bb1_shr16_i_stall_local;
wire [31:0] local_bb1_shr16_i;

assign local_bb1_shr16_i = (local_bb1__10_i >> 32'h17);

// This section implements an unregistered operation.
// 
wire local_bb1_and20_i_stall_local;
wire [31:0] local_bb1_and20_i;

assign local_bb1_and20_i = (local_bb1__10_i & 32'h7FFFFF);

// This section implements an unregistered operation.
// 
wire local_bb1_and35_i_stall_local;
wire [31:0] local_bb1_and35_i;

assign local_bb1_and35_i = (local_bb1__10_i & 32'h80000000);

// This section implements an unregistered operation.
// 
wire local_bb1_xor_i_stall_local;
wire [31:0] local_bb1_xor_i;

assign local_bb1_xor_i = (local_bb1__10_i ^ local_bb1__9_i);

// This section implements an unregistered operation.
// 
wire local_bb1_and19_i_stall_local;
wire [31:0] local_bb1_and19_i;

assign local_bb1_and19_i = ((local_bb1_shr18_i & 32'h1FF) & 32'hFF);

// This section implements an unregistered operation.
// 
wire local_bb1_lnot33_not_i_stall_local;
wire local_bb1_lnot33_not_i;

assign local_bb1_lnot33_not_i = ((local_bb1_and21_i & 32'h7FFFFF) != 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_or64_i_stall_local;
wire [31:0] local_bb1_or64_i;

assign local_bb1_or64_i = ((local_bb1_and21_i & 32'h7FFFFF) << 32'h3);

// This section implements an unregistered operation.
// 
wire local_bb1_var__u25_stall_local;
wire [31:0] local_bb1_var__u25;

assign local_bb1_var__u25 = ((local_bb1_shr18_i & 32'h1FF) & (local_bb1_shr16_i & 32'h1FF));

// This section implements an unregistered operation.
// 
wire local_bb1_sub_i_stall_local;
wire [31:0] local_bb1_sub_i;

assign local_bb1_sub_i = ((local_bb1_shr16_i & 32'h1FF) - (local_bb1_shr18_i & 32'h1FF));

// This section implements an unregistered operation.
// 
wire local_bb1_lnot23_i_stall_local;
wire local_bb1_lnot23_i;

assign local_bb1_lnot23_i = ((local_bb1_and19_i & 32'hFF) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_cmp27_i_stall_local;
wire local_bb1_cmp27_i;

assign local_bb1_cmp27_i = ((local_bb1_and19_i & 32'hFF) == 32'hFF);

// This section implements an unregistered operation.
// 
wire local_bb1_shl65_i_stall_local;
wire [31:0] local_bb1_shl65_i;

assign local_bb1_shl65_i = ((local_bb1_or64_i & 32'h3FFFFF8) | 32'h4000000);

// This section implements an unregistered operation.
// 
wire local_bb1_var__u26_stall_local;
wire [31:0] local_bb1_var__u26;

assign local_bb1_var__u26 = ((local_bb1_var__u25 & 32'h1FF) & 32'hFF);

// This section implements an unregistered operation.
// 
wire local_bb1_and68_i_stall_local;
wire [31:0] local_bb1_and68_i;

assign local_bb1_and68_i = (local_bb1_sub_i & 32'hFF);

// This section implements an unregistered operation.
// 
wire local_bb1__15_i_stall_local;
wire [31:0] local_bb1__15_i;

assign local_bb1__15_i = (local_bb1_lnot23_i ? 32'h0 : ((local_bb1_shl65_i & 32'h7FFFFF8) | 32'h4000000));

// This section implements an unregistered operation.
// 
wire local_bb1_var__u27_stall_local;
wire local_bb1_var__u27;

assign local_bb1_var__u27 = ((local_bb1_var__u26 & 32'hFF) == 32'hFF);

// This section implements an unregistered operation.
// 
wire local_bb1_cmp69_i_stall_local;
wire local_bb1_cmp69_i;

assign local_bb1_cmp69_i = ((local_bb1_and68_i & 32'hFF) > 32'h1F);

// This section implements an unregistered operation.
// 
wire local_bb1_and72_i_stall_local;
wire [31:0] local_bb1_and72_i;

assign local_bb1_and72_i = ((local_bb1__15_i & 32'h7FFFFF8) >> 32'h3);

// This section implements an unregistered operation.
// 
wire local_bb1_and75_i_stall_local;
wire [31:0] local_bb1_and75_i;

assign local_bb1_and75_i = ((local_bb1__15_i & 32'h7FFFFF8) & 32'hF0);

// This section implements an unregistered operation.
// 
wire local_bb1_and78_i_stall_local;
wire [31:0] local_bb1_and78_i;

assign local_bb1_and78_i = ((local_bb1__15_i & 32'h7FFFFF8) & 32'hF00);

// This section implements an unregistered operation.
// 
wire local_bb1_and90_i_stall_local;
wire [31:0] local_bb1_and90_i;

assign local_bb1_and90_i = ((local_bb1__15_i & 32'h7FFFFF8) & 32'h7000000);

// This section implements an unregistered operation.
// 
wire local_bb1_and87_i_stall_local;
wire [31:0] local_bb1_and87_i;

assign local_bb1_and87_i = ((local_bb1__15_i & 32'h7FFFFF8) & 32'hF00000);

// This section implements an unregistered operation.
// 
wire local_bb1_and84_i_stall_local;
wire [31:0] local_bb1_and84_i;

assign local_bb1_and84_i = ((local_bb1__15_i & 32'h7FFFFF8) & 32'hF0000);

// This section implements an unregistered operation.
// 
wire local_bb1_var__u28_stall_local;
wire [31:0] local_bb1_var__u28;

assign local_bb1_var__u28 = ((local_bb1__15_i & 32'h7FFFFF8) & 32'hFFF8);

// This section implements an unregistered operation.
// 
wire local_bb1_align_0_i_stall_local;
wire [31:0] local_bb1_align_0_i;

assign local_bb1_align_0_i = (local_bb1_cmp69_i ? 32'h1F : (local_bb1_and68_i & 32'hFF));

// This section implements an unregistered operation.
// 
wire local_bb1_and72_tr_i_stall_local;
wire [7:0] local_bb1_and72_tr_i;
wire [31:0] local_bb1_and72_tr_i$ps;

assign local_bb1_and72_tr_i$ps = (local_bb1_and72_i & 32'hFFFFFF);
assign local_bb1_and72_tr_i = local_bb1_and72_tr_i$ps[7:0];

// This section implements an unregistered operation.
// 
wire local_bb1_cmp76_i_stall_local;
wire local_bb1_cmp76_i;

assign local_bb1_cmp76_i = ((local_bb1_and75_i & 32'hF0) != 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_cmp79_i_stall_local;
wire local_bb1_cmp79_i;

assign local_bb1_cmp79_i = ((local_bb1_and78_i & 32'hF00) != 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_cmp91_i_stall_local;
wire local_bb1_cmp91_i;

assign local_bb1_cmp91_i = ((local_bb1_and90_i & 32'h7000000) != 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_cmp88_i_stall_local;
wire local_bb1_cmp88_i;

assign local_bb1_cmp88_i = ((local_bb1_and87_i & 32'hF00000) != 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_cmp85_i_stall_local;
wire local_bb1_cmp85_i;

assign local_bb1_cmp85_i = ((local_bb1_and84_i & 32'hF0000) != 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_var__u29_stall_local;
wire local_bb1_var__u29;

assign local_bb1_var__u29 = ((local_bb1_var__u28 & 32'hFFF8) != 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_and93_i_stall_local;
wire [31:0] local_bb1_and93_i;

assign local_bb1_and93_i = ((local_bb1_align_0_i & 32'hFF) & 32'h1C);

// This section implements an unregistered operation.
// 
wire local_bb1_and95_i_stall_local;
wire [31:0] local_bb1_and95_i;

assign local_bb1_and95_i = ((local_bb1_align_0_i & 32'hFF) & 32'h10);

// This section implements an unregistered operation.
// 
wire local_bb1_and112_i_stall_local;
wire [31:0] local_bb1_and112_i;

assign local_bb1_and112_i = ((local_bb1_align_0_i & 32'hFF) & 32'h8);

// This section implements an unregistered operation.
// 
wire local_bb1_and125_i_stall_local;
wire [31:0] local_bb1_and125_i;

assign local_bb1_and125_i = ((local_bb1_align_0_i & 32'hFF) & 32'h4);

// This section implements an unregistered operation.
// 
wire local_bb1_and143_i_stall_local;
wire [31:0] local_bb1_and143_i;

assign local_bb1_and143_i = ((local_bb1_align_0_i & 32'hFF) & 32'h3);

// This section implements an unregistered operation.
// 
wire local_bb1_frombool74_i_stall_local;
wire [7:0] local_bb1_frombool74_i;

assign local_bb1_frombool74_i = (local_bb1_and72_tr_i & 8'h1);

// This section implements an unregistered operation.
// 
wire local_bb1_frombool106_i_stall_local;
wire [7:0] local_bb1_frombool106_i;

assign local_bb1_frombool106_i[7:1] = 7'h0;
assign local_bb1_frombool106_i[0] = local_bb1_cmp85_i;

// This section implements an unregistered operation.
// 
wire local_bb1_conv_i_stall_local;
wire [31:0] local_bb1_conv_i;

assign local_bb1_conv_i[31:1] = 31'h0;
assign local_bb1_conv_i[0] = local_bb1_var__u29;

// This section implements an unregistered operation.
// 
wire local_bb1_cmp96_i_stall_local;
wire local_bb1_cmp96_i;

assign local_bb1_cmp96_i = ((local_bb1_and95_i & 32'h10) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_cmp113_i_stall_local;
wire local_bb1_cmp113_i;

assign local_bb1_cmp113_i = ((local_bb1_and112_i & 32'h8) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_cmp126_not_i_stall_local;
wire local_bb1_cmp126_not_i;

assign local_bb1_cmp126_not_i = ((local_bb1_and125_i & 32'h4) != 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1__16_i_stall_local;
wire [7:0] local_bb1__16_i;

assign local_bb1__16_i = (local_bb1_cmp96_i ? (local_bb1_frombool74_i & 8'h1) : (local_bb1_frombool106_i & 8'h1));

// This section implements an unregistered operation.
// 
wire local_bb1__17_v_i_stall_local;
wire local_bb1__17_v_i;

assign local_bb1__17_v_i = (local_bb1_cmp96_i ? local_bb1_cmp76_i : local_bb1_cmp88_i);

// This section implements an unregistered operation.
// 
wire local_bb1__18_v_i_stall_local;
wire local_bb1__18_v_i;

assign local_bb1__18_v_i = (local_bb1_cmp96_i ? local_bb1_cmp79_i : local_bb1_cmp91_i);

// This section implements an unregistered operation.
// 
wire local_bb1__19_i_stall_local;
wire [31:0] local_bb1__19_i;

assign local_bb1__19_i = (local_bb1_cmp96_i ? 32'h0 : (local_bb1_conv_i & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb1__17_i_stall_local;
wire [7:0] local_bb1__17_i;

assign local_bb1__17_i[7:1] = 7'h0;
assign local_bb1__17_i[0] = local_bb1__17_v_i;

// This section implements an unregistered operation.
// 
wire local_bb1__18_i_stall_local;
wire [7:0] local_bb1__18_i;

assign local_bb1__18_i[7:1] = 7'h0;
assign local_bb1__18_i[0] = local_bb1__18_v_i;

// This section implements an unregistered operation.
// 
wire local_bb1_var__u30_stall_local;
wire [7:0] local_bb1_var__u30;

assign local_bb1_var__u30 = ((local_bb1__17_i & 8'h1) | (local_bb1__16_i & 8'h1));

// This section implements an unregistered operation.
// 
wire local_bb1__20_i_stall_local;
wire [7:0] local_bb1__20_i;

assign local_bb1__20_i = (local_bb1_cmp113_i ? (local_bb1__16_i & 8'h1) : (local_bb1__18_i & 8'h1));

// This section implements an unregistered operation.
// 
wire local_bb1_conv118_i_stall_local;
wire [31:0] local_bb1_conv118_i;

assign local_bb1_conv118_i[31:8] = 24'h0;
assign local_bb1_conv118_i[7:0] = (local_bb1_var__u30 & 8'h1);

// This section implements an unregistered operation.
// 
wire local_bb1_var__u31_stall_local;
wire [7:0] local_bb1_var__u31;

assign local_bb1_var__u31 = ((local_bb1__20_i & 8'h1) & 8'h1);

// This section implements an unregistered operation.
// 
wire local_bb1_or119_i_stall_local;
wire [31:0] local_bb1_or119_i;

assign local_bb1_or119_i = (local_bb1_cmp113_i ? 32'h0 : (local_bb1_conv118_i & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb1_conv129_i_stall_local;
wire [31:0] local_bb1_conv129_i;

assign local_bb1_conv129_i[31:8] = 24'h0;
assign local_bb1_conv129_i[7:0] = (local_bb1_var__u31 & 8'h1);

// This section implements an unregistered operation.
// 
wire local_bb1_reduction_3_i_stall_local;
wire [31:0] local_bb1_reduction_3_i;

assign local_bb1_reduction_3_i = ((local_bb1__19_i & 32'h1) | (local_bb1_or119_i & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb1_xor_i_valid_out;
wire local_bb1_xor_i_stall_in;
wire local_bb1_shr16_i_valid_out_2;
wire local_bb1_shr16_i_stall_in_2;
wire local_bb1_and20_i_valid_out;
wire local_bb1_and20_i_stall_in;
wire local_bb1_and35_i_valid_out;
wire local_bb1_and35_i_stall_in;
wire local_bb1_lnot33_not_i_valid_out;
wire local_bb1_lnot33_not_i_stall_in;
wire local_bb1_cmp27_i_valid_out;
wire local_bb1_cmp27_i_stall_in;
wire local_bb1__15_i_valid_out_7;
wire local_bb1__15_i_stall_in_7;
wire local_bb1_var__u27_valid_out;
wire local_bb1_var__u27_stall_in;
wire local_bb1_and93_i_valid_out;
wire local_bb1_and93_i_stall_in;
wire local_bb1_and143_i_valid_out;
wire local_bb1_and143_i_stall_in;
wire local_bb1_or130_i_valid_out;
wire local_bb1_or130_i_stall_in;
wire local_bb1_reduction_3_i_valid_out;
wire local_bb1_reduction_3_i_stall_in;
wire local_bb1_or130_i_inputs_ready;
wire local_bb1_or130_i_stall_local;
wire [31:0] local_bb1_or130_i;

assign local_bb1_or130_i_inputs_ready = (rnode_146to147_bb1__8_i_0_valid_out_0_NO_SHIFT_REG & rnode_146to147_bb1_var__u10_0_valid_out_0_NO_SHIFT_REG & rnode_146to147_bb1_add284_i212_0_valid_out_0_NO_SHIFT_REG & rnode_146to147_bb1__8_i_0_valid_out_1_NO_SHIFT_REG & rnode_146to147_bb1_var__u10_0_valid_out_1_NO_SHIFT_REG & rnode_146to147_bb1_add284_i212_0_valid_out_1_NO_SHIFT_REG);
assign local_bb1_or130_i = (local_bb1_cmp126_not_i ? (local_bb1_conv129_i & 32'h1) : 32'h0);
assign local_bb1_xor_i_valid_out = 1'b1;
assign local_bb1_shr16_i_valid_out_2 = 1'b1;
assign local_bb1_and20_i_valid_out = 1'b1;
assign local_bb1_and35_i_valid_out = 1'b1;
assign local_bb1_lnot33_not_i_valid_out = 1'b1;
assign local_bb1_cmp27_i_valid_out = 1'b1;
assign local_bb1__15_i_valid_out_7 = 1'b1;
assign local_bb1_var__u27_valid_out = 1'b1;
assign local_bb1_and93_i_valid_out = 1'b1;
assign local_bb1_and143_i_valid_out = 1'b1;
assign local_bb1_or130_i_valid_out = 1'b1;
assign local_bb1_reduction_3_i_valid_out = 1'b1;
assign rnode_146to147_bb1__8_i_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_146to147_bb1_var__u10_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_146to147_bb1_add284_i212_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_146to147_bb1__8_i_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_146to147_bb1_var__u10_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_146to147_bb1_add284_i212_0_stall_in_1_NO_SHIFT_REG = 1'b0;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_147to148_bb1_xor_i_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_147to148_bb1_xor_i_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_147to148_bb1_xor_i_0_NO_SHIFT_REG;
 logic rnode_147to148_bb1_xor_i_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_147to148_bb1_xor_i_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_147to148_bb1_xor_i_1_NO_SHIFT_REG;
 logic rnode_147to148_bb1_xor_i_0_valid_out_2_NO_SHIFT_REG;
 logic rnode_147to148_bb1_xor_i_0_stall_in_2_NO_SHIFT_REG;
 logic [31:0] rnode_147to148_bb1_xor_i_2_NO_SHIFT_REG;
 logic rnode_147to148_bb1_xor_i_0_reg_148_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_147to148_bb1_xor_i_0_reg_148_NO_SHIFT_REG;
 logic rnode_147to148_bb1_xor_i_0_valid_out_0_reg_148_NO_SHIFT_REG;
 logic rnode_147to148_bb1_xor_i_0_stall_in_0_reg_148_NO_SHIFT_REG;
 logic rnode_147to148_bb1_xor_i_0_stall_out_reg_148_NO_SHIFT_REG;

acl_data_fifo rnode_147to148_bb1_xor_i_0_reg_148_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_147to148_bb1_xor_i_0_reg_148_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_147to148_bb1_xor_i_0_stall_in_0_reg_148_NO_SHIFT_REG),
	.valid_out(rnode_147to148_bb1_xor_i_0_valid_out_0_reg_148_NO_SHIFT_REG),
	.stall_out(rnode_147to148_bb1_xor_i_0_stall_out_reg_148_NO_SHIFT_REG),
	.data_in(local_bb1_xor_i),
	.data_out(rnode_147to148_bb1_xor_i_0_reg_148_NO_SHIFT_REG)
);

defparam rnode_147to148_bb1_xor_i_0_reg_148_fifo.DEPTH = 1;
defparam rnode_147to148_bb1_xor_i_0_reg_148_fifo.DATA_WIDTH = 32;
defparam rnode_147to148_bb1_xor_i_0_reg_148_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_147to148_bb1_xor_i_0_reg_148_fifo.IMPL = "shift_reg";

assign rnode_147to148_bb1_xor_i_0_reg_148_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_xor_i_stall_in = 1'b0;
assign rnode_147to148_bb1_xor_i_0_stall_in_0_reg_148_NO_SHIFT_REG = 1'b0;
assign rnode_147to148_bb1_xor_i_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_147to148_bb1_xor_i_0_NO_SHIFT_REG = rnode_147to148_bb1_xor_i_0_reg_148_NO_SHIFT_REG;
assign rnode_147to148_bb1_xor_i_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_147to148_bb1_xor_i_1_NO_SHIFT_REG = rnode_147to148_bb1_xor_i_0_reg_148_NO_SHIFT_REG;
assign rnode_147to148_bb1_xor_i_0_valid_out_2_NO_SHIFT_REG = 1'b1;
assign rnode_147to148_bb1_xor_i_2_NO_SHIFT_REG = rnode_147to148_bb1_xor_i_0_reg_148_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_147to148_bb1_shr16_i_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_147to148_bb1_shr16_i_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_147to148_bb1_shr16_i_0_NO_SHIFT_REG;
 logic rnode_147to148_bb1_shr16_i_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_147to148_bb1_shr16_i_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_147to148_bb1_shr16_i_1_NO_SHIFT_REG;
 logic rnode_147to148_bb1_shr16_i_0_reg_148_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_147to148_bb1_shr16_i_0_reg_148_NO_SHIFT_REG;
 logic rnode_147to148_bb1_shr16_i_0_valid_out_0_reg_148_NO_SHIFT_REG;
 logic rnode_147to148_bb1_shr16_i_0_stall_in_0_reg_148_NO_SHIFT_REG;
 logic rnode_147to148_bb1_shr16_i_0_stall_out_reg_148_NO_SHIFT_REG;

acl_data_fifo rnode_147to148_bb1_shr16_i_0_reg_148_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_147to148_bb1_shr16_i_0_reg_148_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_147to148_bb1_shr16_i_0_stall_in_0_reg_148_NO_SHIFT_REG),
	.valid_out(rnode_147to148_bb1_shr16_i_0_valid_out_0_reg_148_NO_SHIFT_REG),
	.stall_out(rnode_147to148_bb1_shr16_i_0_stall_out_reg_148_NO_SHIFT_REG),
	.data_in((local_bb1_shr16_i & 32'h1FF)),
	.data_out(rnode_147to148_bb1_shr16_i_0_reg_148_NO_SHIFT_REG)
);

defparam rnode_147to148_bb1_shr16_i_0_reg_148_fifo.DEPTH = 1;
defparam rnode_147to148_bb1_shr16_i_0_reg_148_fifo.DATA_WIDTH = 32;
defparam rnode_147to148_bb1_shr16_i_0_reg_148_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_147to148_bb1_shr16_i_0_reg_148_fifo.IMPL = "shift_reg";

assign rnode_147to148_bb1_shr16_i_0_reg_148_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_shr16_i_stall_in_2 = 1'b0;
assign rnode_147to148_bb1_shr16_i_0_stall_in_0_reg_148_NO_SHIFT_REG = 1'b0;
assign rnode_147to148_bb1_shr16_i_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_147to148_bb1_shr16_i_0_NO_SHIFT_REG = rnode_147to148_bb1_shr16_i_0_reg_148_NO_SHIFT_REG;
assign rnode_147to148_bb1_shr16_i_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_147to148_bb1_shr16_i_1_NO_SHIFT_REG = rnode_147to148_bb1_shr16_i_0_reg_148_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_147to148_bb1_and20_i_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_147to148_bb1_and20_i_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_147to148_bb1_and20_i_0_NO_SHIFT_REG;
 logic rnode_147to148_bb1_and20_i_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_147to148_bb1_and20_i_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_147to148_bb1_and20_i_1_NO_SHIFT_REG;
 logic rnode_147to148_bb1_and20_i_0_reg_148_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_147to148_bb1_and20_i_0_reg_148_NO_SHIFT_REG;
 logic rnode_147to148_bb1_and20_i_0_valid_out_0_reg_148_NO_SHIFT_REG;
 logic rnode_147to148_bb1_and20_i_0_stall_in_0_reg_148_NO_SHIFT_REG;
 logic rnode_147to148_bb1_and20_i_0_stall_out_reg_148_NO_SHIFT_REG;

acl_data_fifo rnode_147to148_bb1_and20_i_0_reg_148_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_147to148_bb1_and20_i_0_reg_148_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_147to148_bb1_and20_i_0_stall_in_0_reg_148_NO_SHIFT_REG),
	.valid_out(rnode_147to148_bb1_and20_i_0_valid_out_0_reg_148_NO_SHIFT_REG),
	.stall_out(rnode_147to148_bb1_and20_i_0_stall_out_reg_148_NO_SHIFT_REG),
	.data_in((local_bb1_and20_i & 32'h7FFFFF)),
	.data_out(rnode_147to148_bb1_and20_i_0_reg_148_NO_SHIFT_REG)
);

defparam rnode_147to148_bb1_and20_i_0_reg_148_fifo.DEPTH = 1;
defparam rnode_147to148_bb1_and20_i_0_reg_148_fifo.DATA_WIDTH = 32;
defparam rnode_147to148_bb1_and20_i_0_reg_148_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_147to148_bb1_and20_i_0_reg_148_fifo.IMPL = "shift_reg";

assign rnode_147to148_bb1_and20_i_0_reg_148_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_and20_i_stall_in = 1'b0;
assign rnode_147to148_bb1_and20_i_0_stall_in_0_reg_148_NO_SHIFT_REG = 1'b0;
assign rnode_147to148_bb1_and20_i_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_147to148_bb1_and20_i_0_NO_SHIFT_REG = rnode_147to148_bb1_and20_i_0_reg_148_NO_SHIFT_REG;
assign rnode_147to148_bb1_and20_i_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_147to148_bb1_and20_i_1_NO_SHIFT_REG = rnode_147to148_bb1_and20_i_0_reg_148_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_147to148_bb1_and35_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_147to148_bb1_and35_i_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_147to148_bb1_and35_i_0_NO_SHIFT_REG;
 logic rnode_147to148_bb1_and35_i_0_reg_148_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_147to148_bb1_and35_i_0_reg_148_NO_SHIFT_REG;
 logic rnode_147to148_bb1_and35_i_0_valid_out_reg_148_NO_SHIFT_REG;
 logic rnode_147to148_bb1_and35_i_0_stall_in_reg_148_NO_SHIFT_REG;
 logic rnode_147to148_bb1_and35_i_0_stall_out_reg_148_NO_SHIFT_REG;

acl_data_fifo rnode_147to148_bb1_and35_i_0_reg_148_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_147to148_bb1_and35_i_0_reg_148_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_147to148_bb1_and35_i_0_stall_in_reg_148_NO_SHIFT_REG),
	.valid_out(rnode_147to148_bb1_and35_i_0_valid_out_reg_148_NO_SHIFT_REG),
	.stall_out(rnode_147to148_bb1_and35_i_0_stall_out_reg_148_NO_SHIFT_REG),
	.data_in((local_bb1_and35_i & 32'h80000000)),
	.data_out(rnode_147to148_bb1_and35_i_0_reg_148_NO_SHIFT_REG)
);

defparam rnode_147to148_bb1_and35_i_0_reg_148_fifo.DEPTH = 1;
defparam rnode_147to148_bb1_and35_i_0_reg_148_fifo.DATA_WIDTH = 32;
defparam rnode_147to148_bb1_and35_i_0_reg_148_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_147to148_bb1_and35_i_0_reg_148_fifo.IMPL = "shift_reg";

assign rnode_147to148_bb1_and35_i_0_reg_148_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_and35_i_stall_in = 1'b0;
assign rnode_147to148_bb1_and35_i_0_NO_SHIFT_REG = rnode_147to148_bb1_and35_i_0_reg_148_NO_SHIFT_REG;
assign rnode_147to148_bb1_and35_i_0_stall_in_reg_148_NO_SHIFT_REG = 1'b0;
assign rnode_147to148_bb1_and35_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_147to148_bb1_lnot33_not_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_147to148_bb1_lnot33_not_i_0_stall_in_NO_SHIFT_REG;
 logic rnode_147to148_bb1_lnot33_not_i_0_NO_SHIFT_REG;
 logic rnode_147to148_bb1_lnot33_not_i_0_reg_148_inputs_ready_NO_SHIFT_REG;
 logic rnode_147to148_bb1_lnot33_not_i_0_reg_148_NO_SHIFT_REG;
 logic rnode_147to148_bb1_lnot33_not_i_0_valid_out_reg_148_NO_SHIFT_REG;
 logic rnode_147to148_bb1_lnot33_not_i_0_stall_in_reg_148_NO_SHIFT_REG;
 logic rnode_147to148_bb1_lnot33_not_i_0_stall_out_reg_148_NO_SHIFT_REG;

acl_data_fifo rnode_147to148_bb1_lnot33_not_i_0_reg_148_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_147to148_bb1_lnot33_not_i_0_reg_148_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_147to148_bb1_lnot33_not_i_0_stall_in_reg_148_NO_SHIFT_REG),
	.valid_out(rnode_147to148_bb1_lnot33_not_i_0_valid_out_reg_148_NO_SHIFT_REG),
	.stall_out(rnode_147to148_bb1_lnot33_not_i_0_stall_out_reg_148_NO_SHIFT_REG),
	.data_in(local_bb1_lnot33_not_i),
	.data_out(rnode_147to148_bb1_lnot33_not_i_0_reg_148_NO_SHIFT_REG)
);

defparam rnode_147to148_bb1_lnot33_not_i_0_reg_148_fifo.DEPTH = 1;
defparam rnode_147to148_bb1_lnot33_not_i_0_reg_148_fifo.DATA_WIDTH = 1;
defparam rnode_147to148_bb1_lnot33_not_i_0_reg_148_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_147to148_bb1_lnot33_not_i_0_reg_148_fifo.IMPL = "shift_reg";

assign rnode_147to148_bb1_lnot33_not_i_0_reg_148_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_lnot33_not_i_stall_in = 1'b0;
assign rnode_147to148_bb1_lnot33_not_i_0_NO_SHIFT_REG = rnode_147to148_bb1_lnot33_not_i_0_reg_148_NO_SHIFT_REG;
assign rnode_147to148_bb1_lnot33_not_i_0_stall_in_reg_148_NO_SHIFT_REG = 1'b0;
assign rnode_147to148_bb1_lnot33_not_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_147to148_bb1_cmp27_i_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_147to148_bb1_cmp27_i_0_stall_in_0_NO_SHIFT_REG;
 logic rnode_147to148_bb1_cmp27_i_0_NO_SHIFT_REG;
 logic rnode_147to148_bb1_cmp27_i_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_147to148_bb1_cmp27_i_0_stall_in_1_NO_SHIFT_REG;
 logic rnode_147to148_bb1_cmp27_i_1_NO_SHIFT_REG;
 logic rnode_147to148_bb1_cmp27_i_0_reg_148_inputs_ready_NO_SHIFT_REG;
 logic rnode_147to148_bb1_cmp27_i_0_reg_148_NO_SHIFT_REG;
 logic rnode_147to148_bb1_cmp27_i_0_valid_out_0_reg_148_NO_SHIFT_REG;
 logic rnode_147to148_bb1_cmp27_i_0_stall_in_0_reg_148_NO_SHIFT_REG;
 logic rnode_147to148_bb1_cmp27_i_0_stall_out_reg_148_NO_SHIFT_REG;

acl_data_fifo rnode_147to148_bb1_cmp27_i_0_reg_148_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_147to148_bb1_cmp27_i_0_reg_148_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_147to148_bb1_cmp27_i_0_stall_in_0_reg_148_NO_SHIFT_REG),
	.valid_out(rnode_147to148_bb1_cmp27_i_0_valid_out_0_reg_148_NO_SHIFT_REG),
	.stall_out(rnode_147to148_bb1_cmp27_i_0_stall_out_reg_148_NO_SHIFT_REG),
	.data_in(local_bb1_cmp27_i),
	.data_out(rnode_147to148_bb1_cmp27_i_0_reg_148_NO_SHIFT_REG)
);

defparam rnode_147to148_bb1_cmp27_i_0_reg_148_fifo.DEPTH = 1;
defparam rnode_147to148_bb1_cmp27_i_0_reg_148_fifo.DATA_WIDTH = 1;
defparam rnode_147to148_bb1_cmp27_i_0_reg_148_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_147to148_bb1_cmp27_i_0_reg_148_fifo.IMPL = "shift_reg";

assign rnode_147to148_bb1_cmp27_i_0_reg_148_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_cmp27_i_stall_in = 1'b0;
assign rnode_147to148_bb1_cmp27_i_0_stall_in_0_reg_148_NO_SHIFT_REG = 1'b0;
assign rnode_147to148_bb1_cmp27_i_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_147to148_bb1_cmp27_i_0_NO_SHIFT_REG = rnode_147to148_bb1_cmp27_i_0_reg_148_NO_SHIFT_REG;
assign rnode_147to148_bb1_cmp27_i_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_147to148_bb1_cmp27_i_1_NO_SHIFT_REG = rnode_147to148_bb1_cmp27_i_0_reg_148_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_147to148_bb1__15_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_147to148_bb1__15_i_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_147to148_bb1__15_i_0_NO_SHIFT_REG;
 logic rnode_147to148_bb1__15_i_0_reg_148_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_147to148_bb1__15_i_0_reg_148_NO_SHIFT_REG;
 logic rnode_147to148_bb1__15_i_0_valid_out_reg_148_NO_SHIFT_REG;
 logic rnode_147to148_bb1__15_i_0_stall_in_reg_148_NO_SHIFT_REG;
 logic rnode_147to148_bb1__15_i_0_stall_out_reg_148_NO_SHIFT_REG;

acl_data_fifo rnode_147to148_bb1__15_i_0_reg_148_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_147to148_bb1__15_i_0_reg_148_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_147to148_bb1__15_i_0_stall_in_reg_148_NO_SHIFT_REG),
	.valid_out(rnode_147to148_bb1__15_i_0_valid_out_reg_148_NO_SHIFT_REG),
	.stall_out(rnode_147to148_bb1__15_i_0_stall_out_reg_148_NO_SHIFT_REG),
	.data_in((local_bb1__15_i & 32'h7FFFFF8)),
	.data_out(rnode_147to148_bb1__15_i_0_reg_148_NO_SHIFT_REG)
);

defparam rnode_147to148_bb1__15_i_0_reg_148_fifo.DEPTH = 1;
defparam rnode_147to148_bb1__15_i_0_reg_148_fifo.DATA_WIDTH = 32;
defparam rnode_147to148_bb1__15_i_0_reg_148_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_147to148_bb1__15_i_0_reg_148_fifo.IMPL = "shift_reg";

assign rnode_147to148_bb1__15_i_0_reg_148_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1__15_i_stall_in_7 = 1'b0;
assign rnode_147to148_bb1__15_i_0_NO_SHIFT_REG = rnode_147to148_bb1__15_i_0_reg_148_NO_SHIFT_REG;
assign rnode_147to148_bb1__15_i_0_stall_in_reg_148_NO_SHIFT_REG = 1'b0;
assign rnode_147to148_bb1__15_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_147to148_bb1_var__u27_0_valid_out_NO_SHIFT_REG;
 logic rnode_147to148_bb1_var__u27_0_stall_in_NO_SHIFT_REG;
 logic rnode_147to148_bb1_var__u27_0_NO_SHIFT_REG;
 logic rnode_147to148_bb1_var__u27_0_reg_148_inputs_ready_NO_SHIFT_REG;
 logic rnode_147to148_bb1_var__u27_0_reg_148_NO_SHIFT_REG;
 logic rnode_147to148_bb1_var__u27_0_valid_out_reg_148_NO_SHIFT_REG;
 logic rnode_147to148_bb1_var__u27_0_stall_in_reg_148_NO_SHIFT_REG;
 logic rnode_147to148_bb1_var__u27_0_stall_out_reg_148_NO_SHIFT_REG;

acl_data_fifo rnode_147to148_bb1_var__u27_0_reg_148_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_147to148_bb1_var__u27_0_reg_148_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_147to148_bb1_var__u27_0_stall_in_reg_148_NO_SHIFT_REG),
	.valid_out(rnode_147to148_bb1_var__u27_0_valid_out_reg_148_NO_SHIFT_REG),
	.stall_out(rnode_147to148_bb1_var__u27_0_stall_out_reg_148_NO_SHIFT_REG),
	.data_in(local_bb1_var__u27),
	.data_out(rnode_147to148_bb1_var__u27_0_reg_148_NO_SHIFT_REG)
);

defparam rnode_147to148_bb1_var__u27_0_reg_148_fifo.DEPTH = 1;
defparam rnode_147to148_bb1_var__u27_0_reg_148_fifo.DATA_WIDTH = 1;
defparam rnode_147to148_bb1_var__u27_0_reg_148_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_147to148_bb1_var__u27_0_reg_148_fifo.IMPL = "shift_reg";

assign rnode_147to148_bb1_var__u27_0_reg_148_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_var__u27_stall_in = 1'b0;
assign rnode_147to148_bb1_var__u27_0_NO_SHIFT_REG = rnode_147to148_bb1_var__u27_0_reg_148_NO_SHIFT_REG;
assign rnode_147to148_bb1_var__u27_0_stall_in_reg_148_NO_SHIFT_REG = 1'b0;
assign rnode_147to148_bb1_var__u27_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_147to148_bb1_and93_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_147to148_bb1_and93_i_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_147to148_bb1_and93_i_0_NO_SHIFT_REG;
 logic rnode_147to148_bb1_and93_i_0_reg_148_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_147to148_bb1_and93_i_0_reg_148_NO_SHIFT_REG;
 logic rnode_147to148_bb1_and93_i_0_valid_out_reg_148_NO_SHIFT_REG;
 logic rnode_147to148_bb1_and93_i_0_stall_in_reg_148_NO_SHIFT_REG;
 logic rnode_147to148_bb1_and93_i_0_stall_out_reg_148_NO_SHIFT_REG;

acl_data_fifo rnode_147to148_bb1_and93_i_0_reg_148_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_147to148_bb1_and93_i_0_reg_148_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_147to148_bb1_and93_i_0_stall_in_reg_148_NO_SHIFT_REG),
	.valid_out(rnode_147to148_bb1_and93_i_0_valid_out_reg_148_NO_SHIFT_REG),
	.stall_out(rnode_147to148_bb1_and93_i_0_stall_out_reg_148_NO_SHIFT_REG),
	.data_in((local_bb1_and93_i & 32'h1C)),
	.data_out(rnode_147to148_bb1_and93_i_0_reg_148_NO_SHIFT_REG)
);

defparam rnode_147to148_bb1_and93_i_0_reg_148_fifo.DEPTH = 1;
defparam rnode_147to148_bb1_and93_i_0_reg_148_fifo.DATA_WIDTH = 32;
defparam rnode_147to148_bb1_and93_i_0_reg_148_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_147to148_bb1_and93_i_0_reg_148_fifo.IMPL = "shift_reg";

assign rnode_147to148_bb1_and93_i_0_reg_148_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_and93_i_stall_in = 1'b0;
assign rnode_147to148_bb1_and93_i_0_NO_SHIFT_REG = rnode_147to148_bb1_and93_i_0_reg_148_NO_SHIFT_REG;
assign rnode_147to148_bb1_and93_i_0_stall_in_reg_148_NO_SHIFT_REG = 1'b0;
assign rnode_147to148_bb1_and93_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_147to148_bb1_and143_i_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_147to148_bb1_and143_i_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_147to148_bb1_and143_i_0_NO_SHIFT_REG;
 logic rnode_147to148_bb1_and143_i_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_147to148_bb1_and143_i_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_147to148_bb1_and143_i_1_NO_SHIFT_REG;
 logic rnode_147to148_bb1_and143_i_0_valid_out_2_NO_SHIFT_REG;
 logic rnode_147to148_bb1_and143_i_0_stall_in_2_NO_SHIFT_REG;
 logic [31:0] rnode_147to148_bb1_and143_i_2_NO_SHIFT_REG;
 logic rnode_147to148_bb1_and143_i_0_valid_out_3_NO_SHIFT_REG;
 logic rnode_147to148_bb1_and143_i_0_stall_in_3_NO_SHIFT_REG;
 logic [31:0] rnode_147to148_bb1_and143_i_3_NO_SHIFT_REG;
 logic rnode_147to148_bb1_and143_i_0_reg_148_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_147to148_bb1_and143_i_0_reg_148_NO_SHIFT_REG;
 logic rnode_147to148_bb1_and143_i_0_valid_out_0_reg_148_NO_SHIFT_REG;
 logic rnode_147to148_bb1_and143_i_0_stall_in_0_reg_148_NO_SHIFT_REG;
 logic rnode_147to148_bb1_and143_i_0_stall_out_reg_148_NO_SHIFT_REG;

acl_data_fifo rnode_147to148_bb1_and143_i_0_reg_148_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_147to148_bb1_and143_i_0_reg_148_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_147to148_bb1_and143_i_0_stall_in_0_reg_148_NO_SHIFT_REG),
	.valid_out(rnode_147to148_bb1_and143_i_0_valid_out_0_reg_148_NO_SHIFT_REG),
	.stall_out(rnode_147to148_bb1_and143_i_0_stall_out_reg_148_NO_SHIFT_REG),
	.data_in((local_bb1_and143_i & 32'h3)),
	.data_out(rnode_147to148_bb1_and143_i_0_reg_148_NO_SHIFT_REG)
);

defparam rnode_147to148_bb1_and143_i_0_reg_148_fifo.DEPTH = 1;
defparam rnode_147to148_bb1_and143_i_0_reg_148_fifo.DATA_WIDTH = 32;
defparam rnode_147to148_bb1_and143_i_0_reg_148_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_147to148_bb1_and143_i_0_reg_148_fifo.IMPL = "shift_reg";

assign rnode_147to148_bb1_and143_i_0_reg_148_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_and143_i_stall_in = 1'b0;
assign rnode_147to148_bb1_and143_i_0_stall_in_0_reg_148_NO_SHIFT_REG = 1'b0;
assign rnode_147to148_bb1_and143_i_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_147to148_bb1_and143_i_0_NO_SHIFT_REG = rnode_147to148_bb1_and143_i_0_reg_148_NO_SHIFT_REG;
assign rnode_147to148_bb1_and143_i_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_147to148_bb1_and143_i_1_NO_SHIFT_REG = rnode_147to148_bb1_and143_i_0_reg_148_NO_SHIFT_REG;
assign rnode_147to148_bb1_and143_i_0_valid_out_2_NO_SHIFT_REG = 1'b1;
assign rnode_147to148_bb1_and143_i_2_NO_SHIFT_REG = rnode_147to148_bb1_and143_i_0_reg_148_NO_SHIFT_REG;
assign rnode_147to148_bb1_and143_i_0_valid_out_3_NO_SHIFT_REG = 1'b1;
assign rnode_147to148_bb1_and143_i_3_NO_SHIFT_REG = rnode_147to148_bb1_and143_i_0_reg_148_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_147to148_bb1_or130_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_147to148_bb1_or130_i_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_147to148_bb1_or130_i_0_NO_SHIFT_REG;
 logic rnode_147to148_bb1_or130_i_0_reg_148_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_147to148_bb1_or130_i_0_reg_148_NO_SHIFT_REG;
 logic rnode_147to148_bb1_or130_i_0_valid_out_reg_148_NO_SHIFT_REG;
 logic rnode_147to148_bb1_or130_i_0_stall_in_reg_148_NO_SHIFT_REG;
 logic rnode_147to148_bb1_or130_i_0_stall_out_reg_148_NO_SHIFT_REG;

acl_data_fifo rnode_147to148_bb1_or130_i_0_reg_148_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_147to148_bb1_or130_i_0_reg_148_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_147to148_bb1_or130_i_0_stall_in_reg_148_NO_SHIFT_REG),
	.valid_out(rnode_147to148_bb1_or130_i_0_valid_out_reg_148_NO_SHIFT_REG),
	.stall_out(rnode_147to148_bb1_or130_i_0_stall_out_reg_148_NO_SHIFT_REG),
	.data_in((local_bb1_or130_i & 32'h1)),
	.data_out(rnode_147to148_bb1_or130_i_0_reg_148_NO_SHIFT_REG)
);

defparam rnode_147to148_bb1_or130_i_0_reg_148_fifo.DEPTH = 1;
defparam rnode_147to148_bb1_or130_i_0_reg_148_fifo.DATA_WIDTH = 32;
defparam rnode_147to148_bb1_or130_i_0_reg_148_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_147to148_bb1_or130_i_0_reg_148_fifo.IMPL = "shift_reg";

assign rnode_147to148_bb1_or130_i_0_reg_148_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_or130_i_stall_in = 1'b0;
assign rnode_147to148_bb1_or130_i_0_NO_SHIFT_REG = rnode_147to148_bb1_or130_i_0_reg_148_NO_SHIFT_REG;
assign rnode_147to148_bb1_or130_i_0_stall_in_reg_148_NO_SHIFT_REG = 1'b0;
assign rnode_147to148_bb1_or130_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_147to148_bb1_reduction_3_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_147to148_bb1_reduction_3_i_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_147to148_bb1_reduction_3_i_0_NO_SHIFT_REG;
 logic rnode_147to148_bb1_reduction_3_i_0_reg_148_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_147to148_bb1_reduction_3_i_0_reg_148_NO_SHIFT_REG;
 logic rnode_147to148_bb1_reduction_3_i_0_valid_out_reg_148_NO_SHIFT_REG;
 logic rnode_147to148_bb1_reduction_3_i_0_stall_in_reg_148_NO_SHIFT_REG;
 logic rnode_147to148_bb1_reduction_3_i_0_stall_out_reg_148_NO_SHIFT_REG;

acl_data_fifo rnode_147to148_bb1_reduction_3_i_0_reg_148_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_147to148_bb1_reduction_3_i_0_reg_148_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_147to148_bb1_reduction_3_i_0_stall_in_reg_148_NO_SHIFT_REG),
	.valid_out(rnode_147to148_bb1_reduction_3_i_0_valid_out_reg_148_NO_SHIFT_REG),
	.stall_out(rnode_147to148_bb1_reduction_3_i_0_stall_out_reg_148_NO_SHIFT_REG),
	.data_in((local_bb1_reduction_3_i & 32'h1)),
	.data_out(rnode_147to148_bb1_reduction_3_i_0_reg_148_NO_SHIFT_REG)
);

defparam rnode_147to148_bb1_reduction_3_i_0_reg_148_fifo.DEPTH = 1;
defparam rnode_147to148_bb1_reduction_3_i_0_reg_148_fifo.DATA_WIDTH = 32;
defparam rnode_147to148_bb1_reduction_3_i_0_reg_148_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_147to148_bb1_reduction_3_i_0_reg_148_fifo.IMPL = "shift_reg";

assign rnode_147to148_bb1_reduction_3_i_0_reg_148_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_reduction_3_i_stall_in = 1'b0;
assign rnode_147to148_bb1_reduction_3_i_0_NO_SHIFT_REG = rnode_147to148_bb1_reduction_3_i_0_reg_148_NO_SHIFT_REG;
assign rnode_147to148_bb1_reduction_3_i_0_stall_in_reg_148_NO_SHIFT_REG = 1'b0;
assign rnode_147to148_bb1_reduction_3_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb1_cmp37_i_stall_local;
wire local_bb1_cmp37_i;

assign local_bb1_cmp37_i = ($signed(rnode_147to148_bb1_xor_i_0_NO_SHIFT_REG) < $signed(32'h0));

// This section implements an unregistered operation.
// 
wire local_bb1_xor_lobit_i_stall_local;
wire [31:0] local_bb1_xor_lobit_i;

assign local_bb1_xor_lobit_i = ($signed(rnode_147to148_bb1_xor_i_1_NO_SHIFT_REG) >>> 32'h1F);

// This section implements an unregistered operation.
// 
wire local_bb1_and36_lobit_i_stall_local;
wire [31:0] local_bb1_and36_lobit_i;

assign local_bb1_and36_lobit_i = (rnode_147to148_bb1_xor_i_2_NO_SHIFT_REG >> 32'h1F);

// This section implements an unregistered operation.
// 
wire local_bb1_and17_i_stall_local;
wire [31:0] local_bb1_and17_i;

assign local_bb1_and17_i = ((rnode_147to148_bb1_shr16_i_0_NO_SHIFT_REG & 32'h1FF) & 32'hFF);

// Register node:
//  * latency = 2
//  * capacity = 2
 logic rnode_148to150_bb1_shr16_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_148to150_bb1_shr16_i_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_148to150_bb1_shr16_i_0_NO_SHIFT_REG;
 logic rnode_148to150_bb1_shr16_i_0_reg_150_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_148to150_bb1_shr16_i_0_reg_150_NO_SHIFT_REG;
 logic rnode_148to150_bb1_shr16_i_0_valid_out_reg_150_NO_SHIFT_REG;
 logic rnode_148to150_bb1_shr16_i_0_stall_in_reg_150_NO_SHIFT_REG;
 logic rnode_148to150_bb1_shr16_i_0_stall_out_reg_150_NO_SHIFT_REG;

acl_data_fifo rnode_148to150_bb1_shr16_i_0_reg_150_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_148to150_bb1_shr16_i_0_reg_150_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_148to150_bb1_shr16_i_0_stall_in_reg_150_NO_SHIFT_REG),
	.valid_out(rnode_148to150_bb1_shr16_i_0_valid_out_reg_150_NO_SHIFT_REG),
	.stall_out(rnode_148to150_bb1_shr16_i_0_stall_out_reg_150_NO_SHIFT_REG),
	.data_in((rnode_147to148_bb1_shr16_i_1_NO_SHIFT_REG & 32'h1FF)),
	.data_out(rnode_148to150_bb1_shr16_i_0_reg_150_NO_SHIFT_REG)
);

defparam rnode_148to150_bb1_shr16_i_0_reg_150_fifo.DEPTH = 2;
defparam rnode_148to150_bb1_shr16_i_0_reg_150_fifo.DATA_WIDTH = 32;
defparam rnode_148to150_bb1_shr16_i_0_reg_150_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_148to150_bb1_shr16_i_0_reg_150_fifo.IMPL = "shift_reg";

assign rnode_148to150_bb1_shr16_i_0_reg_150_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_147to148_bb1_shr16_i_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_148to150_bb1_shr16_i_0_NO_SHIFT_REG = rnode_148to150_bb1_shr16_i_0_reg_150_NO_SHIFT_REG;
assign rnode_148to150_bb1_shr16_i_0_stall_in_reg_150_NO_SHIFT_REG = 1'b0;
assign rnode_148to150_bb1_shr16_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb1_lnot30_i_stall_local;
wire local_bb1_lnot30_i;

assign local_bb1_lnot30_i = ((rnode_147to148_bb1_and20_i_0_NO_SHIFT_REG & 32'h7FFFFF) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_or_i5_stall_local;
wire [31:0] local_bb1_or_i5;

assign local_bb1_or_i5 = ((rnode_147to148_bb1_and20_i_1_NO_SHIFT_REG & 32'h7FFFFF) << 32'h3);

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_148to149_bb1_and35_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_148to149_bb1_and35_i_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_148to149_bb1_and35_i_0_NO_SHIFT_REG;
 logic rnode_148to149_bb1_and35_i_0_reg_149_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_148to149_bb1_and35_i_0_reg_149_NO_SHIFT_REG;
 logic rnode_148to149_bb1_and35_i_0_valid_out_reg_149_NO_SHIFT_REG;
 logic rnode_148to149_bb1_and35_i_0_stall_in_reg_149_NO_SHIFT_REG;
 logic rnode_148to149_bb1_and35_i_0_stall_out_reg_149_NO_SHIFT_REG;

acl_data_fifo rnode_148to149_bb1_and35_i_0_reg_149_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_148to149_bb1_and35_i_0_reg_149_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_148to149_bb1_and35_i_0_stall_in_reg_149_NO_SHIFT_REG),
	.valid_out(rnode_148to149_bb1_and35_i_0_valid_out_reg_149_NO_SHIFT_REG),
	.stall_out(rnode_148to149_bb1_and35_i_0_stall_out_reg_149_NO_SHIFT_REG),
	.data_in((rnode_147to148_bb1_and35_i_0_NO_SHIFT_REG & 32'h80000000)),
	.data_out(rnode_148to149_bb1_and35_i_0_reg_149_NO_SHIFT_REG)
);

defparam rnode_148to149_bb1_and35_i_0_reg_149_fifo.DEPTH = 1;
defparam rnode_148to149_bb1_and35_i_0_reg_149_fifo.DATA_WIDTH = 32;
defparam rnode_148to149_bb1_and35_i_0_reg_149_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_148to149_bb1_and35_i_0_reg_149_fifo.IMPL = "shift_reg";

assign rnode_148to149_bb1_and35_i_0_reg_149_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_147to148_bb1_and35_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_148to149_bb1_and35_i_0_NO_SHIFT_REG = rnode_148to149_bb1_and35_i_0_reg_149_NO_SHIFT_REG;
assign rnode_148to149_bb1_and35_i_0_stall_in_reg_149_NO_SHIFT_REG = 1'b0;
assign rnode_148to149_bb1_and35_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb1_brmerge_not_i_stall_local;
wire local_bb1_brmerge_not_i;

assign local_bb1_brmerge_not_i = (rnode_147to148_bb1_cmp27_i_0_NO_SHIFT_REG & rnode_147to148_bb1_lnot33_not_i_0_NO_SHIFT_REG);

// This section implements an unregistered operation.
// 
wire local_bb1_shr94_i_stall_local;
wire [31:0] local_bb1_shr94_i;

assign local_bb1_shr94_i = ((rnode_147to148_bb1__15_i_0_NO_SHIFT_REG & 32'h7FFFFF8) >> (rnode_147to148_bb1_and93_i_0_NO_SHIFT_REG & 32'h1C));

// This section implements an unregistered operation.
// 
wire local_bb1_cmp146_i_stall_local;
wire local_bb1_cmp146_i;

assign local_bb1_cmp146_i = ((rnode_147to148_bb1_and143_i_1_NO_SHIFT_REG & 32'h3) == 32'h3);

// This section implements an unregistered operation.
// 
wire local_bb1_cmp157_i_stall_local;
wire local_bb1_cmp157_i;

assign local_bb1_cmp157_i = ((rnode_147to148_bb1_and143_i_2_NO_SHIFT_REG & 32'h3) == 32'h2);

// This section implements an unregistered operation.
// 
wire local_bb1_cmp166_i_stall_local;
wire local_bb1_cmp166_i;

assign local_bb1_cmp166_i = ((rnode_147to148_bb1_and143_i_3_NO_SHIFT_REG & 32'h3) == 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb1_lnot_i_stall_local;
wire local_bb1_lnot_i;

assign local_bb1_lnot_i = ((local_bb1_and17_i & 32'hFF) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_cmp25_i_stall_local;
wire local_bb1_cmp25_i;

assign local_bb1_cmp25_i = ((local_bb1_and17_i & 32'hFF) == 32'hFF);

// This section implements an unregistered operation.
// 
wire local_bb1_lnot30_not_i_stall_local;
wire local_bb1_lnot30_not_i;

assign local_bb1_lnot30_not_i = (local_bb1_lnot30_i ^ 1'b1);

// This section implements an unregistered operation.
// 
wire local_bb1_shl_i6_stall_local;
wire [31:0] local_bb1_shl_i6;

assign local_bb1_shl_i6 = ((local_bb1_or_i5 & 32'h3FFFFF8) | 32'h4000000);

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_149to150_bb1_and35_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_149to150_bb1_and35_i_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_149to150_bb1_and35_i_0_NO_SHIFT_REG;
 logic rnode_149to150_bb1_and35_i_0_reg_150_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_149to150_bb1_and35_i_0_reg_150_NO_SHIFT_REG;
 logic rnode_149to150_bb1_and35_i_0_valid_out_reg_150_NO_SHIFT_REG;
 logic rnode_149to150_bb1_and35_i_0_stall_in_reg_150_NO_SHIFT_REG;
 logic rnode_149to150_bb1_and35_i_0_stall_out_reg_150_NO_SHIFT_REG;

acl_data_fifo rnode_149to150_bb1_and35_i_0_reg_150_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_149to150_bb1_and35_i_0_reg_150_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_149to150_bb1_and35_i_0_stall_in_reg_150_NO_SHIFT_REG),
	.valid_out(rnode_149to150_bb1_and35_i_0_valid_out_reg_150_NO_SHIFT_REG),
	.stall_out(rnode_149to150_bb1_and35_i_0_stall_out_reg_150_NO_SHIFT_REG),
	.data_in((rnode_148to149_bb1_and35_i_0_NO_SHIFT_REG & 32'h80000000)),
	.data_out(rnode_149to150_bb1_and35_i_0_reg_150_NO_SHIFT_REG)
);

defparam rnode_149to150_bb1_and35_i_0_reg_150_fifo.DEPTH = 1;
defparam rnode_149to150_bb1_and35_i_0_reg_150_fifo.DATA_WIDTH = 32;
defparam rnode_149to150_bb1_and35_i_0_reg_150_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_149to150_bb1_and35_i_0_reg_150_fifo.IMPL = "shift_reg";

assign rnode_149to150_bb1_and35_i_0_reg_150_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_148to149_bb1_and35_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_149to150_bb1_and35_i_0_NO_SHIFT_REG = rnode_149to150_bb1_and35_i_0_reg_150_NO_SHIFT_REG;
assign rnode_149to150_bb1_and35_i_0_stall_in_reg_150_NO_SHIFT_REG = 1'b0;
assign rnode_149to150_bb1_and35_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb1_brmerge_not_not_i_stall_local;
wire local_bb1_brmerge_not_not_i;

assign local_bb1_brmerge_not_not_i = (local_bb1_brmerge_not_i ^ 1'b1);

// This section implements an unregistered operation.
// 
wire local_bb1_and136_i_stall_local;
wire [31:0] local_bb1_and136_i;

assign local_bb1_and136_i = (local_bb1_shr94_i >> 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb1_shr144_i_stall_local;
wire [31:0] local_bb1_shr144_i;

assign local_bb1_shr144_i = (local_bb1_shr94_i >> (rnode_147to148_bb1_and143_i_0_NO_SHIFT_REG & 32'h3));

// This section implements an unregistered operation.
// 
wire local_bb1_and140_i_stall_local;
wire [31:0] local_bb1_and140_i;

assign local_bb1_and140_i = (local_bb1_shr94_i & 32'h4);

// This section implements an unregistered operation.
// 
wire local_bb1_var__u32_stall_local;
wire [31:0] local_bb1_var__u32;

assign local_bb1_var__u32 = (local_bb1_shr94_i & 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb1_cmp25_not_i_stall_local;
wire local_bb1_cmp25_not_i;

assign local_bb1_cmp25_not_i = (local_bb1_cmp25_i ^ 1'b1);

// This section implements an unregistered operation.
// 
wire local_bb1_var__u33_stall_local;
wire local_bb1_var__u33;

assign local_bb1_var__u33 = (local_bb1_cmp25_i | rnode_147to148_bb1_cmp27_i_1_NO_SHIFT_REG);

// This section implements an unregistered operation.
// 
wire local_bb1_or_cond2_not_i_stall_local;
wire local_bb1_or_cond2_not_i;

assign local_bb1_or_cond2_not_i = (local_bb1_cmp25_i & local_bb1_lnot30_not_i);

// This section implements an unregistered operation.
// 
wire local_bb1__14_i_stall_local;
wire [31:0] local_bb1__14_i;

assign local_bb1__14_i = (local_bb1_lnot_i ? 32'h0 : ((local_bb1_shl_i6 & 32'h7FFFFF8) | 32'h4000000));

// This section implements an unregistered operation.
// 
wire local_bb1_var__u34_stall_local;
wire [31:0] local_bb1_var__u34;

assign local_bb1_var__u34 = ((local_bb1_and136_i & 32'h7FFFFFFF) | local_bb1_shr94_i);

// This section implements an unregistered operation.
// 
wire local_bb1_or170_i_stall_local;
wire [31:0] local_bb1_or170_i;

assign local_bb1_or170_i = (local_bb1_cmp166_i ? (local_bb1_var__u32 & 32'h1) : 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_or_cond2_i_stall_local;
wire local_bb1_or_cond2_i;

assign local_bb1_or_cond2_i = (local_bb1_lnot30_i | local_bb1_cmp25_not_i);

// This section implements an unregistered operation.
// 
wire local_bb1__11_i_stall_local;
wire local_bb1__11_i;

assign local_bb1__11_i = (local_bb1_or_cond2_not_i | local_bb1_brmerge_not_i);

// This section implements an unregistered operation.
// 
wire local_bb1_add_i7_stall_local;
wire [31:0] local_bb1_add_i7;

assign local_bb1_add_i7 = ((local_bb1__14_i & 32'h7FFFFF8) | (local_bb1_and36_lobit_i & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb1_var__u35_stall_local;
wire [31:0] local_bb1_var__u35;

assign local_bb1_var__u35 = (local_bb1_var__u34 & 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb1_reduction_1_i_stall_local;
wire local_bb1_reduction_1_i;

assign local_bb1_reduction_1_i = (local_bb1_or_cond2_i & local_bb1_brmerge_not_not_i);

// This section implements an unregistered operation.
// 
wire local_bb1_var__u36_stall_local;
wire [31:0] local_bb1_var__u36;

assign local_bb1_var__u36 = ((local_bb1_var__u35 & 32'h1) | (local_bb1_and140_i & 32'h4));

// This section implements an unregistered operation.
// 
wire local_bb1_or163_i_stall_local;
wire [31:0] local_bb1_or163_i;

assign local_bb1_or163_i = (local_bb1_cmp157_i ? (local_bb1_var__u35 & 32'h1) : 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_reduction_2_i_stall_local;
wire local_bb1_reduction_2_i;

assign local_bb1_reduction_2_i = (rnode_147to148_bb1_var__u27_0_NO_SHIFT_REG & local_bb1_reduction_1_i);

// This section implements an unregistered operation.
// 
wire local_bb1_var__u37_stall_local;
wire local_bb1_var__u37;

assign local_bb1_var__u37 = ((local_bb1_var__u36 & 32'h5) != 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_reduction_5_i_stall_local;
wire [31:0] local_bb1_reduction_5_i;

assign local_bb1_reduction_5_i = ((local_bb1_or163_i & 32'h1) | (local_bb1_or170_i & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb1__13_i_stall_local;
wire local_bb1__13_i;

assign local_bb1__13_i = (local_bb1_reduction_2_i ? local_bb1_cmp37_i : local_bb1__11_i);

// This section implements an unregistered operation.
// 
wire local_bb1_conv153_i_stall_local;
wire [31:0] local_bb1_conv153_i;

assign local_bb1_conv153_i[31:1] = 31'h0;
assign local_bb1_conv153_i[0] = local_bb1_var__u37;

// This section implements an unregistered operation.
// 
wire local_bb1_reduction_7_i_stall_local;
wire [31:0] local_bb1_reduction_7_i;

assign local_bb1_reduction_7_i = (local_bb1_shr144_i | (local_bb1_reduction_5_i & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb1_or154_i_stall_local;
wire [31:0] local_bb1_or154_i;

assign local_bb1_or154_i = (local_bb1_cmp146_i ? (local_bb1_conv153_i & 32'h1) : 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_reduction_4_i_stall_local;
wire [31:0] local_bb1_reduction_4_i;

assign local_bb1_reduction_4_i = ((rnode_147to148_bb1_or130_i_0_NO_SHIFT_REG & 32'h1) | (local_bb1_or154_i & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb1_reduction_6_i_stall_local;
wire [31:0] local_bb1_reduction_6_i;

assign local_bb1_reduction_6_i = ((rnode_147to148_bb1_reduction_3_i_0_NO_SHIFT_REG & 32'h1) | (local_bb1_reduction_4_i & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb1_reduction_8_i_stall_local;
wire [31:0] local_bb1_reduction_8_i;

assign local_bb1_reduction_8_i = ((local_bb1_reduction_6_i & 32'h1) | local_bb1_reduction_7_i);

// This section implements an unregistered operation.
// 
wire local_bb1_xor175_i_stall_local;
wire [31:0] local_bb1_xor175_i;

assign local_bb1_xor175_i = (local_bb1_reduction_8_i ^ local_bb1_xor_lobit_i);

// This section implements an unregistered operation.
// 
wire local_bb1_cmp37_i_valid_out_1;
wire local_bb1_cmp37_i_stall_in_1;
wire local_bb1__13_i_valid_out;
wire local_bb1__13_i_stall_in;
wire local_bb1_and17_i_valid_out_2;
wire local_bb1_and17_i_stall_in_2;
wire local_bb1_var__u33_valid_out;
wire local_bb1_var__u33_stall_in;
wire local_bb1_add178_i_valid_out;
wire local_bb1_add178_i_stall_in;
wire local_bb1_add178_i_inputs_ready;
wire local_bb1_add178_i_stall_local;
wire [31:0] local_bb1_add178_i;

assign local_bb1_add178_i_inputs_ready = (rnode_147to148_bb1_xor_i_0_valid_out_0_NO_SHIFT_REG & rnode_147to148_bb1_shr16_i_0_valid_out_0_NO_SHIFT_REG & rnode_147to148_bb1_cmp27_i_0_valid_out_1_NO_SHIFT_REG & rnode_147to148_bb1_and20_i_0_valid_out_0_NO_SHIFT_REG & rnode_147to148_bb1_and20_i_0_valid_out_1_NO_SHIFT_REG & rnode_147to148_bb1_cmp27_i_0_valid_out_0_NO_SHIFT_REG & rnode_147to148_bb1_lnot33_not_i_0_valid_out_NO_SHIFT_REG & rnode_147to148_bb1_xor_i_0_valid_out_1_NO_SHIFT_REG & rnode_147to148_bb1_xor_i_0_valid_out_2_NO_SHIFT_REG & rnode_147to148_bb1_var__u27_0_valid_out_NO_SHIFT_REG & rnode_147to148_bb1__15_i_0_valid_out_NO_SHIFT_REG & rnode_147to148_bb1_and93_i_0_valid_out_NO_SHIFT_REG & rnode_147to148_bb1_and143_i_0_valid_out_0_NO_SHIFT_REG & rnode_147to148_bb1_and143_i_0_valid_out_3_NO_SHIFT_REG & rnode_147to148_bb1_and143_i_0_valid_out_2_NO_SHIFT_REG & rnode_147to148_bb1_and143_i_0_valid_out_1_NO_SHIFT_REG & rnode_147to148_bb1_or130_i_0_valid_out_NO_SHIFT_REG & rnode_147to148_bb1_reduction_3_i_0_valid_out_NO_SHIFT_REG);
assign local_bb1_add178_i = ((local_bb1_add_i7 & 32'h7FFFFF9) + local_bb1_xor175_i);
assign local_bb1_cmp37_i_valid_out_1 = 1'b1;
assign local_bb1__13_i_valid_out = 1'b1;
assign local_bb1_and17_i_valid_out_2 = 1'b1;
assign local_bb1_var__u33_valid_out = 1'b1;
assign local_bb1_add178_i_valid_out = 1'b1;
assign rnode_147to148_bb1_xor_i_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_147to148_bb1_shr16_i_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_147to148_bb1_cmp27_i_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_147to148_bb1_and20_i_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_147to148_bb1_and20_i_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_147to148_bb1_cmp27_i_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_147to148_bb1_lnot33_not_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_147to148_bb1_xor_i_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_147to148_bb1_xor_i_0_stall_in_2_NO_SHIFT_REG = 1'b0;
assign rnode_147to148_bb1_var__u27_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_147to148_bb1__15_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_147to148_bb1_and93_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_147to148_bb1_and143_i_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_147to148_bb1_and143_i_0_stall_in_3_NO_SHIFT_REG = 1'b0;
assign rnode_147to148_bb1_and143_i_0_stall_in_2_NO_SHIFT_REG = 1'b0;
assign rnode_147to148_bb1_and143_i_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_147to148_bb1_or130_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_147to148_bb1_reduction_3_i_0_stall_in_NO_SHIFT_REG = 1'b0;

// Register node:
//  * latency = 2
//  * capacity = 2
 logic rnode_148to150_bb1_cmp37_i_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_148to150_bb1_cmp37_i_0_stall_in_0_NO_SHIFT_REG;
 logic rnode_148to150_bb1_cmp37_i_0_NO_SHIFT_REG;
 logic rnode_148to150_bb1_cmp37_i_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_148to150_bb1_cmp37_i_0_stall_in_1_NO_SHIFT_REG;
 logic rnode_148to150_bb1_cmp37_i_1_NO_SHIFT_REG;
 logic rnode_148to150_bb1_cmp37_i_0_valid_out_2_NO_SHIFT_REG;
 logic rnode_148to150_bb1_cmp37_i_0_stall_in_2_NO_SHIFT_REG;
 logic rnode_148to150_bb1_cmp37_i_2_NO_SHIFT_REG;
 logic rnode_148to150_bb1_cmp37_i_0_reg_150_inputs_ready_NO_SHIFT_REG;
 logic rnode_148to150_bb1_cmp37_i_0_reg_150_NO_SHIFT_REG;
 logic rnode_148to150_bb1_cmp37_i_0_valid_out_0_reg_150_NO_SHIFT_REG;
 logic rnode_148to150_bb1_cmp37_i_0_stall_in_0_reg_150_NO_SHIFT_REG;
 logic rnode_148to150_bb1_cmp37_i_0_stall_out_reg_150_NO_SHIFT_REG;

acl_data_fifo rnode_148to150_bb1_cmp37_i_0_reg_150_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_148to150_bb1_cmp37_i_0_reg_150_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_148to150_bb1_cmp37_i_0_stall_in_0_reg_150_NO_SHIFT_REG),
	.valid_out(rnode_148to150_bb1_cmp37_i_0_valid_out_0_reg_150_NO_SHIFT_REG),
	.stall_out(rnode_148to150_bb1_cmp37_i_0_stall_out_reg_150_NO_SHIFT_REG),
	.data_in(local_bb1_cmp37_i),
	.data_out(rnode_148to150_bb1_cmp37_i_0_reg_150_NO_SHIFT_REG)
);

defparam rnode_148to150_bb1_cmp37_i_0_reg_150_fifo.DEPTH = 2;
defparam rnode_148to150_bb1_cmp37_i_0_reg_150_fifo.DATA_WIDTH = 1;
defparam rnode_148to150_bb1_cmp37_i_0_reg_150_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_148to150_bb1_cmp37_i_0_reg_150_fifo.IMPL = "shift_reg";

assign rnode_148to150_bb1_cmp37_i_0_reg_150_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_cmp37_i_stall_in_1 = 1'b0;
assign rnode_148to150_bb1_cmp37_i_0_stall_in_0_reg_150_NO_SHIFT_REG = 1'b0;
assign rnode_148to150_bb1_cmp37_i_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_148to150_bb1_cmp37_i_0_NO_SHIFT_REG = rnode_148to150_bb1_cmp37_i_0_reg_150_NO_SHIFT_REG;
assign rnode_148to150_bb1_cmp37_i_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_148to150_bb1_cmp37_i_1_NO_SHIFT_REG = rnode_148to150_bb1_cmp37_i_0_reg_150_NO_SHIFT_REG;
assign rnode_148to150_bb1_cmp37_i_0_valid_out_2_NO_SHIFT_REG = 1'b1;
assign rnode_148to150_bb1_cmp37_i_2_NO_SHIFT_REG = rnode_148to150_bb1_cmp37_i_0_reg_150_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_148to149_bb1__13_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_148to149_bb1__13_i_0_stall_in_NO_SHIFT_REG;
 logic rnode_148to149_bb1__13_i_0_NO_SHIFT_REG;
 logic rnode_148to149_bb1__13_i_0_reg_149_inputs_ready_NO_SHIFT_REG;
 logic rnode_148to149_bb1__13_i_0_reg_149_NO_SHIFT_REG;
 logic rnode_148to149_bb1__13_i_0_valid_out_reg_149_NO_SHIFT_REG;
 logic rnode_148to149_bb1__13_i_0_stall_in_reg_149_NO_SHIFT_REG;
 logic rnode_148to149_bb1__13_i_0_stall_out_reg_149_NO_SHIFT_REG;

acl_data_fifo rnode_148to149_bb1__13_i_0_reg_149_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_148to149_bb1__13_i_0_reg_149_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_148to149_bb1__13_i_0_stall_in_reg_149_NO_SHIFT_REG),
	.valid_out(rnode_148to149_bb1__13_i_0_valid_out_reg_149_NO_SHIFT_REG),
	.stall_out(rnode_148to149_bb1__13_i_0_stall_out_reg_149_NO_SHIFT_REG),
	.data_in(local_bb1__13_i),
	.data_out(rnode_148to149_bb1__13_i_0_reg_149_NO_SHIFT_REG)
);

defparam rnode_148to149_bb1__13_i_0_reg_149_fifo.DEPTH = 1;
defparam rnode_148to149_bb1__13_i_0_reg_149_fifo.DATA_WIDTH = 1;
defparam rnode_148to149_bb1__13_i_0_reg_149_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_148to149_bb1__13_i_0_reg_149_fifo.IMPL = "shift_reg";

assign rnode_148to149_bb1__13_i_0_reg_149_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1__13_i_stall_in = 1'b0;
assign rnode_148to149_bb1__13_i_0_NO_SHIFT_REG = rnode_148to149_bb1__13_i_0_reg_149_NO_SHIFT_REG;
assign rnode_148to149_bb1__13_i_0_stall_in_reg_149_NO_SHIFT_REG = 1'b0;
assign rnode_148to149_bb1__13_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 2
//  * capacity = 2
 logic rnode_148to150_bb1_and17_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_148to150_bb1_and17_i_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_148to150_bb1_and17_i_0_NO_SHIFT_REG;
 logic rnode_148to150_bb1_and17_i_0_reg_150_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_148to150_bb1_and17_i_0_reg_150_NO_SHIFT_REG;
 logic rnode_148to150_bb1_and17_i_0_valid_out_reg_150_NO_SHIFT_REG;
 logic rnode_148to150_bb1_and17_i_0_stall_in_reg_150_NO_SHIFT_REG;
 logic rnode_148to150_bb1_and17_i_0_stall_out_reg_150_NO_SHIFT_REG;

acl_data_fifo rnode_148to150_bb1_and17_i_0_reg_150_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_148to150_bb1_and17_i_0_reg_150_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_148to150_bb1_and17_i_0_stall_in_reg_150_NO_SHIFT_REG),
	.valid_out(rnode_148to150_bb1_and17_i_0_valid_out_reg_150_NO_SHIFT_REG),
	.stall_out(rnode_148to150_bb1_and17_i_0_stall_out_reg_150_NO_SHIFT_REG),
	.data_in((local_bb1_and17_i & 32'hFF)),
	.data_out(rnode_148to150_bb1_and17_i_0_reg_150_NO_SHIFT_REG)
);

defparam rnode_148to150_bb1_and17_i_0_reg_150_fifo.DEPTH = 2;
defparam rnode_148to150_bb1_and17_i_0_reg_150_fifo.DATA_WIDTH = 32;
defparam rnode_148to150_bb1_and17_i_0_reg_150_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_148to150_bb1_and17_i_0_reg_150_fifo.IMPL = "shift_reg";

assign rnode_148to150_bb1_and17_i_0_reg_150_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_and17_i_stall_in_2 = 1'b0;
assign rnode_148to150_bb1_and17_i_0_NO_SHIFT_REG = rnode_148to150_bb1_and17_i_0_reg_150_NO_SHIFT_REG;
assign rnode_148to150_bb1_and17_i_0_stall_in_reg_150_NO_SHIFT_REG = 1'b0;
assign rnode_148to150_bb1_and17_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_148to149_bb1_var__u33_0_valid_out_NO_SHIFT_REG;
 logic rnode_148to149_bb1_var__u33_0_stall_in_NO_SHIFT_REG;
 logic rnode_148to149_bb1_var__u33_0_NO_SHIFT_REG;
 logic rnode_148to149_bb1_var__u33_0_reg_149_inputs_ready_NO_SHIFT_REG;
 logic rnode_148to149_bb1_var__u33_0_reg_149_NO_SHIFT_REG;
 logic rnode_148to149_bb1_var__u33_0_valid_out_reg_149_NO_SHIFT_REG;
 logic rnode_148to149_bb1_var__u33_0_stall_in_reg_149_NO_SHIFT_REG;
 logic rnode_148to149_bb1_var__u33_0_stall_out_reg_149_NO_SHIFT_REG;

acl_data_fifo rnode_148to149_bb1_var__u33_0_reg_149_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_148to149_bb1_var__u33_0_reg_149_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_148to149_bb1_var__u33_0_stall_in_reg_149_NO_SHIFT_REG),
	.valid_out(rnode_148to149_bb1_var__u33_0_valid_out_reg_149_NO_SHIFT_REG),
	.stall_out(rnode_148to149_bb1_var__u33_0_stall_out_reg_149_NO_SHIFT_REG),
	.data_in(local_bb1_var__u33),
	.data_out(rnode_148to149_bb1_var__u33_0_reg_149_NO_SHIFT_REG)
);

defparam rnode_148to149_bb1_var__u33_0_reg_149_fifo.DEPTH = 1;
defparam rnode_148to149_bb1_var__u33_0_reg_149_fifo.DATA_WIDTH = 1;
defparam rnode_148to149_bb1_var__u33_0_reg_149_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_148to149_bb1_var__u33_0_reg_149_fifo.IMPL = "shift_reg";

assign rnode_148to149_bb1_var__u33_0_reg_149_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_var__u33_stall_in = 1'b0;
assign rnode_148to149_bb1_var__u33_0_NO_SHIFT_REG = rnode_148to149_bb1_var__u33_0_reg_149_NO_SHIFT_REG;
assign rnode_148to149_bb1_var__u33_0_stall_in_reg_149_NO_SHIFT_REG = 1'b0;
assign rnode_148to149_bb1_var__u33_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_148to149_bb1_add178_i_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_148to149_bb1_add178_i_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_148to149_bb1_add178_i_0_NO_SHIFT_REG;
 logic rnode_148to149_bb1_add178_i_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_148to149_bb1_add178_i_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_148to149_bb1_add178_i_1_NO_SHIFT_REG;
 logic rnode_148to149_bb1_add178_i_0_valid_out_2_NO_SHIFT_REG;
 logic rnode_148to149_bb1_add178_i_0_stall_in_2_NO_SHIFT_REG;
 logic [31:0] rnode_148to149_bb1_add178_i_2_NO_SHIFT_REG;
 logic rnode_148to149_bb1_add178_i_0_valid_out_3_NO_SHIFT_REG;
 logic rnode_148to149_bb1_add178_i_0_stall_in_3_NO_SHIFT_REG;
 logic [31:0] rnode_148to149_bb1_add178_i_3_NO_SHIFT_REG;
 logic rnode_148to149_bb1_add178_i_0_reg_149_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_148to149_bb1_add178_i_0_reg_149_NO_SHIFT_REG;
 logic rnode_148to149_bb1_add178_i_0_valid_out_0_reg_149_NO_SHIFT_REG;
 logic rnode_148to149_bb1_add178_i_0_stall_in_0_reg_149_NO_SHIFT_REG;
 logic rnode_148to149_bb1_add178_i_0_stall_out_reg_149_NO_SHIFT_REG;

acl_data_fifo rnode_148to149_bb1_add178_i_0_reg_149_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_148to149_bb1_add178_i_0_reg_149_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_148to149_bb1_add178_i_0_stall_in_0_reg_149_NO_SHIFT_REG),
	.valid_out(rnode_148to149_bb1_add178_i_0_valid_out_0_reg_149_NO_SHIFT_REG),
	.stall_out(rnode_148to149_bb1_add178_i_0_stall_out_reg_149_NO_SHIFT_REG),
	.data_in(local_bb1_add178_i),
	.data_out(rnode_148to149_bb1_add178_i_0_reg_149_NO_SHIFT_REG)
);

defparam rnode_148to149_bb1_add178_i_0_reg_149_fifo.DEPTH = 1;
defparam rnode_148to149_bb1_add178_i_0_reg_149_fifo.DATA_WIDTH = 32;
defparam rnode_148to149_bb1_add178_i_0_reg_149_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_148to149_bb1_add178_i_0_reg_149_fifo.IMPL = "shift_reg";

assign rnode_148to149_bb1_add178_i_0_reg_149_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_add178_i_stall_in = 1'b0;
assign rnode_148to149_bb1_add178_i_0_stall_in_0_reg_149_NO_SHIFT_REG = 1'b0;
assign rnode_148to149_bb1_add178_i_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_148to149_bb1_add178_i_0_NO_SHIFT_REG = rnode_148to149_bb1_add178_i_0_reg_149_NO_SHIFT_REG;
assign rnode_148to149_bb1_add178_i_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_148to149_bb1_add178_i_1_NO_SHIFT_REG = rnode_148to149_bb1_add178_i_0_reg_149_NO_SHIFT_REG;
assign rnode_148to149_bb1_add178_i_0_valid_out_2_NO_SHIFT_REG = 1'b1;
assign rnode_148to149_bb1_add178_i_2_NO_SHIFT_REG = rnode_148to149_bb1_add178_i_0_reg_149_NO_SHIFT_REG;
assign rnode_148to149_bb1_add178_i_0_valid_out_3_NO_SHIFT_REG = 1'b1;
assign rnode_148to149_bb1_add178_i_3_NO_SHIFT_REG = rnode_148to149_bb1_add178_i_0_reg_149_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb1_not_cmp37_i_stall_local;
wire local_bb1_not_cmp37_i;

assign local_bb1_not_cmp37_i = (rnode_148to150_bb1_cmp37_i_0_NO_SHIFT_REG ^ 1'b1);

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_149to150_bb1__13_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_149to150_bb1__13_i_0_stall_in_NO_SHIFT_REG;
 logic rnode_149to150_bb1__13_i_0_NO_SHIFT_REG;
 logic rnode_149to150_bb1__13_i_0_reg_150_inputs_ready_NO_SHIFT_REG;
 logic rnode_149to150_bb1__13_i_0_reg_150_NO_SHIFT_REG;
 logic rnode_149to150_bb1__13_i_0_valid_out_reg_150_NO_SHIFT_REG;
 logic rnode_149to150_bb1__13_i_0_stall_in_reg_150_NO_SHIFT_REG;
 logic rnode_149to150_bb1__13_i_0_stall_out_reg_150_NO_SHIFT_REG;

acl_data_fifo rnode_149to150_bb1__13_i_0_reg_150_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_149to150_bb1__13_i_0_reg_150_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_149to150_bb1__13_i_0_stall_in_reg_150_NO_SHIFT_REG),
	.valid_out(rnode_149to150_bb1__13_i_0_valid_out_reg_150_NO_SHIFT_REG),
	.stall_out(rnode_149to150_bb1__13_i_0_stall_out_reg_150_NO_SHIFT_REG),
	.data_in(rnode_148to149_bb1__13_i_0_NO_SHIFT_REG),
	.data_out(rnode_149to150_bb1__13_i_0_reg_150_NO_SHIFT_REG)
);

defparam rnode_149to150_bb1__13_i_0_reg_150_fifo.DEPTH = 1;
defparam rnode_149to150_bb1__13_i_0_reg_150_fifo.DATA_WIDTH = 1;
defparam rnode_149to150_bb1__13_i_0_reg_150_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_149to150_bb1__13_i_0_reg_150_fifo.IMPL = "shift_reg";

assign rnode_149to150_bb1__13_i_0_reg_150_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_148to149_bb1__13_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_149to150_bb1__13_i_0_NO_SHIFT_REG = rnode_149to150_bb1__13_i_0_reg_150_NO_SHIFT_REG;
assign rnode_149to150_bb1__13_i_0_stall_in_reg_150_NO_SHIFT_REG = 1'b0;
assign rnode_149to150_bb1__13_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_149to150_bb1_var__u33_0_valid_out_NO_SHIFT_REG;
 logic rnode_149to150_bb1_var__u33_0_stall_in_NO_SHIFT_REG;
 logic rnode_149to150_bb1_var__u33_0_NO_SHIFT_REG;
 logic rnode_149to150_bb1_var__u33_0_reg_150_inputs_ready_NO_SHIFT_REG;
 logic rnode_149to150_bb1_var__u33_0_reg_150_NO_SHIFT_REG;
 logic rnode_149to150_bb1_var__u33_0_valid_out_reg_150_NO_SHIFT_REG;
 logic rnode_149to150_bb1_var__u33_0_stall_in_reg_150_NO_SHIFT_REG;
 logic rnode_149to150_bb1_var__u33_0_stall_out_reg_150_NO_SHIFT_REG;

acl_data_fifo rnode_149to150_bb1_var__u33_0_reg_150_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_149to150_bb1_var__u33_0_reg_150_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_149to150_bb1_var__u33_0_stall_in_reg_150_NO_SHIFT_REG),
	.valid_out(rnode_149to150_bb1_var__u33_0_valid_out_reg_150_NO_SHIFT_REG),
	.stall_out(rnode_149to150_bb1_var__u33_0_stall_out_reg_150_NO_SHIFT_REG),
	.data_in(rnode_148to149_bb1_var__u33_0_NO_SHIFT_REG),
	.data_out(rnode_149to150_bb1_var__u33_0_reg_150_NO_SHIFT_REG)
);

defparam rnode_149to150_bb1_var__u33_0_reg_150_fifo.DEPTH = 1;
defparam rnode_149to150_bb1_var__u33_0_reg_150_fifo.DATA_WIDTH = 1;
defparam rnode_149to150_bb1_var__u33_0_reg_150_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_149to150_bb1_var__u33_0_reg_150_fifo.IMPL = "shift_reg";

assign rnode_149to150_bb1_var__u33_0_reg_150_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_148to149_bb1_var__u33_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_149to150_bb1_var__u33_0_NO_SHIFT_REG = rnode_149to150_bb1_var__u33_0_reg_150_NO_SHIFT_REG;
assign rnode_149to150_bb1_var__u33_0_stall_in_reg_150_NO_SHIFT_REG = 1'b0;
assign rnode_149to150_bb1_var__u33_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb1_and179_i_valid_out;
wire local_bb1_and179_i_stall_in;
wire local_bb1_and179_i_inputs_ready;
wire local_bb1_and179_i_stall_local;
wire [31:0] local_bb1_and179_i;

assign local_bb1_and179_i_inputs_ready = rnode_148to149_bb1_add178_i_0_valid_out_0_NO_SHIFT_REG;
assign local_bb1_and179_i = (rnode_148to149_bb1_add178_i_0_NO_SHIFT_REG & 32'hFFFFFFF);
assign local_bb1_and179_i_valid_out = 1'b1;
assign rnode_148to149_bb1_add178_i_0_stall_in_0_NO_SHIFT_REG = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb1_and181_i_valid_out;
wire local_bb1_and181_i_stall_in;
wire local_bb1_and181_i_inputs_ready;
wire local_bb1_and181_i_stall_local;
wire [31:0] local_bb1_and181_i;

assign local_bb1_and181_i_inputs_ready = rnode_148to149_bb1_add178_i_0_valid_out_1_NO_SHIFT_REG;
assign local_bb1_and181_i = (rnode_148to149_bb1_add178_i_1_NO_SHIFT_REG >> 32'h1B);
assign local_bb1_and181_i_valid_out = 1'b1;
assign rnode_148to149_bb1_add178_i_0_stall_in_1_NO_SHIFT_REG = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb1_and184_i_valid_out;
wire local_bb1_and184_i_stall_in;
wire local_bb1_and184_i_inputs_ready;
wire local_bb1_and184_i_stall_local;
wire [31:0] local_bb1_and184_i;

assign local_bb1_and184_i_inputs_ready = rnode_148to149_bb1_add178_i_0_valid_out_2_NO_SHIFT_REG;
assign local_bb1_and184_i = (rnode_148to149_bb1_add178_i_2_NO_SHIFT_REG & 32'h1);
assign local_bb1_and184_i_valid_out = 1'b1;
assign rnode_148to149_bb1_add178_i_0_stall_in_2_NO_SHIFT_REG = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb1_and187_i_stall_local;
wire [31:0] local_bb1_and187_i;

assign local_bb1_and187_i = (rnode_148to149_bb1_add178_i_3_NO_SHIFT_REG & 32'h7FFFFFF);

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_150to151_bb1__13_i_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_150to151_bb1__13_i_0_stall_in_0_NO_SHIFT_REG;
 logic rnode_150to151_bb1__13_i_0_NO_SHIFT_REG;
 logic rnode_150to151_bb1__13_i_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_150to151_bb1__13_i_0_stall_in_1_NO_SHIFT_REG;
 logic rnode_150to151_bb1__13_i_1_NO_SHIFT_REG;
 logic rnode_150to151_bb1__13_i_0_valid_out_2_NO_SHIFT_REG;
 logic rnode_150to151_bb1__13_i_0_stall_in_2_NO_SHIFT_REG;
 logic rnode_150to151_bb1__13_i_2_NO_SHIFT_REG;
 logic rnode_150to151_bb1__13_i_0_reg_151_inputs_ready_NO_SHIFT_REG;
 logic rnode_150to151_bb1__13_i_0_reg_151_NO_SHIFT_REG;
 logic rnode_150to151_bb1__13_i_0_valid_out_0_reg_151_NO_SHIFT_REG;
 logic rnode_150to151_bb1__13_i_0_stall_in_0_reg_151_NO_SHIFT_REG;
 logic rnode_150to151_bb1__13_i_0_stall_out_reg_151_NO_SHIFT_REG;

acl_data_fifo rnode_150to151_bb1__13_i_0_reg_151_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_150to151_bb1__13_i_0_reg_151_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_150to151_bb1__13_i_0_stall_in_0_reg_151_NO_SHIFT_REG),
	.valid_out(rnode_150to151_bb1__13_i_0_valid_out_0_reg_151_NO_SHIFT_REG),
	.stall_out(rnode_150to151_bb1__13_i_0_stall_out_reg_151_NO_SHIFT_REG),
	.data_in(rnode_149to150_bb1__13_i_0_NO_SHIFT_REG),
	.data_out(rnode_150to151_bb1__13_i_0_reg_151_NO_SHIFT_REG)
);

defparam rnode_150to151_bb1__13_i_0_reg_151_fifo.DEPTH = 1;
defparam rnode_150to151_bb1__13_i_0_reg_151_fifo.DATA_WIDTH = 1;
defparam rnode_150to151_bb1__13_i_0_reg_151_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_150to151_bb1__13_i_0_reg_151_fifo.IMPL = "shift_reg";

assign rnode_150to151_bb1__13_i_0_reg_151_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_149to150_bb1__13_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_150to151_bb1__13_i_0_stall_in_0_reg_151_NO_SHIFT_REG = 1'b0;
assign rnode_150to151_bb1__13_i_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_150to151_bb1__13_i_0_NO_SHIFT_REG = rnode_150to151_bb1__13_i_0_reg_151_NO_SHIFT_REG;
assign rnode_150to151_bb1__13_i_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_150to151_bb1__13_i_1_NO_SHIFT_REG = rnode_150to151_bb1__13_i_0_reg_151_NO_SHIFT_REG;
assign rnode_150to151_bb1__13_i_0_valid_out_2_NO_SHIFT_REG = 1'b1;
assign rnode_150to151_bb1__13_i_2_NO_SHIFT_REG = rnode_150to151_bb1__13_i_0_reg_151_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_150to151_bb1_var__u33_0_valid_out_NO_SHIFT_REG;
 logic rnode_150to151_bb1_var__u33_0_stall_in_NO_SHIFT_REG;
 logic rnode_150to151_bb1_var__u33_0_NO_SHIFT_REG;
 logic rnode_150to151_bb1_var__u33_0_reg_151_inputs_ready_NO_SHIFT_REG;
 logic rnode_150to151_bb1_var__u33_0_reg_151_NO_SHIFT_REG;
 logic rnode_150to151_bb1_var__u33_0_valid_out_reg_151_NO_SHIFT_REG;
 logic rnode_150to151_bb1_var__u33_0_stall_in_reg_151_NO_SHIFT_REG;
 logic rnode_150to151_bb1_var__u33_0_stall_out_reg_151_NO_SHIFT_REG;

acl_data_fifo rnode_150to151_bb1_var__u33_0_reg_151_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_150to151_bb1_var__u33_0_reg_151_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_150to151_bb1_var__u33_0_stall_in_reg_151_NO_SHIFT_REG),
	.valid_out(rnode_150to151_bb1_var__u33_0_valid_out_reg_151_NO_SHIFT_REG),
	.stall_out(rnode_150to151_bb1_var__u33_0_stall_out_reg_151_NO_SHIFT_REG),
	.data_in(rnode_149to150_bb1_var__u33_0_NO_SHIFT_REG),
	.data_out(rnode_150to151_bb1_var__u33_0_reg_151_NO_SHIFT_REG)
);

defparam rnode_150to151_bb1_var__u33_0_reg_151_fifo.DEPTH = 1;
defparam rnode_150to151_bb1_var__u33_0_reg_151_fifo.DATA_WIDTH = 1;
defparam rnode_150to151_bb1_var__u33_0_reg_151_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_150to151_bb1_var__u33_0_reg_151_fifo.IMPL = "shift_reg";

assign rnode_150to151_bb1_var__u33_0_reg_151_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_149to150_bb1_var__u33_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_150to151_bb1_var__u33_0_NO_SHIFT_REG = rnode_150to151_bb1_var__u33_0_reg_151_NO_SHIFT_REG;
assign rnode_150to151_bb1_var__u33_0_stall_in_reg_151_NO_SHIFT_REG = 1'b0;
assign rnode_150to151_bb1_var__u33_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_149to150_bb1_and179_i_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_149to150_bb1_and179_i_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_149to150_bb1_and179_i_0_NO_SHIFT_REG;
 logic rnode_149to150_bb1_and179_i_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_149to150_bb1_and179_i_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_149to150_bb1_and179_i_1_NO_SHIFT_REG;
 logic rnode_149to150_bb1_and179_i_0_valid_out_2_NO_SHIFT_REG;
 logic rnode_149to150_bb1_and179_i_0_stall_in_2_NO_SHIFT_REG;
 logic [31:0] rnode_149to150_bb1_and179_i_2_NO_SHIFT_REG;
 logic rnode_149to150_bb1_and179_i_0_reg_150_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_149to150_bb1_and179_i_0_reg_150_NO_SHIFT_REG;
 logic rnode_149to150_bb1_and179_i_0_valid_out_0_reg_150_NO_SHIFT_REG;
 logic rnode_149to150_bb1_and179_i_0_stall_in_0_reg_150_NO_SHIFT_REG;
 logic rnode_149to150_bb1_and179_i_0_stall_out_reg_150_NO_SHIFT_REG;

acl_data_fifo rnode_149to150_bb1_and179_i_0_reg_150_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_149to150_bb1_and179_i_0_reg_150_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_149to150_bb1_and179_i_0_stall_in_0_reg_150_NO_SHIFT_REG),
	.valid_out(rnode_149to150_bb1_and179_i_0_valid_out_0_reg_150_NO_SHIFT_REG),
	.stall_out(rnode_149to150_bb1_and179_i_0_stall_out_reg_150_NO_SHIFT_REG),
	.data_in((local_bb1_and179_i & 32'hFFFFFFF)),
	.data_out(rnode_149to150_bb1_and179_i_0_reg_150_NO_SHIFT_REG)
);

defparam rnode_149to150_bb1_and179_i_0_reg_150_fifo.DEPTH = 1;
defparam rnode_149to150_bb1_and179_i_0_reg_150_fifo.DATA_WIDTH = 32;
defparam rnode_149to150_bb1_and179_i_0_reg_150_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_149to150_bb1_and179_i_0_reg_150_fifo.IMPL = "shift_reg";

assign rnode_149to150_bb1_and179_i_0_reg_150_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_and179_i_stall_in = 1'b0;
assign rnode_149to150_bb1_and179_i_0_stall_in_0_reg_150_NO_SHIFT_REG = 1'b0;
assign rnode_149to150_bb1_and179_i_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_149to150_bb1_and179_i_0_NO_SHIFT_REG = rnode_149to150_bb1_and179_i_0_reg_150_NO_SHIFT_REG;
assign rnode_149to150_bb1_and179_i_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_149to150_bb1_and179_i_1_NO_SHIFT_REG = rnode_149to150_bb1_and179_i_0_reg_150_NO_SHIFT_REG;
assign rnode_149to150_bb1_and179_i_0_valid_out_2_NO_SHIFT_REG = 1'b1;
assign rnode_149to150_bb1_and179_i_2_NO_SHIFT_REG = rnode_149to150_bb1_and179_i_0_reg_150_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_149to150_bb1_and181_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_149to150_bb1_and181_i_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_149to150_bb1_and181_i_0_NO_SHIFT_REG;
 logic rnode_149to150_bb1_and181_i_0_reg_150_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_149to150_bb1_and181_i_0_reg_150_NO_SHIFT_REG;
 logic rnode_149to150_bb1_and181_i_0_valid_out_reg_150_NO_SHIFT_REG;
 logic rnode_149to150_bb1_and181_i_0_stall_in_reg_150_NO_SHIFT_REG;
 logic rnode_149to150_bb1_and181_i_0_stall_out_reg_150_NO_SHIFT_REG;

acl_data_fifo rnode_149to150_bb1_and181_i_0_reg_150_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_149to150_bb1_and181_i_0_reg_150_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_149to150_bb1_and181_i_0_stall_in_reg_150_NO_SHIFT_REG),
	.valid_out(rnode_149to150_bb1_and181_i_0_valid_out_reg_150_NO_SHIFT_REG),
	.stall_out(rnode_149to150_bb1_and181_i_0_stall_out_reg_150_NO_SHIFT_REG),
	.data_in((local_bb1_and181_i & 32'h1F)),
	.data_out(rnode_149to150_bb1_and181_i_0_reg_150_NO_SHIFT_REG)
);

defparam rnode_149to150_bb1_and181_i_0_reg_150_fifo.DEPTH = 1;
defparam rnode_149to150_bb1_and181_i_0_reg_150_fifo.DATA_WIDTH = 32;
defparam rnode_149to150_bb1_and181_i_0_reg_150_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_149to150_bb1_and181_i_0_reg_150_fifo.IMPL = "shift_reg";

assign rnode_149to150_bb1_and181_i_0_reg_150_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_and181_i_stall_in = 1'b0;
assign rnode_149to150_bb1_and181_i_0_NO_SHIFT_REG = rnode_149to150_bb1_and181_i_0_reg_150_NO_SHIFT_REG;
assign rnode_149to150_bb1_and181_i_0_stall_in_reg_150_NO_SHIFT_REG = 1'b0;
assign rnode_149to150_bb1_and181_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_149to150_bb1_and184_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_149to150_bb1_and184_i_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_149to150_bb1_and184_i_0_NO_SHIFT_REG;
 logic rnode_149to150_bb1_and184_i_0_reg_150_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_149to150_bb1_and184_i_0_reg_150_NO_SHIFT_REG;
 logic rnode_149to150_bb1_and184_i_0_valid_out_reg_150_NO_SHIFT_REG;
 logic rnode_149to150_bb1_and184_i_0_stall_in_reg_150_NO_SHIFT_REG;
 logic rnode_149to150_bb1_and184_i_0_stall_out_reg_150_NO_SHIFT_REG;

acl_data_fifo rnode_149to150_bb1_and184_i_0_reg_150_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_149to150_bb1_and184_i_0_reg_150_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_149to150_bb1_and184_i_0_stall_in_reg_150_NO_SHIFT_REG),
	.valid_out(rnode_149to150_bb1_and184_i_0_valid_out_reg_150_NO_SHIFT_REG),
	.stall_out(rnode_149to150_bb1_and184_i_0_stall_out_reg_150_NO_SHIFT_REG),
	.data_in((local_bb1_and184_i & 32'h1)),
	.data_out(rnode_149to150_bb1_and184_i_0_reg_150_NO_SHIFT_REG)
);

defparam rnode_149to150_bb1_and184_i_0_reg_150_fifo.DEPTH = 1;
defparam rnode_149to150_bb1_and184_i_0_reg_150_fifo.DATA_WIDTH = 32;
defparam rnode_149to150_bb1_and184_i_0_reg_150_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_149to150_bb1_and184_i_0_reg_150_fifo.IMPL = "shift_reg";

assign rnode_149to150_bb1_and184_i_0_reg_150_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_and184_i_stall_in = 1'b0;
assign rnode_149to150_bb1_and184_i_0_NO_SHIFT_REG = rnode_149to150_bb1_and184_i_0_reg_150_NO_SHIFT_REG;
assign rnode_149to150_bb1_and184_i_0_stall_in_reg_150_NO_SHIFT_REG = 1'b0;
assign rnode_149to150_bb1_and184_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb1_shr_i_i_stall_local;
wire [31:0] local_bb1_shr_i_i;

assign local_bb1_shr_i_i = ((local_bb1_and187_i & 32'h7FFFFFF) >> 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb1_cond260_i_stall_local;
wire [31:0] local_bb1_cond260_i;

assign local_bb1_cond260_i = (rnode_150to151_bb1__13_i_1_NO_SHIFT_REG ? 32'h400000 : 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_shr200_i_stall_local;
wire [31:0] local_bb1_shr200_i;

assign local_bb1_shr200_i = ((rnode_149to150_bb1_and179_i_1_NO_SHIFT_REG & 32'hFFFFFFF) >> 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb1_var__u38_stall_local;
wire [31:0] local_bb1_var__u38;

assign local_bb1_var__u38 = ((rnode_149to150_bb1_and181_i_0_NO_SHIFT_REG & 32'h1F) & 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb1_or_i_i_stall_local;
wire [31:0] local_bb1_or_i_i;

assign local_bb1_or_i_i = ((local_bb1_shr_i_i & 32'h3FFFFFF) | (local_bb1_and187_i & 32'h7FFFFFF));

// This section implements an unregistered operation.
// 
wire local_bb1_or203_i_stall_local;
wire [31:0] local_bb1_or203_i;

assign local_bb1_or203_i = ((local_bb1_shr200_i & 32'h7FFFFFF) | (rnode_149to150_bb1_and184_i_0_NO_SHIFT_REG & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb1_tobool198_i_stall_local;
wire local_bb1_tobool198_i;

assign local_bb1_tobool198_i = ((local_bb1_var__u38 & 32'h1) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_shr1_i_i_stall_local;
wire [31:0] local_bb1_shr1_i_i;

assign local_bb1_shr1_i_i = ((local_bb1_or_i_i & 32'h7FFFFFF) >> 32'h2);

// This section implements an unregistered operation.
// 
wire local_bb1__26_i_stall_local;
wire local_bb1__26_i;

assign local_bb1__26_i = (local_bb1_tobool198_i & local_bb1_not_cmp37_i);

// This section implements an unregistered operation.
// 
wire local_bb1_or2_i_i_stall_local;
wire [31:0] local_bb1_or2_i_i;

assign local_bb1_or2_i_i = ((local_bb1_shr1_i_i & 32'h1FFFFFF) | (local_bb1_or_i_i & 32'h7FFFFFF));

// This section implements an unregistered operation.
// 
wire local_bb1__27_i_stall_local;
wire [31:0] local_bb1__27_i;

assign local_bb1__27_i = (local_bb1__26_i ? 32'h0 : (local_bb1_var__u38 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb1__29_i_stall_local;
wire [31:0] local_bb1__29_i;

assign local_bb1__29_i = (local_bb1__26_i ? (rnode_149to150_bb1_and179_i_2_NO_SHIFT_REG & 32'hFFFFFFF) : (local_bb1_or203_i & 32'h7FFFFFF));

// This section implements an unregistered operation.
// 
wire local_bb1_shr3_i_i_stall_local;
wire [31:0] local_bb1_shr3_i_i;

assign local_bb1_shr3_i_i = ((local_bb1_or2_i_i & 32'h7FFFFFF) >> 32'h4);

// This section implements an unregistered operation.
// 
wire local_bb1_or4_i_i_stall_local;
wire [31:0] local_bb1_or4_i_i;

assign local_bb1_or4_i_i = ((local_bb1_shr3_i_i & 32'h7FFFFF) | (local_bb1_or2_i_i & 32'h7FFFFFF));

// This section implements an unregistered operation.
// 
wire local_bb1_shr5_i_i_stall_local;
wire [31:0] local_bb1_shr5_i_i;

assign local_bb1_shr5_i_i = ((local_bb1_or4_i_i & 32'h7FFFFFF) >> 32'h8);

// This section implements an unregistered operation.
// 
wire local_bb1_or6_i_i_stall_local;
wire [31:0] local_bb1_or6_i_i;

assign local_bb1_or6_i_i = ((local_bb1_shr5_i_i & 32'h7FFFF) | (local_bb1_or4_i_i & 32'h7FFFFFF));

// This section implements an unregistered operation.
// 
wire local_bb1_shr7_i_i_stall_local;
wire [31:0] local_bb1_shr7_i_i;

assign local_bb1_shr7_i_i = ((local_bb1_or6_i_i & 32'h7FFFFFF) >> 32'h10);

// This section implements an unregistered operation.
// 
wire local_bb1_or8_i_i_stall_local;
wire [31:0] local_bb1_or8_i_i;

assign local_bb1_or8_i_i = ((local_bb1_shr7_i_i & 32'h7FF) | (local_bb1_or6_i_i & 32'h7FFFFFF));

// This section implements an unregistered operation.
// 
wire local_bb1_and_i_i_stall_local;
wire [31:0] local_bb1_and_i_i;

assign local_bb1_and_i_i = ((local_bb1_or8_i_i & 32'h7FFFFFF) ^ 32'h7FFFFFF);

// This section implements an unregistered operation.
// 
wire local_bb1__and_i_i_valid_out;
wire local_bb1__and_i_i_stall_in;
wire local_bb1__and_i_i_inputs_ready;
wire local_bb1__and_i_i_stall_local;
wire [31:0] local_bb1__and_i_i;

thirtysix_six_comp local_bb1__and_i_i_popcnt_instance (
	.data((local_bb1_and_i_i & 32'h1FFFFFFF)),
	.sum(local_bb1__and_i_i)
);


assign local_bb1__and_i_i_inputs_ready = rnode_148to149_bb1_add178_i_0_valid_out_3_NO_SHIFT_REG;
assign local_bb1__and_i_i_valid_out = 1'b1;
assign rnode_148to149_bb1_add178_i_0_stall_in_3_NO_SHIFT_REG = 1'b0;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_149to150_bb1__and_i_i_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_149to150_bb1__and_i_i_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_149to150_bb1__and_i_i_0_NO_SHIFT_REG;
 logic rnode_149to150_bb1__and_i_i_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_149to150_bb1__and_i_i_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_149to150_bb1__and_i_i_1_NO_SHIFT_REG;
 logic rnode_149to150_bb1__and_i_i_0_valid_out_2_NO_SHIFT_REG;
 logic rnode_149to150_bb1__and_i_i_0_stall_in_2_NO_SHIFT_REG;
 logic [31:0] rnode_149to150_bb1__and_i_i_2_NO_SHIFT_REG;
 logic rnode_149to150_bb1__and_i_i_0_reg_150_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_149to150_bb1__and_i_i_0_reg_150_NO_SHIFT_REG;
 logic rnode_149to150_bb1__and_i_i_0_valid_out_0_reg_150_NO_SHIFT_REG;
 logic rnode_149to150_bb1__and_i_i_0_stall_in_0_reg_150_NO_SHIFT_REG;
 logic rnode_149to150_bb1__and_i_i_0_stall_out_reg_150_NO_SHIFT_REG;

acl_data_fifo rnode_149to150_bb1__and_i_i_0_reg_150_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_149to150_bb1__and_i_i_0_reg_150_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_149to150_bb1__and_i_i_0_stall_in_0_reg_150_NO_SHIFT_REG),
	.valid_out(rnode_149to150_bb1__and_i_i_0_valid_out_0_reg_150_NO_SHIFT_REG),
	.stall_out(rnode_149to150_bb1__and_i_i_0_stall_out_reg_150_NO_SHIFT_REG),
	.data_in((local_bb1__and_i_i & 32'h3F)),
	.data_out(rnode_149to150_bb1__and_i_i_0_reg_150_NO_SHIFT_REG)
);

defparam rnode_149to150_bb1__and_i_i_0_reg_150_fifo.DEPTH = 1;
defparam rnode_149to150_bb1__and_i_i_0_reg_150_fifo.DATA_WIDTH = 32;
defparam rnode_149to150_bb1__and_i_i_0_reg_150_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_149to150_bb1__and_i_i_0_reg_150_fifo.IMPL = "shift_reg";

assign rnode_149to150_bb1__and_i_i_0_reg_150_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1__and_i_i_stall_in = 1'b0;
assign rnode_149to150_bb1__and_i_i_0_stall_in_0_reg_150_NO_SHIFT_REG = 1'b0;
assign rnode_149to150_bb1__and_i_i_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_149to150_bb1__and_i_i_0_NO_SHIFT_REG = rnode_149to150_bb1__and_i_i_0_reg_150_NO_SHIFT_REG;
assign rnode_149to150_bb1__and_i_i_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_149to150_bb1__and_i_i_1_NO_SHIFT_REG = rnode_149to150_bb1__and_i_i_0_reg_150_NO_SHIFT_REG;
assign rnode_149to150_bb1__and_i_i_0_valid_out_2_NO_SHIFT_REG = 1'b1;
assign rnode_149to150_bb1__and_i_i_2_NO_SHIFT_REG = rnode_149to150_bb1__and_i_i_0_reg_150_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb1_and9_i_i_stall_local;
wire [31:0] local_bb1_and9_i_i;

assign local_bb1_and9_i_i = ((rnode_149to150_bb1__and_i_i_0_NO_SHIFT_REG & 32'h3F) & 32'h1F);

// This section implements an unregistered operation.
// 
wire local_bb1_and189_i_stall_local;
wire [31:0] local_bb1_and189_i;

assign local_bb1_and189_i = ((rnode_149to150_bb1__and_i_i_1_NO_SHIFT_REG & 32'h3F) & 32'h18);

// This section implements an unregistered operation.
// 
wire local_bb1_and192_i_stall_local;
wire [31:0] local_bb1_and192_i;

assign local_bb1_and192_i = ((rnode_149to150_bb1__and_i_i_2_NO_SHIFT_REG & 32'h3F) & 32'h7);

// This section implements an unregistered operation.
// 
wire local_bb1_sub219_i_stall_local;
wire [31:0] local_bb1_sub219_i;

assign local_bb1_sub219_i = (32'h0 - (local_bb1_and9_i_i & 32'h1F));

// This section implements an unregistered operation.
// 
wire local_bb1_shl190_i_stall_local;
wire [31:0] local_bb1_shl190_i;

assign local_bb1_shl190_i = ((rnode_149to150_bb1_and179_i_0_NO_SHIFT_REG & 32'hFFFFFFF) << (local_bb1_and189_i & 32'h18));

// This section implements an unregistered operation.
// 
wire local_bb1_cond224_i_stall_local;
wire [31:0] local_bb1_cond224_i;

assign local_bb1_cond224_i = (rnode_148to150_bb1_cmp37_i_2_NO_SHIFT_REG ? local_bb1_sub219_i : (local_bb1__27_i & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb1_and191_i_stall_local;
wire [31:0] local_bb1_and191_i;

assign local_bb1_and191_i = (local_bb1_shl190_i & 32'h7FFFFFF);

// This section implements an unregistered operation.
// 
wire local_bb1_add225_i_stall_local;
wire [31:0] local_bb1_add225_i;

assign local_bb1_add225_i = (local_bb1_cond224_i + (rnode_148to150_bb1_and17_i_0_NO_SHIFT_REG & 32'hFF));

// This section implements an unregistered operation.
// 
wire local_bb1_fold_i8_stall_local;
wire [31:0] local_bb1_fold_i8;

assign local_bb1_fold_i8 = (local_bb1_cond224_i + (rnode_148to150_bb1_shr16_i_0_NO_SHIFT_REG & 32'h1FF));

// This section implements an unregistered operation.
// 
wire local_bb1_shl193_i_stall_local;
wire [31:0] local_bb1_shl193_i;

assign local_bb1_shl193_i = ((local_bb1_and191_i & 32'h7FFFFFF) << (local_bb1_and192_i & 32'h7));

// This section implements an unregistered operation.
// 
wire local_bb1_and227_i_stall_local;
wire [31:0] local_bb1_and227_i;

assign local_bb1_and227_i = (local_bb1_add225_i & 32'h100);

// This section implements an unregistered operation.
// 
wire local_bb1_and230_i_stall_local;
wire [31:0] local_bb1_and230_i;

assign local_bb1_and230_i = (local_bb1_fold_i8 & 32'hFF);

// This section implements an unregistered operation.
// 
wire local_bb1_and194_i_stall_local;
wire [31:0] local_bb1_and194_i;

assign local_bb1_and194_i = (local_bb1_shl193_i & 32'h7FFFFFF);

// This section implements an unregistered operation.
// 
wire local_bb1_tobool228_i_stall_local;
wire local_bb1_tobool228_i;

assign local_bb1_tobool228_i = ((local_bb1_and227_i & 32'h100) != 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_cmp231_i_stall_local;
wire local_bb1_cmp231_i;

assign local_bb1_cmp231_i = ((local_bb1_and230_i & 32'hFF) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_shl248_i_stall_local;
wire [31:0] local_bb1_shl248_i;

assign local_bb1_shl248_i = ((local_bb1_and230_i & 32'hFF) << 32'h17);

// This section implements an unregistered operation.
// 
wire local_bb1__30_i_stall_local;
wire [31:0] local_bb1__30_i;

assign local_bb1__30_i = (rnode_148to150_bb1_cmp37_i_1_NO_SHIFT_REG ? (local_bb1_and194_i & 32'h7FFFFFF) : (local_bb1__29_i & 32'hFFFFFFF));

// This section implements an unregistered operation.
// 
wire local_bb1_or_cond_i_stall_local;
wire local_bb1_or_cond_i;

assign local_bb1_or_cond_i = (local_bb1_tobool228_i | local_bb1_cmp231_i);

// This section implements an unregistered operation.
// 
wire local_bb1_and209_i_stall_local;
wire [31:0] local_bb1_and209_i;

assign local_bb1_and209_i = ((local_bb1__30_i & 32'hFFFFFFF) & 32'h7FFFFFF);

// This section implements an unregistered operation.
// 
wire local_bb1_and245_i_stall_local;
wire [31:0] local_bb1_and245_i;

assign local_bb1_and245_i = ((local_bb1__30_i & 32'hFFFFFFF) & 32'h7);

// This section implements an unregistered operation.
// 
wire local_bb1_shr246_i_stall_local;
wire [31:0] local_bb1_shr246_i;

assign local_bb1_shr246_i = ((local_bb1__30_i & 32'hFFFFFFF) >> 32'h3);

// This section implements an unregistered operation.
// 
wire local_bb1_cmp210_i_stall_local;
wire local_bb1_cmp210_i;

assign local_bb1_cmp210_i = ((local_bb1_and209_i & 32'h7FFFFFF) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_cmp264_i_stall_local;
wire local_bb1_cmp264_i;

assign local_bb1_cmp264_i = ((local_bb1_and245_i & 32'h7) > 32'h4);

// This section implements an unregistered operation.
// 
wire local_bb1_cmp266_i_stall_local;
wire local_bb1_cmp266_i;

assign local_bb1_cmp266_i = ((local_bb1_and245_i & 32'h7) == 32'h4);

// This section implements an unregistered operation.
// 
wire local_bb1_cmp210_not_i_stall_local;
wire local_bb1_cmp210_not_i;

assign local_bb1_cmp210_not_i = (local_bb1_cmp210_i ^ 1'b1);

// This section implements an unregistered operation.
// 
wire local_bb1__31_i_stall_local;
wire local_bb1__31_i;

assign local_bb1__31_i = (local_bb1_or_cond_i | local_bb1_cmp210_i);

// This section implements an unregistered operation.
// 
wire local_bb1_brmerge7_i_stall_local;
wire local_bb1_brmerge7_i;

assign local_bb1_brmerge7_i = (local_bb1_cmp210_not_i | local_bb1_not_cmp37_i);

// This section implements an unregistered operation.
// 
wire local_bb1_add225_i_valid_out_1;
wire local_bb1_add225_i_stall_in_1;
wire local_bb1_shl248_i_valid_out;
wire local_bb1_shl248_i_stall_in;
wire local_bb1_resultSign_0_i_valid_out;
wire local_bb1_resultSign_0_i_stall_in;
wire local_bb1_shr246_i_valid_out;
wire local_bb1_shr246_i_stall_in;
wire local_bb1_cmp264_i_valid_out;
wire local_bb1_cmp264_i_stall_in;
wire local_bb1_cmp266_i_valid_out;
wire local_bb1_cmp266_i_stall_in;
wire local_bb1_cmp210_not_i_valid_out_1;
wire local_bb1_cmp210_not_i_stall_in_1;
wire local_bb1__31_i_valid_out;
wire local_bb1__31_i_stall_in;
wire local_bb1_resultSign_0_i_inputs_ready;
wire local_bb1_resultSign_0_i_stall_local;
wire [31:0] local_bb1_resultSign_0_i;

assign local_bb1_resultSign_0_i_inputs_ready = (rnode_148to150_bb1_shr16_i_0_valid_out_NO_SHIFT_REG & rnode_148to150_bb1_cmp37_i_0_valid_out_2_NO_SHIFT_REG & rnode_148to150_bb1_and17_i_0_valid_out_NO_SHIFT_REG & rnode_148to150_bb1_cmp37_i_0_valid_out_0_NO_SHIFT_REG & rnode_149to150_bb1_and179_i_0_valid_out_2_NO_SHIFT_REG & rnode_149to150_bb1_and35_i_0_valid_out_NO_SHIFT_REG & rnode_148to150_bb1_cmp37_i_0_valid_out_1_NO_SHIFT_REG & rnode_149to150_bb1_and181_i_0_valid_out_NO_SHIFT_REG & rnode_149to150_bb1_and179_i_0_valid_out_1_NO_SHIFT_REG & rnode_149to150_bb1_and184_i_0_valid_out_NO_SHIFT_REG & rnode_149to150_bb1_and179_i_0_valid_out_0_NO_SHIFT_REG & rnode_149to150_bb1__and_i_i_0_valid_out_1_NO_SHIFT_REG & rnode_149to150_bb1__and_i_i_0_valid_out_2_NO_SHIFT_REG & rnode_149to150_bb1__and_i_i_0_valid_out_0_NO_SHIFT_REG);
assign local_bb1_resultSign_0_i = (local_bb1_brmerge7_i ? (rnode_149to150_bb1_and35_i_0_NO_SHIFT_REG & 32'h80000000) : 32'h0);
assign local_bb1_add225_i_valid_out_1 = 1'b1;
assign local_bb1_shl248_i_valid_out = 1'b1;
assign local_bb1_resultSign_0_i_valid_out = 1'b1;
assign local_bb1_shr246_i_valid_out = 1'b1;
assign local_bb1_cmp264_i_valid_out = 1'b1;
assign local_bb1_cmp266_i_valid_out = 1'b1;
assign local_bb1_cmp210_not_i_valid_out_1 = 1'b1;
assign local_bb1__31_i_valid_out = 1'b1;
assign rnode_148to150_bb1_shr16_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_148to150_bb1_cmp37_i_0_stall_in_2_NO_SHIFT_REG = 1'b0;
assign rnode_148to150_bb1_and17_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_148to150_bb1_cmp37_i_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_149to150_bb1_and179_i_0_stall_in_2_NO_SHIFT_REG = 1'b0;
assign rnode_149to150_bb1_and35_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_148to150_bb1_cmp37_i_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_149to150_bb1_and181_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_149to150_bb1_and179_i_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_149to150_bb1_and184_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_149to150_bb1_and179_i_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_149to150_bb1__and_i_i_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_149to150_bb1__and_i_i_0_stall_in_2_NO_SHIFT_REG = 1'b0;
assign rnode_149to150_bb1__and_i_i_0_stall_in_0_NO_SHIFT_REG = 1'b0;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_150to151_bb1_add225_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_150to151_bb1_add225_i_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_150to151_bb1_add225_i_0_NO_SHIFT_REG;
 logic rnode_150to151_bb1_add225_i_0_reg_151_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_150to151_bb1_add225_i_0_reg_151_NO_SHIFT_REG;
 logic rnode_150to151_bb1_add225_i_0_valid_out_reg_151_NO_SHIFT_REG;
 logic rnode_150to151_bb1_add225_i_0_stall_in_reg_151_NO_SHIFT_REG;
 logic rnode_150to151_bb1_add225_i_0_stall_out_reg_151_NO_SHIFT_REG;

acl_data_fifo rnode_150to151_bb1_add225_i_0_reg_151_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_150to151_bb1_add225_i_0_reg_151_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_150to151_bb1_add225_i_0_stall_in_reg_151_NO_SHIFT_REG),
	.valid_out(rnode_150to151_bb1_add225_i_0_valid_out_reg_151_NO_SHIFT_REG),
	.stall_out(rnode_150to151_bb1_add225_i_0_stall_out_reg_151_NO_SHIFT_REG),
	.data_in(local_bb1_add225_i),
	.data_out(rnode_150to151_bb1_add225_i_0_reg_151_NO_SHIFT_REG)
);

defparam rnode_150to151_bb1_add225_i_0_reg_151_fifo.DEPTH = 1;
defparam rnode_150to151_bb1_add225_i_0_reg_151_fifo.DATA_WIDTH = 32;
defparam rnode_150to151_bb1_add225_i_0_reg_151_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_150to151_bb1_add225_i_0_reg_151_fifo.IMPL = "shift_reg";

assign rnode_150to151_bb1_add225_i_0_reg_151_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_add225_i_stall_in_1 = 1'b0;
assign rnode_150to151_bb1_add225_i_0_NO_SHIFT_REG = rnode_150to151_bb1_add225_i_0_reg_151_NO_SHIFT_REG;
assign rnode_150to151_bb1_add225_i_0_stall_in_reg_151_NO_SHIFT_REG = 1'b0;
assign rnode_150to151_bb1_add225_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_150to151_bb1_shl248_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_150to151_bb1_shl248_i_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_150to151_bb1_shl248_i_0_NO_SHIFT_REG;
 logic rnode_150to151_bb1_shl248_i_0_reg_151_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_150to151_bb1_shl248_i_0_reg_151_NO_SHIFT_REG;
 logic rnode_150to151_bb1_shl248_i_0_valid_out_reg_151_NO_SHIFT_REG;
 logic rnode_150to151_bb1_shl248_i_0_stall_in_reg_151_NO_SHIFT_REG;
 logic rnode_150to151_bb1_shl248_i_0_stall_out_reg_151_NO_SHIFT_REG;

acl_data_fifo rnode_150to151_bb1_shl248_i_0_reg_151_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_150to151_bb1_shl248_i_0_reg_151_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_150to151_bb1_shl248_i_0_stall_in_reg_151_NO_SHIFT_REG),
	.valid_out(rnode_150to151_bb1_shl248_i_0_valid_out_reg_151_NO_SHIFT_REG),
	.stall_out(rnode_150to151_bb1_shl248_i_0_stall_out_reg_151_NO_SHIFT_REG),
	.data_in((local_bb1_shl248_i & 32'h7F800000)),
	.data_out(rnode_150to151_bb1_shl248_i_0_reg_151_NO_SHIFT_REG)
);

defparam rnode_150to151_bb1_shl248_i_0_reg_151_fifo.DEPTH = 1;
defparam rnode_150to151_bb1_shl248_i_0_reg_151_fifo.DATA_WIDTH = 32;
defparam rnode_150to151_bb1_shl248_i_0_reg_151_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_150to151_bb1_shl248_i_0_reg_151_fifo.IMPL = "shift_reg";

assign rnode_150to151_bb1_shl248_i_0_reg_151_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_shl248_i_stall_in = 1'b0;
assign rnode_150to151_bb1_shl248_i_0_NO_SHIFT_REG = rnode_150to151_bb1_shl248_i_0_reg_151_NO_SHIFT_REG;
assign rnode_150to151_bb1_shl248_i_0_stall_in_reg_151_NO_SHIFT_REG = 1'b0;
assign rnode_150to151_bb1_shl248_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_150to151_bb1_resultSign_0_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_150to151_bb1_resultSign_0_i_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_150to151_bb1_resultSign_0_i_0_NO_SHIFT_REG;
 logic rnode_150to151_bb1_resultSign_0_i_0_reg_151_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_150to151_bb1_resultSign_0_i_0_reg_151_NO_SHIFT_REG;
 logic rnode_150to151_bb1_resultSign_0_i_0_valid_out_reg_151_NO_SHIFT_REG;
 logic rnode_150to151_bb1_resultSign_0_i_0_stall_in_reg_151_NO_SHIFT_REG;
 logic rnode_150to151_bb1_resultSign_0_i_0_stall_out_reg_151_NO_SHIFT_REG;

acl_data_fifo rnode_150to151_bb1_resultSign_0_i_0_reg_151_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_150to151_bb1_resultSign_0_i_0_reg_151_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_150to151_bb1_resultSign_0_i_0_stall_in_reg_151_NO_SHIFT_REG),
	.valid_out(rnode_150to151_bb1_resultSign_0_i_0_valid_out_reg_151_NO_SHIFT_REG),
	.stall_out(rnode_150to151_bb1_resultSign_0_i_0_stall_out_reg_151_NO_SHIFT_REG),
	.data_in((local_bb1_resultSign_0_i & 32'h80000000)),
	.data_out(rnode_150to151_bb1_resultSign_0_i_0_reg_151_NO_SHIFT_REG)
);

defparam rnode_150to151_bb1_resultSign_0_i_0_reg_151_fifo.DEPTH = 1;
defparam rnode_150to151_bb1_resultSign_0_i_0_reg_151_fifo.DATA_WIDTH = 32;
defparam rnode_150to151_bb1_resultSign_0_i_0_reg_151_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_150to151_bb1_resultSign_0_i_0_reg_151_fifo.IMPL = "shift_reg";

assign rnode_150to151_bb1_resultSign_0_i_0_reg_151_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_resultSign_0_i_stall_in = 1'b0;
assign rnode_150to151_bb1_resultSign_0_i_0_NO_SHIFT_REG = rnode_150to151_bb1_resultSign_0_i_0_reg_151_NO_SHIFT_REG;
assign rnode_150to151_bb1_resultSign_0_i_0_stall_in_reg_151_NO_SHIFT_REG = 1'b0;
assign rnode_150to151_bb1_resultSign_0_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_150to151_bb1_shr246_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_150to151_bb1_shr246_i_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_150to151_bb1_shr246_i_0_NO_SHIFT_REG;
 logic rnode_150to151_bb1_shr246_i_0_reg_151_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_150to151_bb1_shr246_i_0_reg_151_NO_SHIFT_REG;
 logic rnode_150to151_bb1_shr246_i_0_valid_out_reg_151_NO_SHIFT_REG;
 logic rnode_150to151_bb1_shr246_i_0_stall_in_reg_151_NO_SHIFT_REG;
 logic rnode_150to151_bb1_shr246_i_0_stall_out_reg_151_NO_SHIFT_REG;

acl_data_fifo rnode_150to151_bb1_shr246_i_0_reg_151_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_150to151_bb1_shr246_i_0_reg_151_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_150to151_bb1_shr246_i_0_stall_in_reg_151_NO_SHIFT_REG),
	.valid_out(rnode_150to151_bb1_shr246_i_0_valid_out_reg_151_NO_SHIFT_REG),
	.stall_out(rnode_150to151_bb1_shr246_i_0_stall_out_reg_151_NO_SHIFT_REG),
	.data_in((local_bb1_shr246_i & 32'h1FFFFFF)),
	.data_out(rnode_150to151_bb1_shr246_i_0_reg_151_NO_SHIFT_REG)
);

defparam rnode_150to151_bb1_shr246_i_0_reg_151_fifo.DEPTH = 1;
defparam rnode_150to151_bb1_shr246_i_0_reg_151_fifo.DATA_WIDTH = 32;
defparam rnode_150to151_bb1_shr246_i_0_reg_151_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_150to151_bb1_shr246_i_0_reg_151_fifo.IMPL = "shift_reg";

assign rnode_150to151_bb1_shr246_i_0_reg_151_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_shr246_i_stall_in = 1'b0;
assign rnode_150to151_bb1_shr246_i_0_NO_SHIFT_REG = rnode_150to151_bb1_shr246_i_0_reg_151_NO_SHIFT_REG;
assign rnode_150to151_bb1_shr246_i_0_stall_in_reg_151_NO_SHIFT_REG = 1'b0;
assign rnode_150to151_bb1_shr246_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_150to151_bb1_cmp264_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_150to151_bb1_cmp264_i_0_stall_in_NO_SHIFT_REG;
 logic rnode_150to151_bb1_cmp264_i_0_NO_SHIFT_REG;
 logic rnode_150to151_bb1_cmp264_i_0_reg_151_inputs_ready_NO_SHIFT_REG;
 logic rnode_150to151_bb1_cmp264_i_0_reg_151_NO_SHIFT_REG;
 logic rnode_150to151_bb1_cmp264_i_0_valid_out_reg_151_NO_SHIFT_REG;
 logic rnode_150to151_bb1_cmp264_i_0_stall_in_reg_151_NO_SHIFT_REG;
 logic rnode_150to151_bb1_cmp264_i_0_stall_out_reg_151_NO_SHIFT_REG;

acl_data_fifo rnode_150to151_bb1_cmp264_i_0_reg_151_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_150to151_bb1_cmp264_i_0_reg_151_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_150to151_bb1_cmp264_i_0_stall_in_reg_151_NO_SHIFT_REG),
	.valid_out(rnode_150to151_bb1_cmp264_i_0_valid_out_reg_151_NO_SHIFT_REG),
	.stall_out(rnode_150to151_bb1_cmp264_i_0_stall_out_reg_151_NO_SHIFT_REG),
	.data_in(local_bb1_cmp264_i),
	.data_out(rnode_150to151_bb1_cmp264_i_0_reg_151_NO_SHIFT_REG)
);

defparam rnode_150to151_bb1_cmp264_i_0_reg_151_fifo.DEPTH = 1;
defparam rnode_150to151_bb1_cmp264_i_0_reg_151_fifo.DATA_WIDTH = 1;
defparam rnode_150to151_bb1_cmp264_i_0_reg_151_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_150to151_bb1_cmp264_i_0_reg_151_fifo.IMPL = "shift_reg";

assign rnode_150to151_bb1_cmp264_i_0_reg_151_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_cmp264_i_stall_in = 1'b0;
assign rnode_150to151_bb1_cmp264_i_0_NO_SHIFT_REG = rnode_150to151_bb1_cmp264_i_0_reg_151_NO_SHIFT_REG;
assign rnode_150to151_bb1_cmp264_i_0_stall_in_reg_151_NO_SHIFT_REG = 1'b0;
assign rnode_150to151_bb1_cmp264_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_150to151_bb1_cmp266_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_150to151_bb1_cmp266_i_0_stall_in_NO_SHIFT_REG;
 logic rnode_150to151_bb1_cmp266_i_0_NO_SHIFT_REG;
 logic rnode_150to151_bb1_cmp266_i_0_reg_151_inputs_ready_NO_SHIFT_REG;
 logic rnode_150to151_bb1_cmp266_i_0_reg_151_NO_SHIFT_REG;
 logic rnode_150to151_bb1_cmp266_i_0_valid_out_reg_151_NO_SHIFT_REG;
 logic rnode_150to151_bb1_cmp266_i_0_stall_in_reg_151_NO_SHIFT_REG;
 logic rnode_150to151_bb1_cmp266_i_0_stall_out_reg_151_NO_SHIFT_REG;

acl_data_fifo rnode_150to151_bb1_cmp266_i_0_reg_151_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_150to151_bb1_cmp266_i_0_reg_151_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_150to151_bb1_cmp266_i_0_stall_in_reg_151_NO_SHIFT_REG),
	.valid_out(rnode_150to151_bb1_cmp266_i_0_valid_out_reg_151_NO_SHIFT_REG),
	.stall_out(rnode_150to151_bb1_cmp266_i_0_stall_out_reg_151_NO_SHIFT_REG),
	.data_in(local_bb1_cmp266_i),
	.data_out(rnode_150to151_bb1_cmp266_i_0_reg_151_NO_SHIFT_REG)
);

defparam rnode_150to151_bb1_cmp266_i_0_reg_151_fifo.DEPTH = 1;
defparam rnode_150to151_bb1_cmp266_i_0_reg_151_fifo.DATA_WIDTH = 1;
defparam rnode_150to151_bb1_cmp266_i_0_reg_151_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_150to151_bb1_cmp266_i_0_reg_151_fifo.IMPL = "shift_reg";

assign rnode_150to151_bb1_cmp266_i_0_reg_151_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_cmp266_i_stall_in = 1'b0;
assign rnode_150to151_bb1_cmp266_i_0_NO_SHIFT_REG = rnode_150to151_bb1_cmp266_i_0_reg_151_NO_SHIFT_REG;
assign rnode_150to151_bb1_cmp266_i_0_stall_in_reg_151_NO_SHIFT_REG = 1'b0;
assign rnode_150to151_bb1_cmp266_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_150to151_bb1_cmp210_not_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_150to151_bb1_cmp210_not_i_0_stall_in_NO_SHIFT_REG;
 logic rnode_150to151_bb1_cmp210_not_i_0_NO_SHIFT_REG;
 logic rnode_150to151_bb1_cmp210_not_i_0_reg_151_inputs_ready_NO_SHIFT_REG;
 logic rnode_150to151_bb1_cmp210_not_i_0_reg_151_NO_SHIFT_REG;
 logic rnode_150to151_bb1_cmp210_not_i_0_valid_out_reg_151_NO_SHIFT_REG;
 logic rnode_150to151_bb1_cmp210_not_i_0_stall_in_reg_151_NO_SHIFT_REG;
 logic rnode_150to151_bb1_cmp210_not_i_0_stall_out_reg_151_NO_SHIFT_REG;

acl_data_fifo rnode_150to151_bb1_cmp210_not_i_0_reg_151_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_150to151_bb1_cmp210_not_i_0_reg_151_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_150to151_bb1_cmp210_not_i_0_stall_in_reg_151_NO_SHIFT_REG),
	.valid_out(rnode_150to151_bb1_cmp210_not_i_0_valid_out_reg_151_NO_SHIFT_REG),
	.stall_out(rnode_150to151_bb1_cmp210_not_i_0_stall_out_reg_151_NO_SHIFT_REG),
	.data_in(local_bb1_cmp210_not_i),
	.data_out(rnode_150to151_bb1_cmp210_not_i_0_reg_151_NO_SHIFT_REG)
);

defparam rnode_150to151_bb1_cmp210_not_i_0_reg_151_fifo.DEPTH = 1;
defparam rnode_150to151_bb1_cmp210_not_i_0_reg_151_fifo.DATA_WIDTH = 1;
defparam rnode_150to151_bb1_cmp210_not_i_0_reg_151_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_150to151_bb1_cmp210_not_i_0_reg_151_fifo.IMPL = "shift_reg";

assign rnode_150to151_bb1_cmp210_not_i_0_reg_151_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_cmp210_not_i_stall_in_1 = 1'b0;
assign rnode_150to151_bb1_cmp210_not_i_0_NO_SHIFT_REG = rnode_150to151_bb1_cmp210_not_i_0_reg_151_NO_SHIFT_REG;
assign rnode_150to151_bb1_cmp210_not_i_0_stall_in_reg_151_NO_SHIFT_REG = 1'b0;
assign rnode_150to151_bb1_cmp210_not_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_150to151_bb1__31_i_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_150to151_bb1__31_i_0_stall_in_0_NO_SHIFT_REG;
 logic rnode_150to151_bb1__31_i_0_NO_SHIFT_REG;
 logic rnode_150to151_bb1__31_i_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_150to151_bb1__31_i_0_stall_in_1_NO_SHIFT_REG;
 logic rnode_150to151_bb1__31_i_1_NO_SHIFT_REG;
 logic rnode_150to151_bb1__31_i_0_reg_151_inputs_ready_NO_SHIFT_REG;
 logic rnode_150to151_bb1__31_i_0_reg_151_NO_SHIFT_REG;
 logic rnode_150to151_bb1__31_i_0_valid_out_0_reg_151_NO_SHIFT_REG;
 logic rnode_150to151_bb1__31_i_0_stall_in_0_reg_151_NO_SHIFT_REG;
 logic rnode_150to151_bb1__31_i_0_stall_out_reg_151_NO_SHIFT_REG;

acl_data_fifo rnode_150to151_bb1__31_i_0_reg_151_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_150to151_bb1__31_i_0_reg_151_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_150to151_bb1__31_i_0_stall_in_0_reg_151_NO_SHIFT_REG),
	.valid_out(rnode_150to151_bb1__31_i_0_valid_out_0_reg_151_NO_SHIFT_REG),
	.stall_out(rnode_150to151_bb1__31_i_0_stall_out_reg_151_NO_SHIFT_REG),
	.data_in(local_bb1__31_i),
	.data_out(rnode_150to151_bb1__31_i_0_reg_151_NO_SHIFT_REG)
);

defparam rnode_150to151_bb1__31_i_0_reg_151_fifo.DEPTH = 1;
defparam rnode_150to151_bb1__31_i_0_reg_151_fifo.DATA_WIDTH = 1;
defparam rnode_150to151_bb1__31_i_0_reg_151_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_150to151_bb1__31_i_0_reg_151_fifo.IMPL = "shift_reg";

assign rnode_150to151_bb1__31_i_0_reg_151_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1__31_i_stall_in = 1'b0;
assign rnode_150to151_bb1__31_i_0_stall_in_0_reg_151_NO_SHIFT_REG = 1'b0;
assign rnode_150to151_bb1__31_i_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_150to151_bb1__31_i_0_NO_SHIFT_REG = rnode_150to151_bb1__31_i_0_reg_151_NO_SHIFT_REG;
assign rnode_150to151_bb1__31_i_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_150to151_bb1__31_i_1_NO_SHIFT_REG = rnode_150to151_bb1__31_i_0_reg_151_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb1_cmp236_i_stall_local;
wire local_bb1_cmp236_i;

assign local_bb1_cmp236_i = ($signed(rnode_150to151_bb1_add225_i_0_NO_SHIFT_REG) > $signed(32'hFE));

// This section implements an unregistered operation.
// 
wire local_bb1_and247_i_stall_local;
wire [31:0] local_bb1_and247_i;

assign local_bb1_and247_i = ((rnode_150to151_bb1_shr246_i_0_NO_SHIFT_REG & 32'h1FFFFFF) & 32'h7FFFFF);

// This section implements an unregistered operation.
// 
wire local_bb1_conv267_i_stall_local;
wire [31:0] local_bb1_conv267_i;

assign local_bb1_conv267_i[31:1] = 31'h0;
assign local_bb1_conv267_i[0] = rnode_150to151_bb1_cmp266_i_0_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb1_lnot279_i_valid_out;
wire local_bb1_lnot279_i_stall_in;
wire local_bb1_lnot279_i_inputs_ready;
wire local_bb1_lnot279_i_stall_local;
wire local_bb1_lnot279_i;

assign local_bb1_lnot279_i_inputs_ready = rnode_150to151_bb1__31_i_0_valid_out_1_NO_SHIFT_REG;
assign local_bb1_lnot279_i = (rnode_150to151_bb1__31_i_1_NO_SHIFT_REG ^ 1'b1);
assign local_bb1_lnot279_i_valid_out = 1'b1;
assign rnode_150to151_bb1__31_i_0_stall_in_1_NO_SHIFT_REG = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb1_lnot239__i_stall_local;
wire local_bb1_lnot239__i;

assign local_bb1_lnot239__i = (local_bb1_cmp236_i & rnode_150to151_bb1_cmp210_not_i_0_NO_SHIFT_REG);

// This section implements an unregistered operation.
// 
wire local_bb1_or249_i_stall_local;
wire [31:0] local_bb1_or249_i;

assign local_bb1_or249_i = ((local_bb1_and247_i & 32'h7FFFFF) | (rnode_150to151_bb1_shl248_i_0_NO_SHIFT_REG & 32'h7F800000));

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_151to152_bb1_lnot279_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_151to152_bb1_lnot279_i_0_stall_in_NO_SHIFT_REG;
 logic rnode_151to152_bb1_lnot279_i_0_NO_SHIFT_REG;
 logic rnode_151to152_bb1_lnot279_i_0_reg_152_inputs_ready_NO_SHIFT_REG;
 logic rnode_151to152_bb1_lnot279_i_0_reg_152_NO_SHIFT_REG;
 logic rnode_151to152_bb1_lnot279_i_0_valid_out_reg_152_NO_SHIFT_REG;
 logic rnode_151to152_bb1_lnot279_i_0_stall_in_reg_152_NO_SHIFT_REG;
 logic rnode_151to152_bb1_lnot279_i_0_stall_out_reg_152_NO_SHIFT_REG;

acl_data_fifo rnode_151to152_bb1_lnot279_i_0_reg_152_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_151to152_bb1_lnot279_i_0_reg_152_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_151to152_bb1_lnot279_i_0_stall_in_reg_152_NO_SHIFT_REG),
	.valid_out(rnode_151to152_bb1_lnot279_i_0_valid_out_reg_152_NO_SHIFT_REG),
	.stall_out(rnode_151to152_bb1_lnot279_i_0_stall_out_reg_152_NO_SHIFT_REG),
	.data_in(local_bb1_lnot279_i),
	.data_out(rnode_151to152_bb1_lnot279_i_0_reg_152_NO_SHIFT_REG)
);

defparam rnode_151to152_bb1_lnot279_i_0_reg_152_fifo.DEPTH = 1;
defparam rnode_151to152_bb1_lnot279_i_0_reg_152_fifo.DATA_WIDTH = 1;
defparam rnode_151to152_bb1_lnot279_i_0_reg_152_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_151to152_bb1_lnot279_i_0_reg_152_fifo.IMPL = "shift_reg";

assign rnode_151to152_bb1_lnot279_i_0_reg_152_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_lnot279_i_stall_in = 1'b0;
assign rnode_151to152_bb1_lnot279_i_0_NO_SHIFT_REG = rnode_151to152_bb1_lnot279_i_0_reg_152_NO_SHIFT_REG;
assign rnode_151to152_bb1_lnot279_i_0_stall_in_reg_152_NO_SHIFT_REG = 1'b0;
assign rnode_151to152_bb1_lnot279_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb1_or242_i_stall_local;
wire local_bb1_or242_i;

assign local_bb1_or242_i = (rnode_150to151_bb1_var__u33_0_NO_SHIFT_REG | local_bb1_lnot239__i);

// This section implements an unregistered operation.
// 
wire local_bb1_or250_i_stall_local;
wire [31:0] local_bb1_or250_i;

assign local_bb1_or250_i = ((local_bb1_or249_i & 32'h7FFFFFFF) | (rnode_150to151_bb1_resultSign_0_i_0_NO_SHIFT_REG & 32'h80000000));

// This section implements an unregistered operation.
// 
wire local_bb1_or253_i_stall_local;
wire local_bb1_or253_i;

assign local_bb1_or253_i = (rnode_150to151_bb1__31_i_0_NO_SHIFT_REG | local_bb1_or242_i);

// This section implements an unregistered operation.
// 
wire local_bb1_or257_i_stall_local;
wire local_bb1_or257_i;

assign local_bb1_or257_i = (local_bb1_or242_i | rnode_150to151_bb1__13_i_0_NO_SHIFT_REG);

// This section implements an unregistered operation.
// 
wire local_bb1_reduction_9_demorgan_i_stall_local;
wire local_bb1_reduction_9_demorgan_i;

assign local_bb1_reduction_9_demorgan_i = (rnode_150to151_bb1__13_i_2_NO_SHIFT_REG | local_bb1_or242_i);

// This section implements an unregistered operation.
// 
wire local_bb1_cond254_i_stall_local;
wire [31:0] local_bb1_cond254_i;

assign local_bb1_cond254_i = (local_bb1_or253_i ? 32'h80000000 : 32'hFFFFFFFF);

// This section implements an unregistered operation.
// 
wire local_bb1_cond258_i_stall_local;
wire [31:0] local_bb1_cond258_i;

assign local_bb1_cond258_i = (local_bb1_or257_i ? 32'h7F800000 : 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_and261_i_stall_local;
wire [31:0] local_bb1_and261_i;

assign local_bb1_and261_i = ((local_bb1_cond254_i | 32'h80000000) & local_bb1_or250_i);

// This section implements an unregistered operation.
// 
wire local_bb1_or262_i_stall_local;
wire [31:0] local_bb1_or262_i;

assign local_bb1_or262_i = ((local_bb1_cond258_i & 32'h7F800000) | (local_bb1_cond260_i & 32'h400000));

// This section implements an unregistered operation.
// 
wire local_bb1_and269_i_stall_local;
wire [31:0] local_bb1_and269_i;

assign local_bb1_and269_i = ((local_bb1_conv267_i & 32'h1) & local_bb1_and261_i);

// This section implements an unregistered operation.
// 
wire local_bb1_or263_i_stall_local;
wire [31:0] local_bb1_or263_i;

assign local_bb1_or263_i = ((local_bb1_or262_i & 32'h7FC00000) | local_bb1_and261_i);

// This section implements an unregistered operation.
// 
wire local_bb1_tobool270_i_stall_local;
wire local_bb1_tobool270_i;

assign local_bb1_tobool270_i = ((local_bb1_and269_i & 32'h1) != 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb1_reduction_9_demorgan_i_valid_out;
wire local_bb1_reduction_9_demorgan_i_stall_in;
wire local_bb1_or263_i_valid_out;
wire local_bb1_or263_i_stall_in;
wire local_bb1__32_i_valid_out;
wire local_bb1__32_i_stall_in;
wire local_bb1__32_i_inputs_ready;
wire local_bb1__32_i_stall_local;
wire local_bb1__32_i;

assign local_bb1__32_i_inputs_ready = (rnode_150to151_bb1_add225_i_0_valid_out_NO_SHIFT_REG & rnode_150to151_bb1_cmp210_not_i_0_valid_out_NO_SHIFT_REG & rnode_150to151_bb1_var__u33_0_valid_out_NO_SHIFT_REG & rnode_150to151_bb1__31_i_0_valid_out_0_NO_SHIFT_REG & rnode_150to151_bb1__13_i_0_valid_out_0_NO_SHIFT_REG & rnode_150to151_bb1__13_i_0_valid_out_2_NO_SHIFT_REG & rnode_150to151_bb1__13_i_0_valid_out_1_NO_SHIFT_REG & rnode_150to151_bb1_resultSign_0_i_0_valid_out_NO_SHIFT_REG & rnode_150to151_bb1_shr246_i_0_valid_out_NO_SHIFT_REG & rnode_150to151_bb1_shl248_i_0_valid_out_NO_SHIFT_REG & rnode_150to151_bb1_cmp266_i_0_valid_out_NO_SHIFT_REG & rnode_150to151_bb1_cmp264_i_0_valid_out_NO_SHIFT_REG);
assign local_bb1__32_i = (rnode_150to151_bb1_cmp264_i_0_NO_SHIFT_REG | local_bb1_tobool270_i);
assign local_bb1_reduction_9_demorgan_i_valid_out = 1'b1;
assign local_bb1_or263_i_valid_out = 1'b1;
assign local_bb1__32_i_valid_out = 1'b1;
assign rnode_150to151_bb1_add225_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_150to151_bb1_cmp210_not_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_150to151_bb1_var__u33_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_150to151_bb1__31_i_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_150to151_bb1__13_i_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_150to151_bb1__13_i_0_stall_in_2_NO_SHIFT_REG = 1'b0;
assign rnode_150to151_bb1__13_i_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_150to151_bb1_resultSign_0_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_150to151_bb1_shr246_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_150to151_bb1_shl248_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_150to151_bb1_cmp266_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_150to151_bb1_cmp264_i_0_stall_in_NO_SHIFT_REG = 1'b0;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_151to152_bb1_reduction_9_demorgan_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_151to152_bb1_reduction_9_demorgan_i_0_stall_in_NO_SHIFT_REG;
 logic rnode_151to152_bb1_reduction_9_demorgan_i_0_NO_SHIFT_REG;
 logic rnode_151to152_bb1_reduction_9_demorgan_i_0_reg_152_inputs_ready_NO_SHIFT_REG;
 logic rnode_151to152_bb1_reduction_9_demorgan_i_0_reg_152_NO_SHIFT_REG;
 logic rnode_151to152_bb1_reduction_9_demorgan_i_0_valid_out_reg_152_NO_SHIFT_REG;
 logic rnode_151to152_bb1_reduction_9_demorgan_i_0_stall_in_reg_152_NO_SHIFT_REG;
 logic rnode_151to152_bb1_reduction_9_demorgan_i_0_stall_out_reg_152_NO_SHIFT_REG;

acl_data_fifo rnode_151to152_bb1_reduction_9_demorgan_i_0_reg_152_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_151to152_bb1_reduction_9_demorgan_i_0_reg_152_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_151to152_bb1_reduction_9_demorgan_i_0_stall_in_reg_152_NO_SHIFT_REG),
	.valid_out(rnode_151to152_bb1_reduction_9_demorgan_i_0_valid_out_reg_152_NO_SHIFT_REG),
	.stall_out(rnode_151to152_bb1_reduction_9_demorgan_i_0_stall_out_reg_152_NO_SHIFT_REG),
	.data_in(local_bb1_reduction_9_demorgan_i),
	.data_out(rnode_151to152_bb1_reduction_9_demorgan_i_0_reg_152_NO_SHIFT_REG)
);

defparam rnode_151to152_bb1_reduction_9_demorgan_i_0_reg_152_fifo.DEPTH = 1;
defparam rnode_151to152_bb1_reduction_9_demorgan_i_0_reg_152_fifo.DATA_WIDTH = 1;
defparam rnode_151to152_bb1_reduction_9_demorgan_i_0_reg_152_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_151to152_bb1_reduction_9_demorgan_i_0_reg_152_fifo.IMPL = "shift_reg";

assign rnode_151to152_bb1_reduction_9_demorgan_i_0_reg_152_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_reduction_9_demorgan_i_stall_in = 1'b0;
assign rnode_151to152_bb1_reduction_9_demorgan_i_0_NO_SHIFT_REG = rnode_151to152_bb1_reduction_9_demorgan_i_0_reg_152_NO_SHIFT_REG;
assign rnode_151to152_bb1_reduction_9_demorgan_i_0_stall_in_reg_152_NO_SHIFT_REG = 1'b0;
assign rnode_151to152_bb1_reduction_9_demorgan_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_151to152_bb1_or263_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_151to152_bb1_or263_i_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_151to152_bb1_or263_i_0_NO_SHIFT_REG;
 logic rnode_151to152_bb1_or263_i_0_reg_152_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_151to152_bb1_or263_i_0_reg_152_NO_SHIFT_REG;
 logic rnode_151to152_bb1_or263_i_0_valid_out_reg_152_NO_SHIFT_REG;
 logic rnode_151to152_bb1_or263_i_0_stall_in_reg_152_NO_SHIFT_REG;
 logic rnode_151to152_bb1_or263_i_0_stall_out_reg_152_NO_SHIFT_REG;

acl_data_fifo rnode_151to152_bb1_or263_i_0_reg_152_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_151to152_bb1_or263_i_0_reg_152_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_151to152_bb1_or263_i_0_stall_in_reg_152_NO_SHIFT_REG),
	.valid_out(rnode_151to152_bb1_or263_i_0_valid_out_reg_152_NO_SHIFT_REG),
	.stall_out(rnode_151to152_bb1_or263_i_0_stall_out_reg_152_NO_SHIFT_REG),
	.data_in(local_bb1_or263_i),
	.data_out(rnode_151to152_bb1_or263_i_0_reg_152_NO_SHIFT_REG)
);

defparam rnode_151to152_bb1_or263_i_0_reg_152_fifo.DEPTH = 1;
defparam rnode_151to152_bb1_or263_i_0_reg_152_fifo.DATA_WIDTH = 32;
defparam rnode_151to152_bb1_or263_i_0_reg_152_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_151to152_bb1_or263_i_0_reg_152_fifo.IMPL = "shift_reg";

assign rnode_151to152_bb1_or263_i_0_reg_152_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1_or263_i_stall_in = 1'b0;
assign rnode_151to152_bb1_or263_i_0_NO_SHIFT_REG = rnode_151to152_bb1_or263_i_0_reg_152_NO_SHIFT_REG;
assign rnode_151to152_bb1_or263_i_0_stall_in_reg_152_NO_SHIFT_REG = 1'b0;
assign rnode_151to152_bb1_or263_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_151to152_bb1__32_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_151to152_bb1__32_i_0_stall_in_NO_SHIFT_REG;
 logic rnode_151to152_bb1__32_i_0_NO_SHIFT_REG;
 logic rnode_151to152_bb1__32_i_0_reg_152_inputs_ready_NO_SHIFT_REG;
 logic rnode_151to152_bb1__32_i_0_reg_152_NO_SHIFT_REG;
 logic rnode_151to152_bb1__32_i_0_valid_out_reg_152_NO_SHIFT_REG;
 logic rnode_151to152_bb1__32_i_0_stall_in_reg_152_NO_SHIFT_REG;
 logic rnode_151to152_bb1__32_i_0_stall_out_reg_152_NO_SHIFT_REG;

acl_data_fifo rnode_151to152_bb1__32_i_0_reg_152_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_151to152_bb1__32_i_0_reg_152_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_151to152_bb1__32_i_0_stall_in_reg_152_NO_SHIFT_REG),
	.valid_out(rnode_151to152_bb1__32_i_0_valid_out_reg_152_NO_SHIFT_REG),
	.stall_out(rnode_151to152_bb1__32_i_0_stall_out_reg_152_NO_SHIFT_REG),
	.data_in(local_bb1__32_i),
	.data_out(rnode_151to152_bb1__32_i_0_reg_152_NO_SHIFT_REG)
);

defparam rnode_151to152_bb1__32_i_0_reg_152_fifo.DEPTH = 1;
defparam rnode_151to152_bb1__32_i_0_reg_152_fifo.DATA_WIDTH = 1;
defparam rnode_151to152_bb1__32_i_0_reg_152_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_151to152_bb1__32_i_0_reg_152_fifo.IMPL = "shift_reg";

assign rnode_151to152_bb1__32_i_0_reg_152_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb1__32_i_stall_in = 1'b0;
assign rnode_151to152_bb1__32_i_0_NO_SHIFT_REG = rnode_151to152_bb1__32_i_0_reg_152_NO_SHIFT_REG;
assign rnode_151to152_bb1__32_i_0_stall_in_reg_152_NO_SHIFT_REG = 1'b0;
assign rnode_151to152_bb1__32_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb1_reduction_9_i_stall_local;
wire local_bb1_reduction_9_i;

assign local_bb1_reduction_9_i = (rnode_151to152_bb1_reduction_9_demorgan_i_0_NO_SHIFT_REG ^ 1'b1);

// This section implements an unregistered operation.
// 
wire local_bb1_reduction_10_i_stall_local;
wire local_bb1_reduction_10_i;

assign local_bb1_reduction_10_i = (rnode_151to152_bb1__32_i_0_NO_SHIFT_REG & rnode_151to152_bb1_lnot279_i_0_NO_SHIFT_REG);

// This section implements an unregistered operation.
// 
wire local_bb1_reduction_11_i_stall_local;
wire local_bb1_reduction_11_i;

assign local_bb1_reduction_11_i = (local_bb1_reduction_10_i & local_bb1_reduction_9_i);

// This section implements an unregistered operation.
// 
wire local_bb1_conv283_i_stall_local;
wire [31:0] local_bb1_conv283_i;

assign local_bb1_conv283_i[31:1] = 31'h0;
assign local_bb1_conv283_i[0] = local_bb1_reduction_11_i;

// This section implements an unregistered operation.
// 
wire local_bb1_add284_i_stall_local;
wire [31:0] local_bb1_add284_i;

assign local_bb1_add284_i = ((local_bb1_conv283_i & 32'h1) + rnode_151to152_bb1_or263_i_0_NO_SHIFT_REG);

// This section implements an unregistered operation.
// 
wire local_bb1__3_v_stall_local;
wire [31:0] local_bb1__3_v;

assign local_bb1__3_v = (local_bb1__ ? rnode_151to152_bb1_add284_i212_0_NO_SHIFT_REG : local_bb1_add284_i);

// This section implements an unregistered operation.
// 
wire local_bb1__3_stall_local;
wire [31:0] local_bb1__3;

assign local_bb1__3 = local_bb1__3_v;

// This section implements an unregistered operation.
// 
wire local_bb1_c0_exi2_valid_out;
wire local_bb1_c0_exi2_stall_in;
wire local_bb1_c0_exi2_inputs_ready;
wire local_bb1_c0_exi2_stall_local;
wire [63:0] local_bb1_c0_exi2;

assign local_bb1_c0_exi2_inputs_ready = (rnode_151to152_bb1_c0_ene1_0_valid_out_NO_SHIFT_REG & rnode_151to152_bb1_cmp9_0_valid_out_NO_SHIFT_REG & rnode_151to152_bb1_add284_i212_0_valid_out_NO_SHIFT_REG & rnode_151to152_bb1_or263_i_0_valid_out_NO_SHIFT_REG & rnode_151to152_bb1_reduction_9_demorgan_i_0_valid_out_NO_SHIFT_REG & rnode_151to152_bb1__32_i_0_valid_out_NO_SHIFT_REG & rnode_151to152_bb1_lnot279_i_0_valid_out_NO_SHIFT_REG);
assign local_bb1_c0_exi2[31:0] = local_bb1_c0_exi1[31:0];
assign local_bb1_c0_exi2[63:32] = local_bb1__3;
assign local_bb1_c0_exi2_valid_out = 1'b1;
assign rnode_151to152_bb1_c0_ene1_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_151to152_bb1_cmp9_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_151to152_bb1_add284_i212_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_151to152_bb1_or263_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_151to152_bb1_reduction_9_demorgan_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_151to152_bb1__32_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_151to152_bb1_lnot279_i_0_stall_in_NO_SHIFT_REG = 1'b0;

// This section implements a registered operation.
// 
wire local_bb1_c0_exit_c0_exi2_inputs_ready;
 reg local_bb1_c0_exit_c0_exi2_valid_out_0_NO_SHIFT_REG;
wire local_bb1_c0_exit_c0_exi2_stall_in_0;
 reg local_bb1_c0_exit_c0_exi2_valid_out_1_NO_SHIFT_REG;
wire local_bb1_c0_exit_c0_exi2_stall_in_1;
 reg [63:0] local_bb1_c0_exit_c0_exi2_NO_SHIFT_REG;
wire [63:0] local_bb1_c0_exit_c0_exi2_in;
wire local_bb1_c0_exit_c0_exi2_valid;
wire local_bb1_c0_exit_c0_exi2_causedstall;

acl_stall_free_sink local_bb1_c0_exit_c0_exi2_instance (
	.clock(clock),
	.resetn(resetn),
	.data_in(local_bb1_c0_exi2),
	.data_out(local_bb1_c0_exit_c0_exi2_in),
	.input_accepted(local_bb1_c0_enter_c0_eni3_input_accepted),
	.valid_out(local_bb1_c0_exit_c0_exi2_valid),
	.stall_in(~(local_bb1_c0_exit_c0_exi2_output_regs_ready)),
	.stall_entry(local_bb1_c0_exit_c0_exi2_entry_stall),
	.valid_in(local_bb1_c0_exit_c0_exi2_valid_in),
	.IIphases(local_bb1_c0_exit_c0_exi2_phases),
	.inc_pipelined_thread(local_bb1_c0_enter_c0_eni3_inc_pipelined_thread),
	.dec_pipelined_thread(local_bb1_c0_enter_c0_eni3_dec_pipelined_thread)
);

defparam local_bb1_c0_exit_c0_exi2_instance.DATA_WIDTH = 64;
defparam local_bb1_c0_exit_c0_exi2_instance.PIPELINE_DEPTH = 24;
defparam local_bb1_c0_exit_c0_exi2_instance.SHARINGII = 1;
defparam local_bb1_c0_exit_c0_exi2_instance.SCHEDULEII = 1;
defparam local_bb1_c0_exit_c0_exi2_instance.ALWAYS_THROTTLE = 0;

assign local_bb1_c0_exit_c0_exi2_inputs_ready = 1'b1;
assign local_bb1_c0_exit_c0_exi2_output_regs_ready = ((~(local_bb1_c0_exit_c0_exi2_valid_out_0_NO_SHIFT_REG) | ~(local_bb1_c0_exit_c0_exi2_stall_in_0)) & (~(local_bb1_c0_exit_c0_exi2_valid_out_1_NO_SHIFT_REG) | ~(local_bb1_c0_exit_c0_exi2_stall_in_1)));
assign local_bb1_c0_exit_c0_exi2_valid_in = SFC_1_VALID_151_152_0_NO_SHIFT_REG;
assign local_bb1_c0_exi2_stall_in = 1'b0;
assign SFC_1_VALID_151_152_0_stall_in = 1'b0;
assign local_bb1_c0_exit_c0_exi2_causedstall = (1'b1 && (1'b0 && !(~(local_bb1_c0_exit_c0_exi2_output_regs_ready))));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb1_c0_exit_c0_exi2_NO_SHIFT_REG <= 'x;
		local_bb1_c0_exit_c0_exi2_valid_out_0_NO_SHIFT_REG <= 1'b0;
		local_bb1_c0_exit_c0_exi2_valid_out_1_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (local_bb1_c0_exit_c0_exi2_output_regs_ready)
		begin
			local_bb1_c0_exit_c0_exi2_NO_SHIFT_REG <= local_bb1_c0_exit_c0_exi2_in;
			local_bb1_c0_exit_c0_exi2_valid_out_0_NO_SHIFT_REG <= local_bb1_c0_exit_c0_exi2_valid;
			local_bb1_c0_exit_c0_exi2_valid_out_1_NO_SHIFT_REG <= local_bb1_c0_exit_c0_exi2_valid;
		end
		else
		begin
			if (~(local_bb1_c0_exit_c0_exi2_stall_in_0))
			begin
				local_bb1_c0_exit_c0_exi2_valid_out_0_NO_SHIFT_REG <= 1'b0;
			end
			if (~(local_bb1_c0_exit_c0_exi2_stall_in_1))
			begin
				local_bb1_c0_exit_c0_exi2_valid_out_1_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end


// This section implements an unregistered operation.
// 
wire local_bb1_c0_exe1_valid_out;
wire local_bb1_c0_exe1_stall_in;
wire local_bb1_c0_exe1_inputs_ready;
wire local_bb1_c0_exe1_stall_local;
wire local_bb1_c0_exe1;

assign local_bb1_c0_exe1_inputs_ready = local_bb1_c0_exit_c0_exi2_valid_out_0_NO_SHIFT_REG;
assign local_bb1_c0_exe1 = local_bb1_c0_exit_c0_exi2_NO_SHIFT_REG[8];
assign local_bb1_c0_exe1_valid_out = local_bb1_c0_exe1_inputs_ready;
assign local_bb1_c0_exe1_stall_local = local_bb1_c0_exe1_stall_in;
assign local_bb1_c0_exit_c0_exi2_stall_in_0 = (|local_bb1_c0_exe1_stall_local);

// This section implements an unregistered operation.
// 
wire local_bb1_c0_exe2_valid_out;
wire local_bb1_c0_exe2_stall_in;
wire local_bb1_c0_exe2_inputs_ready;
wire local_bb1_c0_exe2_stall_local;
wire [31:0] local_bb1_c0_exe2;

assign local_bb1_c0_exe2_inputs_ready = local_bb1_c0_exit_c0_exi2_valid_out_1_NO_SHIFT_REG;
assign local_bb1_c0_exe2 = local_bb1_c0_exit_c0_exi2_NO_SHIFT_REG[63:32];
assign local_bb1_c0_exe2_valid_out = local_bb1_c0_exe2_inputs_ready;
assign local_bb1_c0_exe2_stall_local = local_bb1_c0_exe2_stall_in;
assign local_bb1_c0_exit_c0_exi2_stall_in_1 = (|local_bb1_c0_exe2_stall_local);

// This section implements a registered operation.
// 
wire local_bb1_st_add7_inputs_ready;
 reg local_bb1_st_add7_valid_out_NO_SHIFT_REG;
wire local_bb1_st_add7_stall_in;
wire local_bb1_st_add7_output_regs_ready;
wire local_bb1_st_add7_fu_stall_out;
wire local_bb1_st_add7_fu_valid_out;
wire local_bb1_st_add7_causedstall;

lsu_top lsu_local_bb1_st_add7 (
	.clock(clock),
	.clock2x(clock2x),
	.resetn(resetn),
	.flush(start),
	.stream_base_addr(),
	.stream_size(),
	.stream_reset(),
	.o_stall(local_bb1_st_add7_fu_stall_out),
	.i_valid(local_bb1_st_add7_inputs_ready),
	.i_address((input_result & 64'hFFFFFFFFFFFFFC00)),
	.i_writedata(input_wii_add7),
	.i_cmpdata(),
	.i_predicate(local_bb1_c0_exe1),
	.i_bitwiseor(64'h0),
	.i_byteenable(),
	.i_stall(~(local_bb1_st_add7_output_regs_ready)),
	.o_valid(local_bb1_st_add7_fu_valid_out),
	.o_readdata(),
	.o_input_fifo_depth(),
	.o_writeack(),
	.i_atomic_op(3'h0),
	.o_active(local_bb1_st_add7_active),
	.avm_address(avm_local_bb1_st_add7_address),
	.avm_read(avm_local_bb1_st_add7_read),
	.avm_enable(avm_local_bb1_st_add7_enable),
	.avm_readdata(avm_local_bb1_st_add7_readdata),
	.avm_write(avm_local_bb1_st_add7_write),
	.avm_writeack(avm_local_bb1_st_add7_writeack),
	.avm_burstcount(avm_local_bb1_st_add7_burstcount),
	.avm_writedata(avm_local_bb1_st_add7_writedata),
	.avm_byteenable(avm_local_bb1_st_add7_byteenable),
	.avm_waitrequest(avm_local_bb1_st_add7_waitrequest),
	.avm_readdatavalid(avm_local_bb1_st_add7_readdatavalid),
	.profile_bw(),
	.profile_bw_incr(),
	.profile_total_ivalid(),
	.profile_total_req(),
	.profile_i_stall_count(),
	.profile_o_stall_count(),
	.profile_avm_readwrite_count(),
	.profile_avm_burstcount_total(),
	.profile_avm_burstcount_total_incr(),
	.profile_req_cache_hit_count(),
	.profile_extra_unaligned_reqs(),
	.profile_avm_stall()
);

defparam lsu_local_bb1_st_add7.AWIDTH = 30;
defparam lsu_local_bb1_st_add7.WIDTH_BYTES = 4;
defparam lsu_local_bb1_st_add7.MWIDTH_BYTES = 32;
defparam lsu_local_bb1_st_add7.WRITEDATAWIDTH_BYTES = 32;
defparam lsu_local_bb1_st_add7.ALIGNMENT_BYTES = 32;
defparam lsu_local_bb1_st_add7.READ = 0;
defparam lsu_local_bb1_st_add7.ATOMIC = 0;
defparam lsu_local_bb1_st_add7.WIDTH = 32;
defparam lsu_local_bb1_st_add7.MWIDTH = 256;
defparam lsu_local_bb1_st_add7.ATOMIC_WIDTH = 3;
defparam lsu_local_bb1_st_add7.BURSTCOUNT_WIDTH = 5;
defparam lsu_local_bb1_st_add7.KERNEL_SIDE_MEM_LATENCY = 7;
defparam lsu_local_bb1_st_add7.MEMORY_SIDE_MEM_LATENCY = 0;
defparam lsu_local_bb1_st_add7.USE_WRITE_ACK = 0;
defparam lsu_local_bb1_st_add7.ENABLE_BANKED_MEMORY = 0;
defparam lsu_local_bb1_st_add7.ABITS_PER_LMEM_BANK = 0;
defparam lsu_local_bb1_st_add7.NUMBER_BANKS = 1;
defparam lsu_local_bb1_st_add7.LMEM_ADDR_PERMUTATION_STYLE = 0;
defparam lsu_local_bb1_st_add7.INTENDED_DEVICE_FAMILY = "Cyclone V";
defparam lsu_local_bb1_st_add7.USEINPUTFIFO = 0;
defparam lsu_local_bb1_st_add7.USECACHING = 0;
defparam lsu_local_bb1_st_add7.USEOUTPUTFIFO = 1;
defparam lsu_local_bb1_st_add7.FORCE_NOP_SUPPORT = 0;
defparam lsu_local_bb1_st_add7.ADDRSPACE = 1;
defparam lsu_local_bb1_st_add7.STYLE = "PIPELINED";
defparam lsu_local_bb1_st_add7.USE_BYTE_EN = 0;

assign local_bb1_st_add7_inputs_ready = (local_bb1_c0_exe1_valid_out & rnode_156to157_add7_0_valid_out_NO_SHIFT_REG & rnode_156to157_input_result_0_valid_out_NO_SHIFT_REG);
assign local_bb1_st_add7_output_regs_ready = (&(~(local_bb1_st_add7_valid_out_NO_SHIFT_REG) | ~(local_bb1_st_add7_stall_in)));
assign local_bb1_c0_exe1_stall_in = (local_bb1_st_add7_fu_stall_out | ~(local_bb1_st_add7_inputs_ready));
assign rnode_156to157_add7_0_stall_in_NO_SHIFT_REG = (local_bb1_st_add7_fu_stall_out | ~(local_bb1_st_add7_inputs_ready));
assign rnode_156to157_input_result_0_stall_in_NO_SHIFT_REG = (local_bb1_st_add7_fu_stall_out | ~(local_bb1_st_add7_inputs_ready));
assign local_bb1_st_add7_causedstall = (local_bb1_st_add7_inputs_ready && (local_bb1_st_add7_fu_stall_out && !(~(local_bb1_st_add7_output_regs_ready))));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb1_st_add7_valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (local_bb1_st_add7_output_regs_ready)
		begin
			local_bb1_st_add7_valid_out_NO_SHIFT_REG <= local_bb1_st_add7_fu_valid_out;
		end
		else
		begin
			if (~(local_bb1_st_add7_stall_in))
			begin
				local_bb1_st_add7_valid_out_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end


// This section implements a registered operation.
// 
wire local_bb1_st_c0_exe2_inputs_ready;
 reg local_bb1_st_c0_exe2_valid_out_NO_SHIFT_REG;
wire local_bb1_st_c0_exe2_stall_in;
wire local_bb1_st_c0_exe2_output_regs_ready;
wire local_bb1_st_c0_exe2_fu_stall_out;
wire local_bb1_st_c0_exe2_fu_valid_out;
wire local_bb1_st_c0_exe2_causedstall;

lsu_top lsu_local_bb1_st_c0_exe2 (
	.clock(clock),
	.clock2x(clock2x),
	.resetn(resetn),
	.flush(start),
	.stream_base_addr(),
	.stream_size(),
	.stream_reset(),
	.o_stall(local_bb1_st_c0_exe2_fu_stall_out),
	.i_valid(local_bb1_st_c0_exe2_inputs_ready),
	.i_address((local_bb1_arrayidx23 & 64'hFFFFFFFFFFFFFFFC)),
	.i_writedata(local_bb1_c0_exe2),
	.i_cmpdata(),
	.i_predicate(rnode_156to157_bb1_cmp_0_NO_SHIFT_REG),
	.i_bitwiseor(64'h0),
	.i_byteenable(),
	.i_stall(~(local_bb1_st_c0_exe2_output_regs_ready)),
	.o_valid(local_bb1_st_c0_exe2_fu_valid_out),
	.o_readdata(),
	.o_input_fifo_depth(),
	.o_writeack(),
	.i_atomic_op(3'h0),
	.o_active(local_bb1_st_c0_exe2_active),
	.avm_address(avm_local_bb1_st_c0_exe2_address),
	.avm_read(avm_local_bb1_st_c0_exe2_read),
	.avm_enable(avm_local_bb1_st_c0_exe2_enable),
	.avm_readdata(avm_local_bb1_st_c0_exe2_readdata),
	.avm_write(avm_local_bb1_st_c0_exe2_write),
	.avm_writeack(avm_local_bb1_st_c0_exe2_writeack),
	.avm_burstcount(avm_local_bb1_st_c0_exe2_burstcount),
	.avm_writedata(avm_local_bb1_st_c0_exe2_writedata),
	.avm_byteenable(avm_local_bb1_st_c0_exe2_byteenable),
	.avm_waitrequest(avm_local_bb1_st_c0_exe2_waitrequest),
	.avm_readdatavalid(avm_local_bb1_st_c0_exe2_readdatavalid),
	.profile_bw(),
	.profile_bw_incr(),
	.profile_total_ivalid(),
	.profile_total_req(),
	.profile_i_stall_count(),
	.profile_o_stall_count(),
	.profile_avm_readwrite_count(),
	.profile_avm_burstcount_total(),
	.profile_avm_burstcount_total_incr(),
	.profile_req_cache_hit_count(),
	.profile_extra_unaligned_reqs(),
	.profile_avm_stall()
);

defparam lsu_local_bb1_st_c0_exe2.AWIDTH = 30;
defparam lsu_local_bb1_st_c0_exe2.WIDTH_BYTES = 4;
defparam lsu_local_bb1_st_c0_exe2.MWIDTH_BYTES = 32;
defparam lsu_local_bb1_st_c0_exe2.WRITEDATAWIDTH_BYTES = 32;
defparam lsu_local_bb1_st_c0_exe2.ALIGNMENT_BYTES = 4;
defparam lsu_local_bb1_st_c0_exe2.READ = 0;
defparam lsu_local_bb1_st_c0_exe2.ATOMIC = 0;
defparam lsu_local_bb1_st_c0_exe2.WIDTH = 32;
defparam lsu_local_bb1_st_c0_exe2.MWIDTH = 256;
defparam lsu_local_bb1_st_c0_exe2.ATOMIC_WIDTH = 3;
defparam lsu_local_bb1_st_c0_exe2.BURSTCOUNT_WIDTH = 5;
defparam lsu_local_bb1_st_c0_exe2.KERNEL_SIDE_MEM_LATENCY = 4;
defparam lsu_local_bb1_st_c0_exe2.MEMORY_SIDE_MEM_LATENCY = 10;
defparam lsu_local_bb1_st_c0_exe2.USE_WRITE_ACK = 0;
defparam lsu_local_bb1_st_c0_exe2.ENABLE_BANKED_MEMORY = 0;
defparam lsu_local_bb1_st_c0_exe2.ABITS_PER_LMEM_BANK = 0;
defparam lsu_local_bb1_st_c0_exe2.NUMBER_BANKS = 1;
defparam lsu_local_bb1_st_c0_exe2.LMEM_ADDR_PERMUTATION_STYLE = 0;
defparam lsu_local_bb1_st_c0_exe2.INTENDED_DEVICE_FAMILY = "Cyclone V";
defparam lsu_local_bb1_st_c0_exe2.USEINPUTFIFO = 0;
defparam lsu_local_bb1_st_c0_exe2.USECACHING = 0;
defparam lsu_local_bb1_st_c0_exe2.USEOUTPUTFIFO = 1;
defparam lsu_local_bb1_st_c0_exe2.FORCE_NOP_SUPPORT = 0;
defparam lsu_local_bb1_st_c0_exe2.ADDRSPACE = 1;
defparam lsu_local_bb1_st_c0_exe2.STYLE = "BURST-COALESCED";
defparam lsu_local_bb1_st_c0_exe2.USE_BYTE_EN = 0;

assign local_bb1_st_c0_exe2_inputs_ready = (local_bb1_c0_exe2_valid_out & local_bb1_arrayidx23_valid_out & rnode_156to157_bb1_cmp_0_valid_out_NO_SHIFT_REG);
assign local_bb1_st_c0_exe2_output_regs_ready = (&(~(local_bb1_st_c0_exe2_valid_out_NO_SHIFT_REG) | ~(local_bb1_st_c0_exe2_stall_in)));
assign local_bb1_c0_exe2_stall_in = (local_bb1_st_c0_exe2_fu_stall_out | ~(local_bb1_st_c0_exe2_inputs_ready));
assign local_bb1_arrayidx23_stall_in = (local_bb1_st_c0_exe2_fu_stall_out | ~(local_bb1_st_c0_exe2_inputs_ready));
assign rnode_156to157_bb1_cmp_0_stall_in_NO_SHIFT_REG = (local_bb1_st_c0_exe2_fu_stall_out | ~(local_bb1_st_c0_exe2_inputs_ready));
assign local_bb1_st_c0_exe2_causedstall = (local_bb1_st_c0_exe2_inputs_ready && (local_bb1_st_c0_exe2_fu_stall_out && !(~(local_bb1_st_c0_exe2_output_regs_ready))));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb1_st_c0_exe2_valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (local_bb1_st_c0_exe2_output_regs_ready)
		begin
			local_bb1_st_c0_exe2_valid_out_NO_SHIFT_REG <= local_bb1_st_c0_exe2_fu_valid_out;
		end
		else
		begin
			if (~(local_bb1_st_c0_exe2_stall_in))
			begin
				local_bb1_st_c0_exe2_valid_out_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end


// This section implements a staging register.
// 
wire rstag_164to164_bb1_st_add7_valid_out;
wire rstag_164to164_bb1_st_add7_stall_in;
wire rstag_164to164_bb1_st_add7_inputs_ready;
wire rstag_164to164_bb1_st_add7_stall_local;
 reg rstag_164to164_bb1_st_add7_staging_valid_NO_SHIFT_REG;
wire rstag_164to164_bb1_st_add7_combined_valid;

assign rstag_164to164_bb1_st_add7_inputs_ready = local_bb1_st_add7_valid_out_NO_SHIFT_REG;
assign rstag_164to164_bb1_st_add7_combined_valid = (rstag_164to164_bb1_st_add7_staging_valid_NO_SHIFT_REG | rstag_164to164_bb1_st_add7_inputs_ready);
assign rstag_164to164_bb1_st_add7_valid_out = rstag_164to164_bb1_st_add7_combined_valid;
assign rstag_164to164_bb1_st_add7_stall_local = rstag_164to164_bb1_st_add7_stall_in;
assign local_bb1_st_add7_stall_in = (|rstag_164to164_bb1_st_add7_staging_valid_NO_SHIFT_REG);

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		rstag_164to164_bb1_st_add7_staging_valid_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (rstag_164to164_bb1_st_add7_stall_local)
		begin
			if (~(rstag_164to164_bb1_st_add7_staging_valid_NO_SHIFT_REG))
			begin
				rstag_164to164_bb1_st_add7_staging_valid_NO_SHIFT_REG <= rstag_164to164_bb1_st_add7_inputs_ready;
			end
		end
		else
		begin
			rstag_164to164_bb1_st_add7_staging_valid_NO_SHIFT_REG <= 1'b0;
		end
	end
end


// Register node:
//  * latency = 3
//  * capacity = 3
 logic rnode_161to164_bb1_st_c0_exe2_0_valid_out_NO_SHIFT_REG;
 logic rnode_161to164_bb1_st_c0_exe2_0_stall_in_NO_SHIFT_REG;
 logic rnode_161to164_bb1_st_c0_exe2_0_reg_164_inputs_ready_NO_SHIFT_REG;
 logic rnode_161to164_bb1_st_c0_exe2_0_valid_out_reg_164_NO_SHIFT_REG;
 logic rnode_161to164_bb1_st_c0_exe2_0_stall_in_reg_164_NO_SHIFT_REG;
 logic rnode_161to164_bb1_st_c0_exe2_0_stall_out_reg_164_NO_SHIFT_REG;

acl_data_fifo rnode_161to164_bb1_st_c0_exe2_0_reg_164_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_161to164_bb1_st_c0_exe2_0_reg_164_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_161to164_bb1_st_c0_exe2_0_stall_in_reg_164_NO_SHIFT_REG),
	.valid_out(rnode_161to164_bb1_st_c0_exe2_0_valid_out_reg_164_NO_SHIFT_REG),
	.stall_out(rnode_161to164_bb1_st_c0_exe2_0_stall_out_reg_164_NO_SHIFT_REG),
	.data_in(),
	.data_out()
);

defparam rnode_161to164_bb1_st_c0_exe2_0_reg_164_fifo.DEPTH = 4;
defparam rnode_161to164_bb1_st_c0_exe2_0_reg_164_fifo.DATA_WIDTH = 0;
defparam rnode_161to164_bb1_st_c0_exe2_0_reg_164_fifo.ALLOW_FULL_WRITE = 0;
defparam rnode_161to164_bb1_st_c0_exe2_0_reg_164_fifo.IMPL = "ll_reg";

assign rnode_161to164_bb1_st_c0_exe2_0_reg_164_inputs_ready_NO_SHIFT_REG = local_bb1_st_c0_exe2_valid_out_NO_SHIFT_REG;
assign local_bb1_st_c0_exe2_stall_in = rnode_161to164_bb1_st_c0_exe2_0_stall_out_reg_164_NO_SHIFT_REG;
assign rnode_161to164_bb1_st_c0_exe2_0_stall_in_reg_164_NO_SHIFT_REG = rnode_161to164_bb1_st_c0_exe2_0_stall_in_NO_SHIFT_REG;
assign rnode_161to164_bb1_st_c0_exe2_0_valid_out_NO_SHIFT_REG = rnode_161to164_bb1_st_c0_exe2_0_valid_out_reg_164_NO_SHIFT_REG;

// This section describes the behaviour of the BRANCH node.
wire branch_var__inputs_ready;
wire branch_var__output_regs_ready;

assign branch_var__inputs_ready = (rnode_161to164_bb1_st_c0_exe2_0_valid_out_NO_SHIFT_REG & rstag_164to164_bb1_st_add7_valid_out);
assign branch_var__output_regs_ready = ~(stall_in);
assign rnode_161to164_bb1_st_c0_exe2_0_stall_in_NO_SHIFT_REG = (~(branch_var__output_regs_ready) | ~(branch_var__inputs_ready));
assign rstag_164to164_bb1_st_add7_stall_in = (~(branch_var__output_regs_ready) | ~(branch_var__inputs_ready));
assign valid_out = branch_var__inputs_ready;

endmodule

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

// altera message_off 10036
// altera message_off 10230
// altera message_off 10858
module convolution_kernel_function
	(
		input 		clock,
		input 		resetn,
		input [31:0] 		input_global_id_0,
		output 		stall_out,
		input 		valid_in,
		output 		valid_out,
		input 		stall_in,
		input [31:0] 		workgroup_size,
		output 		avm_local_bb0_ld__enable,
		input [255:0] 		avm_local_bb0_ld__readdata,
		input 		avm_local_bb0_ld__readdatavalid,
		input 		avm_local_bb0_ld__waitrequest,
		output [29:0] 		avm_local_bb0_ld__address,
		output 		avm_local_bb0_ld__read,
		output 		avm_local_bb0_ld__write,
		input 		avm_local_bb0_ld__writeack,
		output [255:0] 		avm_local_bb0_ld__writedata,
		output [31:0] 		avm_local_bb0_ld__byteenable,
		output [4:0] 		avm_local_bb0_ld__burstcount,
		output 		avm_local_bb0_ld_memcoalesce_inputArray_load_0_enable,
		input [255:0] 		avm_local_bb0_ld_memcoalesce_inputArray_load_0_readdata,
		input 		avm_local_bb0_ld_memcoalesce_inputArray_load_0_readdatavalid,
		input 		avm_local_bb0_ld_memcoalesce_inputArray_load_0_waitrequest,
		output [29:0] 		avm_local_bb0_ld_memcoalesce_inputArray_load_0_address,
		output 		avm_local_bb0_ld_memcoalesce_inputArray_load_0_read,
		output 		avm_local_bb0_ld_memcoalesce_inputArray_load_0_write,
		input 		avm_local_bb0_ld_memcoalesce_inputArray_load_0_writeack,
		output [255:0] 		avm_local_bb0_ld_memcoalesce_inputArray_load_0_writedata,
		output [31:0] 		avm_local_bb0_ld_memcoalesce_inputArray_load_0_byteenable,
		output [4:0] 		avm_local_bb0_ld_memcoalesce_inputArray_load_0_burstcount,
		output 		avm_local_bb1_ld_memcoalesce_inputArray_load_09_enable,
		input [255:0] 		avm_local_bb1_ld_memcoalesce_inputArray_load_09_readdata,
		input 		avm_local_bb1_ld_memcoalesce_inputArray_load_09_readdatavalid,
		input 		avm_local_bb1_ld_memcoalesce_inputArray_load_09_waitrequest,
		output [29:0] 		avm_local_bb1_ld_memcoalesce_inputArray_load_09_address,
		output 		avm_local_bb1_ld_memcoalesce_inputArray_load_09_read,
		output 		avm_local_bb1_ld_memcoalesce_inputArray_load_09_write,
		input 		avm_local_bb1_ld_memcoalesce_inputArray_load_09_writeack,
		output [255:0] 		avm_local_bb1_ld_memcoalesce_inputArray_load_09_writedata,
		output [31:0] 		avm_local_bb1_ld_memcoalesce_inputArray_load_09_byteenable,
		output [4:0] 		avm_local_bb1_ld_memcoalesce_inputArray_load_09_burstcount,
		output 		avm_local_bb1_st_add7_enable,
		input [255:0] 		avm_local_bb1_st_add7_readdata,
		input 		avm_local_bb1_st_add7_readdatavalid,
		input 		avm_local_bb1_st_add7_waitrequest,
		output [29:0] 		avm_local_bb1_st_add7_address,
		output 		avm_local_bb1_st_add7_read,
		output 		avm_local_bb1_st_add7_write,
		input 		avm_local_bb1_st_add7_writeack,
		output [255:0] 		avm_local_bb1_st_add7_writedata,
		output [31:0] 		avm_local_bb1_st_add7_byteenable,
		output [4:0] 		avm_local_bb1_st_add7_burstcount,
		output 		avm_local_bb1_st_c0_exe2_enable,
		input [255:0] 		avm_local_bb1_st_c0_exe2_readdata,
		input 		avm_local_bb1_st_c0_exe2_readdatavalid,
		input 		avm_local_bb1_st_c0_exe2_waitrequest,
		output [29:0] 		avm_local_bb1_st_c0_exe2_address,
		output 		avm_local_bb1_st_c0_exe2_read,
		output 		avm_local_bb1_st_c0_exe2_write,
		input 		avm_local_bb1_st_c0_exe2_writeack,
		output [255:0] 		avm_local_bb1_st_c0_exe2_writedata,
		output [31:0] 		avm_local_bb1_st_c0_exe2_byteenable,
		output [4:0] 		avm_local_bb1_st_c0_exe2_burstcount,
		input 		clock2x,
		input 		start,
		input [63:0] 		input_inputArray,
		input [63:0] 		input_size,
		input [63:0] 		input_result,
		output reg 		has_a_write_pending,
		output reg 		has_a_lsu_active
	);


wire [31:0] cur_cycle;
wire bb_0_stall_out;
wire bb_0_valid_out;
wire [31:0] bb_0_lvb_bb0_add7;
wire [31:0] bb_0_lvb_bb0_sub;
wire [31:0] bb_0_lvb_input_global_id_0;
wire bb_0_local_bb0_ld__active;
wire bb_0_local_bb0_ld_memcoalesce_inputArray_load_0_active;
wire bb_1_stall_out;
wire bb_1_valid_out;
wire bb_1_local_bb1_ld_memcoalesce_inputArray_load_09_active;
wire bb_1_local_bb1_st_add7_active;
wire bb_1_local_bb1_st_c0_exe2_active;
wire [1:0] writes_pending;
wire [4:0] lsus_active;

convolution_kernel_basic_block_0 convolution_kernel_basic_block_0 (
	.clock(clock),
	.resetn(resetn),
	.start(start),
	.input_inputArray(input_inputArray),
	.input_size(input_size),
	.valid_in(valid_in),
	.stall_out(bb_0_stall_out),
	.input_global_id_0(input_global_id_0),
	.valid_out(bb_0_valid_out),
	.stall_in(bb_1_stall_out),
	.lvb_bb0_add7(bb_0_lvb_bb0_add7),
	.lvb_bb0_sub(bb_0_lvb_bb0_sub),
	.lvb_input_global_id_0(bb_0_lvb_input_global_id_0),
	.workgroup_size(workgroup_size),
	.avm_local_bb0_ld__enable(avm_local_bb0_ld__enable),
	.avm_local_bb0_ld__readdata(avm_local_bb0_ld__readdata),
	.avm_local_bb0_ld__readdatavalid(avm_local_bb0_ld__readdatavalid),
	.avm_local_bb0_ld__waitrequest(avm_local_bb0_ld__waitrequest),
	.avm_local_bb0_ld__address(avm_local_bb0_ld__address),
	.avm_local_bb0_ld__read(avm_local_bb0_ld__read),
	.avm_local_bb0_ld__write(avm_local_bb0_ld__write),
	.avm_local_bb0_ld__writeack(avm_local_bb0_ld__writeack),
	.avm_local_bb0_ld__writedata(avm_local_bb0_ld__writedata),
	.avm_local_bb0_ld__byteenable(avm_local_bb0_ld__byteenable),
	.avm_local_bb0_ld__burstcount(avm_local_bb0_ld__burstcount),
	.local_bb0_ld__active(bb_0_local_bb0_ld__active),
	.clock2x(clock2x),
	.avm_local_bb0_ld_memcoalesce_inputArray_load_0_enable(avm_local_bb0_ld_memcoalesce_inputArray_load_0_enable),
	.avm_local_bb0_ld_memcoalesce_inputArray_load_0_readdata(avm_local_bb0_ld_memcoalesce_inputArray_load_0_readdata),
	.avm_local_bb0_ld_memcoalesce_inputArray_load_0_readdatavalid(avm_local_bb0_ld_memcoalesce_inputArray_load_0_readdatavalid),
	.avm_local_bb0_ld_memcoalesce_inputArray_load_0_waitrequest(avm_local_bb0_ld_memcoalesce_inputArray_load_0_waitrequest),
	.avm_local_bb0_ld_memcoalesce_inputArray_load_0_address(avm_local_bb0_ld_memcoalesce_inputArray_load_0_address),
	.avm_local_bb0_ld_memcoalesce_inputArray_load_0_read(avm_local_bb0_ld_memcoalesce_inputArray_load_0_read),
	.avm_local_bb0_ld_memcoalesce_inputArray_load_0_write(avm_local_bb0_ld_memcoalesce_inputArray_load_0_write),
	.avm_local_bb0_ld_memcoalesce_inputArray_load_0_writeack(avm_local_bb0_ld_memcoalesce_inputArray_load_0_writeack),
	.avm_local_bb0_ld_memcoalesce_inputArray_load_0_writedata(avm_local_bb0_ld_memcoalesce_inputArray_load_0_writedata),
	.avm_local_bb0_ld_memcoalesce_inputArray_load_0_byteenable(avm_local_bb0_ld_memcoalesce_inputArray_load_0_byteenable),
	.avm_local_bb0_ld_memcoalesce_inputArray_load_0_burstcount(avm_local_bb0_ld_memcoalesce_inputArray_load_0_burstcount),
	.local_bb0_ld_memcoalesce_inputArray_load_0_active(bb_0_local_bb0_ld_memcoalesce_inputArray_load_0_active)
);


convolution_kernel_basic_block_1 convolution_kernel_basic_block_1 (
	.clock(clock),
	.resetn(resetn),
	.input_result(input_result),
	.input_inputArray(input_inputArray),
	.input_wii_add7(bb_0_lvb_bb0_add7),
	.input_wii_sub(bb_0_lvb_bb0_sub),
	.valid_in(bb_0_valid_out),
	.stall_out(bb_1_stall_out),
	.input_global_id_0(bb_0_lvb_input_global_id_0),
	.valid_out(bb_1_valid_out),
	.stall_in(stall_in),
	.workgroup_size(workgroup_size),
	.start(start),
	.avm_local_bb1_ld_memcoalesce_inputArray_load_09_enable(avm_local_bb1_ld_memcoalesce_inputArray_load_09_enable),
	.avm_local_bb1_ld_memcoalesce_inputArray_load_09_readdata(avm_local_bb1_ld_memcoalesce_inputArray_load_09_readdata),
	.avm_local_bb1_ld_memcoalesce_inputArray_load_09_readdatavalid(avm_local_bb1_ld_memcoalesce_inputArray_load_09_readdatavalid),
	.avm_local_bb1_ld_memcoalesce_inputArray_load_09_waitrequest(avm_local_bb1_ld_memcoalesce_inputArray_load_09_waitrequest),
	.avm_local_bb1_ld_memcoalesce_inputArray_load_09_address(avm_local_bb1_ld_memcoalesce_inputArray_load_09_address),
	.avm_local_bb1_ld_memcoalesce_inputArray_load_09_read(avm_local_bb1_ld_memcoalesce_inputArray_load_09_read),
	.avm_local_bb1_ld_memcoalesce_inputArray_load_09_write(avm_local_bb1_ld_memcoalesce_inputArray_load_09_write),
	.avm_local_bb1_ld_memcoalesce_inputArray_load_09_writeack(avm_local_bb1_ld_memcoalesce_inputArray_load_09_writeack),
	.avm_local_bb1_ld_memcoalesce_inputArray_load_09_writedata(avm_local_bb1_ld_memcoalesce_inputArray_load_09_writedata),
	.avm_local_bb1_ld_memcoalesce_inputArray_load_09_byteenable(avm_local_bb1_ld_memcoalesce_inputArray_load_09_byteenable),
	.avm_local_bb1_ld_memcoalesce_inputArray_load_09_burstcount(avm_local_bb1_ld_memcoalesce_inputArray_load_09_burstcount),
	.local_bb1_ld_memcoalesce_inputArray_load_09_active(bb_1_local_bb1_ld_memcoalesce_inputArray_load_09_active),
	.clock2x(clock2x),
	.avm_local_bb1_st_add7_enable(avm_local_bb1_st_add7_enable),
	.avm_local_bb1_st_add7_readdata(avm_local_bb1_st_add7_readdata),
	.avm_local_bb1_st_add7_readdatavalid(avm_local_bb1_st_add7_readdatavalid),
	.avm_local_bb1_st_add7_waitrequest(avm_local_bb1_st_add7_waitrequest),
	.avm_local_bb1_st_add7_address(avm_local_bb1_st_add7_address),
	.avm_local_bb1_st_add7_read(avm_local_bb1_st_add7_read),
	.avm_local_bb1_st_add7_write(avm_local_bb1_st_add7_write),
	.avm_local_bb1_st_add7_writeack(avm_local_bb1_st_add7_writeack),
	.avm_local_bb1_st_add7_writedata(avm_local_bb1_st_add7_writedata),
	.avm_local_bb1_st_add7_byteenable(avm_local_bb1_st_add7_byteenable),
	.avm_local_bb1_st_add7_burstcount(avm_local_bb1_st_add7_burstcount),
	.local_bb1_st_add7_active(bb_1_local_bb1_st_add7_active),
	.avm_local_bb1_st_c0_exe2_enable(avm_local_bb1_st_c0_exe2_enable),
	.avm_local_bb1_st_c0_exe2_readdata(avm_local_bb1_st_c0_exe2_readdata),
	.avm_local_bb1_st_c0_exe2_readdatavalid(avm_local_bb1_st_c0_exe2_readdatavalid),
	.avm_local_bb1_st_c0_exe2_waitrequest(avm_local_bb1_st_c0_exe2_waitrequest),
	.avm_local_bb1_st_c0_exe2_address(avm_local_bb1_st_c0_exe2_address),
	.avm_local_bb1_st_c0_exe2_read(avm_local_bb1_st_c0_exe2_read),
	.avm_local_bb1_st_c0_exe2_write(avm_local_bb1_st_c0_exe2_write),
	.avm_local_bb1_st_c0_exe2_writeack(avm_local_bb1_st_c0_exe2_writeack),
	.avm_local_bb1_st_c0_exe2_writedata(avm_local_bb1_st_c0_exe2_writedata),
	.avm_local_bb1_st_c0_exe2_byteenable(avm_local_bb1_st_c0_exe2_byteenable),
	.avm_local_bb1_st_c0_exe2_burstcount(avm_local_bb1_st_c0_exe2_burstcount),
	.local_bb1_st_c0_exe2_active(bb_1_local_bb1_st_c0_exe2_active)
);


convolution_kernel_sys_cycle_time system_cycle_time_module (
	.clock(clock),
	.resetn(resetn),
	.cur_cycle(cur_cycle)
);


assign valid_out = bb_1_valid_out;
assign stall_out = bb_0_stall_out;
assign writes_pending[0] = bb_1_local_bb1_st_add7_active;
assign writes_pending[1] = bb_1_local_bb1_st_c0_exe2_active;
assign lsus_active[0] = bb_0_local_bb0_ld__active;
assign lsus_active[1] = bb_0_local_bb0_ld_memcoalesce_inputArray_load_0_active;
assign lsus_active[2] = bb_1_local_bb1_ld_memcoalesce_inputArray_load_09_active;
assign lsus_active[3] = bb_1_local_bb1_st_add7_active;
assign lsus_active[4] = bb_1_local_bb1_st_c0_exe2_active;

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		has_a_write_pending <= 1'b0;
		has_a_lsu_active <= 1'b0;
	end
	else
	begin
		has_a_write_pending <= (|writes_pending);
		has_a_lsu_active <= (|lsus_active);
	end
end

endmodule

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

// altera message_off 10036
// altera message_off 10230
// altera message_off 10858
module convolution_kernel_function_wrapper
	(
		input 		clock,
		input 		resetn,
		input 		clock2x,
		input 		local_router_hang,
		input 		avs_cra_enable,
		input 		avs_cra_read,
		input 		avs_cra_write,
		input [3:0] 		avs_cra_address,
		input [63:0] 		avs_cra_writedata,
		input [7:0] 		avs_cra_byteenable,
		output reg [63:0] 		avs_cra_readdata,
		output reg 		avs_cra_readdatavalid,
		output 		cra_irq,
		output 		avm_local_bb0_ld__inst0_enable,
		input [255:0] 		avm_local_bb0_ld__inst0_readdata,
		input 		avm_local_bb0_ld__inst0_readdatavalid,
		input 		avm_local_bb0_ld__inst0_waitrequest,
		output [29:0] 		avm_local_bb0_ld__inst0_address,
		output 		avm_local_bb0_ld__inst0_read,
		output 		avm_local_bb0_ld__inst0_write,
		input 		avm_local_bb0_ld__inst0_writeack,
		output [255:0] 		avm_local_bb0_ld__inst0_writedata,
		output [31:0] 		avm_local_bb0_ld__inst0_byteenable,
		output [4:0] 		avm_local_bb0_ld__inst0_burstcount,
		output 		avm_local_bb0_ld_memcoalesce_inputArray_load_0_inst0_enable,
		input [255:0] 		avm_local_bb0_ld_memcoalesce_inputArray_load_0_inst0_readdata,
		input 		avm_local_bb0_ld_memcoalesce_inputArray_load_0_inst0_readdatavalid,
		input 		avm_local_bb0_ld_memcoalesce_inputArray_load_0_inst0_waitrequest,
		output [29:0] 		avm_local_bb0_ld_memcoalesce_inputArray_load_0_inst0_address,
		output 		avm_local_bb0_ld_memcoalesce_inputArray_load_0_inst0_read,
		output 		avm_local_bb0_ld_memcoalesce_inputArray_load_0_inst0_write,
		input 		avm_local_bb0_ld_memcoalesce_inputArray_load_0_inst0_writeack,
		output [255:0] 		avm_local_bb0_ld_memcoalesce_inputArray_load_0_inst0_writedata,
		output [31:0] 		avm_local_bb0_ld_memcoalesce_inputArray_load_0_inst0_byteenable,
		output [4:0] 		avm_local_bb0_ld_memcoalesce_inputArray_load_0_inst0_burstcount,
		output 		avm_local_bb1_ld_memcoalesce_inputArray_load_09_inst0_enable,
		input [255:0] 		avm_local_bb1_ld_memcoalesce_inputArray_load_09_inst0_readdata,
		input 		avm_local_bb1_ld_memcoalesce_inputArray_load_09_inst0_readdatavalid,
		input 		avm_local_bb1_ld_memcoalesce_inputArray_load_09_inst0_waitrequest,
		output [29:0] 		avm_local_bb1_ld_memcoalesce_inputArray_load_09_inst0_address,
		output 		avm_local_bb1_ld_memcoalesce_inputArray_load_09_inst0_read,
		output 		avm_local_bb1_ld_memcoalesce_inputArray_load_09_inst0_write,
		input 		avm_local_bb1_ld_memcoalesce_inputArray_load_09_inst0_writeack,
		output [255:0] 		avm_local_bb1_ld_memcoalesce_inputArray_load_09_inst0_writedata,
		output [31:0] 		avm_local_bb1_ld_memcoalesce_inputArray_load_09_inst0_byteenable,
		output [4:0] 		avm_local_bb1_ld_memcoalesce_inputArray_load_09_inst0_burstcount,
		output 		avm_local_bb1_st_add7_inst0_enable,
		input [255:0] 		avm_local_bb1_st_add7_inst0_readdata,
		input 		avm_local_bb1_st_add7_inst0_readdatavalid,
		input 		avm_local_bb1_st_add7_inst0_waitrequest,
		output [29:0] 		avm_local_bb1_st_add7_inst0_address,
		output 		avm_local_bb1_st_add7_inst0_read,
		output 		avm_local_bb1_st_add7_inst0_write,
		input 		avm_local_bb1_st_add7_inst0_writeack,
		output [255:0] 		avm_local_bb1_st_add7_inst0_writedata,
		output [31:0] 		avm_local_bb1_st_add7_inst0_byteenable,
		output [4:0] 		avm_local_bb1_st_add7_inst0_burstcount,
		output 		avm_local_bb1_st_c0_exe2_inst0_enable,
		input [255:0] 		avm_local_bb1_st_c0_exe2_inst0_readdata,
		input 		avm_local_bb1_st_c0_exe2_inst0_readdatavalid,
		input 		avm_local_bb1_st_c0_exe2_inst0_waitrequest,
		output [29:0] 		avm_local_bb1_st_c0_exe2_inst0_address,
		output 		avm_local_bb1_st_c0_exe2_inst0_read,
		output 		avm_local_bb1_st_c0_exe2_inst0_write,
		input 		avm_local_bb1_st_c0_exe2_inst0_writeack,
		output [255:0] 		avm_local_bb1_st_c0_exe2_inst0_writedata,
		output [31:0] 		avm_local_bb1_st_c0_exe2_inst0_byteenable,
		output [4:0] 		avm_local_bb1_st_c0_exe2_inst0_burstcount
	);

// Responsible for interfacing a kernel with the outside world. It comprises a
// slave interface to specify the kernel arguments and retain kernel status. 

// This section of the wrapper implements the slave interface.
// twoXclock_consumer uses clock2x, even if nobody inside the kernel does. Keeps interface to acl_iface consistent for all kernels.
 reg start_NO_SHIFT_REG;
 reg started_NO_SHIFT_REG;
wire finish;
 reg [31:0] status_NO_SHIFT_REG;
wire has_a_write_pending;
wire has_a_lsu_active;
 reg [191:0] kernel_arguments_NO_SHIFT_REG;
 reg twoXclock_consumer_NO_SHIFT_REG /* synthesis  preserve  noprune  */;
 reg [31:0] workgroup_size_NO_SHIFT_REG;
 reg [31:0] global_size_NO_SHIFT_REG[2:0];
 reg [31:0] num_groups_NO_SHIFT_REG[2:0];
 reg [31:0] local_size_NO_SHIFT_REG[2:0];
 reg [31:0] work_dim_NO_SHIFT_REG;
 reg [31:0] global_offset_NO_SHIFT_REG[2:0];
 reg [63:0] profile_data_NO_SHIFT_REG;
 reg [31:0] profile_ctrl_NO_SHIFT_REG;
 reg [63:0] profile_start_cycle_NO_SHIFT_REG;
 reg [63:0] profile_stop_cycle_NO_SHIFT_REG;
wire dispatched_all_groups;
wire [31:0] group_id_tmp[2:0];
wire [31:0] global_id_base_out[2:0];
wire start_out;
wire [31:0] local_id[0:0][2:0];
wire [31:0] global_id[0:0][2:0];
wire [31:0] group_id[0:0][2:0];
wire iter_valid_in;
wire iter_stall_out;
wire stall_in;
wire stall_out;
wire valid_in;
wire valid_out;

always @(posedge clock2x or negedge resetn)
begin
	if (~(resetn))
	begin
		twoXclock_consumer_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		twoXclock_consumer_NO_SHIFT_REG <= 1'b1;
	end
end



// Work group dispatcher is responsible for issuing work-groups to id iterator(s)
acl_work_group_dispatcher group_dispatcher (
	.clock(clock),
	.resetn(resetn),
	.start(start_NO_SHIFT_REG),
	.num_groups(num_groups_NO_SHIFT_REG),
	.local_size(local_size_NO_SHIFT_REG),
	.stall_in(iter_stall_out),
	.valid_out(iter_valid_in),
	.group_id_out(group_id_tmp),
	.global_id_base_out(global_id_base_out),
	.start_out(start_out),
	.dispatched_all_groups(dispatched_all_groups)
);

defparam group_dispatcher.NUM_COPIES = 1;
defparam group_dispatcher.RUN_FOREVER = 0;


// This section of the wrapper implements an Avalon Slave Interface used to configure a kernel invocation.
// The few words words contain the status and the workgroup size registers.
// The remaining addressable space is reserved for kernel arguments.
 reg [63:0] cra_readdata_st1_NO_SHIFT_REG;
 reg [3:0] cra_addr_st1_NO_SHIFT_REG;
 reg cra_read_st1_NO_SHIFT_REG;
wire [63:0] bitenable;

assign bitenable[7:0] = (avs_cra_byteenable[0] ? 8'hFF : 8'h0);
assign bitenable[15:8] = (avs_cra_byteenable[1] ? 8'hFF : 8'h0);
assign bitenable[23:16] = (avs_cra_byteenable[2] ? 8'hFF : 8'h0);
assign bitenable[31:24] = (avs_cra_byteenable[3] ? 8'hFF : 8'h0);
assign bitenable[39:32] = (avs_cra_byteenable[4] ? 8'hFF : 8'h0);
assign bitenable[47:40] = (avs_cra_byteenable[5] ? 8'hFF : 8'h0);
assign bitenable[55:48] = (avs_cra_byteenable[6] ? 8'hFF : 8'h0);
assign bitenable[63:56] = (avs_cra_byteenable[7] ? 8'hFF : 8'h0);
assign cra_irq = (status_NO_SHIFT_REG[1] | status_NO_SHIFT_REG[3]);

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		start_NO_SHIFT_REG <= 1'b0;
		started_NO_SHIFT_REG <= 1'b0;
		kernel_arguments_NO_SHIFT_REG <= 192'h0;
		status_NO_SHIFT_REG <= 32'h30000;
		profile_ctrl_NO_SHIFT_REG <= 32'h4;
		profile_start_cycle_NO_SHIFT_REG <= 64'h0;
		profile_stop_cycle_NO_SHIFT_REG <= 64'hFFFFFFFFFFFFFFFF;
		work_dim_NO_SHIFT_REG <= 32'h0;
		workgroup_size_NO_SHIFT_REG <= 32'h0;
		global_size_NO_SHIFT_REG[0] <= 32'h0;
		global_size_NO_SHIFT_REG[1] <= 32'h0;
		global_size_NO_SHIFT_REG[2] <= 32'h0;
		num_groups_NO_SHIFT_REG[0] <= 32'h0;
		num_groups_NO_SHIFT_REG[1] <= 32'h0;
		num_groups_NO_SHIFT_REG[2] <= 32'h0;
		local_size_NO_SHIFT_REG[0] <= 32'h0;
		local_size_NO_SHIFT_REG[1] <= 32'h0;
		local_size_NO_SHIFT_REG[2] <= 32'h0;
		global_offset_NO_SHIFT_REG[0] <= 32'h0;
		global_offset_NO_SHIFT_REG[1] <= 32'h0;
		global_offset_NO_SHIFT_REG[2] <= 32'h0;
	end
	else
	begin
		if (avs_cra_write)
		begin
			case (avs_cra_address)
				4'h0:
				begin
					status_NO_SHIFT_REG[31:16] <= 16'h3;
					status_NO_SHIFT_REG[15:0] <= ((status_NO_SHIFT_REG[15:0] & ~(bitenable[15:0])) | (avs_cra_writedata[15:0] & bitenable[15:0]));
				end

				4'h1:
				begin
					profile_ctrl_NO_SHIFT_REG <= ((profile_ctrl_NO_SHIFT_REG & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				4'h3:
				begin
					profile_start_cycle_NO_SHIFT_REG[31:0] <= ((profile_start_cycle_NO_SHIFT_REG[31:0] & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					profile_start_cycle_NO_SHIFT_REG[63:32] <= ((profile_start_cycle_NO_SHIFT_REG[63:32] & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				4'h4:
				begin
					profile_stop_cycle_NO_SHIFT_REG[31:0] <= ((profile_stop_cycle_NO_SHIFT_REG[31:0] & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					profile_stop_cycle_NO_SHIFT_REG[63:32] <= ((profile_stop_cycle_NO_SHIFT_REG[63:32] & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				4'h5:
				begin
					work_dim_NO_SHIFT_REG <= ((work_dim_NO_SHIFT_REG & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					workgroup_size_NO_SHIFT_REG <= ((workgroup_size_NO_SHIFT_REG & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				4'h6:
				begin
					global_size_NO_SHIFT_REG[0] <= ((global_size_NO_SHIFT_REG[0] & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					global_size_NO_SHIFT_REG[1] <= ((global_size_NO_SHIFT_REG[1] & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				4'h7:
				begin
					global_size_NO_SHIFT_REG[2] <= ((global_size_NO_SHIFT_REG[2] & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					num_groups_NO_SHIFT_REG[0] <= ((num_groups_NO_SHIFT_REG[0] & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				4'h8:
				begin
					num_groups_NO_SHIFT_REG[1] <= ((num_groups_NO_SHIFT_REG[1] & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					num_groups_NO_SHIFT_REG[2] <= ((num_groups_NO_SHIFT_REG[2] & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				4'h9:
				begin
					local_size_NO_SHIFT_REG[0] <= ((local_size_NO_SHIFT_REG[0] & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					local_size_NO_SHIFT_REG[1] <= ((local_size_NO_SHIFT_REG[1] & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				4'hA:
				begin
					local_size_NO_SHIFT_REG[2] <= ((local_size_NO_SHIFT_REG[2] & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					global_offset_NO_SHIFT_REG[0] <= ((global_offset_NO_SHIFT_REG[0] & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				4'hB:
				begin
					global_offset_NO_SHIFT_REG[1] <= ((global_offset_NO_SHIFT_REG[1] & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					global_offset_NO_SHIFT_REG[2] <= ((global_offset_NO_SHIFT_REG[2] & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				4'hC:
				begin
					kernel_arguments_NO_SHIFT_REG[31:0] <= ((kernel_arguments_NO_SHIFT_REG[31:0] & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					kernel_arguments_NO_SHIFT_REG[63:32] <= ((kernel_arguments_NO_SHIFT_REG[63:32] & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				4'hD:
				begin
					kernel_arguments_NO_SHIFT_REG[95:64] <= ((kernel_arguments_NO_SHIFT_REG[95:64] & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					kernel_arguments_NO_SHIFT_REG[127:96] <= ((kernel_arguments_NO_SHIFT_REG[127:96] & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				4'hE:
				begin
					kernel_arguments_NO_SHIFT_REG[159:128] <= ((kernel_arguments_NO_SHIFT_REG[159:128] & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					kernel_arguments_NO_SHIFT_REG[191:160] <= ((kernel_arguments_NO_SHIFT_REG[191:160] & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				default:
				begin
				end

			endcase
		end
		else
		begin
			if (status_NO_SHIFT_REG[0])
			begin
				start_NO_SHIFT_REG <= 1'b1;
			end
			if (start_NO_SHIFT_REG)
			begin
				status_NO_SHIFT_REG[0] <= 1'b0;
				started_NO_SHIFT_REG <= 1'b1;
			end
			if (started_NO_SHIFT_REG)
			begin
				start_NO_SHIFT_REG <= 1'b0;
			end
			if (finish)
			begin
				status_NO_SHIFT_REG[1] <= 1'b1;
				started_NO_SHIFT_REG <= 1'b0;
			end
		end
		status_NO_SHIFT_REG[11] <= 1'b0;
		status_NO_SHIFT_REG[12] <= (|has_a_lsu_active);
		status_NO_SHIFT_REG[13] <= (|has_a_write_pending);
		status_NO_SHIFT_REG[14] <= (|valid_in);
		status_NO_SHIFT_REG[15] <= started_NO_SHIFT_REG;
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		cra_read_st1_NO_SHIFT_REG <= 1'b0;
		cra_addr_st1_NO_SHIFT_REG <= 4'h0;
		cra_readdata_st1_NO_SHIFT_REG <= 64'h0;
	end
	else
	begin
		cra_read_st1_NO_SHIFT_REG <= avs_cra_read;
		cra_addr_st1_NO_SHIFT_REG <= avs_cra_address;
		case (avs_cra_address)
			4'h0:
			begin
				cra_readdata_st1_NO_SHIFT_REG[31:0] <= status_NO_SHIFT_REG;
				cra_readdata_st1_NO_SHIFT_REG[63:32] <= 32'h0;
			end

			4'h1:
			begin
				cra_readdata_st1_NO_SHIFT_REG[31:0] <= 'x;
				cra_readdata_st1_NO_SHIFT_REG[63:32] <= 32'h0;
			end

			4'h2:
			begin
				cra_readdata_st1_NO_SHIFT_REG[63:0] <= 64'h0;
			end

			4'h3:
			begin
				cra_readdata_st1_NO_SHIFT_REG[63:0] <= 64'h0;
			end

			4'h4:
			begin
				cra_readdata_st1_NO_SHIFT_REG[63:0] <= 64'h0;
			end

			default:
			begin
				cra_readdata_st1_NO_SHIFT_REG <= status_NO_SHIFT_REG;
			end

		endcase
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		avs_cra_readdatavalid <= 1'b0;
		avs_cra_readdata <= 64'h0;
	end
	else
	begin
		avs_cra_readdatavalid <= cra_read_st1_NO_SHIFT_REG;
		case (cra_addr_st1_NO_SHIFT_REG)
			4'h2:
			begin
				avs_cra_readdata[63:0] <= profile_data_NO_SHIFT_REG;
			end

			default:
			begin
				avs_cra_readdata <= cra_readdata_st1_NO_SHIFT_REG;
			end

		endcase
	end
end


// Handshaking signals used to control data through the pipeline

// Determine when the kernel is finished.
acl_kernel_finish_detector kernel_finish_detector (
	.clock(clock),
	.resetn(resetn),
	.start(start_NO_SHIFT_REG),
	.wg_size(workgroup_size_NO_SHIFT_REG),
	.wg_dispatch_valid_out(iter_valid_in),
	.wg_dispatch_stall_in(iter_stall_out),
	.dispatched_all_groups(dispatched_all_groups),
	.kernel_copy_valid_out(valid_out),
	.kernel_copy_stall_in(stall_in),
	.pending_writes(has_a_write_pending),
	.finish(finish)
);

defparam kernel_finish_detector.TESSELLATION_SIZE = 0;
defparam kernel_finish_detector.NUM_COPIES = 1;
defparam kernel_finish_detector.WG_SIZE_W = 32;

assign stall_in = 1'b0;

// Creating ID iterator and kernel instance for every requested kernel copy

// ID iterator is responsible for iterating over all local ids for given work-groups
acl_id_iterator id_iter_inst0 (
	.clock(clock),
	.resetn(resetn),
	.start(start_out),
	.valid_in(iter_valid_in),
	.stall_out(iter_stall_out),
	.stall_in(stall_out),
	.valid_out(valid_in),
	.group_id_in(group_id_tmp),
	.global_id_base_in(global_id_base_out),
	.local_size(local_size_NO_SHIFT_REG),
	.global_size(global_size_NO_SHIFT_REG),
	.local_id(local_id[0]),
	.global_id(global_id[0]),
	.group_id(group_id[0])
);

defparam id_iter_inst0.LOCAL_WIDTH_X = 32;
defparam id_iter_inst0.LOCAL_WIDTH_Y = 32;
defparam id_iter_inst0.LOCAL_WIDTH_Z = 32;


// This section instantiates a kernel function block
convolution_kernel_function convolution_kernel_function_inst0 (
	.clock(clock),
	.resetn(resetn),
	.input_global_id_0(global_id[0][0]),
	.stall_out(stall_out),
	.valid_in(valid_in),
	.valid_out(valid_out),
	.stall_in(stall_in),
	.workgroup_size(workgroup_size_NO_SHIFT_REG),
	.avm_local_bb0_ld__enable(avm_local_bb0_ld__inst0_enable),
	.avm_local_bb0_ld__readdata(avm_local_bb0_ld__inst0_readdata),
	.avm_local_bb0_ld__readdatavalid(avm_local_bb0_ld__inst0_readdatavalid),
	.avm_local_bb0_ld__waitrequest(avm_local_bb0_ld__inst0_waitrequest),
	.avm_local_bb0_ld__address(avm_local_bb0_ld__inst0_address),
	.avm_local_bb0_ld__read(avm_local_bb0_ld__inst0_read),
	.avm_local_bb0_ld__write(avm_local_bb0_ld__inst0_write),
	.avm_local_bb0_ld__writeack(avm_local_bb0_ld__inst0_writeack),
	.avm_local_bb0_ld__writedata(avm_local_bb0_ld__inst0_writedata),
	.avm_local_bb0_ld__byteenable(avm_local_bb0_ld__inst0_byteenable),
	.avm_local_bb0_ld__burstcount(avm_local_bb0_ld__inst0_burstcount),
	.avm_local_bb0_ld_memcoalesce_inputArray_load_0_enable(avm_local_bb0_ld_memcoalesce_inputArray_load_0_inst0_enable),
	.avm_local_bb0_ld_memcoalesce_inputArray_load_0_readdata(avm_local_bb0_ld_memcoalesce_inputArray_load_0_inst0_readdata),
	.avm_local_bb0_ld_memcoalesce_inputArray_load_0_readdatavalid(avm_local_bb0_ld_memcoalesce_inputArray_load_0_inst0_readdatavalid),
	.avm_local_bb0_ld_memcoalesce_inputArray_load_0_waitrequest(avm_local_bb0_ld_memcoalesce_inputArray_load_0_inst0_waitrequest),
	.avm_local_bb0_ld_memcoalesce_inputArray_load_0_address(avm_local_bb0_ld_memcoalesce_inputArray_load_0_inst0_address),
	.avm_local_bb0_ld_memcoalesce_inputArray_load_0_read(avm_local_bb0_ld_memcoalesce_inputArray_load_0_inst0_read),
	.avm_local_bb0_ld_memcoalesce_inputArray_load_0_write(avm_local_bb0_ld_memcoalesce_inputArray_load_0_inst0_write),
	.avm_local_bb0_ld_memcoalesce_inputArray_load_0_writeack(avm_local_bb0_ld_memcoalesce_inputArray_load_0_inst0_writeack),
	.avm_local_bb0_ld_memcoalesce_inputArray_load_0_writedata(avm_local_bb0_ld_memcoalesce_inputArray_load_0_inst0_writedata),
	.avm_local_bb0_ld_memcoalesce_inputArray_load_0_byteenable(avm_local_bb0_ld_memcoalesce_inputArray_load_0_inst0_byteenable),
	.avm_local_bb0_ld_memcoalesce_inputArray_load_0_burstcount(avm_local_bb0_ld_memcoalesce_inputArray_load_0_inst0_burstcount),
	.avm_local_bb1_ld_memcoalesce_inputArray_load_09_enable(avm_local_bb1_ld_memcoalesce_inputArray_load_09_inst0_enable),
	.avm_local_bb1_ld_memcoalesce_inputArray_load_09_readdata(avm_local_bb1_ld_memcoalesce_inputArray_load_09_inst0_readdata),
	.avm_local_bb1_ld_memcoalesce_inputArray_load_09_readdatavalid(avm_local_bb1_ld_memcoalesce_inputArray_load_09_inst0_readdatavalid),
	.avm_local_bb1_ld_memcoalesce_inputArray_load_09_waitrequest(avm_local_bb1_ld_memcoalesce_inputArray_load_09_inst0_waitrequest),
	.avm_local_bb1_ld_memcoalesce_inputArray_load_09_address(avm_local_bb1_ld_memcoalesce_inputArray_load_09_inst0_address),
	.avm_local_bb1_ld_memcoalesce_inputArray_load_09_read(avm_local_bb1_ld_memcoalesce_inputArray_load_09_inst0_read),
	.avm_local_bb1_ld_memcoalesce_inputArray_load_09_write(avm_local_bb1_ld_memcoalesce_inputArray_load_09_inst0_write),
	.avm_local_bb1_ld_memcoalesce_inputArray_load_09_writeack(avm_local_bb1_ld_memcoalesce_inputArray_load_09_inst0_writeack),
	.avm_local_bb1_ld_memcoalesce_inputArray_load_09_writedata(avm_local_bb1_ld_memcoalesce_inputArray_load_09_inst0_writedata),
	.avm_local_bb1_ld_memcoalesce_inputArray_load_09_byteenable(avm_local_bb1_ld_memcoalesce_inputArray_load_09_inst0_byteenable),
	.avm_local_bb1_ld_memcoalesce_inputArray_load_09_burstcount(avm_local_bb1_ld_memcoalesce_inputArray_load_09_inst0_burstcount),
	.avm_local_bb1_st_add7_enable(avm_local_bb1_st_add7_inst0_enable),
	.avm_local_bb1_st_add7_readdata(avm_local_bb1_st_add7_inst0_readdata),
	.avm_local_bb1_st_add7_readdatavalid(avm_local_bb1_st_add7_inst0_readdatavalid),
	.avm_local_bb1_st_add7_waitrequest(avm_local_bb1_st_add7_inst0_waitrequest),
	.avm_local_bb1_st_add7_address(avm_local_bb1_st_add7_inst0_address),
	.avm_local_bb1_st_add7_read(avm_local_bb1_st_add7_inst0_read),
	.avm_local_bb1_st_add7_write(avm_local_bb1_st_add7_inst0_write),
	.avm_local_bb1_st_add7_writeack(avm_local_bb1_st_add7_inst0_writeack),
	.avm_local_bb1_st_add7_writedata(avm_local_bb1_st_add7_inst0_writedata),
	.avm_local_bb1_st_add7_byteenable(avm_local_bb1_st_add7_inst0_byteenable),
	.avm_local_bb1_st_add7_burstcount(avm_local_bb1_st_add7_inst0_burstcount),
	.avm_local_bb1_st_c0_exe2_enable(avm_local_bb1_st_c0_exe2_inst0_enable),
	.avm_local_bb1_st_c0_exe2_readdata(avm_local_bb1_st_c0_exe2_inst0_readdata),
	.avm_local_bb1_st_c0_exe2_readdatavalid(avm_local_bb1_st_c0_exe2_inst0_readdatavalid),
	.avm_local_bb1_st_c0_exe2_waitrequest(avm_local_bb1_st_c0_exe2_inst0_waitrequest),
	.avm_local_bb1_st_c0_exe2_address(avm_local_bb1_st_c0_exe2_inst0_address),
	.avm_local_bb1_st_c0_exe2_read(avm_local_bb1_st_c0_exe2_inst0_read),
	.avm_local_bb1_st_c0_exe2_write(avm_local_bb1_st_c0_exe2_inst0_write),
	.avm_local_bb1_st_c0_exe2_writeack(avm_local_bb1_st_c0_exe2_inst0_writeack),
	.avm_local_bb1_st_c0_exe2_writedata(avm_local_bb1_st_c0_exe2_inst0_writedata),
	.avm_local_bb1_st_c0_exe2_byteenable(avm_local_bb1_st_c0_exe2_inst0_byteenable),
	.avm_local_bb1_st_c0_exe2_burstcount(avm_local_bb1_st_c0_exe2_inst0_burstcount),
	.clock2x(clock2x),
	.start(start_out),
	.input_inputArray(kernel_arguments_NO_SHIFT_REG[63:0]),
	.input_size(kernel_arguments_NO_SHIFT_REG[127:64]),
	.input_result(kernel_arguments_NO_SHIFT_REG[191:128]),
	.has_a_write_pending(has_a_write_pending),
	.has_a_lsu_active(has_a_lsu_active)
);



endmodule

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

// altera message_off 10036
// altera message_off 10230
// altera message_off 10858
module convolution_kernel_sys_cycle_time
	(
		input 		clock,
		input 		resetn,
		output [31:0] 		cur_cycle
	);


 reg [31:0] cur_count_NO_SHIFT_REG;

assign cur_cycle = cur_count_NO_SHIFT_REG;

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		cur_count_NO_SHIFT_REG <= 32'h0;
	end
	else
	begin
		cur_count_NO_SHIFT_REG <= (cur_count_NO_SHIFT_REG + 32'h1);
	end
end

endmodule

