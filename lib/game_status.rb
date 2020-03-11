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
  WIN_COMBINATIONS.each do |winning_array|
    if board[winning_array[0]] == 'X' && board[winning_array[1]]== 'X' && board[winning_array[2]] == 'X'
      return winning_array
    elsif board[winning_array[0]] == 'O' && board[winning_array[1]]== 'O' && board[winning_array[2]] == 'O'
      return winning_array
    end
  end
  return false
end

def full?(board)
  board.all? do |current_player|
   current_player == "X" || current_player == "O"
  end
 end

 def draw?(board)
   if won?(board) == false && full?(board)== true
     return true
   elsif won?(board)== false || full?(board)== false
     return false
   end
   return false
 end

def over? (board)
  if draw?(board)== true || won?(board)!= false || full?(board) == true
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board) != false
    winning_array = won?(board)
    board[winning_array[0]] == "X" ?  "X" : "O"
  else
    return nil
  end
end
