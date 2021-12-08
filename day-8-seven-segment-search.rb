def seven_segment_search(puzzle_input)
  outputs = []
  puzzle_input.each do |line|
    output = line.split(" | ").last
    outputs << output.split(" ").map { |digit| digit.length }
  end
  p outputs.flatten.count { |length| [7, 4, 3, 2].include? length }
end

puzzle_input = File.open("puzzle_inputs/day-8.txt").readlines.map(&:chomp)
seven_segment_search(puzzle_input)
