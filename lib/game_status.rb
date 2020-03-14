# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
[0,1,2], # Top row
[3,4,5], # Middle row
[6,7,8], # Bottom row
[0,3,6], # Left row
[1,4,7], # Center row
[2,5,8], # Right row
[2,4,6], # Foward diagonal
[0,4,8]  # Backward diagonal
]

def won?(board)
  WIN_COMBINATIONS.each {|win_combination| #Grabbing every array in WIN_COMBINATIONS
    index_0 = win_combination[0] #setting index_0 to the first element in the win_combination index
    index_1 = win_combination[1] #setting index_1 to the second element in the win_combination index
    index_2 = win_combination[2] #setting index_2 to the third element in the win_combination index

    position_1 = board[index_0] #setting postition_1 to the first position on the board that is equal to the first element in a win_combination index
    position_2 = board[index_1] #setting postition_2 to the second position on the board that is equal to the second element in a win_combination index
    position_3 = board[index_2] #setting postition_3 to the third position on the board that is equal to the third element in a win_combination index

    if position_1 == "X" && position_2 == "X" && position_3 == "X" #if all three of the index positions in a win_combination are filled with Xs return the win_combination
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O" #if all three of the index positions in a win_combination are filled with Os return the win_combination
      return win_combination
    end
  }
  return false
end

def full?(board) #method should accept a board and return true if every element in the board contains either an "X" or an "O".
 board.all? {|element| element == "X" || element == "O"}
end

def draw?(board)
  if !won?(board) && full?(board) #if its true the game hase no been won and its true the board is full return true
    return true
  else
    return false #for everything else return false
  end
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner (board)
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
