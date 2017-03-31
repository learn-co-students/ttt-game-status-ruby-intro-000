# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Diag 1
  [2,4,6] # Diag 2
]

def won?(board)
  winner = false
  WIN_COMBINATIONS.each do |win_combo|
    if (board[win_combo[0]] == "X" && board[win_combo[1]] == "X" &&
      board[win_combo[2]] == "X") || (board[win_combo[0]] == "O" &&
      board[win_combo[1]] == "O" && board[win_combo[2]] == "O")
      winner = win_combo
    end
  end
  winner
end

def full?(board)
  (0..8).all? do |index|
    position_taken?(board, index)
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || won?(board) || draw?(board)
end

def winner(board)
  win = won?(board)
  if win
    board[win[0]]
  end
end
