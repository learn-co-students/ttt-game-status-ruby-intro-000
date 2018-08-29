# Helper Method
def position_taken?(board, pos)
  !(board[pos].nil? || board[index] == " ")
end

def won?(board)
  WIN_COMBINATIONS.each do |win|
    if board[win[0]] == "X" && board[win[1]] == "X" && board[win[2]] == "X"
      return win
    elsif
      board[win[0]] == "O" && board[win[1]] == "O" && board[win[2]] == "O"
        return win
    end
  end
    return false
  end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # middle rows
  [6,7,8], # bottom row
  [0,3,6], # left column
  [1,4,7], # middle column
  [2,5,8], # right column
  [0,4,8], # diagonal one
  [2,4,6] # diagonal two
]

def full?(board)
  return true unless board.include?(" ")
end

def draw?(board)
  if !full?(board) && !won?(board)
    return false
  elsif won?(board)
   return false
 elsif full?(board) && !won?(board)
   return true
  end
end

def over?(board)
  return true while (draw?(board) || won?(board))
  return false
end

def winner(board)
  if won?(board) && board[won?(board)[0]]  == "X"
    return "X"
  elsif won?(board) && board[won?(board)[0]] == "O"
    return "O"
  end
  return nil
end
