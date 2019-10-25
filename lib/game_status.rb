# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 4, 8],
  [2, 4, 6],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8]
]

def won?(board)
  WIN_COMBINATIONS.each do |wincombo|
    if (board[wincombo[0]]) == "X" && (board[wincombo[1]]) == "X" && (board[wincombo[2]]) == "X"
      return wincombo
    elsif (board[wincombo[0]]) == "O" && (board[wincombo[1]]) == "O" && (board[wincombo[2]]) == "O"
      return wincombo
    end
  end
if (board == 'X' || board == 'O')
  return false
end
end


def full?(board)
  if board.include?  " "
    return false
  else true
  end
end


def draw?(board)

if !won?(board) && full?(board)
  return true
elsif !won?(board) && !full?(board)
  return false
elsif won?(board)
  return false
end
end


def over?(board)
  if (won?(board)) || (draw?(board)) || (full?(board))
    return true
else
  false
end
end


def winner(board)

if i = won?(board)
return board[i.first]

end
end
