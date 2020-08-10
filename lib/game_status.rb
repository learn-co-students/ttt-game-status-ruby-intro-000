# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # middle row
  [6,7,8], # bottom row
  [0,3,6], # first column
  [1,4,7], # second column
  [2,5,8], # third column
  [0,4,8], # diagonal top left to bottom right
  [2,4,6] # diagonal bottom left to top right
]

def won?(board)
  WIN_COMBINATIONS.find do |win_combination|
      board[win_combination[0]] != " " && board[win_combination[0]] == board[win_combination[1]] && board[win_combination[1]] == board[win_combination[2]]
  end
end

def full?(board)
  board.none?{|i| i == " "}
end

def draw?(board)
  if full?(board) == true && won?(board) == false
      return true
    else false
  end
end

def over?(board)
  if won?(board) == true || draw?(board) == true || full?(board) == true
    return true
  else false
  end
end
