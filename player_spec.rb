require_relative 'player'

describe Player do

	before do
		@initial_health = 50
		@player = Player.new("larry", @initial_health)

		$stdout = StringIO.new
	end

	it "has a capitalized name" do
		@player.name.should == "Larry"
	end

	it "has an initial health" do
		@player.health.should == 50
	end

	it "has a string representation" do
		@player.to_s.should == "I'm Larry with a health of 50 and a score of 55."
	end

	it "computes a score as the sum of its health and length of its name" do
		@player.score.should == 55
	end

	it "increases health by 15 when w00ted" do
		@player.w00t

		@player.health.should == @initial_health + 15
	end

	it "decreases health by 10 when blammed" do
		@player.blam

		@player.health.should == @initial_health - 10
	end

	context "with a health greater than 100" do
		before do
			@player = Player.new("name", 150)
		end

		it "Player is strong" do

			@player.should be_strong
		end
	end

	context "with a health 100 or less" do
		before do
			@player = Player.new("name", 100)
		end

		it "Player is wimpy" do
			@player.should_not be_strong
		end
	end


end