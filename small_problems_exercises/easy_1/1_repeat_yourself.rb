=begin
Write a method that takes two arguments, a string and a positive integer,
and prints the string as many times as the integer indicates.
=end

=begin
P: (Understand the Problem)
  Inputs: string, integer
  Outputs: string repeater {integer} times

Explicit requirements:
  Take in two arguments: repeat(string, integer)

  Implicit requirements
  Print the string on separate lines
  All numbers are natural and cannot be floats

  Questions 
  What happens if the string is negative?

E: (Example/Tests)
  Input: 'Hello', 3 
  Output: 
    Hello
    Hello 
    Hello 

    Input: '', 2
    Output: 
    # empty string 
    # empty string 

    Input: 'What's up?', 0
    Output: #nil 

D:(Data Structure)
  Input: string, Integer
  Interim: Do we need anythign special to hold the values? No. Just a regular variable.
  Output: String printed out integer times.

A: (Algorithm)
  For integer times, 
    PRINT the string on a new line. 
=end

def repeat(string, number)
  number.times { puts string }
  # (1..number).each { puts string }
end
