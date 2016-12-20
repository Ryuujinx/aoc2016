#!/usr/bin/env ruby

keypad = [[ 1, 2, 3],[ 4, 5, 6],[ 7, 8 , 9]]
puts keypad[1][1]

x_pos = 1
y_pos = 1
passcode = String.new

File.open("input1", "r") do |f|
	f.each_line do |line|
		line.split("").each_with_index do |char,idx|
			if char == "L" 
				unless x_pos == 0 
					x_pos -= 1
				end
			elsif char == "R"
				unless x_pos == 2
					x_pos += 1
				end
			elsif char == "U"
				unless y_pos == 0
					y_pos -= 1
				end
			elsif char =="D"
				unless y_pos == 2
					y_pos += 1
				end
			end
		end	
		passcode = "#{passcode}#{keypad[y_pos][x_pos]}"
	end
end

puts passcode
