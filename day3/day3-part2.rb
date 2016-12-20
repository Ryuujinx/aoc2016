#!/usr/bin/env ruby

possible_triangles = 0
buffer1 = []
buffer2 = []
buffer3 = []
counter = 0
difference1 = 0
difference2 = 0
difference3 = 0
File.open("day3-input", "r") do |f|
        f.each_line do |line|
		shape = line.strip.split.map(&:to_i)
		buffer1 << shape[0] 
		buffer2 << shape[1]
		buffer3 << shape[2]
		counter += 1
		if counter == 3
			difference1 = buffer1[0] + buffer1[1] + buffer1[2] - buffer1.max * 2
			difference2 = buffer2[0] + buffer2[1] + buffer2[2] - buffer2.max * 2
			difference3 = buffer3[0] + buffer3[1] + buffer3[2] - buffer3.max * 2
			counter = 0
			buffer1.clear
			buffer2.clear
			buffer3.clear
		end
		if difference1 > 0
			possible_triangles += 1
			difference1 = 0
		else
			difference1 = 0
		end
		if difference2 > 0
			possible_triangles += 1
			difference2 = 0
		else
			difference2 = 0
		end
		if difference3 > 0
			possible_triangles += 1
			difference3 = 0
		else
			difference3 = 0
		end		
	end
end
puts possible_triangles
