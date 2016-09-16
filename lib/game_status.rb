# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #left columns
  [1,4,7], #middle columns
  [2,5,8], #right columns
  [0,4,8], #diagonal 1
  [2,4,6] #diagonal 2
]



def won?(board)
    WIN_COMBINATIONS.detect do |win_combination|
		if board[win_combination[0]] == board[win_combination[1]] && board[win_combination[1]] == board[win_combination[2]] && board[win_combination[0]] != " "
        return win_combination
    elsif board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
       false
    else
      false
      end
    end
end

def full?(board)
  board.all? do |position|
    position != " "
  end
end

def draw?(board)
  full?(board) == true && winner(board) == nil
end



def over?(board)
  won?(board) == true || full?(board) == true || draw?(board) == true
end

def winner(board)
  WIN_COMBINATIONS.detect do |win_combination|
    if board[win_combination[0]] == board[win_combination[1]] && board[win_combination[1]] == board[win_combination[2]] && board[win_combination[0]] != " "
      return board[win_combination[0]]
    else
      nil
    end
  end
end
