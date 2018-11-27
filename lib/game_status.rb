# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
#Create a nested array of win combinations defined in a constant
#Tic Tac Toe has 8 possible ways to win: 3 horizontal rows, 3 vertical columns,
#and 2 diagonals

WIN_COMBINATIONS =[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8],
]

#build a method that can check a tic tac toe board
#and return true if there is a win and false if not.
#method should accept a board as an argument and return false/nil if
#there is no win combination present in the board
#return the winning combination indexes as an array if there is a win.

def won?(board)
  WIN_COMBINATIONS.each do |w_combinations|
    w_combinations.each do |win_index|
      win_index_1 = w_combinations[0]
      win_index_2 = w_combinations[1]
      win_index_3 = w_combinations[2]

      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]

      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return w_combinations
      end
    end
    end
    return false
end


def full?(board)
  board.all? {|ele| ele == "X" || ele == "O"}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  winning_combo = won?(board)
  if winning_combo == false
    nil
  elsif winning_combo[0] == 0
    "X"
  else
    "O"
  end
end
