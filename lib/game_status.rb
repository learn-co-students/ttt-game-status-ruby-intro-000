def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

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

def won?(board)
  WIN_COMBINATIONS.detect do | win_combination |
    ( board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X") || \
    ( board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O")
  end
end

def full?(board)
  board.select! do | position |
    (position == "O" || position == "X")
  end
  board.length == 9
end

def draw?(board)
  full?(board) && !(won?(board))
end

def over?(board)
  (won?(board) != nil) || (full?(board) == true)
end

def winner(board)
  win_combination = won?(board)
  unless win_combination == nil
    board[win_combination[0]]
  end
end
