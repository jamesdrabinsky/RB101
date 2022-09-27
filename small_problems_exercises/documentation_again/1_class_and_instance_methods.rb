=begin
Locate the ruby documentation for methods File::path and File#path. How are they different?
=end

# https://docs.ruby-lang.org/en/2.7.0/File.html#method-c-path
# https://docs.ruby-lang.org/en/2.7.0/File.html#method-i-path

# File::path is a class method which returns the string representation of the
# path

puts File.path('bin')

# File#path is an instance method which returns the pathname used to create file
# as a string.

f = File.new('my-file.txt')
puts f.path
