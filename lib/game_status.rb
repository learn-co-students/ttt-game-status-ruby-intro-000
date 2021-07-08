# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " " || board[index] == "")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],  #top row win
  [3,4,5],  #middle row win
  [6,7,8],  #bottom row win
  [0,3,6],  #first columnn
  [1,4,7],  #second columnn
  [2,5,8],  #third columnn
  [0,4,8],  #diagonal win
  [2,4,6]  #other diagonal win
]

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

#failing to return false for an in-progress game
def full?(board)
  board.all? do |pos|
    pos == "X" || pos == "O"
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

#failing to return false for an in-progress game
def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    win_array = won?(board)
    if board[win_array[0]] == "X"
      "X"
    else
      "O"
    end
  else
    nil
  end

  #master solutions
  #if winning_combo = won?(board)
  # board[winning_combo.first]

end
