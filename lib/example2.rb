board = [" "," "," "," "," "," "," "," "," "]

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS =[
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
#  if board.any? {|space| space == "X" || space =="O"}
    match_array = []
    WIN_COMBINATIONS.each do |win_index|
      if win_index.all? {|position| board[position] == "X"}
        match_array << win_index
      elsif win_index.all? {|position| board[position] == "O"}
        match_array << win_index
      else
        false
      end
      match_array
    end
    return
#  end
end
