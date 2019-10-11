# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS =
  [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]


def won?(board)
  for win_combo in WIN_COMBINATIONS do

    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]


    if
      (board[win_index_1] == "X" && board[win_index_2] == "X" && board[win_index_3] == "X")
      return win_combo
    elsif
      (board[win_index_1] == "O" && board[win_index_2] == "O" && board[win_index_3] == "O")
      return win_combo

    end
  end
  return false
end

def full?(board)
  full = true
  for space in board do
    if space == "X" || space == "O"
      next
    else
      full = false
      return full
    end
  end
  return full
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  else
    false
  end
end

def winner(board)
  if won?(board)
    win_place = won?(board)[0]
    return board[win_place]
  else
    nil
  end
end
