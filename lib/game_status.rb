# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], # top row win
   [3, 4, 5], # middle row win
   [6, 7, 8], # bottom row win
   [0, 3, 6], # left column win
   [1, 4, 7], # middle column win
   [2, 5, 8], # right row win
   [0, 4, 8], # diagonal - top-left to bottom-right
   [2, 4, 6] # diagonal - top-right to bottom-left
 ]

 def won?(board)
   WIN_COMBINATIONS.detect do |win_combo|
     board[win_combo[0]] == "X" && board[win_combo[1]] == "X" && board[win_combo[2]] == "X" ||
     board[win_combo[0]] == "O" && board[win_combo[1]] == "O" && board[win_combo[2]] == "O"
   end
 end

 def full?(board)
   board.all? {|e| e == "X" || e == "O"}
 end

 def draw?(board)
   !won?(board) && full?(board)
 end

 def over?(board)
   draw?(board) || won?(board) || full?(board)
 end

 def winner(board)
   if won?(board)
     return board[won?(board)[0]]
   else
     return nil
   end
 end
