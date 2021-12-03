def binary_diagnostic(puzzle_input)
  bit_index = 0
  bit_hash = {}
  bits = puzzle_input.first.length
  bits.times do
    bit_hash[bit_index] = { 0=>0, 1=>0 }
    puzzle_input.each do |n|
      n[bit_index] == '1' ? bit_hash[bit_index][1] += 1 : bit_hash[bit_index][0] += 1
    end
    bit_index += 1
  end
  
  gamma_rate = ""
  epsilon_rate = ""

  bit_hash.values.each do |h|
    if h[0] > h[1]
      gamma_rate << '0'
      epsilon_rate << '1'
    else
      gamma_rate << '1'
      epsilon_rate << '0'
    end
  end

  p convert_to_decimal(gamma_rate) * convert_to_decimal(epsilon_rate)
end

def convert_to_decimal(binary)
  binary.reverse.chars.map.with_index do |digit, index|
    digit.to_i * 2**index
  end.sum
end

puzzle_input = File.open("puzzle_inputs/day-3.txt").readlines.map(&:chomp)
binary_diagnostic(puzzle_input)
