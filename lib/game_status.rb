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
  winning_output = WIN_COMBINATIONS.each do |winning_streak|
   win_X = winning_streak.all? do |position|
    character = board[position] 
    character == "X"
   end
   win_O = winning_streak.all? do |position|
    character = board[position] 
    character == "O"
   end
   if win_X || win_O
    return winning_streak
   end
  end
  if winning_output == WIN_COMBINATIONS
    return false
  end
end
def full?(board)
  board.all? do |position|
  position == "X" || position == "O"
  end
end
def draw?(board)
  full?(board) && !won?(board)
end
def over?(board)
  won?(board) || draw?(board) || full?(board)
end
def winner(board)
  if won?(board) != false
    board[won?(board).first]
  end
end
