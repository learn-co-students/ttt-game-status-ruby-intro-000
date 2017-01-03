# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

board = ["X", "X", "X", " ", " ", " ", " ", " ", " "]

# Define your WIN_COMBINATIONS constant
#
WIN_COMBINATIONS = [
	[0,1,2],
	[6,7,8],
	[3,4,5],
	[0,3,6],
	[2,5,8],
	[1,4,7],
	[0,4,8],
	[2,4,6]
]

top_row_win = [0,1,2]

if board[top_row_win[0]] == "X" && board[top_row_win[1]] == "X" && board[top_row_win[2]] == "X"
	  "X won in the top row"
end

