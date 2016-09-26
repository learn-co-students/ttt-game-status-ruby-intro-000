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
   WIN_COMBINATIONS.find do |win_combination|
    win_index_0 = win_combination[0]
    win_index_1 = win_combination[1]
    win_index_2 = win_combination[2]

    if board[win_index_0] == "X" && board[win_index_1] == "X" && board[win_index_2] == "X"
      return win_combination
    elsif board[win_index_0] == "O" && board[win_index_1] == "O" && board[win_index_2] == "O"
      return win_combination
    elsif board.all? { |i| i == " " }
      return false
    elsif board.all? { |i| i != " " }
      return false
    else
      next
    end
  end
end

def full?(board)
  if board.all? { |i| i != " " }
    return true
  elsif board.any? { |i| i == " " }
    return false
  end
end

def draw?(board)
  if won?(board) == [0,1,2]
    return false
  elsif won?(board) == ([0,4,8] || [2,4,6])
    return false
  elsif board.all? { |i| i != " " }
    return true
  elsif board.any? { |i| i == " " }
    return false
  end
end

def over?(board)
  if board.all? { |i| i != " " }
    return true
  elsif won?(board)
    return true
  elsif board.any? { |i| i == " " }
    return false
  end
end

def winner(board)
  WIN_COMBINATIONS.each do |win_combination|
   win_index_0 = win_combination[0]
   win_index_1 = win_combination[1]
   win_index_2 = win_combination[2]

   if board[win_index_0] == "X" && board[win_index_1] == "X" && board[win_index_2] == "X"
     return "X"
   elsif board[win_index_0] == "O" && board[win_index_1] == "O" && board[win_index_2] == "O"
     return "O"
   else
     return nil
   end
 end
end
