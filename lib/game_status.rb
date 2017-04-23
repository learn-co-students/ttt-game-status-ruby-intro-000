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
  [2,4,6],
]

#determine if a winning combination is currently represented by one player on the board
def won?(board)
	WIN_COMBINATIONS.each do |combo_array|
  		if board[combo_array[0]] == "X" && board[combo_array[1]] == "X" && board[combo_array[2]] == "X" || board[combo_array[0]] == "O" && board[combo_array[1]] == "O" && board[combo_array[2]] == "O"
          	return combo_array
    		end
	end
  #return false for no wins
	return false
end

#check if all spots on the board are filled with a player character
def full?(board)
  full_board = board.all? do |value|
    value == "X" || value == "O"
  end
  full_board
end

#determine if the full board is a draw or a win
def draw?(board)
  if won?(board) == false && full?(board) == true
    #a draw returns true
    return true
  end
end

#determine if the game is over.  a win, draw, and full board return true
def over?(board)
  if won?(board) == true || draw?(board) == true || full?(board) == true
    return true
  end
end

#determine who the winner is
def winner(board)
  #grab the result of the won? method (should be true or false)
  if won?(board)
    #if there is a win, grab the returned winning combination array
    winning_combination = won?(board)
    #check the first index in the winning combination against the matching board array index
            board[winning_combination[0]]
      else
        nil
  end
end
