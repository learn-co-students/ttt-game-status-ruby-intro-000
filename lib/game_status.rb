# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,4,8],
  [6,4,2],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def won?(board)
  combo = WIN_COMBINATIONS.detect do |win_combination|
    win_combination.all? do |index|
      if board[index]=="X"
        true
      end
    end
  end
  if combo == nil
    combo = WIN_COMBINATIONS.detect do |win_combination|
      win_combination.all? do |index|
        if board[index]=="O"
          true
        end
      end
    end
  end
  return combo
end

def full?(board)
  board.all? do |move|
    if move=="X" || move=="O"
      true
    else
      false
    end
  end
end

def draw?(board)
  if won?(board)==nil && full?(board)==true #draw
    true
  else
    false
  end
end

def over?(board)
  if draw?(board) == true || won?(board)!=nil || full?(board)==true
    true
  else
    false
  end
end

def winner(board)
  if won?(board)==nil
    nil
  else
    index=won?(board)[0]
    return board[index]
  end
end
