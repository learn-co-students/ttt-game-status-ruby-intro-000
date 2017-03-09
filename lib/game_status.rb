# Helper Method
def position_taken? board, index
  !(board[index].nil? || board[index] == " " || board[index] == "")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], # Top row
  [3, 4, 5], # Middle row
  [6, 7, 8], # Bottom row
  [0, 3, 6], # Right column
  [1, 4, 7], # Middle column
  [2, 5, 8], # Left column
  [0, 4, 8], # Right diagonal
  [2, 4, 6], # Left diagonal
]

def won? board
  WIN_COMBINATIONS.any? do |x|
    return x if x.all? { |i| board[i] == "X" }
    return x if x.all? { |i| board[i] == "O" }
  end
end

def full? board
  board.none? { |i| i.nil? || i == " " || i == ""}
end

def draw? board
  !won?(board) && full?(board)
end

def over? board
  won?(board) || draw?(board) || full?(board)
end

def winner board
  return nil if !won?(board)
  return "X" if won?(board).all? { |i| board[i] == "X" }
  return "O" if won?(board).all? { |i| board[i] == "O" }
end
