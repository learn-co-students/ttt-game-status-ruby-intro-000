require "pry"# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #left column
  [1,4,7], #middle column
  [2,5,8], #right column
  [0,4,8], #top left to bottom right diagonal
  [6,4,2], #bottom left to top right diagonal
]

def won?(board)
  WIN_COMBINATIONS.detect do |combo|

    board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] &&  position_taken?(board, combo[0])
        end
end

def full?(board)
  board.none? do |space|
    space == " " || space.nil?
  end
end

def draw?(board)
   full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  else
    nil
  end
end
