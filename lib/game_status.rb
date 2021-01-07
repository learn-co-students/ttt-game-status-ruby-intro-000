# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def space_occupied?(board, space)
  return (board[space] == "X" || board[space] == "O")
end

def spaces_equal?(board, spaces)
  if board.length == 0 || spaces.length == 0
    return false
  end
  val = board[spaces[0]]
  spaces.all? do |index|
    board[index] == val
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if (space_occupied?(board, combo[0]) && spaces_equal?(board, combo))
      return combo
    end
  end
  return false
end

def full?(board)
  board.all? do |space|
    space == "X" or space=="O"
  end
end

def draw?(board)
  return full?(board) && !won?(board)
end

def over?(board)
  return full?(board) || won?(board) || draw?(board)
end

def winner(board)
  combo = won?(board)
  if combo
    return board[combo[0]]
  else
    return nil
  end
end
