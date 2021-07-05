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
  [6,4,2]
]

def won?(board)
  # check to see if it's empty, first
  if empty?(board)
    return false
  end

  WIN_COMBINATIONS.each do |win_combination|

    # get indexes of win_combination
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    # load the values of the board positions at those indexes
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    #check if they all have the same entry
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination # return the win_combination indexes that won.
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end

  end # WIN_COMBINATIONS.each

  if full?(board)
    return false
  end

end # win?

def full?(board)
  board.all? do |space|
    space == "X" || space == "O"
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end

def empty?(board)
  board.all? do |space|
    space == " "
  end
end

def over?(board)
  if draw?(board) || won?(board)
    return true
  else
    return false
  end
end

def winner(board)

  winning_combo = won?(board)

  if !winning_combo
    return nil
  end

  if board[winning_combo[0]] == "X"
    return "X"
  elsif board[winning_combo[0]] == "O"
    return "O"
  else
    return false
  end

end
