class FindThreeLargestBasins
  def initialize(puzzle_input)
    @lines = puzzle_input.map { |line| line.chars.map(&:to_i) }
    @explored_cells = {}
    @basins = Hash.new(0)
  end

  def call
    @lines.each_with_index do |line, y|
      line.each_with_index do |cell, x|
        explore_cell(cell, x, y)
      end
    end
    p @basins.values.sort[-3..-1].reduce(:*)
  end
end

def explore_cell(cell, x, y, basin_id=nil)
  if cell != 9 && !@explored_cells[[x, y]]
    basin_id = basin_id ? basin_id : [x, y]
    @explored_cells[[x, y]] = true
    @basins[basin_id] += 1
    explore_cell(@lines[y - 1][x], x, y - 1, basin_id) unless y == 0
    explore_cell(@lines[y][x - 1], x - 1, y, basin_id) unless x == 0
    explore_cell(@lines[y][x + 1], x + 1, y, basin_id) unless x == @lines[y].length - 1
    explore_cell(@lines[y + 1][x], x, y + 1, basin_id) unless y == @lines.length - 1
  end
end

puzzle_input = File.open("puzzle_inputs/day-9.txt").readlines.map(&:chomp)
FindThreeLargestBasins.new(puzzle_input).call
