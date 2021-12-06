def simulate_lanternfish(puzzle_input, day_count)
  unique_timers = puzzle_input.uniq

  fish_hash = unique_timers.each_with_object({}) do |timer, hash|
    hash[timer] = puzzle_input.count(timer)
  end
  
  day_count.times do
    fish_hash_dup = Hash.new(0)
    keys = fish_hash.keys.sort.reverse
    keys.each do |k|
      if k == 0
        fish_hash_dup[8] += fish_hash[k]
        fish_hash_dup[6] += fish_hash.delete k
      elsif k > 0
        fish_hash_dup[(k - 1).to_i] = fish_hash.delete k
      end
    end
    fish_hash = fish_hash_dup
  end
  
  p fish_hash.values.sum
end

puzzle_input = File.read("puzzle_inputs/day-6.txt").split(",").map(&:to_i)
simulate_lanternfish(puzzle_input, 256)