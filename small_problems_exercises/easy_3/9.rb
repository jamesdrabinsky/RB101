=begin
Write another method that returns true if the string passed as an argument is a palindrome, false otherwise. 
This time, however, your method should be case-insensitive, and it should ignore all non-alphanumeric characters.
=end

# def real_palindrome?(string)
#   string = string.downcase.delete('^a-z0-9')
#   palindrome?(string)
# end

def real_palindrome?(string)
  alpha_num_string = string.downcase.gsub(/[^a-z0-9]/, '')
  alpha_num_string == alpha_num_string.reverse
end

def real_palindrome2?(string)
  alpha_num_string = (string.chars.reject do |char|
    ['.', '!', ',', "'", ' ', '-', '/'].include?(char)
  end).map(&:downcase).join
  alpha_num_string == alpha_num_string.reverse
end


p real_palindrome2?('madam') == true
p real_palindrome2?('Madam') == true           # (case does not matter)
p real_palindrome2?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome2?('356653') == true
p real_palindrome2?('356a653') == true
p real_palindrome2?('123ab321') == false