require_relative 'game'
require_relative 'player'

player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)

knuckleheads = Game.new("Knuckleheads")
knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)
knuckleheads.play(10) do
	knuckleheads.total_points >= 2000 #end game if total points is equal to or greater than 2000 points (optional play mode)
end
knuckleheads.print_stats
