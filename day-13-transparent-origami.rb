require 'set'
def transparent_origami(puzzle_input)
  @instructions = puzzle_input.split("\n\n").drop(1).first.split("\n").map { |str| str[11..-1] }
  @coordinates = puzzle_input.split("\n\n")[0].split("\n").map { |str| str.split(",").map(&:to_i) }.to_set

  @instructions.each do |step|
    num = step[2..-1].to_i
    fold_along(num, step[0])
  end

  x_max = @coordinates.map { |c| c[0].to_i }.max
  y_max = @coordinates.map { |c| c[1].to_i }.max
  paper = []
  (y_max + 1).times do |y|
    paper << (0..x_max).to_a.fill(".")
  end
  @coordinates.each { |c| paper[c[1]][c[0]] = "#" }
  paper.each { |line| puts line.join }
  # PZFJHRFZ
end

def fold_along(num, cross_axis)
  coordinates_dup = @coordinates.dup
  axis_idx = cross_axis == "x" ? 0 : 1
  @coordinates.each do |c|
    if c[axis_idx] == num
      coordinates_dup.delete(c)
    elsif c[axis_idx] > num
      folded_coord = cross_axis == "x" ? [num - (c[0] - num), c[1]] : [c[0], num - (c[1] - num)]
      coordinates_dup.add(folded_coord)
      coordinates_dup.delete(c)
    end
  end
  @coordinates = coordinates_dup
end

puzzle_input = File.read("puzzle_inputs/day-13.txt")
transparent_origami(puzzle_input)
