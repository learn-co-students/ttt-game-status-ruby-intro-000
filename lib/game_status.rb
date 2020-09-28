require 'pry'
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS =
 [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def won?(board)
  WIN_COMBINATIONS.find do |match|
    board[match[0]] == board[match[1]] &&
    board[match[1]] == board[match[2]] &&
    position_taken?(board, match[0])
  end
end

def full?(board)
  board.all? do |taken|
    taken == "X" || taken == "O"
  end
end
#scan board; return taken spaces; taken spaces = [0-8] -> full is true.

def draw?(board)
!(won?(board)) && full?(board)
end


def over?(board)
  if draw?(board)
    return true
  elsif won?(board) && !(full?(board))
    return true
  elsif won?(board) && full?(board)
    return true
  else
    return false
  end
end


def winner(board)
  if combo_array = won?(board)
    #no iterations here
    index = combo_array[0]
    return board[index]
  end
end
=begin def winner(board)
  won?(board).find do |index|
    index = won?(board)[0]
    return board[index]
  end
end
=end
#We have determined that the board is occupied
#We matched the occupied spaces match a win condition
#I need to know determine which win condition was triggered
#then search the board for that index
=begin

match[0] = [0, 1, 2]
match[1] = [3, 4, 5]
match[2] = [6, 7, 8]

board[0, 1, 2] == board[3, 4, 5] &&
board [3, 4, 5] == board[7, 8, 9]
position_taken?(board, [0, 1, 2])
posi












=begin def won?(board)
  won = false #declaring variable won
  x_array = [] #declaring array
  o_array = []
  x_counter = 0
  o_counter = 0
  board.select do |found_X| #search the board for X
    x_array << x_counter if found_X == "X" #If found X, add the index from found_X to the x_array
    x_counter += 1
  end
  board.select do |found_O|
    o_array << o_counter if found_O == "O"
    o_counter += 1
  end
  x_array #array where x is found
  o_array
  WIN_COMBINATIONS.find do |match| #go through each win combination array
    match == x_array || match == o_array
    if match == x_array
        return x_array
    elsif match == o_array
    return o_array
    end
end
  x_array
  o_array
  binding.pry
end
=end

    #if match == x_array || match == o_array #if the returned array matches win condition

    #  won = true #the match is won
    #else #ok
    #  won = false
    #end
  #end
  #binding.pry

#right now i'm returning an array and matching it to an array
#then returning a true/false value.
#the test wants me to return a set of chracters that can be made into an array
#when i tried returning ['x','x','x'] won was returning false and got errors.

#WIN_COMBINATIONS.each do |combination|
#  if board[combination] == ["X", "X", "X"] || board[combination] == board[combination] == ["O", "O", "O"]
##I need to read each win condition
#If the board matches the win condition, i win.
#

#look at the board for X and O
#go through win combinations array
#if win_combination[condition] all contain X or O
#return true


#i need to scan the board for X
#I need to return the board index that contains X
#select is able of capturing multiple
