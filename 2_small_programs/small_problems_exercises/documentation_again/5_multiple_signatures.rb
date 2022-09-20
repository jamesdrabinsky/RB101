=begin
What do each of these puts statements output?
=end

a = %w(a b c d e)
puts a.fetch(7) # IndexError
puts a.fetch(7, 'beats me') # 'beats me'
puts a.fetch(7) { |index| index**2 } # 49 (Block is executed when an invalid index is referenced.)
