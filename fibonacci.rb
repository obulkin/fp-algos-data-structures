def recursive_fib(position)
  if position == 0
    0
  elsif position == 1
    1
  else
    recursive_fib(position - 1) + recursive_fib(position - 2)
  end
end

def iterative_fib(position)
  sequence = [0, 1]
  while sequence.length - 1 < position
    sequence << sequence[sequence.length - 1] + sequence[sequence.length - 2]
  end
  sequence[position]
end

require "benchmark"
num = 35
Benchmark.bm do |x|
  x.report("recursive_fib") do
    10.times {recursive_fib num}
  end
  x.report("iterative_fib") do
    10.times {iterative_fib num}
  end
end