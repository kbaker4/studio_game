require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'

class Game
	attr_reader :title

	def initialize(title)
		@title = title
		@players = []
	end

	def add_player(player)
		@players.push(player)
	end

	def play(rounds)
		puts "There are #{@players.size} players in #{@title}."
		@players.each do |player|
			puts player
		end

		treasures = TreasureTrove::TREASURES
		puts "\nThere are #{treasures.size} treasures in the Treasure Trove"
		treasures.each do |treasure|
			puts "A #{treasure.name} is worth #{treasure.points} points."
		end

		1.upto(rounds) do |round|
			puts "\nRoud #{round}:"
			@players.each do |player|
				GameTurn.take_turn(player)
				puts player
			end
		end
	end

	def print_stats
		strong, wimpy = @players.partition do |player|
			player.strong?
		end
		puts "Knucklehead Statistics:"
		puts "\n#{strong.length} strong players:"
		strong.each { |player| print_name_and_health(player) }
		puts "\n#{wimpy.length} wimpy players:"
		wimpy.each { |player| print_name_and_health(player) }

		puts "\nKnucklehead High Scores:"
		@players.sort.each { |player| puts "#{player.name.ljust(20, '.')}#{player.score}" }
	end

	def print_name_and_health(player)
		puts "#{player.name} (#{player.health})"
	end
end