# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],  #Top
  [3,4,5],  #Middle
  [6,7,8],  #Bottom
  [0,3,6],  #Left
  [1,4,7],  #MiddleVert
  [2,5,8],  #Right
  [0,4,8],  #Diagonal1
  [2,4,6]   #Diagonal2
]
def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
    end
  end
  return false
end

def full? (board)
  board.all? do |slot|
    slot == "X" || slot == "O"
  end
end

def draw? (board)
  if  won?(board) == false && full?(board) == true
    return true
  else return false
  end
end

def over? (board)
  if won?(board) != false || draw?(board) == true || full?(board) == true
    return true
  else return false
  end
end

def winner(board)
  if won?(board) != false && board[won?(board)[0]] == "X"
    return "X"
  elsif won?(board) != false && board[won?(board)[0]] == "O"
    return "O"
  else return nil
  end
end
