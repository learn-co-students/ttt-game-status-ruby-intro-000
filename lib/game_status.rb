# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def won?(board)
 WIN_COMBINATIONS.each do |win_comb|
   if board[win_comb[0]] =="X" && board[win_comb[1]] == "X" && board[win_comb[2]] == "X" ||  board[win_comb[0]] =="O" && board[win_comb[1]] == "O" && board[win_comb[2]] == "O"
      return win_comb
   end
 end
 false
end

def full?(board)
  board.all? do |index|
    index == "X" || index == "O"
  end
end

def draw?(board)
  if won?(board) || !full?(board)
      return false
    elsif full?(board) || !won?(board)
      return true
    else
      return false
   end
end

def over?(board)
   won?(board) || full?(board) || draw?(board)
end

def winner(board)
   if  board[win_comb] =="X"
     return "X"
   elsif won?(board) =="O"
     return "O"
  else
    return nil
   end
end
