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

=begin
  board.each do |space|
    position_taken?(board, index)
    index = board.index(space)
    if position_taken?(board, index) == true
      puts "draw"
      return false
    else
      puts "full"
      return false
    end
  end



  puts position_1
  puts position_2
  puts position_3
  puts combo
=end



## using || did not work to group the two statements,  needed to use an else outside of the .each

def won?(board)
  WIN_COMBINATIONS.each do |combo|
      win_index_1 = combo[0]
      win_index_2 = combo[1]
      win_index_3 = combo[2]

      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return combo
     elsif position_1 == "O"  && position_2 == "O" && position_3 == "O"
        return combo
      end
  end
  return false
end


## else doesnt work so needed to put the false return after the .select
def full?(board)
  board.select do |space|
    if space == " "
      puts "Game in-progress"
      puts space
      return false
    end
  end
puts "Draw"
return true
end

## I had an issue with != and == solving for t/f and I needed to nest the IF && was not working
def draw?(board)
  won?(board)
  full?(board)
  if won?(board) == false
    if full?(board) == true
      return true
    end
  elsif won?(board) == true
    if full?(board) == false
      return false
    end
  end
end

def over?(board)
  draw?(board)
  won?(board)
  full?(board)
  if draw?(board) || full?(board) || won?(board)
    return true
  end
  return false
end

## i used the winner method to act as a gate keeper.  once I knew the board had a winner I compared the number of X and O 
def winner(board)
  won?(board)
    if won?(board)
      if board.count("X") > board.count("O")
        puts board.count("X")
        puts board.count("0")
        puts "X wins"
        return "X"
      else
        puts board.count("X")
        puts board.count("0")
        puts "O wins"
        return "O"
      end
end
end
