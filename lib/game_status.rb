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
  WIN_COMBINATIONS.each do |combination|
    #puts "#{combination}"
    if combination.all?{|mark| board[mark] == "X"} || combination.all?{|mark| board[mark] == "O"}
      return combination
    end
  end
  return false
end

def full?(board)
  return true if board.all?{|mark| mark=="X" || mark=="O"}
  false
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  elsif !won?(board) && !full?(board)
    return false
  elsif won?(board)
    return false
  end
end

def over?(board)
  return true if won?(board) || draw?(board) || full?(board)
end

def winner(board)
  winner = won?(board)
  winner ? board[winner[0]] : nil
end
