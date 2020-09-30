# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
# 8 Possible win combinations
# 3 element array for each win combo.
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Diagonal Left to Right
  [2,4,6] # Diagonal Right to Left
    ]

    # Use a .detect enumerator?
    def won?(board)
      WIN_COMBINATIONS.find do |win_combination|

        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]

        position_1 = board[win_index_1]
        position_2 = board[win_index_2]
        position_3 = board[win_index_3]

        if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
          return win_combination
        end #if end
      end #loop end
    end #def end

def full? (board)
  board.all? do |counter|
    counter == "X" || counter == "O"
  end #loop end
end #def end

def draw? (board)
    if won?(board) == nil && full?(board) == true
      return true
    end
end

def over? (board)
  won?(board) || draw?(board) || full?(board)
end

def winner (board)
  if winning_counter = won?(board)
  board[winning_counter[1]]
else
  nil
end
end
