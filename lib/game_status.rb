  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

  def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
index1 = win_combo[0]
index2 = win_combo[1]
index3 = win_combo[2]
position_1 = board[index1]
position_2 = board[index2]
position_3 = board[index3]
if position_1 == "X" && position_2 == "X" && position_3 == "X"
  return win_combo
elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
  return win_combo
else
  false
end
end
false
end
def full?(board)
  board.each do |location|
    if location == " "
      return false

    end
    true
  end

end
def draw?(board)
  if won?(board)
  return false
elsif full?(board)
  return true

end
end
def over?(board)
  if full?(board)
    return true
  end
false
end
def winner(board)
  if draw?(board)
  return  nil
elsif won?(board)==[0,4,8]
  return "X"
elsif won?(board)==[1,4,7]
  return "O"
end
end
