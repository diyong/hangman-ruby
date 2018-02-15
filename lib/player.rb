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

	def to_s
		"In Player:\n   #{@name}, #{@misses}, #{@misses_array}, #{@word_array}, #{@word}, #{@hits}, #{@difficulty}\n"
	end

	def to_json(*a)
		{
			"json_class"   => self.class.name,
			"data"				 => { "name" => @name, "misses" => @misses, "misses_array" => @misses_array, "word_array" => @word_array, "word" => @word, "hits" => @hits, "difficulty" => @difficulty }
		}.to_json(*a)
	end

	def self.json_create(o)
		new(o["data"]["name"], o["data"]["misses"], o["data"]["misses_array"], o["data"]["word_array"], o["data"]["word"], o["data"]["hits"], o["data"]["difficulty"])
	end

	
end