require_relative 'player'
require_relative 'die'

class Game
	attr_reader :title

	def initialize(title)
		@title = title
		@players = []
	end

	def add_player(player)
		@players.push(player)
	end

	def play
		puts "There are #{@players.size} players in #{@title}."
		@players.each do |player|
			die = Die.new
			case die.roll
				when 1..2
					player.blam
				when 3..4
					puts "#{player.name} is skipped."
				else 5..6
					player.w00t
				end
		end
	end
end