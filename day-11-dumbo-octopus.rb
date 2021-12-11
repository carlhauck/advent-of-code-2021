class DumboOctopus
  def initialize(puzzle_input)
    @line_size = puzzle_input.first.length
    @num_array = puzzle_input.join("").split("").map(&:to_i)
    @flash_count = 0
  end

  def call
    100.times do
      @flashed_cells = {}
      @num_array = increase_energy_level
      @lines = @num_array.each_slice(@line_size).to_a
      @lines.each_with_index do |line, y|
        line.each_with_index do |_, x|
          flash(x, y) if @lines[y][x] > 9 && !@flashed_cells[[x, y]]
        end
      end
      @num_array = reset_energy
    end
    @flash_count
  end
end

def increase_energy_level
  @num_array.map { |num| num += 1 }
end

def flash(x, y)
  @lines[y][x] += 1
  if @lines[y][x] > 9 && !@flashed_cells[[x, y]]
    @flashed_cells[[x, y]] = true
    @flash_count += 1
    flash(x - 1, y - 1) unless y == 0 || x == 0 # top left
    flash(x, y - 1) unless y == 0 # top
    flash(x + 1, y - 1) unless y == 0 || x == @line_size - 1 # top right
    flash(x - 1, y) unless x == 0 # left
    flash(x + 1, y) unless x == @line_size - 1 # right
    flash(x - 1, y + 1) unless y == @lines.length - 1 || x == 0 # bottom left
    flash(x, y + 1) unless y == @lines.length - 1 # bottom
    flash(x + 1, y + 1) unless y == @lines.length - 1 || x == @line_size - 1 # bottom right
  end
end

def reset_energy
  @lines.flatten.map { |num| num > 9 ? 0 : num }
end

puzzle_input = File.open("puzzle_inputs/day-11.txt").readlines.map(&:chomp)
p DumboOctopus.new(puzzle_input).call