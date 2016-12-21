#!/usr/bin/env ruby

def initialize_grid(x, y)
	grid = Array.new
	x.times do |column_index|
		row = Array.new
		y.times do |row_index|
			row << 0
		end
		grid << row
	end
	return grid
end

def rect(x, y, grid)
	0.upto(x -1) do |x_pos|
		0.upto(y -1) do |y_pos|
			grid[x_pos][y_pos] = 1
		end
	end
	return grid
end

def rotate(dir, pos, val, grid)
	if dir == "row"
		pixel_on = Array.new
		0.upto(grid.count() -1) do |idx|
			if grid[idx][pos] == 1
				pixel_on << idx
			end
		end
		pixel_on.each do |p1|
			grid[p1][pos] = 0
		end
		pixel_on.each do |p2|
			grid[(p2 + val) % grid.count][pos] = 1
		end
	elsif dir == "column"
		pixel_on = Array.new
		0.upto(grid[pos].count() -1) do |idx|
			if grid[pos][idx] == 1
				pixel_on << idx
			end
		end
		pixel_on.each do |p1|
			grid[pos][p1] = 0
		end
		pixel_on.each do |p2|
			grid[pos][(p2 + val) % grid[pos].count] = 1
		end
	end
	return grid
end
		
grid = initialize_grid(50, 6)
File.open("day8-input", "r") do |f|
	f.each_line do |line|
		ins = line.split
		if ins[0] == "rect"
			x = ins[1].split("x")[0].to_i
			y = ins[1].split("x")[1].to_i
			grid = rect(x, y, grid)
		elsif ins[0] == "rotate"
			dir = ins[1]
			val = ins[4].to_i
			pos = ins[2].split("=")[1].to_i
			grid = rotate(dir, pos, val, grid)
		end
	end
end

counter = 0
0.upto(grid[0].count() -1) do |y_idx|
	0.upto(grid.count() -1) do |x_idx|
		if grid[x_idx][y_idx] == 0
	        	grid[x_idx][y_idx] = "."
		elsif grid[x_idx][y_idx] == 1
	        	grid[x_idx][y_idx] = "#"
		end
		print grid[x_idx][y_idx]
	end
	puts ""
end

puts counter


			
