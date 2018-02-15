class Player

	attr_reader :name
	attr_accessor :misses, :word, :hits, :difficulty

	def initialize(name)
		@name = name
		@misses = 0
		@word = []
		@hits = []
		@difficulty = ""
	end

end