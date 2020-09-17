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
require "pry"
# def won?(board)
#   WIN_COMBINATIONS.detect do |combinations|
#
# board[combinations[0]] == board[combinations[1]] && board[combinations[1]] == board[combinations[2]] && position_taken?(board, combinations[0])
#
#  end
# end

def won?(board)
  solution = false
  WIN_COMBINATIONS.each do |combinations|
    if board[combinations[0]] == board[combinations[1]] && board[combinations[1]] == board[combinations[2]] && position_taken?(board, combinations[0])
  return  solution = combinations
  end
 end
 solution
end

def full?(board)
  board.all? do |full|
    full == "X" || full == "O"
# else !position_taken?(board, index)
#   return false
  end
 end
#end

# def draw?(board)
#   if won?(board) !== combinations && full?(board) !== true
#     return true
#   else
#     false
#   end
# end

def draw?(board)
  if !won?(board) && full?(board)
    true
  else !won?(board) && !full?(board) || won?(board)
    false
  end
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
    return true
  else
    false
  end
end

# def winner?(board)
#
# end
