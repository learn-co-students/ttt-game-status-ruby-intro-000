# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
[0,1,2], #Top row
[3,4,5], #Middle row
[6,7,8], #Bottom row
[0,3,6], #First column
[1,4,7], #Second column
[2,5,8], #Third column
[0,4,8], #Left diagonal
[2,4,6], #Right diagonal
]

#won? method
def won?(board)

  winning_combination = WIN_COMBINATIONS.select do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    if board[win_index_1] == "X" && board[win_index_2] == "X" && board[win_index_3] == "X"
      return win_combination
    elsif board[win_index_1] == "O" && board[win_index_2] == "O" && board[win_index_3] == "O"
      return win_combination
    end
  end

  empty_board = board.all? do |board_index|
    board_index == nil || board_index == " "
  end

  if empty_board
    return false
  elsif empty_board == false && winning_combination == []
    return false
  else
    return winning_combination
  end
end

#full method
def full?(board)
  full_board = board.all? do |board_index|
    board_index == "X" || board_index == "O"
  end
  incomplete_board = board.all? do |board_index|
    board_index == "X" || board_index == "O" || board_index = ""
  end
  if full_board
    return true
  elsif incomplete_board
    return false
  end
end

#draw method
def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  else
    return false
    end
end

#over method
def over?(board)
 if won?(board) && full?(board) == true
   return true
 elsif won?(board) && full?(board) == false
     return true
   elsif draw?(board) == true
     return true
   else
     return false
   end
 end

#winner method
def winner(board)
  if won?(board) == false
    return nil
  else board[won?(board)[0]]
end
end
