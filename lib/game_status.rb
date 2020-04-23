# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # bottom row
  [0,3,6], # Left vertical row
  [1,4,7], # middle vertical row
  [2,5,8], # Right vertical row
  [0,4,8], # first diagonal row
  [2,4,6] # second diagonal row
]

def won?(board)
  WIN_COMBINATIONS.each {|win_combo|
    index_0 = win_combo[0]
    index_1 = win_combo[1]
    index_2 = win_combo[2]

    position_1 = board[index_0]
    position_2 = board[index_1]
    position_3 = board[index_2]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
    end
  }
  return false
end

def full?(board)
  board.all? do |index|# if all indexes of the board are full by either X or O
    index == "X" || index == "O"
  end
end

def draw?(board)
  if !won?(board) && full?(board) # no winning combinations but board is full.
    return true
  else
    return false
  end
end

def over?(board)#the game is over when either there is a win or the board is full or the game is a draw
  if won?(board) || full?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner (board)
  index = []
  index = won?(board)
  if index == false
    return nil
  else
    if board[index[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end
