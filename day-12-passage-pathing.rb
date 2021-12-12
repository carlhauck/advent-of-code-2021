def passage_pathing(puzzle_input)
  connections = puzzle_input
  @destination_hash = {}
  connections.map { |con| con.split("-") }.each do |a, b|
    if b != "start"
      @destination_hash[a] ||= []
      @destination_hash[a].push(b)
    end
    if a != "start"
      @destination_hash[b] ||= []
      @destination_hash[b].push(a)
    end
  end

  p count_paths("start")
  p count_paths_pt2("start")  
end

def count_paths(cave, small_visited=Hash.new)
  return 1 if cave == "end"
  if cave != "start" && cave != "end" && cave == cave.downcase
    small_visited[cave] = true
  end
  @destination_hash[cave].map do |dest|
    small_visited[dest] ? 0 : count_paths(dest, small_visited.dup)
  end.reduce(:+)
end

def count_paths_pt2(cave, small_visited=Hash.new, visited_twice=nil)
  return 1 if cave == "end"
  if cave != "start" && cave != "end" && cave == cave.downcase
    small_visited[cave] ? visited_twice = true : small_visited[cave] = true
  end
  @destination_hash[cave].map do |dest|
    small_visited[dest] && !visited_twice.nil? ? 0 : count_paths_pt2(dest, small_visited.dup, visited_twice)
  end.reduce(:+)
end

puzzle_input = File.open("puzzle_inputs/day-12.txt").readlines.map(&:chomp)
passage_pathing(puzzle_input)
