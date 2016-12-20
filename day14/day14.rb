#!/usr/bin/env ruby

require 'rubygems'
require 'digest'

#seed='qzyelonm'
seed='ngcjuoqr'
index=-1
counter=0

puts seed

def check_for_key(seed, index)
#match(/(.)\1{2,}/)
	if Digest::MD5.hexdigest(seed + index.to_s).match(/(.)\1{2,}/).nil?
		return false
	else
		matchset = Digest::MD5.hexdigest(seed + index.to_s).match(/(.)\1{2,}/)[0].chr
		(index + 1).upto(index + 1000) do |idx|
			if not Digest::MD5.hexdigest(seed + idx.to_s).match(/(#{matchset})\1{4,}/).nil?
				return true
			end
		end
		return false
	end
end

until counter == 64 do
	index +=1
	if check_for_key(seed, index) == true
		counter += 1
		puts counter
	end
end

puts index
