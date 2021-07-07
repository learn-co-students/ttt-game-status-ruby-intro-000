# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " " || board[index] == "")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # middle row
  [6,7,8], # bottom row
  [0,3,6], # left column
  [1,4,7], # middle column
  [2,5,8], # right columnlib
  [0,4,8], # left diagonal
  [2,4,6]  # right diagonal
]

$winner_X_O =

def won?(board)
  WIN_COMBINATIONS.each do | win_combination |
    if (position_taken?(board, win_combination[0]) && position_taken?(board, win_combination[1]) && position_taken?(board, win_combination[0])) &&
        ((board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X") ||
          (board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"))
            $winner_X_O = board[win_combination[0]]
            return win_combination
    else
            false
    end
  end
  return false
end

def full?(board)
  full_array = board.select {| elem | elem == " " || elem == "" or elem == nil}
  if full_array.length > 0
      return false
  else
      return true
  end
end

def draw?(board)
  if won?(board) || !full?(board)
    return false
  else
    return true
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
      return $winner_X_O
      else return nil
  end
end
