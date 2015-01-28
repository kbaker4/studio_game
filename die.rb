class Die
	attr_reader :number

	def initialize
		roll
	end

	def roll
		@number = rand(0..6)
	end
end

if __FILE__ == $0
d = Die.new
puts d.number
end
