require "json"

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

	#might have to get rid of this
	def load_data(hsh)
		@misses = hsh["misses"]
		@misses_array = hsh["misses_array"]
		@word_array = hsh["word_array"]
		@word = hsh["word"]
		@hits = hsh["hits"]
		@difficulty = hsh["difficulty"]
	end

	def as_json(options = {})
		{
			name: @name,
			misses: @misses,
			misses_array: @misses_array,
			word_array: @word_array,
			word: @word,
			hits: @hits,
			difficulty: @difficulty
		}
	end

	def to_json(*options)
		as_json(*options).to_json(*options)
	end

=begin
	def to_s
		"In Player:\n   #{@name}, #{@misses}, #{@misses_array}, #{@word_array}, #{@word}, #{@hits}, #{@difficulty}\n"
	end

	def to_json(*a)
		{
			"json_class"   => self.class.name,
			"data"				 => { "name" => @name, "misses" => @misses, "misses_array" => @misses_array, "word_array" => @word_array, "word" => @word, "hits" => @hits, "difficulty" => @difficulty }
		}.to_json(*a)
	end
=end
end