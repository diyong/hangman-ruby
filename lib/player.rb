class Player

	attr_reader :name
	attr_accessor :misses, :misses_array, :word, :word_array, :hits, :difficulty

	def initialize(name)
		@name = name
		@misses = 0
		@misses_array = []
		@word_array = []
		@word = ""
		@hits = []
		@difficulty = ""
	end

end