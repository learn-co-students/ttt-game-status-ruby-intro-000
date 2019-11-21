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
        [2,4,6],
]

def won?(board)
  WIN_COMBINATIONS.each {|combinations|
    index = combinations[0]
    index1 = combinations[1]
    index2 = combinations[2]

    position1 = board[index]
    position2 = board[index1]
    position3 = board[index2]

    if position1 == "X" && position2 == "X" && position3 == "X"
      return combinations
    elsif position1 == "O" && position2 == "O" && position3 == "O"
      return combinations
    end
  }
      return false
  end

  def full?(board)
    board.all?{|taken| taken == "X" || taken == "O"}
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

def winner (board)
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
