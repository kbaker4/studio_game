module StudioGame
	require_relative 'auditable'

	class Die
		include Auditable

		attr_reader :number

		def initialize
			roll
		end

		def roll
			@number = rand(0..6)
			audit
			@number
		end
	end

	if __FILE__ == $0
	d = Die.new
	puts d.number
	end
end