# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [2,4,6],
    [0,4,8]
]
 

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    index_1 = combination[0]
    index_2 = combination[1]
    index_3 = combination[2]
    
    option_1 = board[index_1]
    option_2 = board[index_2]
    option_3 = board[index_3]

   if option_1 == option_2 && option_2 == option_3 && position_taken?(board,index_1)
     return combination
 end
 end 
  return false
end


def full?(board)
  board.all? { |value| value == 'X' || value == 'O'}
end

def draw?(board)
  cond_1 = full?(board) == true;
  cond_2 = won?(board) == false;
  if cond_2 && cond_1 
    return true
    elsif !cond_1 && !cond_2
    return false
   else cond_2 == true
  return false
end
end
  
  def over?(board)
    if won?(board) || full?(board) || draw?(board)
      return true
    else 
      return false
    end
  end
  
  def winner(board)
    if won?(board)
    indexes = won?(board)
   return board[indexes[0]]
 else 
   return nil 
  end
end

  
  
  
  