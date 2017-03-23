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
  winning_combination=nil
  winning_combination = WIN_COMBINATIONS.detect do |combination|
    board[combination[0]] != " " && board[combination[0]] == board[combination[1]] && board[combination[1]] == board[combination[2]]
  end
end

def full?(board)
  !board.any?{|i| i==" "}
end

def draw?(board)
  true if !won?(board) && full?(board)
end

def over?(board)
  true if won?(board) || draw?(board) || full?(board)
end

def winner(board)
  winning_combo = won?(board)
  if winning_combo
    board[winning_combo[0]]
  else
    nil
  end
end