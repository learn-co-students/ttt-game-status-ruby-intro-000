require 'pry'

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

def won?(board)
  WIN_COMBINATIONS.each do |winner_set|
    if position_taken?(board, winner_set[0]) &&
       board[winner_set[0]] == board[winner_set[1]] &&
       board[winner_set[0]] == board[winner_set[2]]
       return winner_set
    end
  end
  false
end

def full?(board)
  board.none? do |board_taken|
    if board_taken == " "
      true
    else
      false
    end
  end
end

def draw?(board)
  if !(won?(board)) && full?(board)
    true
  else
    false
  end
end

def over?(board)
  if won?(board) || draw?(board)
    true
  else
    false
  end
end

def winner(board)
  if won?(board)
  return board[won?(board)[0]]
else
  nil
  end
end
