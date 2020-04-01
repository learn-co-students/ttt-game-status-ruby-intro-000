# Helper Method takes a board and an index as arguments and
# returns true or false based on whether that position on the board has been filled
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
  [6,4,2]
]

def won?(board)
 WIN_COMBINATIONS.detect do |combo|
   board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

def full?(board) #return true if every element in the board contains either an "X" or an "O"
  board.all? { |index| index == "X" || index == "O" }
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  elsif !won?(board) && !full?(board)
    return false
  else won?(board)
    return false
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
#  index = []
#  index = won?(board)
#  if index == false
#    return nil
#  else
#    if board[index[0]] == "X"
#      return "X"
#    else
#      return "O"
#    end
  end
end
