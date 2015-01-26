require_relative 'player'
require_relative 'die'
require_relative 'treasure_trove'

module GameTurn
	def self.take_turn(player)
		die = Die.new
		case die.roll
			when 1..2
				player.blam
			when 3..4
				puts "#{player.name} is skipped."
			else 5..6
				player.w00t
		end

		treasure = TreasureTrove.random
		puts "#{player.name} found a #{treasure.name} worth #{treasure.points} points."
	end
end