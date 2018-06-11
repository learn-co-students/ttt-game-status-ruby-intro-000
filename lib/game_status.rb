# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def empty?(board)
  !board.all?{|index| position_taken?(board, index.to_i)}
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
  WIN_COMBINATIONS.detect do |win_combination|
    win_combination.all?{|win_index| board[win_index] == "X"} || win_combination.all?{|win_index| board[win_index] == "O"}
  end
end

def full?(board)
  board.all?{|position| position == "X" || position == "O"}
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  elsif (!full?(board) && !won?(board)) || won?(board)
    return false
  end
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if won?(board).kind_of?(Array)
    winning_array = won?(board).first
    board[winning_array]
  end
end
