# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
    # Middle row
  # ETC, an array for each win combination
]
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
def won?(board)
    combo = 0
    while combo < WIN_COMBINATIONS.length
      current_combo = WIN_COMBINATIONS[combo]

      win1 = current_combo.all? { |position| board[position] == "X" }
      win2 = current_combo.all? { |position| board[position] == "O" }

      if win1 == true || win2 == true
        return current_combo
      else
       false
      end

      combo += 1
    end

  end

def full?(board)
  board.all? do |i|
    i == "X" || i == "O"
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if draw?(board) || won?(board)
    return true
  else return false
  end
end

def winner(board)
  winner = won?(board)
  if winner != nil
    return board[winner[0]]
  end
end
