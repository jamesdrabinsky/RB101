=begin
You are given a method named spin_me that takes a string as an argument and returns 
a string that contains the same words, but with each word's characters reversed. 
Given the method's implementation, will the returned string be the same object as the 
one passed in as an argument or a different object?
=end

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(' ')
end

spin_me('hello world') # "olleh dlrow"

=begin
Line 9
  Action: Method call: String#split
  Object: The string argument
  Side Effect: None
  Return Value: An array containing substrings from the original string delimited by a space
  Is Return Value Used?: Yes, it is used by the `each` method to iterate through the array

Line 9 
  Action: Method call: each
  Object: The return value of str.split
  Return Value: The calling object
  Is Return Value Used?: No

Line 9 - 11
  Action: Block execution
  Object: Each element in the calling object
  Return Value: The element of the array in that iteration reversed
  Is Return Value Used?: No

Line 10
  Action: Method call: reverse!
  Object: The element of the array in that iteration
  Return Value: The element reversed
  Is Return Value Used?: Yes, it is used to determine the return value of the block

Line 11
  Action: Method call: join
  Object: ...
=end