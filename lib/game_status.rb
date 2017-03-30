def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7],
[2, 5, 8], [0, 4, 8], [2, 4, 6]]

def won?(board)
  WIN_COMBINATIONS.detect do |win_array|
  board[win_array[0]] == board[win_array[1]] && board[win_array[1]] == board[win_array[2]] && position_taken?(board, win_array[0])
  end
end

def full?(board)
  board.all?{|position| position == "X" || position == "O"}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  if win_combination = won?(board)
  board[win_combination.first]
  end
end
