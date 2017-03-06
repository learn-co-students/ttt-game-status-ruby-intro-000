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

#Helper method for #won?
def is_board_at_combo_indices?(combo)
  combo.all? do |index|
    yield(index)
  end
end

def won?(board)
  #iterate through WIN_COMBINATIONS; for each iteration (possible winning combination), check if the spaces in the board are occupied.
    #if so, check if they are all x's or all o's.
      #if so, return the current iteration (the winning combination) and stop iterating.
  #if no winning combinations, just return false/nil.
  winning_combo = false
  WIN_COMBINATIONS.each do |combo|
    if is_board_at_combo_indices?(combo){|e| position_taken?(board, e)}
      all_x = is_board_at_combo_indices?(combo){|e| board[e] == "X"}
      all_o = is_board_at_combo_indices?(combo){|e| board[e] == "O"}
      if all_x || all_o
        winning_combo = combo
        break
      end
    end
  end
  winning_combo
end
