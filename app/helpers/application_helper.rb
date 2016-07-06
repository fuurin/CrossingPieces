module ApplicationHelper
	def has_mb?(str)
		str.bytes do |b|
			return true if  (b & 0b10000000) != 0
		end
		false
	end
end
