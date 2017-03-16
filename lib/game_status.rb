# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
#board[index] != " " && board[index] != ""
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

# won
def won?(board)

  WIN_COMBINATIONS.each do |win_combination|
  #  puts "This is win combination #{win_combination}"
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
=begin
    puts "this is position 1: #{position_1}"
    puts "this is position 2: #{position_2}"
    puts "this is position 3: #{position_3}"
=end
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
      break
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
      break
    end
  end
false

# CODE CREATED WITH HELP FROM INSTRUCTOR, USING .FIND TO SEARCH FOR WINING COMBO, AND POS_TAKEN? TO CHECK THAT BOARD IS NOT EMPTY
# WIN_COMBINATIONS.find do |win_combination|
# #  puts "This is win combination #{win_combination}"
#   win_index_1 = win_combination[0]
#   win_index_2 = win_combination[1]
#   win_index_3 = win_combination[2]
#
#   position_1 = board[win_index_1]
#   position_2 = board[win_index_2]
#   position_3 = board[win_index_3]
#
#   puts "this is position 1: #{position_1}"
#   puts "this is position 2: #{position_2}"
#   puts "this is position 3: #{position_3}"
#
#   position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
# end
 end

def full?(board)
  if board.include?(" ") == false
    true
  end

  # if board.any?{|number| number == " "} == true
  #   false
  # end
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    true
  end
end

def over?(board)
  if won?(board) == true || full?(board) == true
    true
  end
end

def winner(board)
  if won?(board) == false
    return nil
  else
    winning_position = won?(board)
    winning_index = winning_position[0]
    board[winning_index]
  end


end
