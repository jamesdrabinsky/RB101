=begin
Use irb to run the following code:

You should find that it prints a list of all of the public methods available to the 
String s; this includes not only those methods defined in the String class, but also 
methods that are inherited from Object (which inherits other methods from the BasicObject 
  class and the Kernel module). That's a lot of methods.

How would you modify this code to print just the public methods that are defined or 
overridden by the String class? That is, the list should exclude all members that are 
only defined in Object, BasicObject, and Kernel.
=end

# https://docs.ruby-lang.org/en/2.7.0/Object.html#method-i-public_methods


s = 'abc'
puts s.public_methods(false).inspect

# non_exclusive_methods = Object.methods + Kernel.methods + BasicObject.methods
# s.public_methods.select { |x|  !non_exclusive_methods.include?(x) }
