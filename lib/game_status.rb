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

# won method : returns true if there is a winner; else if not
def won?(board)

    # loops through the 2D array WIN_COMBINATIONS
    WIN_COMBINATIONS.each do |combination|

      # flags
      x_win = 0
      o_win = 0

      combination.each do |index|

        # checks if player X wins
        if board[index] == "X"
          x_win += 1

          if x_win == 3
            return combination
          end
        else
          x_win = 0
        end

        # checks if player O wins
        if board[index] == "O"
          o_win += 1

          if o_win == 3
            return combination
          end
        else
          o_win = 0
        end

      end
    end

    # return false if there is no winner
    return false
end

# full method : accepts the array "board" and returns true if every element in the board contains a value "X" or "O"
def full?(board)
  board.each do |values|
    if values == " " || values == ""
      return false
    else
      true
    end
  end
end

# draw method : accepts the array "board" and returns true if the board has not been won but is full
def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end

# over method : accepts the array "board" and returns true if board has been won, is a draw, or is full
def over?(board)
  if won?(board)
    return true
  elsif draw?(board)
    return true
  else
    false
  end
end

# won method" accepts board and returns the token "X" or "O" indicating the winner
def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  else
    return nil
  end
end
