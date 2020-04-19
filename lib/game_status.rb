require "pry"
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
def won?(board)
  
  WIN_COMBINATIONS.each do |wincombo|
  if board[wincombo[0]] == "X" && board[wincombo[1]] == "X" && board[wincombo[2]] == "X"
    return wincombo
   elsif board[wincombo[0]] == "O" && board[wincombo[1]] == "O" && board[wincombo[2]] == "O"
     return wincombo 
  end
end
false
end

def full?(board)
  board.each do |space|
   if space == " "
    return false
    if space == !WIN_COMBINATIONS
end
end
true 
end
end 

def draw?(board)
full?(board) && !won?(board)
end

def over?(board)
 full?(board) || won?(board) 
  end

def winner(board)
#binding.pry 
if won?(board)
    board[won?(board)[0]]

else 
  nil
  end
end
=begin
 board = ["X", " ", " ", " ", "X", " ", " ", " ", "X"]
 
 won?(board) == [0, 4, 8]
 
 won?(board)[1] == 4
 
 board[4] == 'X' 
 
 board[won?(board)[1]] == board[4] // 'X'
 
 
 
 board = ["X", "O", " ", " ", "O", " ", " ", "O", "X"]
 
 won?(board) == [1, 4, 7]
 
 won?(board)[0] == 1 
 
 board[1] == "O"
 
 board[won?(board)[0]] == board[1] // 'O'

=end



    
    
    
