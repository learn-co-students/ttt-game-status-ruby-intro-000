require 'pry'
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def won? (board)
  WIN_COMBINATIONS.each do |win|
    if (
      (board[win[0]] != " " && board[win[1]] != " " && board[win[2]] != " ") &&
      ((board[win[0]] == board[win[1]]) && (board[win[1]] == board[win[2]]))
      )
      return win
    end
  end
  return false
end

def full?(board)
  board.none? { |e| e == " "  }
end

def draw?(board)
  if ( !won?(board) && full?(board) )
    return true
  elsif ( !won?(board) && !full?(board) )
    return false
  elsif won?(board)
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  winner = won?(board)
  #binding.pry
  if winner
    return board[winner[0]]
  else
    return nil
  end
end
