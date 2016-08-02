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

def won?(board)
win_combo = false
  WIN_COMBINATIONS.each do |win_combination|
    spot_one = win_combination[0]
    spot_two = win_combination[1]
    spot_three = win_combination[2]

    position_1 = board[spot_one]
    position_2 = board[spot_two]
    position_3 = board[spot_three]

    if position_1 == "X" && position_2 == "X" && position_3 == "X" ||
      position_1 == "O" && position_2 == "O" && position_3 == "O"
      win_combo = win_combination
    else
      false
    end
  end
  return win_combo
end


def full?(board)
  board.all? do |index|
    index == "X" || index == "O"
  end
end


def draw?(board)
  if (won?(board) == false) && (full?(board) == true)
    return true
  else
    return false
  end
end

def over?(board)
  if (won?(board) == true) || (draw?(board) == true) || (full?(board) == true)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board) == false || draw?(board) == true
    return nil
  else
    output = won?(board)[0]
    return board[output]
  end
end
