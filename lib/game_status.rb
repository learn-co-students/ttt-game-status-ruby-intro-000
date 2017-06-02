# Helper Method
require "pry"

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

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    # first = combination[0]
    # second = combination[1]
    # third = combination[2]
    # if (board[first] == board[second]) && (board[second] == board[third]) && position_taken?(second)
    #   return comibination
    # end
    if combination.all? do |position|
  #    binding.pry
        board[position] == "O"
      end
      return combination
    elsif
      combination.all? do |position|
    #    binding.pry
        board[position] == "X"
      end
      return combination
  #  binding.pry
    end
  end
    return false
end

def full?(board)
  board.none?{|i| i == " " }
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  #else
    #return false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  end
end

def winner(board)
  win_index = won?(board)
  if over?(board)
    return board[win_index[1]]
  end
end
