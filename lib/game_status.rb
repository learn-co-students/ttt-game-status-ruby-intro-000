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
  WIN_COMBINATIONS.each do |win_combo|
    index0 = win_combo[0]
    index1 = win_combo[1]
    index2 = win_combo[2]

    position1 = board[index0]
    position2 = board[index1]
    position3 = board[index2]

    if position1 == "X" && position2 == "X" && position3 == "X"
      return win_combo
    elsif position1 == "O" && position2 == "O" && position3 == "O"
      return win_combo
    end

  end
  return false

end


def full?(board)
  board.all? do |space|
    space == "X" || space == "O"
  end
end


def draw?(board)
  if full?(board) && ! won?(board)
    return true
  else
    return false
  end
end


def over?(board)
  if draw?(board) || won?(board) || full?(board)
    return true
  else
    return false
  end
end


def winner(board)
  if won?(board)
    letter = won?(board)[0]

    if board[letter] == "X"
      return "X"
    else
      return "O"
    end

  end
  return nil
end
