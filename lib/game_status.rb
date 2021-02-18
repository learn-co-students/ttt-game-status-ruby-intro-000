# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

#     board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X"


def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    position_taken?(board, combo[0]) && position_taken?(board, combo[1]) && position_taken?(board, combo[2]) && board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]]
  end
end

# define #won?(board)
#  WIN_COMBINATIONS.detect do |combo|
#    board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && board[combo[2]] != " "
#  end
#end

# define #full?(board) method
def full?(board)
  board.all? { |position| position != " " }
end

# define #draw?(board) method
def draw?(board)
  if full?(board) && !won?(board)
    true
  elsif !full?(board) && !won?(board)
    false
  else
    false
  end
end

# define #over?(board) method
def over?(board)
  won?(board) || draw?(board) || full?(board)
end

# define #winner(board method)
def winner(board)
  won?(board) ? board[won?(board)[0]] : nil
end
