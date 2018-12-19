# # Helper Method
# def position_taken?(board, index)
#   !(board[index].nil? || board[index] == " ")
# end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2], [0,3,6], [0,4,8], [1,4,7],
[2,5,8], [2,4,6], [3,4,5], [6,7,8]]


def won?(board)

win_combinations = [[0,1,2], [0,3,6], [0,4,8], [1,4,7],
[2,5,8], [2,4,6], [3,4,5], [6,7,8]]


arr = []
i = 0
while i < board.length
  if board[i] == "X"
    arr << i
end
i+=1
end


arrs = []
i = 0
while i < board.length
  if board[i] == "O"
    arrs << i
end
i+=1
end





i = 0
while i <= WIN_COMBINATIONS.length
  if WIN_COMBINATIONS[i] == arr or WIN_COMBINATIONS[i] == arrs
    return WIN_COMBINATIONS[i]
  end
  i+=1
end



return false

end



def full?(board)
  i = 0
  arr= []
  while i < board.length
    if board[i] == "X" or board[i] == "O"
      arr << 1
    end
    i+=1
  end

  if arr.length == 9 #and won?(board) !=false
    return true
  else
    return false
  end


end



def draw?(board)


  # if full?(board) == true
  #   return true
  # else
  #   return false
  # end


if full?(board) == false and won?(board) == false
  return false
end

if [board[0], board[4], board[8]] == ["X", "X", "X"] or [board[0], board[4], board[8]] == ["O", "O", "O"]
  return nil
end

  if [board[2], board[4], board[6]] == ["X", "X", "X"] or [board[2], board[4], board[6]] == ["O", "O", "O"]
    return nil
  end


if [board[0], board[1], board[2]] == ["X", "X", "X"] or [board[0], board[1], board[2]] == ["O", "O", "O"]
  return nil
end

if full?(board) == true
  return true
end


end





def over?(board)

if won?(board) == true and full?(board) == true
    return true
  end

if draw?(board) == true
    return true
  end

if full?(board) ==false and won?(board) == false
      return false
end

return true

end




def winner(board)

if board.count{|i| i=="X"} > board.count{|i| i == "O"} and won?(board)
  return "X"
end

if board.count{|i| i=="O"} > board.count{|i| i == "X"} and won?(board)
  return "O"
end


# if won?(board) == false
#   nil
# end

end
