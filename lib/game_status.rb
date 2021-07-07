# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    idx1 = win_combo[0]
    idx2 = win_combo[1]
    idx3 = win_combo[2]

    position1 = board[idx1]
    position2 = board[idx2]
    position3 = board[idx3]

    if position1 == "X" && position2 == "X" && position3 == "X"
      return win_combo
    elsif position1 == "O" && position2 == "O" && position3 == "O"
      return win_combo
    end
  end
  false
end

def full?(board)
  board.none? do |element|
    element == " "
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  elsif !full?(board)
    return false
  elsif won?(board)
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  end
  false
end

def winner(board)
  if won?(board) == false
    return nil
  end
  
  win_combo = won?(board)

  index = win_combo[0]

  board[index]
end
