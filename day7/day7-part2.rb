#!/usr/bin/env ruby


counter=0
address={"brackets" => -1, "segments" => 0}
bracketed=false
b=-1
s=0
ssl=false
aba=Array.new

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
					address["b#{b}"] = chr.chomp
				else
					address["b#{b}"] += chr.chomp
				end
			elsif ! bracketed and chr != "]"
				if address["s#{s}"].nil?
					address["s#{s}"] = chr.chomp
				else
					address["s#{s}"] += chr.chomp
				end
			end
		end
		0.upto(address["segments"]) do |iter|
			arr=Array.new
			address["s#{iter}"].chars.each do |chr|
				if arr.count == 3
					if arr[0] != arr[1] && arr[0] == arr[2]
						aba << arr[0] + arr[1] + arr[2]
					end
					arr.shift
				end
				arr << chr
			end
		end
		0.upto(address["brackets"]) do |iter|
			aba.each do |abaiter|
				if address["b#{iter}"] =~ /#{abaiter[1] + abaiter[0] + abaiter[1]}/
					ssl=true
				end
			end
		end
		if ssl
			counter += 1
		end
		ssl=false
		address={"brackets" => -1, "segments" => 0}
		b=-1
		s=0
		aba.clear
	end
end
puts counter	
