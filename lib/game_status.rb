# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8],
]

def won?(board)
  combo = 0
  while combo < WIN_COMBINATIONS.length
    current_combo = WIN_COMBINATIONS[combo]

    won1 = current_combo.all? { |cell| board[cell] == "X" }
    won2 = current_combo.all? { |cell| board[cell] == "O" }

    if won1 == true || won2 == true
      return current_combo
    end
    combo += 1
  end
  false
end

def full?(board)
  board.none? do |cell|
    cell == "" || cell == " "
  end
end

def draw?(board)
  if won?(board)
    false
  elsif full?(board) == false
    false
  else
    true
  end
end

def over?(board)
  if won?(board)
    true
  elsif full?(board)
    true
  elsif draw?(board)
    true
  else
    false
    end
end

def winner(board)
  if won?(board) == false
    nil
  else
  win_1 = won?(board)
    board[win_1[0]]
  end
end
