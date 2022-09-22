=begin
Consider these two simple methods:

What would be the return value of the following method invocation?
=end

def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

puts bar(foo) # foo == yes
              # return no
