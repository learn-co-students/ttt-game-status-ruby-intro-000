# Helper Method
require 'pry'
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
  [6,4,2]
]

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    board[win_combination[0]] != " " && board[win_combination[0]]== board[win_combination[1]] && board[win_combination[1]] == board[win_combination[2]]
  end
end

def full?(board)
  board.all? do |index|
    index != " "
  end
end

def draw?(board)
  if !won?(board) && over?(board)
    return true
  end
end

def over?(board)
  if full?(board) || won?(board)
    return true
  end
end

def winner(board)
  if won?(board)
    combo = won?(board)
    winner = board[combo[0]]
      return winner
  else
    return nil
  end
end
