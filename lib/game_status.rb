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

#  returns an array of matching indexes for a top row win
#  returns an array of matching indexes for a middle row win
#  returns an array of matching indexes for a bottom row win
#  returns an array of matching indexes for a left column win
#  returns an array of matching indexes for a middle column win
#  returns an array of matching indexes for a right column win
#  returns an array of matching indexes for a left diagonal win
#  returns an array of matching indexes for a right diagonal win


def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    # from WIN_COMBINATIONS, take each array, then
    # look separately the first, second and third element and call it an index
    # win_combo[0] takes a look at the first element of each nested array in the big array of WIN_COMBINATIONS
    index_0 = win_combo[0]
    index_1 = win_combo[1]
    index_2 = win_combo[2]

    # then takes the submitted board and looks at the space corresponding to the number in the board
    # **** how does the computer method 'board' and argument 'num' refer to a position?
    # **** does it translate to, "within board, this number is position_1"?
    position_1 = board[index_0]
    position_2 = board[index_1]
    position_3 = board[index_2]

    # if all 3 positions have the same sign, then it's a win
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
    end
  end
    return false
end




def full?(board)
    # returns true for a draw
    # returns false for an in-progress game
    board.all? do |index|
    index == "X" || index == "O"
    # ***** why does the below give "returns false for an in-progress game"
    # I know why it FAILS returns true for a draw (because not all nil could be in progress)
    # index == !nil
    # If the board is not all empty or not all nil, then it might not be in progress or a draw
    # is a draw considered an in-progress game?
  end
 end

def draw?(board)
# returns true for a draw
# returns false for a game won in the first row
# returns false for a won game diagonaly
#returns false for an in-progress game

WIN_COMBINATIONS.each do |win_combo|
  index_0 = win_combo[0]
  index_1 = win_combo[1]
  index_2 = win_combo[2]

  position_1 = board[index_0]
  position_2 = board[index_1]
  position_3 = board[index_2]

  if position_1 == "X" && position_2 == "X" && position_3 == "X"
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return false
# ***** why doesn't this satisfy, is it just not what the spec was looking for?
# returns false for a game won in the first row (FAILED - 1)
# returns false for a won game diagonaly (FAILED - 2)
    else
      return true
    end
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  # returns true for a draw
  # returns true for a won game when the board is full
  # returns true for a won game when the board is not full
  # returns false for an in-progress game
  if won?(board)
    return true
  elsif full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  pickedthree = won?(board)
#  if draw?(board) == true
#  return nil
  # else
# syntax needs to be
# if condition
#   stuff here
# elsif new condition
#  stuff here
# else
#  this
# end
  if won?(board) == false
  return nil
    # this says if there was no winner, then consider it a draw
  elsif board[pickedthree[0]] == "X"
     return "X"
  else
     return "O"
end
end
