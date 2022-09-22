=begin
Method calls can take expressions as arguments. Suppose we define a method called rps as follows, 
which follows the classic rules of rock-paper-scissors game: it returns the winning fist or, 
in the case of a tie, the fist that both players played.

What is the result of the following call?
=end

def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

one_1 = rps("rock", "paper")  # paper
one_2 = rps("rock", "scissors") # rock
one = rps(one_1, one_2) # paper

puts rps(one, "rock") # paper