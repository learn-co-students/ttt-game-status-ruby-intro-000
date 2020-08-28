# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS=[
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
#  puts board
#  WIN_COMBINATIONS.each {|combo| puts "yo-#{combo[0]}#{combo[1]}#{combo[2]}=#{board[combo[0]]}#{board[combo[1]]}#{board[combo[2]]}"}
#  puts WIN_COMBINATIONS.detect{|combo| (board[combo[0]]=="X" || board[combo[0]]=="O") && board[combo[0]]==board[combo[1]] && board[combo[1]]==board[combo[2]]}
  WIN_COMBINATIONS.detect{|combo| (board[combo[0]]=="X" || board[combo[0]]=="O") && board[combo[0]]==board[combo[1]] && board[combo[1]]==board[combo[2]]}
end

def full?(board)
  not(board.any?{|position| position==" "})
end

def draw?(board)
  full?(board) && not(won?(board))
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  if (won?(board))
    board[won?(board)[0]]
  else
    nil
  end
end