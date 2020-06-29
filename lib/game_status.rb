# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  #3 horizontal winning combos
  [0,1,2],
  [3,4,5],
  [6,7,8],
  #3 vertical winning combos
  [0,3,6],
  [1,4,7],
  [2,5,8],
  #2 diagonal winning combos
  [0,4,8],
  [2,4,6]
]

#method returning the winning combination indexes (or false if nobody won)
def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    check = [board[win_combo[0]], board[win_combo[1]], board[win_combo[2]]]
    if check[0] == "X" && check[1] == "X" && check[2] == "X"
      return win_combo
    elsif check[0] == "O" && check[1] == "O" && check[2] == "O"
      return win_combo
    end
  end
  return false
=begin  
  found = false
  WIN_COMBINATIONS.each do |win_combo|
    if win_combo.all? {|index| index == "X"} == true
      found = win_combo
    elsif win_combo.all? {|index| index == "O"} == true
      found = win_combo
    end
  end
  return found
=end
end

#method returning whether the entire board is full
#AKA, if the none of the elements in the board array are " ", return true
def full?(board)
  board.none? {|char| char == " "}
end

#method returning whether the game is a draw
#returns true if the board is full and there is no winner
#returns false otherwise
def draw?(board)
  return full?(board) && won?(board) == false
end

#method returning whether the game is over
#returns true if there is a winner, there was a draw, or the board is full
def over?(board)
  return !won?(board) == false || draw?(board) || full?(board)
end

#method returning the winning player's character, given a winning game
#returns nil if passed a board with no winner
def winner(board)
  if won?(board) == false
    return nil
  else
    winning_combo_arr = won?(board)
    winning_char = board[winning_combo_arr[0]]
    return winning_char
  end
end