=begin
Write a program that reads the content of a text file and then prints the longest 
sentence in the file based on number of words. Sentences may end with periods (.), 
exclamation points (!), or question marks (?). Any sequence of characters that are 
not spaces or sentence-ending characters should be treated as a word. 
You should also print the number of words in the longest sentence.
=end

file = File.open("pg84.txt")
text = file.read
sentences = text.split(/\.|\?|!/)

p sentences.size

