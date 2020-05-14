# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  # ETC, an array for each win combination
  [6,7,8],
  [0,3,6], [1,4,7], [2,5,8],
  [0,4,8], [2,4,6]
  ]

def won?(board)
  WIN_COMBINATIONS.detect do |comb|
     board[comb[0]] == board[comb[1]] && board[comb[1]] == board[comb[2]] &&
     position_taken?(board, comb[0])
  end
end

def full?(board)
  board.all? do |index|
    index == "X" || index == "O"
end
end

def draw?(board)
  full?(board)  && !won?(board)
end

def over?(board)
  full?(board) || won?(board)
end

def winner(board)
  if win = won?(board)
    board[win.first]
  end
end
