@bingo_calls = File.read("puzzle_inputs/day-4-bingo-call.txt").split(",").map(&:to_i)
@boards = File.read("puzzle_inputs/day-4-boards.txt").split("\n\n")
@boards_array = []
@win_combos = [(0..4).to_a, (5..9).to_a, (10..14).to_a, (15..19).to_a, (20..24).to_a, [0,5,10,15,20], [1,6,11,16,21], [2,7,12,17,22], [3,8,13,18,23], [4,9,14,19,24]]

def prep_boards
  @boards.each do |b|
    @boards_array << b.split(/\s{1,2}/).map { |num| { num.to_i => false } }
  end
end

def calculate_final_score(winning_number, board)
  unmarked = board.select { |sq| sq.values.first == false }.map { |sq| sq.keys.first }
  p unmarked.sum * winning_number
end

def check_for_win(winning_number)
  @win_combos.each do |combo|
    @boards_array.each_with_index do |board, index|
      if combo.all? { |num| board[num].values.first == true }
        calculate_final_score(winning_number, board) if @boards_array.length == 1
        @boards_array.delete_at(index)
      end
    end
  end
end

def make_bingo_calls
  @bingo_calls.each_with_index do |num, index|
    @boards_array.each do |b|
      b.each { |sq| sq[num] = true if sq.has_key?(num) }
    end
    check_for_win(num) if index >= 5 && @boards_array.length > 0
  end
end

prep_boards
make_bingo_calls
