def calculate_and_multiply_final_positions(puzzle_input)
  horizontal_position = puzzle_input.select { |d| d[0] == "f"}.map { |d| d.split(" ")[1].to_i }.sum
  up = puzzle_input.select { |d| d[0] == "u"}.map { |d| d.split(" ")[1].to_i }.sum
  down = puzzle_input.select { |d| d[0] == "d"}.map { |d| d.split(" ")[1].to_i }.sum

  depth = down - up
  p horizontal_position * depth
end

puzzle_input = File.open("puzzle_inputs/day-2.txt").readlines.map(&:chomp)
calculate_and_multiply_final_positions(puzzle_input)