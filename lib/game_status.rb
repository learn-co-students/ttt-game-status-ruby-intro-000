# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
  board[combo[0]] ==  board[combo[1]] &&
  board[combo[1]] ==  board[combo[2]] &&
  position_taken?(board, combo[0])
  end
end

def full?(board)
  board.all? do
    |token| token == "X" || token == "O"
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || won?(board) || draw?(board)
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [2,5,8],
  [1,4,7]

]
