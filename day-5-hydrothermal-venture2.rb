def count_overlap_points(puzzle_input)
  lines = puzzle_input.map do |line|
    endpoints = line.split(" -> ").map { |endpoint| endpoint.split(",").map(&:to_i) }
  end
    
  points_hash = Hash.new(0)

  lines.each do |line|
    if line[0][0] == line[1][0]
      range = line[0][1] < line[1][1] ? (line[0][1]..line[1][1]) : (line[1][1]..line[0][1])
      range.each do |y|
        points_hash[[line[0][0], y]] += 1
      end
    elsif line[0][1] == line[1][1]
      range = line[0][0] < line[1][0] ? (line[0][0]..line[1][0]) : (line[1][0]..line[0][0])
      range.each do |x|
        points_hash[[x, line[0][1]]] += 1
      end
    else
      x_range = line[0][0] < line[1][0] ? (line[0][0]..line[1][0]) : (line[1][0]..line[0][0]).to_a.reverse
      y_range = line[0][1] < line[1][1] ? (line[0][1]..line[1][1]) : (line[1][1]..line[0][1]).to_a.reverse
      x_range.zip(y_range).each do |point|
        points_hash[[point[0], point[1]]] += 1
      end
    end
  end

  p points_hash.select { |_, v| v >= 2 }.length
end

puzzle_input = File.open("puzzle_inputs/day-5.txt").readlines.map(&:chomp)
count_overlap_points(puzzle_input)