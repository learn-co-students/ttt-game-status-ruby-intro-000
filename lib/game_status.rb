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
    [2,4,6]
  ]
  
 #code for won? method 
def won?(board_array)
  winning_combo = nil
  #create a varibale to store code to check if board is empty
  empty_or_not = board_array.all? do |index|
    index == " "
  end
  #checks to see of board is empty or not
  if empty_or_not
    return false
  else
    #logic to check for a winning combination
    WIN_COMBINATIONS.each do |combo|
      if  board_array[combo[0]] == "X" && board_array[combo[1]] == "X" && board_array[combo[2]] == "X"
        winning_combo = combo
      elsif board_array[combo[0]] == "O" && board_array[combo[1]] == "O" && board_array[combo[2]] == "O"
        winning_combo = combo
    end
  end
end
  return winning_combo
end 

#code for full? method
def full?(board_array)
  board_check = board_array.all? do |space|
    space != " "
  end
  
  if board_check
    return true #situation for a draw
  else
    return false #situation for an in-progress game
  end
end

#code for draw? method
def draw?(board_array)
  if won?(board_array)
    return false
  else
    return true
  end
end

#code for over? method
def over?(board_array)
  if full?(board_array) || won?(board_array)
    return true
  else
    return false
  end
end

#code for winner method
def winner(board_array)
  if won?(board_array) && board_array.include?("O")
    return "O"
  elsif won?(board_array) && board_array.include?("X")
    return "X"
  else
    return nil
  end 
end

