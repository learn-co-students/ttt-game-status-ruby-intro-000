# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], # top row
  [3, 4, 5], # middle row
  [6, 7, 8], # bottom row
  [0, 3, 6], # left column
  [1, 4, 7], # middle column
  [2, 5, 8], # right column
  [0, 4, 8], # leading diagonal
  [2, 4, 6]  # other diagonal
]

def won?(board)
  WIN_COMBINATIONS.detect do |combination|
    combination.all?{|i| board[i]=="X"} || combination.all?{|i| board[i] == "O"}
  end
end

def full?(board)
  board.all? {|value| value=="X" || value=="O" }
end

def draw?(board)
  (!won?(board) && full?(board))
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end
