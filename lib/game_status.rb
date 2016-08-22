# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #left column
  [1,4,7], #middle column
  [2,5,8], #right column
  [0,4,8], #diagonal one
  [2,4,6] #diagonal two
]

def won?(board)
  win_combo = false
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    pos_1 = board[win_index_1]
    pos_2 = board[win_index_2]
    pos_3 = board[win_index_3]

    if (pos_1 == "X" && pos_2 == "X" && pos_3 == "X") || (pos_1 == "O" && pos_2 == "O" && pos_3 == "O")
      win_combo = win_combination
      winner = pos_1
    else
      false
    end
  end
  win_combo
end

def full?(board)
  board.none?{|i| i == " "} # if no element of board is " ", full? returns true
end

def draw?(board)
  !won?(board) && full?(board) #if not "someone won" AND board is full, draw? is true
end

def over?(board)
  draw?(board) || won?(board) #if it's a draw or someone won, over? is true
end

def winner(board)
  win_combo = won?(board) # win_combo is an array of winning indices or "false"
  if win_combo != false   # if win_combo isn't false & is an array, grab the first index in the array
    winner_spot = win_combo[0]
    winner = board[winner_spot] # winner is "X" or "O", whichever occupies the first index of the winning combo
    return winner # return "X" or "O"
  else
    nil # if won? returned "false", return nil for winner method
  end
end
