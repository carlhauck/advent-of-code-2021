def extended_polymerization(puzzle_input)
  template = puzzle_input.split("\n\n").first
  rules_hash = {}
  insertion_rules = puzzle_input.split("\n\n").drop(1).first.split("\n").map do |line|
    rule = line.split(" -> ")
    rules_hash[rule[0]] = rule[0].dup.insert(1, rule[1])
  end

  pair_count_hash = Hash.new(0)
  pairs = template.chars.each_cons(2) { |pair| pair_count_hash[pair.join] += 1 }

  40.times do
    pair_count_hash_dup = pair_count_hash.dup
    pair_count_hash = Hash.new(0)
    pair_count_hash_dup.each do |k, v|
      trio = rules_hash[k]
      pair_count_hash[trio[0..1]] += v
      pair_count_hash[trio[1..2]] += v
    end
  end

  total = Hash.new(0)
  pair_count_hash.each do |k, v|
    total[k[0]] += v
  end
  total[template[-1]] += 1

  total.values.max - total.values.min
end

puzzle_input = File.read("puzzle_inputs/day-14.txt")
p extended_polymerization(puzzle_input)
