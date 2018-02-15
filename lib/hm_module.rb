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
			words.select { |word| word.length < 13 && word.length > 9 }.sample.split("")
		end
	end

	def game(player)
		input = ""
		loop do
			input = ""
			gallow(player.misses)

			puts "\nMissed: #{ player.misses_array }"

			puts "Correct: #{ player.hits }"

			puts "\nPlease enter a guess:"
			print "> "

			while input = gets.chomp
				if input.length == 1 && input.match?(/^[a-z]$/i)
					if player.word_array.include?(input)
						player.hits[player.word_array.find_index(input)] = input
						player.word_array[player.word_array.find_index(input)] = nil
					else
						player.misses_array << input
						player.misses += 1
					end
					break
				else
					puts "Incorrect input. Single letter input only. Please enter a guess:"
					print "> "
				end
			end

			if player.misses_array.length == 6
				gallow(player.misses)
				puts "\nHangman has been completed! You lose."
				puts "The word was: #{ player.word.red }"
				break
			elsif player.word_array.all?(nil)
				puts "\nThe word is: #{ player.word.red }"
				puts "You guessed the word. Congratulations!"
				break
			end
		end
	end

	def gallow(num)
		pic = []

		pic[0] = <<HEREDOC
    +------------+
                 |
                 |
                 |
                 |
                 |
                 |
                 |
                 |
                 |
 ------------------
|__________________|
HEREDOC
		
		pic[1] = <<HEREDOC
    +------------+
    |            |
   /o\\           |
  o   o          |
   \\o/           |
                 |
                 |
                 |
                 |
                 |
 ------------------
|__________________|
HEREDOC

		pic[2] = <<HEREDOC
    +------------+
    |            |
   /o\\           |
  o   o          |
   \\o/           |
    |            |
    |            |
    |            |
                 |
                 |
 ------------------
|__________________|
HEREDOC
		
		pic[3] = <<HEREDOC
    +------------+
    |            |
   /o\\           |
  o   o          |
   \\o/           |
   _|            |
  / |            |
    |            |
                 |
                 |
 ------------------
|__________________|
HEREDOC

		pic[4] = <<HEREDOC
    +------------+
    |            |
   /o\\           |
  o   o          |
   \\o/           |
   _|_           |
  / | \\          |
    |            |
                 |
                 |
 ------------------
|__________________|
HEREDOC

		pic[5] = <<HEREDOC
    +------------+
    |            |
   /o\\           |
  o   o          |
   \\o/           |
   _|_           |
  / | \\          |
    |_           |
       \\         |
                 |
 ------------------
|__________________|
HEREDOC

		pic[6] = <<HEREDOC
    +------------+
    |            |
   /o\\           |
  o   o          |
   \\o/           |
   _|_           |
  / | \\          |
   _|_           |
  /   \\          |
                 |
 ------------------
|__________________|
HEREDOC

		puts pic[num]
	end
end