class Die
	attr_reader :number

	def initialize
		roll
	end

	def roll
		@number = rand(0..6)
	end
end

d = Die.new
puts d.number
