# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.each do |x|
    if board[x[0]] == "X" && board[x[1]] == "X" && board[x[2]] == "X" || board[x[0]] == "O" && board[x[1]] == "O" && board[x[2]] == "O"
      return x
      end
  end
        return false
end

def full?(board)
  if board.any? { |x|
      x == " " }
        return false
  else
    return true
  end
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  else
    return false
  end
end

def over?(board)
  if draw?(board) == true || full?(board) == true || won?(board) == true
    return true
  else
    return false
  end
end

def winner(board)
  WIN_COMBINATIONS.each do |x|
    if board[x[0]] == "X" && board[x[1]] == "X" && board[x[2]] == "X" || board[x[0]] == "O" && board[x[1]] == "O" && board[x[2]] == "O"
      return board[x[0]]
      end
  end
        return nil
end
