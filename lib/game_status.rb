WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [2,4,6], # Diognal from right
  [0,4,8], # Diognal from left
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8]  # Right column
]

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
def won?(board)
  WIN_COMBINATIONS.each do |combo|
  if board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X" ||
      board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
      return combo
    end
  end
  false
end

def full?(board)
  return true if board.all? {|a| a.match(/[XO]/)}
  false
end

def draw?(board)
  return true if full?(board) && won?(board) == false
  false
end

def over?(board)
  return true if full?(board) || won?(board) || draw?(board)
end

def winner(board)
  if won?(board)
      board[won?(board)[0]]
  end
end
