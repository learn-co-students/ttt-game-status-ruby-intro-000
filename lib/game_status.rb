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
  [6,4,2]
]


def won?(board)
  WIN_COMBINATIONS.each do |combo|
      return combo if combo.all? { |index| board[index] == "X"  }
      return combo if combo.all? { |index| board[index] == "O"  }
  end
  false
end


def full?(board)
  board.all? do |element|
    element == "X" || element == "O"
  end
end


def draw?(board)
  if full?(board) && !won?(board)
    return true
  elsif full?(board) && won?(board)
    return false
  else
    return false
  end
end


def over?(board)
  if won?(board) || draw?(board)
    return true
  else
    return false
  end
end


def winner?(board)
  won?(board).all? do |element|
    if board[element] == "X"
      return "X"
    elsif board[element] == "O"
      return "O"
    elsif full?(board) && !won?(board)
      return nil
    end
  end
end
