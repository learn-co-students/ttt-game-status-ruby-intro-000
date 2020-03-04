require 'pry'
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

def won?(board)
  WIN_COMBINATIONS.any? do |combo|
    windex1 = combo[0]
    windex2 = combo[1]
    windex3 = combo[2]
    pose1 = board[windex1]
    pose2 = board[windex2]
    pose3 = board[windex3]
    if pose1 == "X" && pose2 == "X" && pose3 == "X"
      return combo
    elsif pose1 == "O" && pose2 == "O" && pose3 == "O"
      return combo
  end
 end
end

def full?(board)
  board.all?{|space| space == "X" || space == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  if draw?(board)
    return true
  elsif !full?(board) && won?(board)
    return true
  elsif won?(board) && full?(board)
    return true
  end
end

def winner(board)
winners = won?(board)
if won?(board)
  return board[winners[0]]
else
 return nil
 end
end 
