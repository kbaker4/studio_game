require_relative 'game'

describe Game do 
	before do
		@game = Game.new("Knuckleheads")

		@initial_health = 100
		@player = Player.new("moe", @initial_health)

		@game.add_player(@player)

		$stdout = StringIO.new
	end

	it "player's health increases by 15 if a high number is rolled" do
		Die.any_instance.stub(:roll).and_return(5)

		@game.play

		@player.health.should == @initial_health + 15
	end

	it "player's health decreases by 10 if a low number is rolled" do
		Die.any_instance.stub(:roll).and_return(1)

		@game.play

		@player.health.should == @initial_health - 10
	end

	it "player's health remains the same if a middle number is rolled" do
		Die.any_instance.stub(:roll).and_return(3)

		@game.play

		@player.health.should == @initial_health
	end	
	
end