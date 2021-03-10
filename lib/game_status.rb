# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def won?(board)
 WIN_COMBINATIONS.each do |win_combination|
  
    index_1 = win_combination[0]
    index_2 = win_combination[1]
    index_3 = win_combination[2]
    
   if board[index_1] == "X" && board[index_2] == "X" && board[index_3] == "X" || board[index_1] == "O" && board[index_2] == "O" && board[index_3] == "O"
return win_combination
  end
  end
  return false
end

def full?(board)
  full_value = board.all? { |value| value == "X" || value == "O"}
  return full_value
end

def draw?(board)
  if (!won?(board) && full?(board))
    return true 
  end
  return false
end
 
def over?(board)
  if (won?(board) || draw?(board) || full?(board))
    return true 
  end
end 

def winner(board)
  if won?(board)
  winning_combination = won?(board)
  winning_space = winning_combination[0] 
  if board[winning_space] == "X"
    return "X"
  else
    return "O"
  end
end
end