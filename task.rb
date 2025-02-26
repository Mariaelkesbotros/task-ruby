class Stack
  def initialize
    @stack = []
    @max_stack = []
  end

  def push(num)
    raise ArgumentError, "Only unsigned integers allowed" unless num.is_a?(Integer) && num >= 0

    @stack.push(num)
    @max_stack.push(num) if @max_stack.empty? || num >= @max_stack.last
  end

  def pop
    return nil if @stack.empty?

    value = @stack.pop
    @max_stack.pop if value == @max_stack.last
    value
  end

  def max
    @max_stack.last
  end
end

class Extras < Stack
  def initialize
    super
    @sum = 0
    @count = 0
  end

  def push(num)
    super
    @sum += num
    @count += 1
  end

  def pop
    return nil if @stack.empty?

    value = super
    @sum -= value
    @count -= 1
    value
  end

  def mean
    return nil if @count.zero?

    @sum.to_f / @count
  end

  def pop_all
    while (value = pop)
      print "#{value} "
    end
    puts
  end
end

stack = Extras.new
puts "Enter an unsigned integer (or type 'exit' to finish):"

while input = gets.chomp
  break if input.strip.downcase == 'exit'
  begin
    num = Integer(input)
    stack.push(num)
  rescue ArgumentError => e
    puts "Invalid input: #{e.message}. Please enter a valid unsigned integer."
  rescue StandardError
    puts "Invalid input. Please enter a valid unsigned integer."
  end
  puts "Enter another unsigned integer (or type 'exit' to finish):"
end

puts "The max number is: #{stack.max}"
puts "The average of the numbers is: #{stack.mean}"
print "The numbers after FILO are: "
stack.pop_all

