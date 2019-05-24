# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[1,4,7],[2,5,8]]
#######################################################
def won?(board)
  for win_combo in WIN_COMBINATIONS
    win_idx_1= win_combo[0]
    win_idx_2= win_combo[1]
    win_idx_3= win_combo[2]


    position_1 = board[win_idx_1]
    position_2 = board[win_idx_2]
    position_3 = board[win_idx_3]

    if position_1 == "X" && position_2 =="X" && position_3 == "X"
      return [win_combo[0],win_combo[1],win_combo[2]]
    elsif  position_1 == "O" && position_2 =="O" && position_3 == "O"
   return [win_combo[0],win_combo[1],win_combo[2]]
    end
  end
  return false
end
##################################

def full?(board)
  if board.any? {|el| el == " " }
    return false
  end
return true
end

######################################
def draw?(board)
  if full?(board) && !won?(board)
    return true
  end
end
####################################
def over?(board)
  if !!won?(board)
    return true
elsif full?(board)
    return true
  end

  return false
end

##################################
def return_winner(board)
  for win_combo in WIN_COMBINATIONS
    win_idx_1= win_combo[0]
    win_idx_2= win_combo[1]
    win_idx_3= win_combo[2]
    position_1 = board[win_idx_1]
    position_2 = board[win_idx_2]
    position_3 = board[win_idx_3]
    if position_1 == "X" && position_2 =="X" && position_3 == "X"
      return "X"
    elsif  position_1 == "O" && position_2 =="O" && position_3 == "O"
   return "O"
    end
  end
end
###########################################
def winner(board)
  if !won?(board)
    return nil
  end
  return return_winner(board)
end
