=begin
Mad libs are a simple game where you create a story template with blanks for words. 
You, or another player, then construct a list of words and place them into the story, 
creating an often silly or funny story as a result.

Create a simple mad-lib program that prompts for a noun, a verb, an adverb, 
and an adjective and injects those into a story that you create.
=end

puts 'Enter a noun:'
noun = gets.chomp.strip

puts 'Enter a verb:'
verb = gets.chomp.strip

puts 'Enter an adjective:'
adjective = gets.chomp.strip

puts 'Enter an adverb:'
adverb = gets.chomp.strip

puts "Do you #{verb} your #{noun} #{adverb}?  That's #{adjective}!"