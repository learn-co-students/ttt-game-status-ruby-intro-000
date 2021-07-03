# Helper Method
require 'pry'
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

def won?(board)
      WIN_COMBINATIONS.each do |win_combo|
          win_index_1 = win_combo[0]
          win_index_2 = win_combo[1]
          win_index_3 = win_combo[2]

          position_1 = board[win_index_1]
          position_2 = board[win_index_2]
          position_3 = board[win_index_3]

          if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
            return win_combo
          end
      end
      return false
end

def full?(board)
  board.all? do |position|
    position == "X" || position == "O"
  end
end

def draw?(board)
  #binding.pry
  if full?(board) == false || won?(board) == true
    return false
  end
  if full?(board) == true && won?(board) == false
    return true
  end
end

def over?(board)
  if won?(board) == true || draw?(board) == true || full?(board) == true
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
    #thing = some_code
    #return thing
  end
end
