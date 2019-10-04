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
  WIN_COMBINATIONS.each {|winner_wcd|
    index_0 = winner_wcd[0]
    index_1 = winner_wcd[1]
    index_2 = winner_wcd[2]

    position_1 = board[index_0]
    position_2 = board[index_1]
    position_3 = board[index_2]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return winner_wcd
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return winner_wcd
    end
  }
  return false
end

def full?(board)
  board.all? {|index| index == "X" || index == "O"}
end

def draw?(board)
  if !won?(board) && full?(board)
    return true 
  else
    return false
  end
end 

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true 
  else 
    return false 
  end
end 

def winner(board)
  index = []
  index = won?(board)
  if index == false 
    return nil
  else
    if board[index[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end