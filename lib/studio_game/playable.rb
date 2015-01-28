module StudioGame	
	module Playable

		def blam
			self.health -= 10
			puts "#{name} got blammed!"
		end

		def w00t
			self.health += 15
			puts "#{name} got w00ted!"
		end
		
		def strong?
			#returns true if player's health is greater than 100
			self.health > 100
		end
	end
end