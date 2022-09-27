=begin
What does this code print out? Think about it for a moment before continuing.
=end

name = 'Bob'
save_name = name
name = 'Alice'
puts name, save_name

# Alice
# Bob

name = 'Bob'
save_name = name  # Both variables point to the same address in memory
name.upcase!  # upcase! is a destructive method which changes the variable in place 
puts name, save_name

# BOB
# BOB

=begin
Because assignment in ruby just assigns a reference to a variable, both name and save_name refer to the same string, Bob. 
When you apply name.upcase!, which mutates name in place, the value that save_name references also changes. 
Thus, both name and save_name are set equal to 'BOB'.
=end