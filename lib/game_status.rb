# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row

  [0,3,6],
  [1,4,7],
  [2,5,8],

  [0,4,8],
  [2,4,6],
]

def won?(board)
  xwin = false
  owin = false
  WIN_COMBINATIONS.each do |win_combination|
    # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
    # grab each index from the win_combination that composes a win.
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      xwin = win_combination # return the win_combination indexes that won.
    end
    if position_1 == "O" && position_2 == "O" && position_3 == "O"
      owin = win_combination # return the win_combination indexes that won.
    end
  end

  if xwin && owin
    false
  elsif xwin
    xwin
  elsif owin
    owin
  else
    false
  end
end

def full?(board)
  count = 0
  board.each do |spot|
    count += spot == ' ' ? 0 : 1
  end
  return count == 9
end

def draw?(board)
  return full?(board) && !won?(board)
end

def over?(board)
  return won?(board) || draw?(board) || full?(board)
end


def winner(board)
  x = won?(board)
  if x
    board[x[0]]
  else
    nil
  end
end
