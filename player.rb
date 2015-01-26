require_relative 'game'

class Player
	attr_reader :health, :name

	def initialize(name, health = 100)
		@name = name.capitalize
		@health = health
	end

	def name=(new_name)
		@name = new_name.capitalize
	end

	def to_s
		"I'm #{@name} with a health of #{@health} and a score of #{score}."
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
		@health + @name.length
	end

	def strong?
		#returns true if player's health is greater than 100
		@health > 100
	end

	def <=>(other)
		other.score <=> score
	end
end
