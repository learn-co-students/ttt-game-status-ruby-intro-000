board = ["X","O","O","X","O","X","X","X","O"]


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

WC = [3,4,5]

def won?(board)

    if board.all?{|j| j  == " "}
      return false
    end

    WIN_COMBINATIONS.each do |w|
    if w.all?{|i| board[i] == "X"} || w.all?{|i| board[i] == "O"}
        print w
        return w
    else
       next
    end
  end

  return false
end

won?(board)

def full?(board)
  if board.any?{|i| i == " "}
    return false
  else
    return true
  end
end

def draw?(board)
  if won?(board) && (full?(board) ||  !full?(board))
    return false
  elsif !won?(board)
    return true
  end
end

def over?(board)
  if draw?(board) || won?(board) || full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board).any?{|i| board[i] == "X"}
    return "X"

  elsif won?(board).any?{|i| board[i] == "O"}
    return "O"

else
  return false
  end
end
