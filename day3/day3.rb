#!/usr/bin/env ruby

possible_triangles = 0
File.open("day3-input", "r") do |f|
        f.each_line do |line|
		shape = line.split.map(&:to_i)
		difference = shape[0] + shape[1] + shape[2] - shape.max * 2
		if difference > 0
			possible_triangles += 1	
		end		
	end
end
puts possible_triangles
