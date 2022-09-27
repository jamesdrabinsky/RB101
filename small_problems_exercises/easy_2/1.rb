=begin
Build a program that randomly generates and prints Teddy's age. To get the age, 
you should generate a random number between 20 and 200.
=end

# age = rand(20..200)
# puts "Teddy is #{age} years old!"

=begin
Further Exploration
Modify this program to ask for a name, and then print the age for that person. 
For an extra challenge, use "Teddy" as the name if no name is entered.
=end

puts "What's you name?"
answer = gets.chomp.downcase.strip
name = answer.empty? ? 'Teddy': answer
age = rand(20..200)
puts "#{name.capitalize} is #{age} years old!"
