# Helper Method
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
  winner_game = nil
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    position_1 = board[win_index_1]

    win_index_2 = win_combination[1]
    position_2 = board[win_index_2]

    win_index_3 = win_combination[2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X"  && position_3 == "X"
      winner_game = win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      winner_game = win_combination 
    end

    break if winner_game
  end

  return winner_game
end

  def full?(board)
  board.all? do |index|
    index == "X" || index == "O"  
  end
end


def draw?(board)
  if ( !(won?(board)) && full?(board) ) #true if board has not been won and is full
    return true
  elsif ( !(won?(board))  && !(full?(board)) ) #false if board has not been won and is not full
    return false
  elsif (won?(board))   #return false if board is won
    return false
  end
    
end

def over?(board)
  #returns true if the board is won, is a draw or is full
  #otherwise return false
  if ( won?(board) || draw?(board) || full?(board))
    return true
  else
    return false
  end
end

def winner(board)
  #return token x or o that won the game
  
  if ( won?(board) )
    position_array = []
    (won?(board)).each do |element|
      position_array << board[element]
    end
    all_X = position_array.all? do|element|
        element == "X"
    end
    if (all_X )
      return "X"
    else
      return "O"
    end
  end
end
