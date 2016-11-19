# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
[0, 1, 2], #top row
[3, 4, 5], #middle row
[6, 7, 8], #bottom row
[0, 3, 6], #first column
[1, 4, 7], #second column
[2, 5, 8], #third column
[0, 4, 8], #L to R diagonal
[2, 4, 6] #R to L diagonal
]

# Define the #won? method

def won?(board)
  WIN_COMBINATIONS.any? do |win_combination| #load each win combination array into this variable
    win_index_1 = win_combination[0] #win_index_1 = first position of the current win combination
    win_index_2 = win_combination[1] #win_index_2 = second position of the current win combination
    win_index_3 = win_combination[2] #win_index_3 = third position of the current win combination

    position_1 = board[win_index_1] #position_1 = the board status at position win_index_1
    position_2 = board[win_index_2] #position_2 = the board status at position win_index_2
    position_3 = board[win_index_3] #position_3 = the board status at position win_index_3

    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combination
    else
      false
    end
  end
end

# Define the #full? method

def full?(board)
  !(board.include? " ")
end

# Define #draw? method

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  else
    return false
  end
end

# define #over? method

def over?(board)
  if full?(board) == true || draw?(board) == true
    return true
  else
    return false
  end
end

#Define #winner? method

def winner(board)
  if won?(board) == false         #check to see if it was actually won
    return nil                    #if it wasn't, return nil
  else                            #otherwise, moving on
    winning_array = won?(board)   #var winning_array to the array returned by won?(board)
    position = winning_array[0]   #var position to the value of the first position of winning_array
    if board[position] == "X"     #if it's "X", return "X", etc...
      return "X"
    elsif board[position] == "O"
      return "O"
    end
  end
end
