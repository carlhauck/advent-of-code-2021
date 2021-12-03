def binary_diagnostic(puzzle_input)
  oxygen_generator_rating = calculate_rating(puzzle_input, type: :oxygen_generator)
  co2_scrubber_rating = calculate_rating(puzzle_input, type: :co2_scrubber)
  p convert_to_decimal(oxygen_generator_rating) * convert_to_decimal(co2_scrubber_rating)
end

def calculate_rating(puzzle_input, type:)
  bit_index = 0
  until puzzle_input.length == 1 do
    zero = 0
    one = 0
    puzzle_input.each do |n|
      n[bit_index] == '1' ? one += 1 : zero += 1
    end
    if type == :oxygen_generator
      puzzle_input = puzzle_input.select { |num| num[bit_index] == (one >= zero ? '1' : '0') }
    elsif type == :co2_scrubber
      puzzle_input = puzzle_input.select { |num| num[bit_index] == (one < zero ? '1' : '0') }
    end
    bit_index += 1
  end
  puzzle_input.first
end

def convert_to_decimal(binary)
  binary.reverse.chars.map.with_index do |digit, index|
    digit.to_i * 2**index
  end.sum
end

puzzle_input = File.open("puzzle_inputs/day-3.txt").readlines.map(&:chomp)
binary_diagnostic(puzzle_input)
