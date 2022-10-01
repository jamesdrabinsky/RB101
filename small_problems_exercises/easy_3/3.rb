=begin
Write a program that will ask a user for an input of a word or multiple words and give back the number of characters. 
Spaces should not be counted as a character.
=end

puts 'Please write word or multiple words:'
string = gets.chomp.strip

number_of_chars1 = string.delete(' ').size
puts number_of_chars1

number_of_chars = string.split.join.size
puts number_of_chars

number_of_chars2 = string.chars.reject { |i| i == ' ' }.size
puts number_of_chars2

number_of_chars3 = string.chars.count { |i| i != ' ' }
puts number_of_chars3

# total = 0
# s.chars.each { |i| total += 1 if i != ' ' }

# s.chars.each_with_object(0) { |i, total| total += 1 if i != ' ' }