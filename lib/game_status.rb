# Helper Method
def position_taken?(board, index)
  (board[index] == nil || board[index] == " " || board[index] == "")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,4,8],
  [6,4,2],
  [0,3,6],
  [2,5,8],
  [1,4,7]
  # ETC, an array for each win combination
]

def won? (board)
  winner = nil
WIN_COMBINATIONS.each do |combo|
    win_index_1 = combo[0]
    win_index_2 = combo[1]
    win_index_3 = combo[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
  position_2 = board[win_index_2] # load the value of the board at win_index_2
  position_3 = board[win_index_3] # load the value of the board at win_index_3
  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    winner = combo
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    winner = combo
  end
end
 winner
end

 def full? (board)
  won?(board) || !board.include?(" ")
 end

 def draw? (board)
  !won?(board) && full?(board)
 end

 def over? (board)
  draw?(board) || won?(board) || full?(board)
 end

 def winner (board)
if  combo = won?(board)
  board[combo[0]]
end
 end
