require "./player.rb"
require "./hm_module.rb"
require "./text_color.rb"
include Tools

player = ""

puts "\nWelcome to Hangman: \"I Hope This Won't Be Too Crazy\" Edition!"

puts %[
 _                                             
| |                                            
| |__   __ _ _ __   __ _ _ __ ___   __ _ _ __  
| '_ \\ / _` | '_ \\ / _` | '_ ` _ \\ / _` | '_ \\ 
| | | | (_| | | | | (_| | | | | | | (_| | | | |
|_| |_|\\__,_|_| |_|\\__, |_| |_| |_|\\__,_|_| |_|
                    __/ |                      
                   |___/   
].light_blue

intro_menu

puts "\nPlease enter your name:"
print "> "
player = Player.new(gets.chomp)

puts "\nWelcome, #{player.name}!"
