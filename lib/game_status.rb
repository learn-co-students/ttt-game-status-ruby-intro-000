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
  WIN_COMBINATIONS.each do |winning_streak|
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
   until win_X || win_O
      return false
   end
  end
end