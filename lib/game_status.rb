# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|

  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]

  position_1 = board[win_index_1]
  position_2 = board[win_index_2]
  position_3 = board[win_index_3]

  if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
    return win_combination # return the win_combination indexes that won.
  else
    false
  end
end
  all_empty = board.all?{|i| i == " "}
  if all_empty == true
    return false
  end
end

def full?(board)
  board.none?{|i| i == " "}
end

def draw?(board)
  if (!won?(board)) && full?(board)
    return true
  end
  if (!won?(board)) && (!full?(board))
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  end
end

def winner(board)
  if (!won?(board))
    return nil
  end
  win_combination = won?(board)
  if board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X"
    return "X"
  end
  if board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
    return "O"
  end
end

board = ["X", "O", " ", " ", "O", " ", " ", "O", "X"]
win_combination = won?(board)
puts "Checkpoint 1"
puts "win_combination = #{win_combination}"
winner = winner(board)
puts "Checkpoint 2"
puts "Winner = #{winner}"
