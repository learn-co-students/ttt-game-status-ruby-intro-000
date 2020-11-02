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
  [6,4,2],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

 
def won?(board)
  WIN_COMBINATIONS.each { |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    
    
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    
    
      if (position_1== "X" && position_2 == "X" && position_3 == "X")
        return win_combination
      elsif (position_1== "O" && position_2 == "O" && position_3) == "O"
        return win_combination
      end 
      }
      return false
end

def full?(board)
  if board.include? (" ")
    return false 
  else
    return true
  end
end   

def draw?(board)
  if !won?(board) && full?(board)
    return true 
  elsif won?(board) && full?(board)== false
    return false
  elsif won?(board) == true
  end 
end 

def over?(board)
  if won?(board) || draw?(board)|| full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  index= [ ]
  index = won?(board)
  if !won?(board)
    return nil
    elsif board[index[0]] == "X"
      return "X"
    elsif board[index[0]] == "O"
      return "O"
    
  end
end
    
    
    
    