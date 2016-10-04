# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7],
[2, 5, 8], [0, 4, 8], [2, 4, 6]]

def won?(board)
  WIN_COMBINATIONS.each do |position|
    if (board[position[0]] == "X") && (board[position[1]] == "X") && (board[position[2]] == "X")
      return position
    elsif (board[position[0]] == "O") && (board[position[1]] == "O") && (board[position[2]] == "O")
      return position
    end
  end
  return false
end

def full?(board)
  if board.all? do |spot|
    (spot != " ") && (spot != "")
    end
    return true
  else
    return false
  end
end

def draw?(board)
  if full?(board) && !(won?(board))
    return true
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

def winner(board)
  winner = nil
  if won?(board)
    WIN_COMBINATIONS.each do |position|
      if (board[position[0]] == "X") && (board[position[1]] == "X") && (board[position[2]] == "X")
        winner = "X"
      elsif (board[position[0]] == "O") && (board[position[1]] == "O") && (board[position[2]] == "O")
        winner = "O"
      end
    end
  end

    return winner
end
