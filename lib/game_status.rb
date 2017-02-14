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
  WIN_COMBINATIONS.each do |win_combination|
    if win_combination.all?{|i| board[i] == "X"}
      return win_combination
    elsif win_combination.all?{|i| board[i] == "O"}
      return win_combination
    else
      false
    end
  end
  if board.all?{|ele| ele == " " || ele == ""}
    false
  end
end

def full?(board)
  board.all?{|ele| ele == "X" || ele == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  win_combination = won?(board)

  if !win_combination
    nil
  elsif draw?(board)
    nil
  elsif win_combination.all?{|i| board[i] == "X"}
    winner = "X"
  elsif win_combination.all?{|i| board[i] == "O"}
    winner = "O"
  end
end
