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


def won?(board)
  WIN_COMBINATIONS.each do |wins|
  if (board[wins[0]] == "X" && board[wins[1]] == "X" && board[wins[2]] == "X") || (board[wins[0]] == "O" && board[wins[1]] == "O" && board[wins[2]] == "O")
    return wins
  end
  end

  if board.each do |e|
    e == " "
    return false
  end
end

end


def full?(board)
  if board.detect{|i| i == " "}
    return false
  else
    return true
  end
end



def draw?(board)
  if !(won?(board)) && full?(board)
    return true
  else
    return false
  end
end


def over?(board)
  if won?(board)
    return true
  elsif draw?(board)
    return true
  elsif full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end
