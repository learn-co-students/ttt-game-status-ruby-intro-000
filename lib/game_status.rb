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

WIN_COMBINATIONS.find do |position|
  board[position[0]] == board[position[1]] && board[position[1]] == board[position[2]] &&  position_taken?(board, position[0])
end
end

def full?(board)
  board.all? do |spot|
spot == "X" || spot == "O"
  end
end

def draw?(board)
!won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
if winning_position = won?(board)
  board[winning_position.first]
end
end




#  if won?(board).include?(X)
#  print "X"
#else
#  print "O"
#end
#winner(board)
#end
