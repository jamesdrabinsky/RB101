=begin
What is the output of the following code?
=end

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

=begin
This code will output 34 (42 - 8).  The mess_with_it method reassigns the some_number variable 
to a differet integer object but it does not mutate the original object.  Therefore, the variable answer
is still bound to 42 when used in the last line.
=end