require "pry"
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #Top Row
  [3,4,5], #Mid Row
  [6,7,8], #Bottom Row
  [0,4,8], #Diagonal L>R
  [2,4,6], #Diagonal R>L
  [0,3,6], #L Column
  [1,4,7], #Mid Column
  [2,5,8]  #R Column
]

#board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def won?(board)
win_combo = false
  WIN_COMBINATIONS.each do |win_array|
    if board[win_array[0]] == "X" && board[win_array[1]] == "X" && board[win_array[2]] == "X" || board[win_array[0]] == "O" && board[win_array[1]] == "O" && board[win_array[2]] == "O"
      win_combo = win_array
    end
  end
win_combo
end

def full?(board)
  full = false
  if board[0] != " " && board[1] != " " && board[2] != " " && board[3] != " " && board[4] != " " && board[5] != " " && board[6] != " " && board[7] != " " && board[8] != " "
    full = true
  end
  full
end

def draw?(board)
  if full?(board) && won?(board)
    false
  elsif full?(board) && !won?(board)
    true
  else !full?(board)
    false
  end
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  winner = nil
  WIN_COMBINATIONS.each do |win_array|
    if board[win_array[0]] == "X" && board[win_array[1]] == "X" && board[win_array[2]] == "X"
      winner = "X"
    elsif board[win_array[0]] == "O" && board[win_array[1]] == "O" && board[win_array[2]] == "O"
      winner = "O"
    end
  end
  winner
end



#def full?(board)
#  board.each do |space|

#  end
#end


#def full?(board)
#  full = false
#  taken = false
#  counter = 0
#  board.each do |space|
#    if space != " "
#      taken = board[counter]
#    end
#    counter += 1
#  end
#  if board[0] == taken && board[1] == taken && board[2] == taken && board[3] == taken && board[4] == taken && board[5] == taken && board[6] == taken && board[7] == taken && board[8] == taken
#    full = true
#  end
#  full
#end


#def won?(board)
#  if board[top_row_win[0]] == "X" && board[top_row_win[1]] == "X" && board[top_row_win[2]] == "X"
#    [0,1,2]
#  elsif board[top_row_win[0]] == "O" && board[top_row_win[1]] == "O" && board[top_row_win[2]] == "O"
#    [0,1,2]
#  else
#    false
#  end
#end
