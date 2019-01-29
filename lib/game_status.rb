# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

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
  WIN_COMBINATIONS.each do |winning_combo|
    index0 = winning_combo[0]
    index1 = winning_combo[1]
    index2 = winning_combo[2]

    position1 = board[index0]
    position2 = board[index1]
    position3 = board[index2]

    if position1 == "X" && position2 == "X" && position3 == "X"
      return winning_combo
    elsif position1 == "O" && position2 == "O" && position3 == "O"
      return winning_combo
    end
  end
  return false
  end

def full?(board)
  board.all? do |pos|
    pos == "X" || pos == "O"
  end
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  elsif full?(board) == false && won?(board) == false
    return false
  elsif won?(board) ==  true
    return false
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  end
end

def winner(board)
  index = []
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
