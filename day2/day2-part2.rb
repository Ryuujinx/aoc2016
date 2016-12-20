#!/usr/bin/env ruby

keypad = [["","",1,"",""],["",2,3,4,""],[5,6,7,8,9],["","A","B","C",""],["","","D","",""]]


x_pos = 0
y_pos = 2
passcode = String.new

File.open("input1", "r") do |f|
	f.each_line do |line|
		line.split("").each_with_index do |char,idx|
			if char == "L" 
				if y_pos != 0 or y_pos != 4
					if y_pos == 1 or y_pos == 3
						unless x_pos == 1
							x_pos -= 1
						end
					elsif y_pos == 2
						unless x_pos == 0
							x_pos -= 1
						end
					end
				end
			elsif char == "R"
				if y_pos != 0 or y_pos != 4
                                        if y_pos == 1 or y_pos == 3
                                                unless x_pos == 3
                                                        x_pos += 1
                                                end
                                        elsif y_pos == 2
                                                unless x_pos == 4
                                                        x_pos += 1
                                                end
                                        end
				end
			elsif char == "U"
				if x_pos != 0 or x_pos != 4
					if x_pos == 1 or x_pos == 3
						unless y_pos == 1
							y_pos -= 1
						end
					elsif x_pos == 2
						unless y_pos == 0
							y_pos -= 1
						end
					end
				end
			elsif char =="D"
				 if x_pos != 0 or x_pos != 4
                                        if x_pos == 1 or x_pos == 3
                                                unless y_pos == 3
                                                        y_pos += 1
                                                end
                                        elsif x_pos == 2
                                                unless y_pos == 4
                                                        y_pos += 1
                                                end
                                        end
                                end

			end
		end	
		passcode = "#{passcode}#{keypad[y_pos][x_pos]}"
	end
end

puts passcode
