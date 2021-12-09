def smoke_basin(puzzle_input)
  risk_level_sum = 0
  lines = puzzle_input.map { |line| line.chars.map(&:to_i) }
  lines.each_with_index do |line, y|
    line.each_with_index do |cell, x|
      if less_than_up(lines, cell, x, y) &&
        less_than_left(lines, cell, x, y) &&
        less_than_right(lines, cell, x, y) &&
        less_than_down(lines, cell, x, y) &&
          risk_level_sum += cell + 1
      end
    end
  end
  p risk_level_sum
end

def less_than_up(lines, cell, x, y)
  return true if y == 0
  lines[y - 1][x] > cell ? true : false
end

def less_than_left(lines, cell, x, y)
  return true if x == 0
  lines[y][x - 1] > cell ? true : false
end

def less_than_right(lines, cell, x, y)
  return true if x == lines[y].length - 1
  lines[y][x + 1] > cell ? true : false
end

def less_than_down(lines, cell, x, y)
  return true if y == lines.length - 1
  lines[y + 1][x] > cell ? true : false
end

puzzle_input = File.open("puzzle_inputs/day-9.txt").readlines.map(&:chomp)
smoke_basin(puzzle_input)
