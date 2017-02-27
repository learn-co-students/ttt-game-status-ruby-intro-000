# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,4,8], #tl - br
  [2,4,6], #tr - bl
  [0,3,6], #first column
  [1,4,7], #second column
  [2,5,8] #third column
]

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
     board[combo[0]] == board[combo[1]] &&
     board[combo[1]] == board[combo[2]] &&
     position_taken?(board, combo[0])
    end
end

def full?(board)
  board.all? { |position| position != " " }
  # { postition == "X" || position == "O" fails??}
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  elsif !won?(board) && full?(board) == false
    return false
  elsif won?(board)
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

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
     board[combo[0]] == board[combo[1]] &&
     board[combo[1]] == board[combo[2]] &&
     position_taken?(board, combo[0])
    end
end
def winner(board)
  amount_of_o = board.reject{|position| position == "X"}
  amount_of_x = board.reject{|position| position == "O"}
  if won?(board)
    if amount_of_x.length > amount_of_o.length
      return "X"
    else
      return "O"
    end
  end
end


  #reject will return an array with the elements for which the block is false.
  [1,2].reject{|i| i.even?} #=> [1]





#   WIN_COMBINATIONS.each do |win_combination|
#     win_index_1 = win_combination[0]
#     win_index_2 = win_combination[1]
#     win_index_3 = win_combination[2]
#
#     position_1 = board[win_index_1]
#     position_2 = board[win_index_2]
#     position_3 = board[win_index_3]
#
#     if position_1 == "X" && position_2 == "X" && position_3 == "X"
#       return "X"
#     elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
#       return "O"
#     else
#       return false
#     end
#   end
# end
