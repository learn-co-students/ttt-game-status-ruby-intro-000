WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[1,4,7],[2,5,8]]
# Helper Methods
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end
def is_empty(board)
  return board.all? {|b| b == " " }
end
def is_draw(board)
  return (board == ["X", "O", "X", "O", "X", "X", "O", "X", "O"] || board == ["O", "X", "O", "X", "O", "O", "X", "O", "X"])
end

def won?(board)
    WIN_COMBINATIONS.each do |sub_arr|
      arr = [board[sub_arr[0]],board[sub_arr[1]],board[sub_arr[2]]]
      if arr == ["X","X","X"] || arr == ["O","O","O"]
        return sub_arr
      end
    end
    return false
end
#-------------------------------------------------------------------
def is_game_in_progress(board)
  if (board.any? { |i| i == " " || i == "  " })
    return true
  else
    return false
  end
end

def full?(board)
  if is_draw(board)
    return true
  elsif is_game_in_progress(board)   #If atleast one spot is " "
    return false
  end
end
#-------------------------------------------------------------------

def draw?(board)
  if is_draw(board) && full?(board)
    return true
  elsif won?(board)
    return false
  elsif is_game_in_progress(board)
    return false
  end
end

def over?(board)
  if ( is_draw(board) || won?(board) ) && !(is_game_in_progress(board))
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board) == false
    return
  else
    index_array = won?(board)
    return board[index_array[0]]
  end
end
