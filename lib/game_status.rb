# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

def won?(board)
  WIN_COMBINATIONS.each {|win|
  index_0 = win[0]
  index_1 = win[1]
  index_2 = win[2]
  
  position_1 = board[index_0]
  position_2 = board[index_1]
  position_3 = board[index_2]
  
  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return win
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win 
  end 
  }
  return FALSE
end

def full?(board)
  board.all? {|index| index == "X" || index == "O"}
end
    
def draw?(board)
  if !won?(board) && full?(board)
    return TRUE
  else
    return FALSE
  end
end

def over?(board)
  if draw?(board) || won?(board) || full?(board)
    return TRUE
  else
    return FALSE
  end
end

def winner(board)
  # Return X when X won, O when O won, nil when no winner. If winning combinations is all X then X wins, If winning combinations is all O, then O wins. 
 answer = won?(board)
  if answer == FALSE
    return nil
  else
    if board[answer[0]] == "X"
    return "X"
  else
    return "O"
  end
end
end
