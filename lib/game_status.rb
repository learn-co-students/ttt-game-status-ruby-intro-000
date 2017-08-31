# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # Left row
  [1,4,7],  # Middle row
  [2,5,8],  # Right row
  [0,4,8],  # Diagonal row
  [2,4,6]  # Diagonal row
]

# won? method
def won?(board)
  WIN_COMBINATIONS.detect do |move|
    board[move[0]] == board[move[1]] &&
    board[move[1]] == board[move[2]] &&
    position_taken?(board, move[0])
  end
end

# full? method
def full?(board)
  board.all?{|move| move == "X" || move =="O"}
end

# draw? method
def draw?(board)
  !(won?(board)) && full?(board)
end

# over? method
def over?(board)
  won?(board) || draw?(board) || full?(board)
end

# winner method  accept a board and return the token, "X" or "O" that has won the game given a winning board
def winner(board)
  if won?(board)
    board[won?(board).first]
  end
end
