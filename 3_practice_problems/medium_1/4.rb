=begin
Alyssa was asked to write an implementation of a rolling buffer. 
Elements are added to the rolling buffer and if the buffer becomes full, 
then new elements that are added will displace the oldest elements in the buffer.

She wrote two implementations saying, "Take your pick. Do you like << or + for modifying the buffer?". 
Is there a difference between the two, other than what operator she chose to use to add an element to the buffer?
=end

def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element # Mutates the caller
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

=begin
rolling_buffer2 assign buffer to the original input array + the new element.  The buffer doesn't retain the most recent item
when the method is invoked.  This method will not alter the caller's input argument.
=end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]  
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

buffer = []
p rolling_buffer2(buffer, 3, 1)
p rolling_buffer2(buffer, 3, 2)
p rolling_buffer2(buffer, 3, 3)
p rolling_buffer2(buffer, 3, 4)
