require 'pry'

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2],  # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # Left column
  [1,4,7],  # Middle column
  [2,5,8],  # Right column
  [0,4,8],  # Left diagonal
  [2,4,6]   # Right diagonal

  # An array for each win combination
]



def won?(board)

  WIN_COMBINATIONS.each do |combo|

    if [board[combo[0]],board[combo[1]],board[combo[2]]] == ["X","X","X"] || [board[combo[0]],board[combo[1]],board[combo[2]]] == ["O","O","O"]
      return combo
    end

  end
  
  false
end


def full?(board)

  board.all? do |token| 
    token == "X" || token == "O"
  end

end


def draw?(board)

  full?(board) && !won?(board)
    
end


def over?(board)
  draw?(board) || won?(board)
end


def winner(board)
  if [board[won?(board)[0]],board[won?(board)[1]],board[won?(board)[2]]] == ["X", "X", "X"]
    "X"
  elsif [board[won?(board)[0]],board[won?(board)[1]],board[won?(board)[2]]] == ["O", "O", "O"]
    "O"
  end
end 
