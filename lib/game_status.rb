# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

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

#1. Is there a winning array?
#    1. are any of the winning combinations on the board? Yes/no
      #  1. are all of the elements within the winning combination matching values? Y/N
        #    1. If yes, return the winning combination

def won?(board)
  WIN_COMBINATIONS.detect do |winning_array|
    board[winning_array[0]] == board[winning_array[1]] && board[winning_array[1]] == board[winning_array[2]] && position_taken?(board, winning_array[0])
  end
end


def full?(board)
  board.all? do |each_index|
    each_index == "X" || each_index == "O"
  end
  end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  combo_array = won?(board)
    if combo_array
      return board[combo_array[0]] #in a winning combo the tokens match so [0] or [1] [2] will all give the same result
    end
    return nil
end



#all_X = winning_array.all? do |single_index| #we've created all_X variable because .detect will only work with the last condition that was entered which means it would only iterate over "O" - therefore by creating the variables all_X and all_O I'm making the conditions one unit under which i call .detect on line 30
  #board[single_index] == "X" #board[single_index] is referring to each index on the board only considering the winning_array/WIN_COMBINATIONS
#end
#all_O = winning_array.all? do |single_index|
#  board[single_index] == "O"
#end
#all_X == true || all_O == true
