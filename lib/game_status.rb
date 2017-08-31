# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS =[
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

    WIN_COMBINATIONS.detect do |win_combination|
(board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X") || (board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O")
end
end


def full?(board)
  if board.include?(" ")
    return false
  else
    return true
  return true
end
end

def draw?(board)
  if  !won?(board) && full?(board) == true
      return true
    elsif  won?(board) == false && full?(board) == false
return false
  else   won?(board)  && full?(board) == true
return false
  end
end

def over?(board)
  if won?(board) || draw?(board) == true || full?(board) == true
  return true
end
end

def winner(board)
  if !won?(board)
  return  nil
  else board[won?(board)[0]]
end
end
