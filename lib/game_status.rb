# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  #bottom row
  [0,3,6],  #left column
  [1,4,7],  #middle column
  [2,5,8],  #right column
  [0,4,8],  #diagonal
  [6,4,2]  #diagonals
]
def won?(board)
  WIN_COMBINATIONS.detect do |win|
        board[win[0]] == board[win[1]] &&
        board[win[1]] == board[win[2]] &&
        position_taken?(board, win[0])
    end
end

def full?(board)
board.all?{|token| token == "X" || token == "O"}
end

def draw?(board)
board.all?{|token| token == "X" || token == "O" || token == "X" && "0"}
  !won?(board)
end

def over?(board)
won?(board) || full?(board)
end

def winner(board)
    if winner = won?(board)
       board[winner.first]
end
end
