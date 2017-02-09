# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end


WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
  return win_combo  if position_taken?(board, win_combo[0]) &&
                       board[win_combo[0]] == board[win_combo[1]] &&
                       board[win_combo[1]] == board[win_combo[2]]
end
  return false
end

def full?(board)
  board.each do |element|
    return false if element == " " || element == nil || element == ""
  end
  return true
end

def draw?(board)
  board.each do |element|
    return false if element == " " || element == nil || element == ""
  end
  if won?(board)
    return false
  end
    return true
end

def over?(board)
  if won?(board) || draw?(board)
    return true
  end
  return false
end

def winner(board)
  if win_person = won?(board)
      return board[win_person[0]]
  end
  return nil
end

# Define your WIN_COMBINATIONS constant
