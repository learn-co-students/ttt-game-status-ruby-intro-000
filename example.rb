  final_line = []
    WIN_COMBINATIONS.each do |win_combination|
      line = win_combination.all? do |position|
          position == "X"
        end
      if line == true
        final_line << win_combination
    end
  end
  print final_line
end

alternate option
all_x = win_combination.all? do |index|
  board[index] == "X"
end

all_o = win_combination.all? do |index|
  board[index] == "O"
end

if all_x || all_o
  return win_combination
end

# win_index_1 = win_combination[0]
# win_index_2 = win_combination[1]
# win_index_3 = win_combination[2]
#
# position_1 = board[win_index_1]
# position_2 = board[win_index_2]
# position_3 = board[win_index_3]
#
# if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
#   return win_combination # return the win_combination indexes that won.
# end


def won?(board)
  final_line = []
    WIN_COMBINATIONS.each do |win_combination|
      if win_combination[0] == win_combination[1] == win_combination [2]
        final_line << win_combination

def won?(board)
empty_array = []
  WIN_COMBINATIONS.each do |win_combination|
    win_combination.each do |position|
      if win_combination.all? do |position|
        position == "X"
      end
      empty_array << win_combination[position]
    end
  end
end
return empty_array
end

def won?(board)
nil.to_i
  WIN_COMBINATIONS.each do |win_combination|
    win_combination.each do |position|
      index = win_combination[position]
      if position_taken?(board, index) == false
          return false
        elsif win_combination.all? do |position|
            position == "X"
          end
      end
    end
  end
end
