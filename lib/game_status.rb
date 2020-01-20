# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0, 1, 2], #top row win
[3, 4, 5], #mid row win
[6, 7, 8], #bottom row win
[1, 4, 7], #mid column win
[2, 5, 8], #right column win
[0, 3, 6], #left column
[0, 4, 8], #left top to bottom right diagonal win
[2, 4, 6]] #right top to bottom left diagonal win]

 def won?(board)
   WIN_COMBINATIONS.detect do |win_conditions|
      if position_taken?(board,win_conditions[0]) && board[win_conditions[0]] == board[win_conditions[1]] && board[win_conditions[1]] == board[win_conditions[2]] 
           return win_conditions
      end
   end
   return false
end

def full?(board)
 board.none? {|spot| spot == " "} 
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else 
    return false
  end
end 

def over?(board)
  if won?(board) || draw?(board)
    return true
  end
end

def winner(board)
  WIN_COMBINATIONS.detect do |win_conditions|
  if board.draw?
    return nil
    elsif board.won? && board[win_conditions[0]] == board[win_conditions[1]] && board[win_conditions[1]] == board[win_conditions[2]] && board[win_conditions[0]] == "X"
    "X"
  elsif board.won? && board[win_conditions[0]] == board[win_conditions[1]] && board[win_conditions[1]] == board[win_conditions[2]] && board[win_conditions[0]] == "O"
    "O"
  else
    return nil
  end
  end
end