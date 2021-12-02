def calculate_and_multiply_final_positions(puzzle_input)
  horizontal_position = 0
  depth = 0
  aim = 0

  puzzle_input.each do |e|
    command = e.split(" ")
    direction = command[0]
    value = command[1].to_i
    if direction == "forward"
      horizontal_position += value
      depth += (aim * value)
    elsif direction == "up"
      aim -= value
    elsif direction == "down"
      aim += value
    end
  end

  p horizontal_position * depth
end

puzzle_input = File.open("puzzle_inputs/day-2.txt").readlines.map(&:chomp)
calculate_and_multiply_final_positions(puzzle_input)
