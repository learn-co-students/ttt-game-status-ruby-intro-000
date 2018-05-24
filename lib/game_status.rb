# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " " || board[index] == "")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

#def won?(board)
#  WIN_COMBINATIONS.detect do |combo|
#    board[combo[0]] == board[combo[1]] &&
#    board[combo[1]] == board[combo[2]] &&
#    position_taken?(board, combo[0])
#  end
#end
#
#def full?(board)
#  board.all?{|token| token == "X" || token == "O"}
#end

def won?(board)
  WIN_COMBINATIONS.select do |row|
    if position_taken?(board, row[0]) && board[row[0]] == board[row[1]] && board[row[1]] == board[row[2]]
      puts "WINNER"
      return row
    end
  end
  return false
end

def full?(board)
  WIN_COMBINATIONS.select do |row|
    row.select do |element|
      if !position_taken?(board, element)
        return false
      end
    end
  end
true
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  if won?(board).is_a?(Array)
    return board[won?(board)[0]]
  else
    return nil
  end
end
