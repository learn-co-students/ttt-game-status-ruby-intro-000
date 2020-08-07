# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], # Top row
  [3, 4, 5], # Middle row
  [6, 7, 8], # Bottom row
  [0, 3, 6], # Left vertical
  [1, 4, 7], # Middle vertical
  [2, 5, 8], # Right vertical
  [0, 4, 8], # Upper left diagonal
  [2, 4, 6] # Upper right diagonal
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3

    if (position_1 == "X" && position_2 == "X" && position_3 == "X")
     return win_combo
   elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combo
    end
  end
  if (board == [" ", " ", " ", " ", " ", " ", " ", " ", " "] || board == ["","","","","","","","",""])
    return false
  end
end

def full?(board)
  board.all? do |position|
    position == "X" || position == "O"
  end
end

def draw?(board)
 if (!won?(board) && full?(board))
   return true
 end
end

def over?(board)
  if (won?(board) || full?(board) || draw?(board))
    return true
  end
end

def winner(board)
  win_combo = won?(board)
  if won?(board)
    token = win_combo[0]
    if board[token] == 'X'
      return "X"
    else
      return "O"
  end
end
end
