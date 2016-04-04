def collatz(starting_point, sequence = [])
  sequence << starting_point
  if starting_point == 1
    sequence
  elsif starting_point % 2 == 0
    collatz starting_point / 2, sequence
  else
    collatz starting_point * 3 + 1, sequence
  end
end

def longest_collatz(range)
  top_length = top_start = 0
  range.each do |num|
    sequence = collatz num
    top_start, top_length = num, sequence.length if sequence.length > top_length
  end
  top_start
end