# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end


# Define your WIN_COMBINATIONS constant

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

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

def won?(board)
      if WIN_COMBINATIONS.each do |win_combination|

        position_1 = board[win_combination[0]]
        position_2 = board[win_combination[1]]
        position_3 = board[win_combination[2]]

        if
          position_1 == "X" && position_2 == "X" && position_3 == "X"
          return win_combination
        elsif
          position_1 == "O" && position_2 == "O" && position_3 == "O"
          return win_combination
        end
      end
      else
        return false
      end
  end

def full?(board)
  board.all? do |play|
    play == "X" || play == "O"
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  elsif !(won?(board) && full?(board))
    return false
  else won?(board) && full?(board)
    return false
  end
end

def over?(board)
  full?board || won?(board) || draw?(board)
end

def winner(board)
    if won?(board)
    win_combination = won?(board)
    board[win_combination[0]]
  end
end
