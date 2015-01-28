module StudioGame
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

		def load_players(from_file)
			File.readlines(from_file).each do |line|
				add_player(Player.from_csv(line))
			end
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
				if block_given?
					break if yield
				end
					puts "\nRound #{round}:"
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
			puts "\nKnucklehead Statistics:"
			puts "\n#{strong.length} strong players:"
			strong.each { |player| print_name_and_health(player) }
			puts "\n#{wimpy.length} wimpy players:"
			wimpy.each { |player| print_name_and_health(player) }

			@players.each do |player|
				puts "\n#{player.name} point totals:"
				puts "#{player.points} grand total points"
			end

			puts "\n#{@title} High Scores:"
			@players.sort.each { |player| puts print_high_scores(player) }

			puts "\nGrand Total Points:"
			puts "#{total_points} total points."
			@players.sort.each do |player| 
				puts "\n#{player.name}'s point totals"
				player.each_found_treasure do |treasure|
					puts "#{treasure.points} total #{treasure.name} points."
				end
				puts "#{player.points} grand total points."
			end

		end

		def print_high_scores(player)
			"#{player.name.ljust(20, '.')}#{player.score}"
		end

		def save_high_scores(filename="high_scores.txt")
			File.open(filename, "w") do |file|
				file.puts "#{@title} High Scores:"
				@players.sort.each { |player| file.puts print_high_scores(player) }
			end
		end

		def print_name_and_health(player)
			puts "#{player.name} (#{player.health})"
		end

		def total_points
			@players.reduce(0) {|sum, player| sum + player.points }
		end
	end
end