require "./text_color.rb"

module Tools

	def intro_menu
		loop do
			puts "\nPlease enter a number from the menu below:"
			puts "--------------------------------------------"
			print "(1)".green
			puts " Start New Game"
			print "(2)".pink
			puts " Load Game"
			print "(3)".purple
			puts " Instructions"
			print "> "

			input = gets.chomp
			case input
			when "1"
				#code
				break
			when "2"
				puts "Under development. Please select a different option."
			when "3"
				puts "\nInstructions".purple
				puts "------------".purple
				puts "In this variation of Hangman, the player will have to guess a word that the Computer randomly chooses. The player will be able to guess a letter per turn. If the player guesses incorrectly, the Computer will note the miss and draw a portion of the hangman. The player will be allowed to make #{"six".red} mistaken guesses. Guess every letter in the word before the hangman is completed to win the game!"
			else
				puts "Incorrect input."	
			end
		end
	end

	def difficulty_setting
		puts "\nThe Computer will now select a random word from a precompiled list. Please set your desired difficulty."

		loop do
			puts "\n(1) Easy - 5 to 6 letters"
			puts "(2) Intermediate - 7 to 9 letters"
			puts "(3) Hard - 10 to 12 letters"
			print "> "

			input = gets.chomp
			case input
			when "1"
				return "1"
			when "2"
				return "2"
			when "3"
				return "3"
			else
				puts "Incorrect input."
			end
		end
	end

	def difficulty_generator(string)
		words = File.readlines("../5desk.txt", chomp: true)

		case string
		when "1"
			words.select { |word| word.length < 7 && word.length > 4 }.sample.split("")
		when "2"
			words.select { |word| word.length < 10 && word.length > 6 }.sample.split("")
		when "3"
			words.select { |word| word.length < 13 && word.lengthy > 9 }.sample.split("")
		end
	end
end