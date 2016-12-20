#!/usr/bin/env ruby

require 'rubygems'
require 'digest'


seed='qzyelonm'
#seed='abc'
index=-1
counter=0

puts seed

def check_for_key(hashes, index)
	if hashes[index].match(/(.)\1{2,}/).nil?
		return false
	else
		matchset = hashes[index].match(/(.)\1{2,}/)[0].chr
		(index + 1).upto(index + 1000) do |idx|
			if not hashes[idx].match(/(#{matchset})\1{4,}/).nil?
				return true
			end
		end
		return false
	end
end

def rehash(hash)
	1.upto(2016) do |foo|
		hash = Digest::MD5.hexdigest(hash)
	end
	return hash
end

puts "Generating hashes...."	
hashes = Array.new
0.upto(50000) do |iter|
	hashes << rehash(Digest::MD5.hexdigest(seed + iter.to_s))
end


puts "Checking for keys..."
until counter == 64 do
	index +=1
	if check_for_key(hashes, index) == true
		counter += 1
		puts counter
	end
end

puts "Answer: #{index}"
