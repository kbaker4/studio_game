module StudioGame
	require_relative '../lib/studio_game/game'
	require_relative '../lib/studio_game/player'
	require_relative '../lib/studio_game/clumsy_player'
	require_relative '../lib/studio_game/berserk_player'

	game = StudioGame::Game.new("game")
	default_player_file = File.join(File.dirname(__FILE__), 'players.csv')
	game.load_players(ARGV.shift || default_player_file)
	klutz = ClumsyPlayer.new("klutz", 105, 5)
	berserker = BerserkPlayer.new("berserker", 50)
	game.add_player(klutz)
	game.add_player(berserker)


	loop do
		puts "\nHow many rounds? ('quit' to exit)"
		answer = gets.chomp.downcase
		case answer
		when /^\d+$/
			game.play(answer.to_i)
		when "quit" || "exit"
			game.print_stats
			break
		else
			puts "Please enter a number or 'quit'"
		end
	end

	game.save_high_scores
end