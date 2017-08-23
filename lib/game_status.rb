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
  [2,4,6],
  [0,4,8]
]
def won?(board)
  WIN_COMBINATIONS.find do |win_combination|
    position_1 = board[win_combination[0]]
    position_2 = board[win_combination[1]]
    position_3 = board[win_combination[2]]

  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return win_combination
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combination
  else
    false
  end
end
end
def full?(board)
  if board.find {|i| i == " " || i == "" || i == nil}
    return false
  else
    return true
  end
end
def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end
def over?(board)
  # if won?(board) || draw?(board)
  if full?(board)
    return true 
  else
    return false
  end
end
def winner(board)
  #answer = won?(board)
  if answer = won?(board) #> [0,1,2]
    # win_combination.detect{|i| return i}
    return board[answer[0]]#=>0  
  end
end