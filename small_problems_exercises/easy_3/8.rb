=begin
Write a method that returns true if the string passed as an argument is a palindrome, false otherwise. 
A palindrome reads the same forward and backward. For this exercise, case matters as does punctuation and spaces.
=end

def palindrome?(string)
  string == string.reverse
end

def palindrome2?(string)
  steps = (string.size - 1..0).step(-1)
  reversed_string = string.split('').values_at(*steps).join
  string == reversed_string
end

def palindrome3?(string)
  first = 0
  last = string.size - 1

  while first < last
    return false if string[first] != string[last]

    first += 1
    last -= 1
  end
  true
end

def palindrome4?(string)
  mid = string.size / 2

  mid.times do |idx|
    return false if string[idx] != string[-(idx + 1)]
  end
  true
end

def palindrome5?(string)
  mid = string.size / 2
  arr = string.split('')

  mid.times do
    return false if arr.shift != arr.pop
  end
  true
end

p palindrome4?('madam') == true
p palindrome4?('Madam') == false          # (case matters)
p palindrome4?("madam i'm adam") == false # (all characters matter)
p palindrome4?('356653') == true


=begin
Write a method that determines whether an array is palindromic; 

write a method that can take either an array or a string argument, and determines whether that argument is a palindrome.
You may not use an if, unless, or case statement or modifier.
=end

def palindromic(obj)
  mid = obj.size / 2

  mid.times do |idx|
    return false if obj[idx] != obj[-(idx + 1)]
  end
  true
end

p palindromic([1, 2, 3, 2, 1])
p palindromic('madam')