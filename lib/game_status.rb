# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  #bottom row
  [0,3,6],  #left column
  [1,4,7],  #middle column
  [2,5,8],  #right column
  [0,4,8],  #diagnocal left
  [2,4,6]   #diagonal right
]

def won?(board)
  WIN_COMBINATIONS.find do |win_combo|
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]
board[win_index_1] == board[win_index_2] && board[win_index_2] == board[win_index_3] && board[win_index_1] != " "

  end
end

def full?(board)
  (0..8).all? do |space|
    position_taken?(board, space)
  end
end

def draw?(board)
  if won?(board) != nil
    return false
  elsif full?(board) == false
    return false
  else return true
  end
end

def over?(board)
  if won?(board) != nil
    return true
  elsif draw?(board) == true
    return true
  else return false
  end
end

def winner(board)
  if won?(board) != nil
  win_move = won?(board)
  return board[win_move[0]]
else return nil
end
end
