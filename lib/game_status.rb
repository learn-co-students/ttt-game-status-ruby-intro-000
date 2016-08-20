# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # bottom row

  [0,3,6],  # First Column
  [1,4,7],  # Second Column
  [2,5,8],  # Third Column

  [0,4,8],  # first diagonal
  [6,4,2]  # second diagonal
]

def won?(board)

  matches = []

  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3

    if (position_1 == "X" && position_2 == "X" && position_3 == "X") ||
       (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combination # return the win_combination indexes that won.
      matches <<  win_combination
    else
      matches = nil
    end
  end

  return matches

end

def full?(board)
  board.each do |element|
    if element == " "
      return false
    end
  end
  return true
end

def draw?(board)
  if won?(board)
    return false
  elsif !won?(board) && full?(board)
    return true
  elsif !won?(board) && !full?(board)
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  token = nil

  winner_player = won?(board)
  # print winner_player

  if winner_player
    if winner_player.class == Array
      position = winner_player[0]
      token = board[position]
    end
  end

end
