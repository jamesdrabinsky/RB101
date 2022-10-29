=begin
Write a method that takes a string, and then returns a hash that contains 3 entries: 

one represents the number of characters in the string that are lowercase letters, 
one the number of characters that are uppercase letters, 
and one the number of characters that are neither.
=end

=begin
P:
  Input: string
  Output: hash with symbol/integer keys and values

  Explicit requirements:
    - Given a string
    - Return a hash with three keys {:lowercase, :uppercase, :neither}
      and their counts respectively
    - Each key in the hash should have a default value of 0

D:
  Input: string
  Output: hash with symbol/integer keys and values

A:
  - Initialize a local variable `counter` which is a Hash with a default value of 0
  - Iterate through the string
     - If the character is lowercase, increment `counter`'s :lowercase value by 1
     - If the character is uppercase, increment `counter`'s :uppercase value by 1
     - Else increment `counter`'s :neither value by 1
  - Return `counter`
=end

def letter_case_count(string)
  counter = %i(lowercase uppercase neither).zip([0] * 3).to_h

  (0..string.size - 1).each do |idx|
    if string[idx].match?(/[A-Z]/)
      counter[:uppercase] += 1
    elsif string[idx].match?(/[a-z]/)
      counter[:lowercase] += 1
    else
      counter[:neither] += 1
    end
  end
  counter
end

# def letter_case_count(string)
#   counts = {}
#   characters = string.chars
#   counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
#   counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
#   counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }
#   counts
# end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }