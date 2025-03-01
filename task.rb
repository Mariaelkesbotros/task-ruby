require 'benchmark'
class Stack
  def initialize
    @stack = []
    @max_value = nil
    @sum = 0
  end

  def push(number)
    @stack.push(number)
    @sum += number
    @max_value = number if @max_value.nil? || number > @max_value
  end

  def pop
    if @stack.any?
      popped_number = @stack.pop
      @sum -= popped_number

      @max_value = @stack.max if popped_number == @max_value
      
      popped_number
    end
  end

  def max
    @max_value unless @stack.empty?
  end
end

class Extras < Stack
  def mean
    @sum.to_f / @stack.size unless @stack.empty?
  end
end

stack = Extras.new
10000000.times.each do|i|
stack.push(rand(1..10))
end

max_time = Benchmark.measure { stack.max }
pop_time = Benchmark.measure { stack.pop }
mean_time = Benchmark.measure { stack.mean }

puts "Max value: #{stack.max}"
puts "Mean value: #{stack.mean}"

puts "Max execution time: #{max_time.real} seconds"
puts "Mean execution time: #{mean_time.real} seconds"
puts "pop execution time: #{pop_time.real} seconds"

puts "Popped values with (FILO):"
while (popped = stack.pop)
  puts popped
end
