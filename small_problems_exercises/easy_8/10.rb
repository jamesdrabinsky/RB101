=begin
Write a method that takes a non-empty string argument, 
and returns the middle character or characters of the argument. 
If the argument has an odd length, you should return exactly one character. 
If the argument has an even length, you should return exactly two characters.
=end

=begin
P:
  Input: string
  Output: string

  Explicit requirements:
     - Give a non-empty string argument
     - Return the middle characters of the string
      - If the argument has an odd length, you should return exactly one character
      - If the argument has an even length, you should return exactly two characters
]
A:
  - Initialize a local variable `mid` to an integer value equal to the string length / 2
  - If the string length is odd, return the character at the `mid` index postiion 
  - If the string length is even, return the character at the `mid`..`mid` + 1 index position
=end

def center_of(string)
  mid = string.size / 2
  string.size.odd? ? string[mid] : string[mid - 1..mid]
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'