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

def won?(board)
  winner = "no one"
	WIN_COMBINATIONS.each do |combo_array|
  		if board[combo_array[0]] == "X" && board[combo_array[1]] == "X" && board[combo_array[2]] == "X" || board[combo_array[0]] == "O" && board[combo_array[1]] == "O" && board[combo_array[2]] == "O"
          winner = "X"
          return combo_array
    	end
	end
  board.all? do |val|
    if val != "X"  || val != "O"
      return false
    end
  end
end


def full?(board)
  full_board = board.all? do |value|
    value == "X" || value == "O"
  end
  full_board
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  end
end

def over?(board)
  if won?(board) == true || draw?(board) == true || full?(board) == true
    return true
  end
end

def winner(board)
  if won?(board)
    formation_array = won?(board)
        board[formation_array[0]]
      else
        nil
  end
end
