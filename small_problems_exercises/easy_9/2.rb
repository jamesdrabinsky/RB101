=begin
A double number is a number with an even number of digits whose left-side digits are exactly 
the same as its right-side digits. For example, 44, 3333, 103103, 7676 are all double numbers. 
444, 334433, and 107 are not.

Write a method that returns 2 times the number provided as an argument, unless the argument 
is a double number; double numbers should be returned as-is.
=end

=begin
P:
  Input: integer
  Output: integer

  Explicit requirements:
     - Given an integer
     - Return 2 * integer if the integer is not a double number, otherwise return the number
     - A double numnber is a number with an even number of digits whose left-side digits 
     are exactly the same as its right-side digits

D:
    Input: integer
    Output: integer
    Intermediate: string

A: 
  - Convert the argumnet integer to a string
  - Initialize a local variable to an integer which represents the mid-point of the string integer
    - THe mid-point will be the result of dividing the string length by 2 and subtracting 1
  - Partition the string integer at the mid-point
  - Compare both side of the string 
    - If they are the same, return the string convert to an integer
    - If they are different, return the string converted to an integer multiplied by 2
=end

def twice(num)
  string_num = num.to_s
  mid = (string_num.size / 2) - 1
  first, second = string_num[0..mid], string_num[mid + 1..]
  (first == second) && (string_num.size.even?) ? num : num * 2
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10