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
  winner = []
  WIN_COMBINATIONS.each do |win_combination|
    if win_combination.all? {|index| board[index] == "X"} || win_combination.all? {|index| board[index] == "O"}
      winner = win_combination
      return winner
    elsif board.all? {|x| x == " "}
      return false
    elsif board.none? {|x| x == " "} && !win_combination.all? {|index| board[index] == "X"} && !win_combination.all? {|index| board[index] == "O"}
      return false
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
