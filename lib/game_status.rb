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
  [0,4,8],
  [2,4,6]
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
  if winner = won?(board)
    if board[winner[0]] == "X"
      return "X"
    elsif board[winner[0]] == "O"
      return "O"
    end 
  else 
    return nil 
  end 
end

board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]

puts winner(board)