def score_illegal_syntax(lines)
  syntax_scores = {
    ")" => 3,
    "]" => 57,
    "}" => 1197,
    ">" => 25137,
  }

  score = 0

  lines.each do |line|
    stack = []
    line.each_char.with_index do |char, index|
      if index == line.length - 1
        break
      elsif ["(", "[", "{", "<"].include? char
        stack.push(char)
      elsif stack.last == "(" && char == ")" || stack.last == "[" && char == "]" || stack.last == "{" && char == "}" || stack.last == "<" && char == ">"
        stack.pop
      elsif stack.empty? || stack.last == "(" && char != ")" || stack.last == "[" && char != "]" || stack.last == "{" && char != "}" || stack.last == "<" && char != ">"
        score += syntax_scores[char]
        break
      end
    end
  end
  score
end

puzzle_input = File.open("puzzle_inputs/day-10.txt").readlines.map(&:chomp)
p score_illegal_syntax(puzzle_input)
