=begin
Build a program that asks a user for the length and width of a room in meters and then displays 
the area of the room in both square meters and square feet.

Note: 1 square meter == 10.7639 square feet
=end

SQMETERS_TO_SQFEET = 10.7639
SQFEET_TO_INCHES = 12
SQINCHES_TO_CENTIMETERS = 2.54

# puts 'What is the length of the room in meters?'
# length = gets.chomp.strip.to_f

# puts 'What is the width of the room in meters?'
# width = gets.chomp.strip.to_f

# square_meters = (length * width).round(2)
# square_feet = (square_meters * SQMETERS_TO_SQFEET).round(2)

# puts <<-MULTI
# The area of the room is:
# #{square_meters} square meters
# #{square_feet} square feet
# MULTI

=begin
Further Exploration
Modify this program to ask for the input measurements in feet, and display the results in square feet, 
square inches, and square centimeters.
=end

puts 'What is the length of the room in feet?'
length = gets.chomp.strip.to_f

puts 'What is the width of the room in feet?'
width = gets.chomp.strip.to_f

square_feet = (length * width).round(2)
square_inches = (square_feet * SQFEET_TO_INCHES).round(2)
square_centimeters = (square_inches * SQINCHES_TO_CENTIMETERS).round(2)

puts <<-MULTI
The area of the room is:
#{square_feet} square feet
#{square_inches} square inches
#{square_centimeters} square centimeters
MULTI
