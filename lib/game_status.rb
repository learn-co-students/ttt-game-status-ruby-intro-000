# Helper Method
require "pry"
board = [" "," "," "," "," "," "," "," "," "]

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2], #Top row
  [3,4,5], #Middle row
  [6,7,8], #Bottom row
  [0,3,6], #Left column
  [1,4,7], #Middle column
  [2,5,8], #Right column
  [0,4,8], #Left start diagonal
  [2,4,6]  #Right start diagonal
]

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
  if (board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X") || (board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O")
    return win_combination
  else
    false
    end
  end
end

def full?(board)
  board.none? {|x| x == " "}
end


def draw?(board)
  if !won?(board) && full?(board)
    true
  elsif won?(board)
    false
  end
end

def over?(board)
  if won?(board) ||full?(board) ||draw?(board)
    true
  else
    false
  end
end

def winner(board)
  WIN_COMBINATIONS.detect do |win_combination|
    if board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X"
     return "X"
    elsif board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
      return "O"
    else
      false
    end
  end
end
