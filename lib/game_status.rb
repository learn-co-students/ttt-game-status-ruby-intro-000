# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# example boards
# board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
board = ["X", "O", "X", "O", "X", "O", "X", "X", "O"]

# Define your WIN_COMBINATIONS constant
=begin
 # Board visual
 0 | 1 | 2
 3 | 4 | 5
 6 | 7 | 8
=end

WIN_COMBINATIONS = [
  [0,1,2], # Top horizontal
  [3,4,5], # Middle horizontal
  [6,7,8], # Bottom horizontal
  [0,3,6], # Left vertical
  [1,4,7], # Middle vertical
  [2,5,8], # Right vertical
  [0,4,8], # \ diagonal
  [2,4,6] # / diagonal
]

def full?(board)
  if board.count { |x| x == "X" || x == "O" } == 9
    true
  else
    false
  end
end

def won?(board)
  win_combo = nil

  count_letter = lambda do |arr, letter|
    true if arr.count(letter) === 3
  end

  if board.count { |x| x == " "} == 9
    false

  else

    WIN_COMBINATIONS.each do |combo|
      positions = [ board[combo[0]], board[combo[1]], board[combo[2]] ]
      if count_letter[positions, "O"]
        win_combo = combo
      elsif count_letter[positions, "X"]
        win_combo = combo
      elsif full?(board)
        false
      else
        false
      end
    end

  end
  return win_combo
end

def draw?(board)
  # returns true if the board has not been won and is full
  if !won?(board) && full?(board)
    true
   # and false if the board is not won and the board is not full,
  elsif !won?(board) && !full?(board)
    false
 # and false if the board is won
  elsif won?(board)
    false
  end

end

def over?(board)
  # returns true if the board has been won, is a draw, or is full
  if won?(board) || draw?(board) || full?(board)
    true
  else
    false
  end
end

def winner(board)
  winner = nil
  pos = won?(board) ? won?(board) : 9 # used an int to avoid undefined method `[]' for nil:NilClass
  player = board.values_at(pos[0], pos[1], pos[2])

  count_letter = lambda do |arr, letter|
    true if arr.count(letter) === 3
  end

  # return the token, "X" or "O" that has won the game given a winning board
  if count_letter[player, "X"]
    winner = "X"
  elsif count_letter[player, "O"]
    winner = "O"
  end

  return winner
end


# won?(board)
