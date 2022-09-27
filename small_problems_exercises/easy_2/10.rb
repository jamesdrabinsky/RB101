=begin
What will the following code print, and why? Don't run the code until you have tried to answer.
=end

array1 = %w[Moe Larry Curly Shemp Harpo Chico Groucho Zeppo]
array2 = []
array1.each { |value| array2 << value }  # Pushing all values from array1 to array2
array1.each { |value| value.upcase! if value.start_with?('C', 'S') } # Uppercases destructively all names in array1 that start with C or S

# Will print out ["Moe", "Larry", "CURLY", "SHEMP", "Harpo", "CHICO", "Groucho", "Zeppo"]
# array2 points to a different address in memory than array1
# However, the elements in array2 are all references to the same variables that exist in array1
# So mutations to elements in array1 will also mutate the elements in array2
puts array2

=begin
The answer lies in the fact that the first each loop simply copies a bunch of references from array1 to array2. 
When that first loop completes, both arrays not only contain the same values, they contain the same String objects. 
If you modify one of those Strings, that modification will show up in both Arrays.
=end