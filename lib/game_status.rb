# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def won?(board)
  n = 0
  y = 1000
  WIN_COMBINATIONS.each do |winning_array|
    if board[winning_array[0]] == "X" && board[winning_array[1]] == "X" && board[winning_array[2]] == "X"
      y = n
    elsif board[winning_array[0]] == "O" && board[winning_array[1]] == "O" && board[winning_array[2]] == "O"
      y = n
    else
      n += 1
    end
  end
  if y != 1000
    return WIN_COMBINATIONS[y]
  elsif y == 1000
    return false
  end
end

def full?(board)
  if board.select{ |banana| banana == " "} != []
    return false
  else
    return true
  end
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) != false || draw?(board) == true
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board) == false
    return nil
  elsif board[won?(board)[1]] == "X"
    return "X"
  elsif board[won?(board)[1]] == "O"
    return "O"
  end
end
