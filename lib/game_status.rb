# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6] ]

def won?(board)
    WIN_COMBINATIONS.detect do |combination|
      if(board[combination[0]] == board[combination[1]] && board[combination[1]] == board[combination[2]] && position_taken?(board,combination[0]))
        return combination
      else
        false
      end
    end
  end


def full? (board)
  board.all? do |x|
    x == "X" || x == "O"
end
end

def draw?(board)
  if(full?(board) && !won?(board))
    true
  else
    false
  end
end

def over?(board)
  if(draw?(board) || won?(board))
    return true
  else
    false
  end
end

def winner(board)
  if(!won?(board))
    return nil
  elsif(board[won?(board)[0]] == "X")
    return "X"
  elsif (board[won?(board)[0]] == "O")
      return "O"
  end
end
