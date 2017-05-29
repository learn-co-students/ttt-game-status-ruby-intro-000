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
  [6, 4, 2]
]

def won?(board)
  empty = board.all? do |item|
    item == " "
  end

  if empty
    return false
  end

  WIN_COMBINATIONS.each do |combination|
    index_1 = combination[0]
    index_2 = combination[1]
    index_3 = combination[2]

    position_1 = board[index_1]
    position_2 = board[index_2]
    position_3 = board[index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return combination
    else
      false
    end
  end
  false
end

def draw?(board)
end

def full?(board)
  empty = board.all? { |i| i == " " }
  any = board.any? { |i| i == " " }

  if empty
    return false
  elsif any
    return false
  else
    true
  end
end

def draw?(board)
  if !full?(board)
    return false
  elsif won?(board).class == Array
    return false
  end

  true
end

def over?(board)
  if draw?(board)
    return true
  elsif won?(board)
    return true
  end
end

def winner(board)
  if draw?(board) || won?(board).class != Array
    return nil
  else
    winner_board = won?(board)
    return board[winner_board[0]]
  end
end

board = ["X", " ", "X", " ", "X", " ", "O", "O", " "]
win_board = ["X", "O", "X", "O", "X", "O", "O", "O", "X"]
draw_board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
no_winner_board = ["X", "O", " ", " ", " ", " ", " ", "O", "X"]

puts winner(no_winner_board)
