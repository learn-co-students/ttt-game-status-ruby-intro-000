WIN_COMBINATIONS = [
  [0, 1, 2], 
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def won?(board)
  WIN_COMBINATIONS.each do | combination |
    win_index_1 = combination[0]
    win_index_2 = combination[1]
    win_index_3 = combination[2]
   
    position_1 = board[win_index_1] 
    position_2 = board[win_index_2] 
    position_3 = board[win_index_3] 
   
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return combination 
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return combination
    end
  end
  return false
end

def full?(board)
  board.all? do | element |
    element == "X" || element == "O"
  end
end

def draw?(board)
  if (full?(board) && !won?(board))
    return true
  elsif ((!won?(board) && !full?(board)) || won?(board))
    return false
  end
end

def over?(board)
  return true if won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if (won?(board))
    winning_combination = won?(board)
    position_1 = board[winning_combination[0]] 
    if (position_1 == "X")
      return "X"
    elsif (position_1 == "O")
      return "O"
    else 
      return nil
    end
  end
end
