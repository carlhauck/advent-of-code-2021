def score_incomplete_syntax(lines)
  syntax_scores_hash = {
    "(" => 1,
    "[" => 2,
    "{" => 3,
    "<" => 4,
  }

  scores_hash = {}

  lines.each do |line|
    stack = []
    line_score = 0
    index = 0

    until index == line.length
      char = line[index]
      if ["(", "[", "{", "<"].include? char
        stack.push(char)
      elsif stack.last == "(" && char == ")" || stack.last == "[" && char == "]" || stack.last == "{" && char == "}" || stack.last == "<" && char == ">"
        stack.pop
      elsif stack.empty? || stack.last == "(" && char != ")" || stack.last == "[" && char != "]" || stack.last == "{" && char != "}" || stack.last == "<" && char != ">"
        break
      end
      index += 1
    end

    if index == line.length
      until stack.empty?
        line_score = line_score * 5 + syntax_scores_hash[stack.pop]
      end
      scores_hash[line] = line_score
    end
  end
  
  scores_hash.values.sort[scores_hash.length / 2]
end

puzzle_input = File.open("puzzle_inputs/day-10.txt").readlines.map(&:chomp)
p score_incomplete_syntax(puzzle_input)
