def seven_segment_search(puzzle_input)
  output_sum = 0

  puzzle_input.each do |line|
    str_first_hash = {}
    num_first_hash = {}
    line = line.split(" | ")
    patterns = line.first.split(" ")
    pattern_lengths = patterns.map { |sp| sp.length }
    pattern_hash = patterns.zip(pattern_lengths).to_h

    pattern_hash.each do |str, size|
      if size == 7
        str_first_hash[str] = 8
        num_first_hash[8] = str
      elsif size == 4
        str_first_hash[str] = 4
        num_first_hash[4] = str
      elsif size == 3
        str_first_hash[str] = 7
        num_first_hash[7] = str
      elsif size == 2
        str_first_hash[str] = 1
        num_first_hash[1] = str
      end
    end

    pattern_hash.select {|_, size| ![7, 4, 3, 2].include? size}.each do |str, size|
      if size == 5
        if (str.chars - num_first_hash[7].chars).length == 2
          str_first_hash[str] = 3
        elsif (num_first_hash[4].chars - str.chars).length == 2
          str_first_hash[str] = 2
        elsif (num_first_hash[4].chars - str.chars).length == 1
          str_first_hash[str] = 5
        end
      elsif size == 6
        if (num_first_hash[1].chars - str.chars).length == 1
          str_first_hash[str] = 6
        elsif (num_first_hash[4].chars - str.chars).length == 1
          str_first_hash[str] = 0
        elsif (num_first_hash[4].chars - str.chars) == []
          str_first_hash[str] = 9
        end
      end
    end
    
    output = line.last.split(" ")
    output_str = ""
    output.each do |str|
      str_first_hash.keys.each do |k|
        if str.length == k.length && (str.chars - k.chars) == []
          output_str += str_first_hash[k].to_s
        end
      end
    end
    output_sum += output_str.to_i
  end
  p output_sum
end

puzzle_input = File.open("puzzle_inputs/day-8.txt").readlines.map(&:chomp)
seven_segment_search(puzzle_input)
