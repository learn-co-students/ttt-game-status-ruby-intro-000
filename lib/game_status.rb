# Helper Method
require "pry"
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]


WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Top left to bottom right
  [2,4,6]] # Top right to bottom left

  board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]

def over?(board) #overthough this one ...
won?(board) || draw?(board)
end

def won?(board)
  WIN_COMBINATIONS.each do |winner|
    if board[winner[0]] == board[winner[1]] && board[winner[1]] == board[winner[2]] && board[winner[0]] != " "
      return winner
    end
  end
  return false
end

draw_board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]

def full?(board)

!board.any? { |space|  space == " " }
end

def draw?(board)
  !won?(board) && full?(board)
end

x_win_diagonal = ["X", " ", " ", " ", "X", " ", " ", " ", "X"]

def winner (board)




if index = won?(board)
    board [index.first]

end
end
#binding.pry
  #if won?(board) nil &&
  #  true
    #all position on the board are taken and no one has won then true
  #end
  #return false



# Define your WIN_COMBINATIONS constant
