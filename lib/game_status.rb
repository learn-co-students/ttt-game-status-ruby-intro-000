# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
[0,1,2], # Top row
[3,4,5], # Middle row
[6,7,8], # Bottom row
[0,3,6], # Top column
[1,4,7], # Middle column
[2,5,8], # End column
[0,4,8], # Left across
[2,4,6]  # Right Across
]

def won? 

end
