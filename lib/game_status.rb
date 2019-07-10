# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], # Top
  [3,4,5], # Middle horizontal
  [6,7,8], # Bottom
  [0,3,6], # Left
  [1,4,7], # Middle vertical
  [2,5,8], # Right
  [0,4,8], # Right Diagonal
  [2,4,6]  # Left Diagonal
]

def won?(board)
  if board.all? { |place| place == ' ' }
    return false
  end
  for combo in WIN_COMBINATIONS
    if combo.all? { |index| board[index] == 'X' }
      return combo
    elsif combo.all? { |index| board[index] == 'O' }
      return combo
    end
  end
  false
end

def full?(board)
  board.all? { |place| place != ' ' }
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  if won?(board)
    return true
  end

  draw?(board) || full?(board)
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end
