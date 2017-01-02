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
  #iterate through WIN_COMBINATIONS; for each iteration (possible winning combination), check if the spaces in the board are occupied.
    #if so, check if they are all x's or all o's.
      #if so, return the current iteration (the winning combination) and stop iterating.
  #if no winning combinations, just return false/nil.
  winning_combo = false
  WIN_COMBINATIONS.each do |combo|
    if combo.all?{|e| position_taken?(board, e)}
      all_x = combo.all?{|e| board[e] == "X"}
      all_o = combo.all?{|e| board[e] == "O"}
      if all_x || all_o
        winning_combo = combo
        break
      end
    end
  end
  winning_combo
end

def full?(board)
  board.all?{|e| !(e == nil || e == " ") }  #Can't use #position_taken? because that takes (board, index) whereas #all? here already accesses the element at the index.
end

def draw?(board)
  #true: full==true; won ==false
  #false: full==false; won==false

  #false: full==true; won==true
  #false: full==false; won==true
  if won?board
    false
  elsif full?board
      true
  else
      false
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)  #draw? is redundant; it's over if it's #won or #full...
    true
  else
    false
  end
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  else
    nil
  end
end
