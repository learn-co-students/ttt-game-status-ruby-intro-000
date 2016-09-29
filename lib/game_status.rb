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
def won?(board)
  WIN_COMBINATIONS.each do |indices|
    result = indices.map { |i| board[i] }
    if result == ["X", "X", "X"] || result == ["O", "O", "O"]
      return indices
    end
  end
  false
end

def full?(board)
  !board.any? { |index| index == " " || index == "" || index == nil}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  draw?(board) || won?(board) || full?(board)
end

def winner(board)
  won?(board) ? board[won?(board)[0]] : nil
end
