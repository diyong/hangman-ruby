module Tools

	def intro_menu
		loop do
			puts "\nPlease enter a number from the menu below:"
			puts "--------------------------------------------"
			puts "(1) Start New Game"
			puts "(2) Load Game"
			puts "(3) Instructions"
			print "> "

			input = gets.chomp
			case input
			when "1"
				#code
				break
			when "2"
				puts "Under development. Please select a different option."
			when "3"
				puts "Under development. Please select a different option."
			else
				puts "Incorrect input."	
			end
		end
	end

end