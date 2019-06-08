# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [ 
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Left diagonal
  [2,4,6]  # Right diagonal
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    position_1 = win_combination[0]
    position_2 = win_combination[1]
    position_3 = win_combination[2]
  
    if position_taken?(board,position_1) && 
      board[position_1] == board[position_2] && 
      board[position_1] == board[position_3]   
      return win_combination
    end 
  end 
  return false
end 

def full?(board)
  board.all? {|x| x != " " }
end 

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end 

def winner(board)
  winning_array = won?(board)
  if won?(board) && board[winning_array[0]] == "X"
    return "X"
  elsif won?(board) && board[winning_array[0]] == "O"
      return "O"
  else 
    return nil 
  end 
end