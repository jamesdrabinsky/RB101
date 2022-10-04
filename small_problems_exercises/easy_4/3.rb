=begin
In the modern era under the Gregorian Calendar, leap years occur in every year that is evenly divisible by 4,
unless the year is also divisible by 100. If the year is evenly divisible by 100, then it is not a leap year
unless the year is evenly divisible by 400.

Assume this rule is good for any year greater than year 0. Write a method that takes any year greater than 0 as input,
and returns true if the year is a leap year, or false if it is not a leap year.
=end

=begin
P:
  Input: Integer
  Output: Boolean

  Explicit Requirements: 
    - Year is a leap year if divisible by 4
      - Unless it is divisible by 100
        - in which case it should also be divisible by 400

D: 
  Input: Integer
  Ouput: Boolean
  Intermediate: None

A: 
  Set up a conditional:
    - On the first level, test whether the year is divible by 4
      
      - If true, then go to the next level of the conditional
          - Test whether the year is divisible by 100
            - If true, then go to the next level of the conditional
              - Test whether the year is divisible by 400
                - If true, then return true
                - If false, then return false
            
              - If not, return true
      
      - if not, then skip to the end of the function and return false
C:
=end

# def leap_year?(year)
#   if year % 400 == 0
#     true
#   elsif year % 100 == 0
#     false
#   else
#     year % 4 == 0
#   end
# end

def leap_year?(year)
  if year % 4 == 0
    if year % 100 == 0
      return true if year % 400 == 0
    else
      return true
    end
  end
  false
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true
