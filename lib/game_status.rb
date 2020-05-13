# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
board = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]

WIN_COMBINATIONS = [
  [0,1,2], #top row win
  [3,4,5], #mid row win
  [6,7,8], #bottom row win
  [0,3,6], #left column win
  [1,4,7], #mid column win
  [2,5,8], #right column win
  [2,4,6], #left diagonal win
  [0,4,8], #right diagonal win
]

def won?(board)
  WIN_COMBINATIONS.each do |win|
    win_index_1 = win[0]
    win_index_2 = win[1]
    win_index_3 = win[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win
    end
  end
  return false
end

def full?(board)
  board.all? do |char|
    char == "X" || char == "O"
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if draw?(board) || won?(board)
    return true
  else !full?(board)
    return false
  end
end

def winner(board)
  win = []
  win = won?(board)
  if win == false
    return nil
  elsif board[win[0]] == "X"
    return "X"
  else
    return "O"
  end
end
