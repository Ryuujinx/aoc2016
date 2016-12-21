#!/usr/bin/env ruby

#  sed 's/.*\[\(.*\)].*/\1/g'
#  sed 's/\[.*//g'
#  sed 's/.*\]//g'

counter=0
address={"brackets" => -1, "segments" => 0}
bracketed=false
b=-1
s=0
tls=false

File.open("day7-input", "r") do |f|
	f.each_line do |line|
		line.chars.each do |chr|
			if chr == "["
				bracketed=true
				b += 1
				address["brackets"] += 1
			elsif chr == "]" 
				bracketed=false
				s += 1
				address["segments"] += 1
			end
			if bracketed and chr != "["
				if address["b#{b}"].nil?
					address["b#{b}"] = chr
				else
					address["b#{b}"] += chr
				end
			elsif ! bracketed and chr != "]"
				if address["s#{s}"].nil?
					address["s#{s}"] = chr
				else
					address["s#{s}"] += chr
				end
			end
		end
		0.upto(address["segments"]) do |iter|
			if address["s#{iter}"] =~ /(.)(.)\2\1/
				part1=/(.)(.)\2\1/.match(address["s#{iter}"])[1]
				part2=/(.)(.)\2\1/.match(address["s#{iter}"])[2]
				if part1 != part2
					tls=true
				end
			end
		end
		0.upto(address["brackets"]) do |iter|
			if address["b#{iter}"] =~ /(.)(.)\2\1/
				part1=/(.)(.)\2\1/.match(address["b#{iter}"])[1]
				part2=/(.)(.)\2\1/.match(address["b#{iter}"])[2]
				if part1 != part2
					tls=false
				end
			end
		end
		if tls
			counter += 1
		end
		tls=false
		address={"brackets" => -1, "segments" => 0}
		b=-1
		s=0
	end
end
puts counter	
