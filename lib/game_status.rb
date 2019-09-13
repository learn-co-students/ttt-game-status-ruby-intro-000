# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
[0, 1, 2], #top gorisontal
[3, 4, 5], #middle gorisontal
[6, 7, 8], #bottom gorisontal
[0, 3, 6], #left vertical
[1, 4, 7], #middle vertical
[2, 5, 8], #right vertical
[0, 4, 8], #right diagonal
[2, 4, 6] #left diagonal
]

def won?(board)
   WIN_COMBINATIONS.each do |combination|
     if combination.all? do |position|
        board[position] == "O"
      end
      return combination
    elsif
      combination.all? do |position|
        board[position] == "X"
      end
      return combination
    end
  end
    return false
end

def full?(board)
  board.none?{|i| i == " " }
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  end
end

def winner(board)
  win_index = won?(board)
  if over?(board)
    return board[win_index[1]]
  end
end
