# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top
  [3,4,5], #Middle
  [6,7,8], #bottom
  [0,3,6], #left
  [1,4,7], #midddle column
  [2,5,8], #right
  [0,4,8], #left diagonal
  [2,4,6]  #right diagonal
]

def won?(board)

  if(!board.include?("X") && !board.include?("Y"))
    return nil
  end

  WIN_COMBINATIONS.each do |combination|
    index1 = combination[0]
    index2 = combination[1]
    index3 = combination[2]
    arr = [index1, index2, index3]
    if (board[index1] == "X" && board[index2] == "X" && board[index3] == "X")
      return arr
    end
    if (board[index1] == "O" && board[index2] == "O" && board[index3] == "O")
      return arr
    end
  end
  return false
end

def full?(board)
  if (board.include?(" "))
    return false
  else
    return true
  end
end

def draw?(board)
  if (full?(board) && !won?(board))
    return true
  end
  return false
end

def over?(board)
  if(draw?(board) || won?(board))
    return true
  else
    return false
  end
end

def winner(board)
    if(winner = won?(board))
      return board[winner[0]]
    else
      return nil
    end
end
