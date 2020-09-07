# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS =[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won? (board)
  WIN_COMBINATIONS.detect do |check|
    position_taken?(board,check[0]) && board[check[0]]==board[check[1]] && board[check[1]]==board[check[2]]
  end
end

def full? (board)
  board.all? {|check| check!=" "}
end

def draw? (board)
  !won?(board) && full?(board)
end

def over? (board)
  won?(board) || draw?(board) || full?(board)
end

def winner (board)
  if over?(board)
    board[won?(board)[0]]
  end
end
