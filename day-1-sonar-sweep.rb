require_relative 'day-1-puzzle-input'

def count_increasing_decreasing(puzzle_input)
  index = 1
  increasing_count = 0
  while index < puzzle_input.length
    increasing_count += 1 if puzzle_input[index] > puzzle_input[index - 1]
    index += 1
  end
  p increasing_count
end

count_increasing_decreasing(puzzle_input)
