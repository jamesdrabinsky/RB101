=begin
Write a method that will take a short line of text, and print it within a box.
=end

def print_in_box(string)
  len = string.size + 2
  h_border = '+' + ('-' * len) + '+'
  non_text_line = '|' + (' ' * len) + '|'
  text_line = '|' + string.center(len) + '|'

  puts(h_border)
  puts(non_text_line)
  puts(text_line)
  puts(non_text_line)
  puts(h_border)
end

print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+

=begin
Further Exploration
Modify this method so it will truncate the message if it will be too wide to fit inside a standard terminal window 
(80 columns, including the sides of the box). For a real challenge, try word wrapping very long messages so they 
appear on multiple lines, but still within a box.
=end

