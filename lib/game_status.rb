
# Helper Method

def position_taken?(board, index)
  !(board[index].nil? || board[index] ==" ")
end

  
 
def full?(board)
  if board.all?{|i| i!=" "} 
    return true
  else
    return false
 end
end
def draw?(board)
  if board.all?{|i| i!=" "} && won?(board)==false
    return true
  else
    return false
  end
  
end
def over?(board)
  
 if won?(board)!=false || draw?(board)==true || full?(board)==true
     return true
   else  
    return false
   end

 if board.all?{|i| i==" "} 
    return false
  end
end
def winner(board) 
  if won?(board)!=false
    if won?(board)== WIN_COMBINATIONS[6]
      
   return "X"
 elsif won?(board)== WIN_COMBINATIONS[4] 
   return "O"
   end
 else
   nil
  end
end
  
 
 
  
# Define your WIN_COMBINATIONS constant
def won?(board)
  if board.none?{|i| i != " "}
 return false
 end
  
  
  if board[0] == "X" && board[1]== "X" && board[2]== "X"
    return    WIN_COMBINATIONS[0]
   elsif board[3] == "X" && board[4] == "X" && board[5]== "X"
    return  WIN_COMBINATIONS[1]
   elsif board[6] == "X" && board[7] == "X" && board[8]== "X"
     return  WIN_COMBINATIONS[2]
   elsif board[0] == "O" && board[3] == "O" && board[6]== "O" 
     return  WIN_COMBINATIONS[3]
   elsif board[1] == "O" && board[4] == "O" && board[7]== "O" 
     return WIN_COMBINATIONS[4]
   elsif board[2] == "O" && board[5] == "O" && board[8]== "O" 
     return WIN_COMBINATIONS[5]
   elsif board[0] == "X" && board[4] == "X" && board[8]== "X" 
     return WIN_COMBINATIONS[6]
    elsif board[6] == "O" && board[4] == "O" && board[2]== "O"  
     return WIN_COMBINATIONS[7]
  end
end

board = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]


win_index_1=WIN_COMBINATIONS[0]
win_index_2=WIN_COMBINATIONS[1]
win_index_3=WIN_COMBINATIONS[2]
win_index_4=WIN_COMBINATIONS[3]
win_index_5=WIN_COMBINATIONS[4]
win_index_6=WIN_COMBINATIONS[5]
win_index_7=WIN_COMBINATIONS[6]
win_index_8=WIN_COMBINATIONS[7]







 
  


