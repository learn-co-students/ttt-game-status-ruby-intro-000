# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
        [0, 1, 2],      # Top row
        [3, 4, 5],      # Middle row
        [6, 7, 8],      # Bottom row
        [0, 3, 6],      # left column
        [1, 4, 7],      # Middle column
        [2, 5, 8],      # Right column
        [0, 4, 8],      # Diagonal left
        [2, 4, 6]       #Diagonal right
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_combination.select do |win_index|
      winner = position_taken?(board, win_index)
         puts winner
    end
  end
end
# board select
# winner = position_taken?
# winner == win_combination
