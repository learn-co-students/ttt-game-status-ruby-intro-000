# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && combo.all?{|position| position_taken?(board, position)}
  end

#combo.all? do |position|
#  position_taken?(board, position)
#end
#combo.all?{|position| position_taken?(board, position)}

  #iterate on WIN_COMBINATIONS
  #all three of the winning combination are position_taken?
  #and
  #all three are the same token
  #and all three are a token
end


def full?(board)
  !board.any?{|position| position == " " || position == "" || position = nil}
end


def draw?(board)
  full?(board) && !won?(board)
end


def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
#if winning combo exists, return the token in one of those cells.
  if won?(board)
    board[won?(board)[0]]
  end
end
