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
  b = board
  WIN_COMBINATIONS.each do |i|
    return i if i.all?{|val| board[val] == 'X'} || i.all?{|val| board[val] == 'O'}
  end
  return nil
end

def full?(board)
  !board.include?(" ") && !board.include?("")
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || won?(board)
end

def winner(board)
  return nil unless won?(board)
  WIN_COMBINATIONS.each do |i|
    return "X" if i.all?{|val| board[val] == "X"}
  end
  return "O"
end
