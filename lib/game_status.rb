# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [2,5,8],
  [1,4,7]
]

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
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
      if board.detect {|i| i == " " || i == nil}
      return false
  else
     return true
   end
 end

def draw?(board)
if  !won?(board) && full?(board)
  return true
else
   return false
end
end

def over?(board)
   if draw?(board) || won?(board)|| full?(board)
        return true
  else
     return false
  end
 end

def winner(board)
  if won?(board) != nil
     win_combination = won?(board)
   return board[win_combination[0]]
   else
   nil
     end
   end
