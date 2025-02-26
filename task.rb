class Stack
  def initialize
    @stack = []           
    @max_stack = []       
    @sum = 0               
  end

 
  def push(number)
    @stack.push(number)
    @sum += number        

   
    if @max_stack.empty? || number >= @max_stack.last
      @max_stack.push(number)
    else
      @max_stack.push(@max_stack.last)
    end
  end

 
  def pop
    return nil if @stack.empty? 

    popped_number = @stack.pop
    @max_stack.pop
    @sum -= popped_number     
    popped_number
  end

 
  def max
    return nil if @max_stack.empty? 

    @max_stack.last
  end
end

class Extras < Stack
 
  def mean
    return 0 if @stack.empty?  

    @sum.to_f / @stack.size   
  end
end


stack = Extras.new

# Push numbers 
stack.push(20)
stack.push(400)
stack.push(80)
stack.push(330)
stack.push(4000)
stack.push(900)
stack.push(650)
stack.push(50)
stack.push(2)


puts "Max value: #{stack.max}"   
puts "Mean value: #{stack.mean}"  


puts "Popped values (FILO):"
while (popped = stack.pop)
  puts popped
end
# Answer to the question 
puts "\nProve why your solution is considered fast(er)?:"
puts "The solution is optimized by using an auxiliary stack for the `max` method, ensuring constant-time retrieval (O(1)) of the maximum value, even with a large number of elements."
puts "The `mean` method runs in constant-time (O(1)) by maintaining a running sum, avoiding the need to traverse the entire stack."
puts "Both the `push` and `pop` operations are performed in constant time (O(1)), ensuring fast performance regardless of stack size."
puts "These optimizations make the solution highly efficient, even for stacks with millions of elements, handling frequent `max` and `mean` calls with ease."
puts "Overall, the approach minimizes time complexity and provides a scalable solution for large-scale data processing."
