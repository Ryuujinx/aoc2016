#!/usr/bin/env ruby

directions = "R2, L1, R2, R1, R1, L3, R3, L5, L5, L2, L1, R4, R1, R3, L5, L5, R3, L4, L4, R5, R4, R3, L1, L2, R5, R4, L2, R1, R4, R4, L2, L1, L1, R190, R3, L4, R52, R5, R3, L5, R3, R2, R1, L5, L5, L4, R2, L3, R3, L1, L3, R5, L3, L4, R3, R77, R3, L2, R189, R4, R2, L2, R2, L1, R5, R4, R4, R2, L2, L2, L5, L1, R1, R2, L3, L4, L5, R1, L1, L2, L2, R2, L3, R3, L4, L1, L5, L4, L4, R3, R5, L2, R4, R5, R3, L2, L2, L4, L2, R2, L5, L4, R3, R1, L2, R2, R4, L1, L4, L4, L2, R2, L4, L1, L1, R4, L1, L3, L2, L2, L5, R5, R2, R5, L1, L5, R2, R4, R4, L2, R5, L5, R5, R5, L4, R2, R1, R1, R3, L3, L3, L4, L3, L2, L2, L2, R2, L1, L3, R2, R5, R5, L4, R3, L3, L4, R2, L5, R5"

current_x_pos = 0
current_y_pos = 0
carddirections = ["N", "E", "S", "W"]
facing = 0
directions.split(", ").each do |var|
	if var.chr == "R"
		if facing == 3
			facing = 0
		else
			facing += 1
		end
	elsif var.chr == "L"
		if facing == 0
			facing = 3
		else
			facing -= 1
		end
	end
	var.slice!(0)
	if carddirections[facing] == "N" 
		current_y_pos += var.to_i
	elsif carddirections[facing] == "S"
		current_y_pos -= var.to_i
	elsif carddirections[facing] == "E" 
		current_x_pos += var.to_i
	elsif carddirections[facing] == "W"
		current_x_pos -= var.to_i
	end
end

puts "Answer: #{current_x_pos.abs + current_y_pos.abs}"


