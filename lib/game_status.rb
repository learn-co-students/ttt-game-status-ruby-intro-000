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

def empty_board?(board)
  board.all? do |position|
    position != "X" && position != "O"
  end
end

def full?(board)
  board.all? do |position|
    position == "X" || position == "O"
  end
end

def draw?(board)
  full?(board) && !win?(board)
end

def over?(board)
  full?(board) || win?(board)
end

def winner(board)
  combination = win?(board)
  if (combination)
    return board[combination[0]]
  else
    return nil
  end
end

def win?(board)
  WIN_COMBINATIONS.each do |combination|
    if combination.all? { |index| board[index] == "X"}
      return combination
    elsif combination.all? { |index| board[index] == "O"}
      return combination
    end
  end
  false
end

def won?(board)
  if empty_board?(board)
    return false
  else
    win?(board)
  end
end
