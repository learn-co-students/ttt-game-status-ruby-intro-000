# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6],
  ]

def won?(board)
  WIN_COMBINATIONS.detect do |com|
    board[com[0]] == board[com[1]] &&
    board[com[0]] == board[com[2]] &&
    position_taken?(board, com[1])
  end
end

def full?(board)
  board.none? do |spot|
    spot.nil? || spot == " "
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || won?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    winner = board[won?(board)[0]]
  end
end
