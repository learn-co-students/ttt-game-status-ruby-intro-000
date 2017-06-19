# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #toprow
  [3,4,5], #middlerow
  [6,7,8], #bottomrow
  [0,3,6], #leftcolumn
  [1,4,7], #middlecolumn
  [2,5,8], #rightcolumn
  [0,4,8], #lrdiagonal
  [2,4,6] #rldiagonal
]

def won?(board)
  WIN_COMBINATIONS.each do |childArray|
    win_index_1 = childArray[0]
    win_index_2 = childArray[1]
    win_index_3 = childArray[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return childArray
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return childArray
    end
  end
  false
end

def full?(board)
  board.none? { |xo| xo == " " }
end

def draw?(board)
  won?(board) == false && full?(board) == true
end

def over?(board)
  draw?(board) == true || won?(board) == true || full?(board) == true
end

def winner(board)
  if won?(board).is_a?(Array)
    winner = won?(board)
    number = winner[0]
    return board[number]
  else
    nil
  end
end
