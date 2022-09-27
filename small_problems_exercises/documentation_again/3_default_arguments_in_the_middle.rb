=begin
Consider the following method and a call to that method:

Use the ruby documentation to determine what this code will print.
=end

# https://docs.ruby-lang.org/en/2.7.0/syntax/calling_methods_rdoc.html

def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d]
end

my_method(4, 5, 6)
# => [4, 5, 3, 6]

# Positional arguments are filled out first, then the default arguments are set with any values supplied, 
# and, finally, default values are applied to anything remaining.
# First 4 is assigned to a, then 6 is assigned to d. This leaves only the arguments with default values. 
# Since 5 has not been assigned to a value yet, it is given to b and c uses its default value of 3.