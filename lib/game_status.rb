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

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    combo.each do
    if position_taken?(board, combo[0]) == true && position_taken?(board, combo[1]) == true && position_taken?(board, combo[2]) == true && board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]]
      return combo
    end
  end
  end
  return false
end
  #WIN_COMBINATIONS.each do |combo|
    #combo.each do |pos|
  #    if board.include?(combo)
  #      return combo
  #    else return false
      #end
  #  end
#  end
#end

#  WIN_COMBINATIONS.each do |i, j, k|
#    if board[i] == board[j] && board[j] == board[k]
#      return i, j, k
#    else return false
#    end
#  end
#end

#  WIN_COMBINATIONS.each do |winner|
  #  winner.each do |pos|
  #   if position_taken?(board, pos) && pos.equal?
     #if pos1 == "X" && pos2 == "X" && pos3 == "X" || pos1 == "O" && pos2 == "O" && pos3 == "O"
  #   return pos
  #  else return false
#  end
#end
#end
#end

  #[board].select do |position|
  #  position

  #array = []
  #WIN_COMBINATIONS.each do |combo|
  #  combo.each do |position|
  #    if position_taken?(board, position) && position == "X" || position == "O"
  #      array[]<<position
  #      return array
  #    else return false
  #    end
  #  end
  #end
#end

  #WIN_COMBINATIONS.each do |combo|
  #  combo.each do |position|
  #    if position_taken?(board, position[1]) && (position[0] == position[1] && position[1] == position[2])
  #      return combo
  #    else return false
  #    end
  #  end
#  end
#end

  #WIN_COMBINATIONS.each do |winner|
  #   a = winner[0]
  #   b = winner[1]
  #   c = winner[2]
  #   pos1 = board[a]
  #   pos2 = board[b]
  #   pos3 = board[c]

  #   if pos1 == "X" && pos2 == "X" && pos3 == "X" || pos1 == "O" && pos2 == "O" && pos3 == "O"
  #     return winner
  #  else return false
#  end
#end
#end

#  WIN_COMBINATIONS.each do |winner|
#    winner.each do |list|
#      a = board[list[0]]
#      b = board[list[1]]
#      c = board[list[2]]
#      if a == "X" && b == "X" && c == "X" || a == "O" && b == "O" && c == "O"
#        return "#{list[0]}, #{list[1]}, #{list[2]}"
#      else return false
#    end
#  end
#end
#end
    #  if postition_taken?(board, index) == list


      #return position_taken?(board, index)
  #if board.include?(WIN_COMBINATIONS)
  #  board.select{|i| i="X", "X", "X" || i="O", "O", "O"}
  #else return false

def full?(board)
  if board.include?(" ")
    return false
  else return true
  end
  #board.none? {|i| i == " "}
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  elsif won?(board) == false && full?(board) == false
    return true
  else return false
end
end

def over?(board)
  if full?(board) == true
    return true
  elsif won?(board) == true
    return true
  end
  return false
end

def winner(board)
  if won?(board)
    return "#{board[won?(board)[0]]}"
  end
end
