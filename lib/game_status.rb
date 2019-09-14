# Helper Method
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2],
]

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  WIN_COMBINATIONS.each {|winCombo|

  if (board[winCombo[0]] == "X" && board[winCombo[1]] == "X" && board[winCombo[2]] == "X")
    return winCombo
  elsif (board[winCombo[0]] == "O" && board[winCombo[1]] == "O" && board[winCombo[2]] == "O")
    return winCombo
  end
  }
  return false
end

def full?(board)
  board.all? { |token|  token == "X" || token == "O"}
end

def draw?(board)
  full?(board) == true && won?(board) == false
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  winningIndices = won?(board)

  if (winningIndices != false)
    return board[winningIndices[0]];
  else
    return nil
  end
end
