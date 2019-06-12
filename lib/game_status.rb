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
  [6,4,2]
]


  def won?(board)
    # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
    # grab each index from the win_combination that composes a win.
    if board[0] == "X" && board[1] == "X" && board[2] == "X"
      return WIN_COMBINATIONS[0]  # return the win_combination indexes that won.
    elsif board[0] == "O" && board[1] == "O" && board[2] == "O"
      return WIN_COMBINATIONS[0]
    elsif board[3] == "X" && board[4] == "X" && board[5] == "X"
      return WIN_COMBINATIONS[1]
    elsif board[3]== "O" && board[4] == "O" && board[5] == "O"
        return WIN_COMBINATIONS[1]
    elsif board[6] == "X" && board[7] == "X" && board[8]== "X"
       return WIN_COMBINATIONS[2]
    elsif board[6] == "O" && board[7] == "O" && board[8] == "O"
       return WIN_COMBINATIONS[2]
    elsif board[0] == "X" && board[3] == "X" && board[6] == "X"
       return WIN_COMBINATIONS[3]
    elsif board[0] == "O" && board[3] == "O" && board[6] == "O"
       return WIN_COMBINATIONS[3]
    elsif board[1] == "X" && board[4] == "X" && board[7] == "X"
      return WIN_COMBINATIONS[4]
    elsif board[1] == "O" && board[4] == "O" && board[7] == "O"
      return WIN_COMBINATIONS[4]
    elsif board[2] == "X" && board[5] == "X" && board[8] == "X"
      return WIN_COMBINATIONS[5]
    elsif board[2] == "O" && board[5] == "O" && board[8] == "O"
      return WIN_COMBINATIONS[5]
    elsif board[0] == "X" && board[4] == "X" && board[8]== "X"
      return WIN_COMBINATIONS[6]
    elsif board[0] == "O" && board[4] == "O" && board[8] == "O"
      return WIN_COMBINATIONS[6]
    elsif board[6] == "X" && board[4] == "X" && board[2] == "X"
      return WIN_COMBINATIONS[7]
    elsif board[6]== "O" && board[4] == "O" && board[2] == "O"
      return WIN_COMBINATIONS[7]
    else
      false
    end
  end


  def full?(board)
    if board.include? " "
      return false
    else
      true
  end
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  else
    false
end
end

def over?(board)
  if won?(board) != false || full?(board) == true || draw?(board) == true
    return true
  else
    false
  end
end

def winner(board)
  if won?(board) != false
    return board[won?(board)[0]]
  else
    nil
  end
end
