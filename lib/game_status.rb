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
  win = nil
  WIN_COMBINATIONS.each {|win_array|
    if board[win_array[0]] == 'X' && board[win_array[1]] == 'X' && board[win_array[2]] == 'X'
      win = win_array
    elsif board[win_array[0]] == 'O' && board[win_array[1]] == 'O' && board[win_array[2]] == 'O'
      win = win_array
    end
  }
  win
end

def full?(board)
  !(board.any? {|location| location == " " || location == nil})
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  won?(board) ? board[won?(board)[0]] : nil
end
