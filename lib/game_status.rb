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

def full?(board)
  board.all? { |e| e == "X" || e == "O"  }
end

def won?(board)
  WIN_COMBINATIONS.each do |win|
    place_1 = board[win[0]]
    place_2 = board[win[1]]
    place_3 = board[win[2]]

    if place_1 == "X" && place_2 == "X" && place_3 == "X" || place_1 == "O" && place_2 == "O" && place_3 == "O"
      return win
    else
      false
    end
  end
  return false
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  else
    return false
  end
end

def over?(board)
  if draw?(board) ||  won?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  else
    return nil
  end
end
