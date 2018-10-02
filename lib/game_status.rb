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
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
    if win_combo.all? do |win_index|
      board[win_index] == "X"
    end
    true
  elsif win_combo.all? do |win_index|
      board[win_index] == "O"
    end
    true
  else
    false
  end
 end
end

def full?(board)
   board.all? {|po| po != " "}
end

def draw?(board)
  if full?(board) == true && !won?(board) == true
    true
  end
end

def over?(board)
   if won?(board) != nil || full?(board) == true || draw?(board) == true
     true
   else
     false
   end
end

def winner(board)
  WIN_COMBINATIONS.find do |win_combo|
    if board[win_combo[0]] == "X" && board[win_combo[1]] == "X" && board[win_combo[2]] == "X"
      return "X"
    elsif board[win_combo[0]] == "O" && board[win_combo[1]] == "O" && board[win_combo[2]] == "O"
      return "O"
    else
      nil
    end
  end
end
