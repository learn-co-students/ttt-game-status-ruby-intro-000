# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0, 1, 2],
                    [3, 4, 5],
                    [6, 7, 8],
                    [0, 3, 6],
                    [1, 4, 7],
                    [2, 5, 8],
                    [0, 4, 8],
                    [2, 4, 6]]

def won?(board)
  # for each win_combination in WIN_COMBINATIONS
  WIN_COMBINATIONS.each do |win_combination|
    # win_combination is a 3 element array of indexes that compose a win, [0, 1, 2]
    # grab each index from the win_combination that composes a win.
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3

    if (position_1 == "X" && position_2 == "X" && position_3 == "X") ||
       (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combination # return the win_combination indexes that won
    end
  end
  return false
end

def full?(board)
  # should accept a board and return true if every element in the board contain either an "X" or an "O"
  return board.none? { |element| element == " " || element == "" || element == nil }
end

def draw?(board)
  # should accept a board and return true if the board has not been won and is full and false if the board is not won and the board is not full, and false if the board is won
  if won?(board) != false # won?(board) returns an array, not a Boolean, if not false
    return false
  else
    return full?(board)
  end
end

def over?(board)
  # should accept a board and return true if the board has been won, is a draw, or is full
  return true if won?(board) != false || draw?(board) || full?(board)
end

def winner(board)
  # should accept a board and return the token, "X" or "O", that has won the game given a winning board
  board[won?(board)[0]] if won?(board)
end
