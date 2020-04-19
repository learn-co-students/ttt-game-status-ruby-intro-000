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
  [0,4,8],
  [1,4,7],
  [2,4,6],
  [2,5,8]

]

def won?(board)
 x_array = []
 o_array= []

board.each_with_index do |n, index|
  if n == "X"
    x_array.push(index)
  else if
    n == "O"
    o_array.push(index)
  else
nil
  end
end
  WIN_COMBINATIONS.each do |win|
  if x_array == win || o_array == win

   return win

  else
    false
  end
end
end
end

def draw?(board)
  if won?(board) == true
    return false
  elsif won?(board) == false && turn_count(board) == 9
    return true
  else
    return false
  end

  def turn_count(board)
turns = 0
board.each do |space|

  if space == "X" || space == "O"
    turns +=1

  end

end
return turns
end
    end
