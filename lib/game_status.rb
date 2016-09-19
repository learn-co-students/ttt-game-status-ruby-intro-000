# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top row wins
  [3,4,5], #middle row wins
  [6,7,8], #botom row wins
  [0,3,6], #left column wins
  [1,4,7], #middle column wins
  [2,5,8], #right column wins
  [0,4,8], #diagonal win
  [2,4,6] #diagonal win
]

def won?(board)
  WIN_COMBINATIONS.each do |win_index|
#    win_index.each do |position|
      position_1 = board[win_index[0]]
      position_2 = board[win_index[1]]
      position_3 = board[win_index[2]]

      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return win_index # return the win_combination indexes that won.
      end
  end
 return false
end

def full?(board)
  board.all? do |i|
    i == "X" || i == "O"
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
  if full?(board) == true || won?(board) == true || draw?(board) == true
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board) == false
    return nil
  else
    win_index = won?(board)
    if board[win_index[0]] == "X"
      return "X"
    elsif board[win_index[0]] == "O"
        return "O"
    end
  end
  return nil
end
