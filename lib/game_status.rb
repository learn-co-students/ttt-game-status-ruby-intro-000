# WIN_COMBINATIONS constant
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

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Winning Move?
def won?(board)
  WIN_COMBINATIONS.each do |combination|
    #pull values from board corresponding to winning combination
    position_1 = board[combination[0]]
    position_2 = board[combination[1]]
    position_3 = board[combination[2]]
    #check for a winner
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return combination
    end
    if position_1 == "O" && position_2 == "O" && position_3 == "O"
      return combination
    end
  end
  return false
end

def full?(board)
  !(board.any? { |position| position == " " || nil })
end

def draw?(board)
  if full?(board) && !(won?(board))
    return true
  else
    false
  end
end

def over?(board)
  if full?(board) || won?(board)
    return true
  else
    false
  end
end

def winner(board)
  win_combo = won?(board)
  if win_combo == false
    return nil
  else
    return board[win_combo[0]]
  end
end
