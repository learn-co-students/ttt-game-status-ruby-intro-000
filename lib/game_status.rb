# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # middle row
  [6,7,8], # bottom row
  [0,3,6], # left column
  [1,4,7], # middle column
  [2,5,8], # right column
  [0,4,8], # top left -> bot right diag
  [2,4,6]  # bot left -> top right diag
]

def matching_tokens?(set)
  if (set.all? {|token| token == "X"} || set.all? {|token| token == "O"})
    return true
  else return false
  end
end

def won?(board)
  win = false
  WIN_COMBINATIONS.each {|combination|
    win_position1 = combination[0]
    win_position2 = combination[1]
    win_position3 = combination[2]
    check = [board[win_position1], board[win_position2], board[win_position3]]
      if (matching_tokens?(check))
        win = combination
      end
  }
  return win
end

def full?(board)
  if (board.detect{|token| token == " "})
    return false
  else return true
  end
end

def draw?(board)
  if (!won?(board) && full?(board))
    return true
  else return false
  end
end

def over?(board)
  if (won?(board) || draw?(board)) #only used won? and draw? because draw? already checks for full?
    return true
  else return false
  end
end

def winner(board)
  if (over?(board) && !draw?(board))
    return board[won?(board)[0]]
  end
end
