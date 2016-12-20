#!/usr/bin/env ruby

c1 = Array.new
c2 = Array.new
c3 = Array.new
c4 = Array.new
c5 = Array.new
c6 = Array.new
c7 = Array.new
c8 = Array.new

File.open("day6-input", "r") do |f|
	f.each_line do |line|
		c1 << line[0,1]	
		c2 << line[1,1]	
		c3 << line[2,1]	
		c4 << line[3,1]	
		c5 << line[4,1]	
		c6 << line[5,1]	
		c7 << line[6,1]	
		c8 << line[7,1]	
	end
end

password = puts c1.group_by{|i| c1.count(i)}.min[1][0] +
c2.group_by{|i| c2.count(i)}.min[1][0] +
c3.group_by{|i| c3.count(i)}.min[1][0] +
c4.group_by{|i| c4.count(i)}.min[1][0] +
c5.group_by{|i| c5.count(i)}.min[1][0] +
c6.group_by{|i| c6.count(i)}.min[1][0] +
c7.group_by{|i| c7.count(i)}.min[1][0] +
c8.group_by{|i| c8.count(i)}.min[1][0]

puts password
