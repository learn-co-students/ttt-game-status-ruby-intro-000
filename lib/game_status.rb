# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # m row
  [6,7,8], # b row
  [0,3,6], # l col
  [1,4,7], # m col
  [2,5,8], # r col
  [0,4,8], # l diag
  [2,4,6]  # r diag
]

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    board[win_combination[0]] == board[win_combination[1]] &&
    board[win_combination[1]] == board[win_combination[2]] &&
    position_taken?(board,win_combination[0])
  end
end

def full?(board)
  board.all? do |char|
    char == "X" || char == "O"
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) == true || full?(board) == true
end

def winner(board)
  if won?(board) != nil
    win_combo = won?(board)
    return board[win_combo[0]]
  end
end
