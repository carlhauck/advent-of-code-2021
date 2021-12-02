def count_increasing_decreasing(puzzle_input)
  index = 1
  increasing_count = 0
  while index < puzzle_input.length - 2
    increasing_count += 1 if puzzle_input.values_at(index..index + 2).sum > puzzle_input.values_at(index - 1..index + 1).sum
    index += 1
  end
  p increasing_count
end

puzzle_input = File.open("puzzle_inputs/day-1.txt").readlines.map(&:to_i)
count_increasing_decreasing(puzzle_input)
