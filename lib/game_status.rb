# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
board = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Last row
  [0,3,6], #
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
]
#return falsey for an empty board
def won?(board)
  return false if board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]

  WIN_COMBINATIONS.each do |win_combo|
    if (board[win_combo[0]] == "X" && board[win_combo[1]] == "X" && board[win_combo[2]] == "X" ) || (board[win_combo[0]] == "O" && board[win_combo[1]] == "O" && board[win_combo[2]] == "O" )
      return win_combo
    end
  end

  false


end

def full?(board)
  counter = 0
  board.each do |i|
    if i == "X" || i == "O"
      counter += 1
    end
  end

  (counter == 9)? true : false
  # if counter == 9
  #   return true
  # else
  #   false
  # end

end

def draw?(board)
  if full?(board) && !won?(board)
    true
  else
    false
  end
end

def over?(board)
  if draw?(board) || won?(board)
    true
  end
end

def winner(board)
  if won?(board)
    winner_board = won?(board)
    return board[winner_board[0]]
  end
end
