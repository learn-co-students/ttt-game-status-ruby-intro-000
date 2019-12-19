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
    board[index[0]] == board[index[1]] &&
    board[index[1]] == board[index[2]] &&
    position_taken?(board, index[0])
  end
end

def full?(board)
  board.none?{|tolken| tolken == "" || tolken == " "}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if winner = won?(board)
    board[winner.first]
  end
end
