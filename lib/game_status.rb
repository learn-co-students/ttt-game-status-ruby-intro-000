# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,4,8], # backslash row
  [2,4,6], # slash row
  [0,3,6], # 1st column row
  [1,4,7], # 2nd column row
  [2,5,8]  # 3rd column row
]

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    win_index_1 = combination[0]
    win_index_2 = combination[1]
    win_index_3 = combination[2]
    
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return combination
    else
      false
    end
  end
  return nil
end

def full?(board)
  board.each do |cell|
    if cell == " " || cell.nil?
      return false
    end
  end
  return true
end

def draw?(board)
  if(full?(board) && !won?(board))
    return true
  else
    return false
  end
end

def over?(board)
  if(full?(board) || won?(board))
    return true
  else
    return false
  end
end

def winner(board)
  WIN_COMBINATIONS.each do |combination|
    win_index_1 = combination[0]
    win_index_2 = combination[1]
    win_index_3 = combination[2]
    
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return "X"
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return "O"
    else
      false
    end
  end
  return nil
end
