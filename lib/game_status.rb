# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

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
  WIN_COMBINATIONS.each do |victory|
  win_index_1 = victory[0]
  win_index_2 = victory[1]
  win_index_3 = victory[2]

  position_1 = board[win_index_1]
  position_2 = board[win_index_2]
  position_3 = board[win_index_3]


if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 =="O" && position_2 == "O" && position_3 == "O")
  return victory
end
end
return false
end


def full?(board)
  board.all? {|space| space == "X" || space == "O"}
end

def draw?(board)
if !won?(board) && full?(board)
  return true
else
  return false
end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  index = [ ]
  index = won?(board)
  if index == false
    return nil
  else
    if board[index[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end
