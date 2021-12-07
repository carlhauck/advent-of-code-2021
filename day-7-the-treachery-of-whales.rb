def calculate_min_fuel(input)
  destinations = (input.min..input.max).to_a
  fuel_spent_hash = {} # position => total fuel
  destinations.each { |des| fuel_spent_hash[des] = calculate_fuel(des, input) }
  fuel_spent_hash.values.min
end

def calculate_fuel(destination, input)
  total = 0
  input.each { |position| total += (position - destination).abs() }
  total
end

puzzle_input = File.read("puzzle_inputs/day-7.txt").split(",").map(&:to_i)
p calculate_min_fuel(puzzle_input)
