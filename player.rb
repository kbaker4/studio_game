require_relative 'game'
require_relative 'treasure_trove'

class Player
	attr_reader :health, :name

	def initialize(name, health = 100)
		@name = name.capitalize
		@health = health
		@found_treasures = Hash.new(0)
	end

	def name=(new_name)
		@name = new_name.capitalize
	end

	def to_s
		"I'm #{@name} with health = #{@health}, points = #{points}, and score = #{score}."
	end

	def blam
		@health -= 10
		puts "#{@name} got blammed!"
	end

	def w00t
		@health += 15
		puts "#{@name} got w00ted!"
	end

	def score
		@health + points
	end

	def strong?
		#returns true if player's health is greater than 100
		@health > 100
	end

	def <=>(other)
		other.score <=> score
	end

	def found_treasure(treasure)
		@found_treasures[treasure.name] += treasure.points
		puts "#{@name} found a #{treasure.name} worth #{treasure.points} points."
		puts "#{@name}'s treasures: #{@found_treasures}"
	end

	def points
		@found_treasures.values.reduce(0, :+)
	end

	def each_found_treasure
		@found_treasures.each do |key, val|
			yield Treasure.new(key, val)
		end
	end
end
