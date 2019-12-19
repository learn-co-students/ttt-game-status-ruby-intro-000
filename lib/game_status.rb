# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0, 1, 2], #Win Top Row [0]
  [3, 4, 5], #Win Middle Row [1]
  [6, 7, 8], #Win Bottom Row [2]

  [0, 3, 6], #Win Left Collumn [3]
  [1, 4, 7], #Win Middle Collumn [4]
  [2, 5, 8], #Win Right Collumn [5]

  [0, 4, 8], #Win Diagonal 1 [6]
  [2, 4, 6]  #Win Diagonal 2 [7]
]

def won?(board)
  WIN_COMBINATIONS.detect do |index|
    board[index[0]] == "X" && board[index[1]] == "X" && board[index[2]] == "X" ||
    board[index[0]] == "O" && board[index[1]] == "O" && board[index[2]] == "O"
  end
end

def full?(board)
  board.none?{|tolken| tolken == "" || tolken == " "}
end

def draw?(board)
  full?(board) && won?(board) == nil
end

def over?(board)
  won?(board) != nil || draw?(board)
end

def winner(board)
  if won?(board) != nil && won?(board).any?{|index| board[index] == "X"}
    "X"
  elsif won?(board) != nil && won?(board).any?{|index| board[index] == "O"}
    "O"
  else
    nil
  end
end
