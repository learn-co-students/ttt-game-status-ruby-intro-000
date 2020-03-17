require "pry"

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], # bottom row
  [0,3,6], #first column
  [1,4,7], #second column
  [2,5,8], #third column
  [0,4,8], #diagonal1
  [2,4,6] #diagonal2
]

def won?(board)
  WIN_COMBINATIONS.detect do |combos|
    win_index_1 = combos[0]
    win_index_2 = combos[1]
    win_index_3 = combos[2]
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return combos
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return combos
    else
      false
    end
  end
end

def full?(board)
  filled = board.all? do |position|
    position == "X" || position == "O"
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  # elsif !full?(board) && !won?(board)
  #   false
  else
    false
  end
end

def over?(board)
  full?(board) || won?(board)
end

def winner(board)
  if won?(board)
    # binding.pry
     combo = won?(board)
     board[combo[0]]
  end
end
