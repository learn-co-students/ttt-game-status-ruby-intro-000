# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #Top Row
  [3,4,5], # Middle Row
  [6,7,8], # Bottom Row
  [0,3,6], # Left Column
  [1,4,7], # Middle Column
  [2,5,8], # Right Column
  [0,4,8], # Left Diagonal
  [2,4,6] #Right Diagonal
]
def won?(board)
  WIN_COMBINATIONS.each do |combo|
    win_index_1 = combo[0]
    win_index_2 = combo[1]
    win_index_3 = combo[2]
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return combo
    end
  end
  return false
end
SPOTS = [0,1,2,3,4,5,6,7,8]
def full?(board)
  full = SPOTS.all? do |index|
    position_taken?(board,index)
  end
end

def draw?(board)
  draw = full?(board) && !won?(board)
end

def over?(board)
  over = full?(board) || draw?(board) || won?(board)
end

def winner(board)
  if won?(board)
    winner = board[won?(board)[0]]
  end
end
