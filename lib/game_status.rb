# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def winning_combo?(board, win_combo, token)
  win_combo.all? do |spot|
    board[spot] == token
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
    winning_combo?(board, win_combo, 'X') || winning_combo?(board, win_combo, 'O')
  end
end

def full?(board)
  board.all? do |spot|
    spot != " " && spot != ""
  end
end

def draw?(board)
  full?(board) && !(won?(board))
end

def over?(board)
  full?(board) || won?(board)
end

def winner(board)
  winning_combo = won?(board)
  if winning_combo
    return board[winning_combo[0]]
  else
    return nil
  end
end
