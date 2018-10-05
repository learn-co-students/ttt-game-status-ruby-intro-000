# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6] ]

def won?(board)
  WIN_COMBINATIONS.each do |win|
      if board[win[0]] == "X" && board[win[1]] == "X" && board[win[2]] == "X"
        return win
      elsif board[win[0]] == "O" && board[win[1]] == "O" && board[win[2]] == "O"
        return win
      end
    end
    return nil
  end

def full?(board)
  i = 0
  while i < 9
    if board[i] != "X" && board[i] != "O"
      return false
    end
    i += 1
  end
  return true
end

def draw?(board)
  if won?(board) == nil && full?(board) == true
    return true
  end
  return false
end

def over?(board)
  if won?(board).class == Array || draw?(board) == true || full?(board) == true
    return true
  end
  return false
end

def winner(board)
  if draw?(board) == true || over?(board) == false
    return nil
  else
    number = won?(board)[0]
    return board[number]
end
end
