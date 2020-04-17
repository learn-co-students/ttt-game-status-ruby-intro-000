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
  [0,4,8],
  [1,4,7],
  [2,4,6],
  [2,5,8]

]

won?(board)
WIN_COMBINATIONS.each |array|
board.select "X"
board.select "O"
if board.select "X" == array || board.select "O" == array
  array
else
falsey
end
end
end
