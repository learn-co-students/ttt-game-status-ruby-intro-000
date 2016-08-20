# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
def won?(board)
  WIN_COMBINATIONS.detect {|win_combination|
  (board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X") || (board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O")
}
end
def full?(board)
  board.all? { |e|
    e == "X" || e == "O"
    }
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  elsif !full?(board) && !won?(board) || won?(board)  #negate a abd b >> not a or not b
    return false
  end
end

def over?(board)
  if full?(board) || won?(board)
    return true
  else
    return false
  end
  end
def winner(board)
  if over?(board) && won?(board)  # there is a winner
    winarray = won?(board)
    if board[winarray[0]] == "X"
       return "X"
    else
      return "O"
    end
  elsif draw?(board) #no one is winner
    return false
  end
end
