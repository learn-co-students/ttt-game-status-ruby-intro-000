# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def won?(b)
  WIN_COMBINATIONS.detect{|c| b[c[0]] != " " && b[c[0]] == b[c[1]] && b[c[0]] == b[c[2]]}
  # should be able to iterate over the combinations defined in WIN_COMBINATIONS
  # using each or a higher-level iterator
  # return the correct board indexes that created the win
end

def full?(board)
  board.none?{|p| p == " "}
  # should accept a board and return true if every element in the board contains either an "X" or an "O".
  # return false if there is an available position and true if there is not
end

def draw?(board)
  full?(board) && !(won?(board))
  # returns true if the board has not been won but is full
  # false if the board is not won and the board is not ful
  # false if the board is won
  # compose this method solely using the methods you used above with some ruby logi
end

def over?(board)
  full?(board) || draw?(board) || won?(board)
  # returns true if the board has been won, is a draw, or is full
  # compose this method solely using the methods you used above with some ruby logic
end

def winner(board)
  if won?(board) == nil
    nil
  else
    winning = won?(board)
    winner = board[winning[0]]
  end
end





  #moves = []
  #if won?(board)
  #  board.select do |x|
  #    moves << x != " "
  #  end
  #end
  #print "move length: "
  #print moves.length()
  #moves.length() % 2 == 0 ? winner = "O" : winner = "X"
  # return the token, "X" or "O" that has won the game given a winning board
  # this method can be greatly simplified by using the methods and their return values you defined above


#board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
#print board.draw?

#print ["X", "O", "X", "O", "X", "X", "O", "X", " "].full?

#print "check"
#print won?(["X", " ", " ", " ", " ", " ", " ", "O", " "])
