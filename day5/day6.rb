#!/usr/bin/env ruby

require 'digest'

input = 'cxdnnyjw'
password = ''
index = 0
counter = 0

def hash(input)
	return Digest::MD5.hexdigest(input)
end


until counter == 8
	check = hash(input + index.to_s)
	if check[0,5] == "00000"
		password += check[5,1]
		counter += 1
	end
	index += 1
end

puts password
