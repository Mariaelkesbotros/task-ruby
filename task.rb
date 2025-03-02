require 'benchmark'

class Stack
  def initialize
    @stack = []
    @max_value = nil  
    @sum = 0
  end

  def push(number)
    @stack.push(number)
    @max_value = number if @max_value.nil? || number > @max_value
    @sum += number
  end

  def pop
    return nil if @stack.empty?

    popped_number = @stack.pop
    @sum -= popped_number  

    if popped_number == @max_value
      @max_value = @stack.max unless @stack.empty?
    end

    popped_number
  end

  def max
    @max_value
  end
end 

class Extras < Stack
  def mean
    @stack.empty? ? 0.0 : @sum.to_f / @stack.size
  end
end

stack = Extras.new
10000000.times.each do|i|
stack.push(rand(1..10))
end


# Push numbers 
=begin

stack.push(20)
stack.push(400)
stack.push(80)
stack.push(330)
stack.push(4000)
stack.push(900)
stack.pop
stack.push(700)
stack.push(50)
stack.pop
stack.push(2)
stack.pop
stack.push(10000)
stack.pop
=end

puts "Max value: #{stack.max}"  
puts "Mean value: #{stack.mean}"

=begin
puts "Popped values (FILO):"
while (popped = stack.pop)
  puts popped
end
=end
max_time = Benchmark.measure { stack.max }.real
pop_time = Benchmark.measure { stack.pop }.real
mean_time = Benchmark.measure { stack.mean }.real


puts "Max execution time: #{format('%.6f', max_time)} seconds"
puts "Mean execution time: #{format('%.6f', mean_time)} seconds"
puts "Pop execution time: #{format('%.6f', pop_time)} seconds"



