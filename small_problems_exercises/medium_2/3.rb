=begin
Write a method that takes a string, and then returns a hash that contains 3 entries: 
  one represents the percentage of characters in the string that are lowercase letters, 
  one the percentage of characters that are uppercase letters, 
  and one the percentage of characters that are neither.
=end

=begin
P:
  Input: String
  Output: Hash (of symbol/float pairs)

  Explicit requirements:
    - Given a string
    - Return a hash which contains 3 entries:
      - % of uppercase characters
      - % of lowercase characters
      - % that are neither

D:
  Input: String
  Output: Hash (of symbol/float pairs)

A:
  First method: calculate_percentage
    - Takes two arguments: number, total_number
    - Divide number by total_number (convert to float) and multiply by 100
    - Round the result to 1 decimal place

  Second method: letter_percentages
    - Initialize hash with default value 0
    - Iterate through the string and increment each hash key based on whether the 
    character at the current index position is uppercase/lowercase/neither
    - Once iteration is complete, call the calculate_percentage method on each hash values.
    - Return the hash
=end

def calculate_percentage(number, total_number)
  100 * (number / total_number.to_f).round(1)
end

def letter_percentages(string)
  percentages = { lowercase: 0, uppercase: 0, neither: 0 }
  (0..string.size - 1).each_with_object(percentages) do |idx, hsh|
    case
    when string[idx] =~ /[A-Z]/ then hsh[:uppercase] += 1
    when string[idx] =~ /[a-z]/ then hsh[:lowercase] += 1
    else hsh[:neither] += 1
    end
  end
  percentages.each do |k, v|
    percentages[k] = calculate_percentage(v, string.size)
  end
end

# p letter_percentages('abCdef 123')  == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
# p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
# p letter_percentages('123')  == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }