# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2],
]

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    if position_taken?(board, combination[0])
      if board[combination[0]] == board[combination[1]] && board[combination[1]] == board[combination[2]]
        return combination
      end
    end
  end
  return false
end

def full?(board)
  if board.detect{|cell| (cell.nil? || cell == " " || cell == "")}
    return false
  end
  return true
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  end
  return false
end

def over?(board)
  if won?(board) || draw?(board)
    return true
  end
  return false
end

def winner(board)
  won = won?(board)
  if won
    return board[won[0]]
  end
end
