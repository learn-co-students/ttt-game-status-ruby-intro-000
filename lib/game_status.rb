# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 4, 8],
  [2, 4, 6],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8]
]

def won?(board)
  WIN_COMBINATIONS.each do |wincombo|
    if (board[wincombo[0]]) == "X" && (board[wincombo[1]]) == "X" && (board[wincombo[2]]) == "X"
      return wincombo
    elsif (board[wincombo[0]]) == "O" && (board[wincombo[1]]) == "O" && (board[wincombo[2]]) == "O"
      return wincombo
    end
  end
  false
end

def full?(board)
  if board.include? " "
      return false
  else return true
  end
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  elsif full?(board) == false && won?(board) == false
    return false
  elsif won?(board) == true
    return false
  end
end

def over?(board)
  if won?(board) == true || draw?(board) == true || full?(board) == true
    return true
  return false
end
end

def winner(board)
  if win_combination = won?(board)
      board[win_combination.first]
  end
end
# Define your WIN_COMBINATIONS constant





=begin
def won?(board)
  if board.include? WIN_COMBINATIONS
    board.select do |x|
      x.include? WIN_COMBINATIONS

  end
end
end

win_index_1 = WIN_COMBINATIONS[0]
win_index_2 = WIN_COMBINATIONS[1]
win_index_3 = WIN_COMBINATIONS[2]
win_index_4 = WIN_COMBINATIONS[3]
win_index_5 = WIN_COMBINATIONS[4]
win_index_6 = WIN_COMBINATIONS[5]
win_index_7 = WIN_COMBINATIONS[6]
win_index_8 = WIN_COMBINATIONS[7]
=end
