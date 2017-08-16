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
[6,4,2]
]

def won?(board)
  WIN_COMBINATIONS.each do |comb|
      return comb if comb.all? { |idx| board[idx] == "X"  }
      return comb if comb.all? { |idx| board[idx] == "O"  }
  end

false
end

def full?(board)
  return true if draw?(board)

end

def draw?(board)
  return false if won?(board).is_a?(Array)
  return true if board.all?{|el| el == "X" || el == "O" }
  false

end

def over?(board)
  return true if draw?(board) || won?(board)
  false
end

def winner(board)
  return board[won?(board).first] if won?(board).is_a?(Array)
  nil
end
