=begin
What will be printed by each of these code groups?
=end

def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three) # Does not mutate the original objects

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# one is: one
# two is: two
# three is: three

################################################################

def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three) # Still does not mutate the original objects.  Just reassigns/binds them to new strings.

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# one is: one
# two is: two
# three is: three

################################################################

def mess_with_vars(one, two, three)
  one.gsub!("one","two")  # gsub! is a destructive method which replace the characters in the first argument
                          # with those in the second argument.
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three) # Mutates the original objects.

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# one is: two
# two is: three
# three is: one
