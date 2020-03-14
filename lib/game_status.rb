# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
[0,1,2], #Top_row
[3,4,5], #Middle_row
[6,7,8], #Bottom_row
[0,3,6], #Vert_left
[1,4,7], #Vert_middle
[2,5,8], #Vert_right
[0,4,8], #Diag_left
[2,4,6], #Diag_right
]

#won_Method
def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
      return win_combination
    end
  end
  return false
end

#full?_method
def full?(board)
    board.all? { |i| i == "X" || i=="O" }
  end

#draw?_method
def draw?(board)
  if full?(board) == true && won?(board) == false
    true
  elsif won?(board) == false && full?(board) == false
    false
  else won?(board)
    false
  end
end

#over?_method
def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  end
end

#winner_method
def winner(board)
  if won?(board)
    return board[won?(board) [0]]
  end
end
