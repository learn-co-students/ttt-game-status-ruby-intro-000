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
  WIN_COMBINATIONS.each do |combos|
    position_1 = board[combos[0]]
    position_2 = board[combos[1]]
    position_3 = board[combos[2]]
    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return combos
    end
  end
  return false
end

def full?(board)
  board.none?{|i| i == " " or i == ""}
end

def draw?(board)
  if full?(board)
    if !won?(board)
      return true
    end
  end
  return false
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  end
  return false
end

def winner(board)
  combo = won?(board)
  if !combo
    return nil
  else
    return board[combo[0]]
  end
end
