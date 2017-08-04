# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [2, 4, 6],
  [0, 4, 8]
]

def won?(board)
  win = WIN_COMBINATIONS.each { |win|
    if board[win[0]] == "X" && board[win[1]] == "X" && board[win[2]] == "X"
      return win
    elsif board[win[0]] == "O" && board[win[1]] == "O" && board[win[2]] == "O"
      return win
    end
  }
  return false
end

def full?(board)
  if board.include?(" ")
    return false
  else
    return true
  end
end

def draw?(board)
  if won?(board) != false && full?(board) == true
    return false
  elsif won?(board) == false && full?(board) == false
    return false
  elsif won?(board) == false && full?(board) == true
    return true
  end
end

def over?(board)
  if won?(board) != false || draw?(board) == true || full?(board) == true
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board) != false
    return board[won?(board)[0]]
  end
end
