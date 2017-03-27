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
  WIN_COMBINATIONS.each do |win_array|
    if board[win_array[0]] == "X" && board[win_array[1]] == "X" && board[win_array[2]] == "X"
      return win_array
    elsif board[win_array[0]] == "O" && board[win_array[1]] == "O" && board[win_array[2]] == "O"
      return win_array
    end
  end
  return false
end

def full?(board)
  if board.include?(" ")
    false
  else
    true
  end
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    true
  else
    false
  end
end

def over?(board)
  if won?(board) == true || draw?(board) == true || full?(board) == true
    true
  else
    false
  end
end

def winner(board)
    WIN_COMBINATIONS.each do |win_array|
      if board[win_array[0]] == "X" && board[win_array[1]] == "X" && board[win_array[2]] == "X"
        return "X"
      elsif board[win_array[0]] == "O" && board[win_array[1]] == "O" && board[win_array[2]] == "O"
        return "O"
      end
    end
    if won?(board) == false
      nil
    end
  end
