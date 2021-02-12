# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # middle row
  [6,7,8], # bottom row
  [0,3,6], # left column
  [1,4,7], # middle column
  [2,5,8], # right column
  [0,4,8], # left diagonal
  [2,4,6] # right diagonal
]

# def won?(board)
#   winning_combination = []
#   WIN_COMBINATIONS.each  do |win_combination|
#     win_combination.each do |win_index|
#       board[win_index]  == "X"
#         winning_combination << win_index
#     end
#   end
#     winning_combination
# end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

# def full?(board)
#   board.all? do |index|
#     index == "X" || index == "O"
#   end
# end

def full?(board)
  board.all? {|token| token == "X"|| token == "O"}
end

# def draw?(board)
#   if !won?(board) && full?(board)
#     true
#   else
#     !won?(board) && !full?(board)
#   end
# end

def draw?(board)
  full?(board) && !won?(board)
end

# def over?(board)
#   if won?(board) && full?(board)
#     true
#   elsif won?(board) && !full?(board)
#     true
#   elsif draw?(board)
#     true
#   else
#      false
#   end
# end

# def over?(board)
#   if (won?(board) && full?(board)) || (won?(board) && !full?(board)) || draw?(board)
#     true
#   else
#      false
#   end
# end

# def over?(board)
#   (won?(board) && full?(board)) || (won?(board) && !full?(board)) || draw?(board)
# end

def over?(board)
  won?(board) || full?(board)
end

# def winner(board)
# winning_combo = won?(board)
#   winning_token = board[winning_combo[0]]
#   winning_token
# end

# def winner(board)
# winning_combo = won?(board)
#   winning_token = board[winning_combo.first]
#   # winning_token
# end

# def winner(board)
#   if won?(board)
#     winning_combo = won?(board)
#     board[winning_combo.first]
#   end
# end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end
