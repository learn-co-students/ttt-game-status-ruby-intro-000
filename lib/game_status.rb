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
  win = false
  WIN_COMBINATIONS.each do |wincombination|
    if board[wincombination[0]] == "X" && board[wincombination[1]] == "X" && board[wincombination[2]] == "X"
      win = wincombination
    elsif board[wincombination[0]] == "O" && board[wincombination[1]] == "O" && board[wincombination[2]] == "O"
      win = wincombination
    end
  end
  win
end

def full?(board)
  board.all? do |slot|
    slot == "X" || slot == "O"
  end
end

def draw?(board)
  draw = false
  if full?(board) == true && won?(board) == false
    draw = true
  end
end

def over?(board)
  over = false
  if won?(board) != false || draw?(board) == true
    over = true
  end
end

def winner(board)
  if won?(board) == false
    nil    
  elsif board[won?(board)[0]] == "X"
    "X"
  elsif board[won?(board)[1]] == "O"
    "O"
  end
end
