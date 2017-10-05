# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
 [0,1,2], # top row
 [3,4,5], # middle row
 [6,7,8], # bottom row
 [0,4,8], # left diagonal
 [2,4,6], # right diagonal
 [0,3,6], # vertical left
 [1,4,7], # vertical middle
 [2,5,8] # vertical right
]

def won?(board)
  WIN_COMBINATIONS.each do |win_index|
    board_subarray = []
     win_index.each do |position|
       board_subarray << board[position]
     end
   if board_subarray.all?{|letters| letters == "X"} || board_subarray.all?{|letters| letters == "O"}
     return win_index
   else
       false
   end
  end
 if board.all?{|letters| letters == "" || letters == " "}
    return false
 end
end

def full?(board)
 if board.all?{|letters| letters == "X" || letters == "O"}
   return true
 else
   return false
 end
end

def draw?(board)
if won?(board) == false || won?(board) == nil && full?(board) == true
  return true
elsif won?(board) == false && full?(board) == false 
  return false
elsif won?(board) == true
  return false
end
end

def over?(board)
  if won?(board) != nil && full?(board) == false # game is won, unfilled board
    return true
  elsif won?(board) != nil || draw?(board) == true || full?(board) == true #game is won OR it's a draw OR board is full
    return true
  elsif won?(board) == nil && full?(board) == false # game is not won AND board is not full
    return false
  end
end

def winner(board)

 array_index = won?(board)

 if array_index == nil
   return nil
 end
 
 letters = []
 array_index.each{|index| letters << board[index] }
 if letters.all?{|letter| letter == "X"}
   return "X"
 elsif letters.all?{|letter| letter == "O"}
   return "O"
 else
   return nil
 end
end

