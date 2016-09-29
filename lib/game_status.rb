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
      # return "#{indices}, winner: #{result[0]}"
      return indices
    # elsif result == ["O", "O", "O"]
    #   return "indices: #{indices}, winner token: 'O'"
    # else
    end
  end
  false
end

def full?(board)
  puts "In full(board)"
end

def draw?(board)
  puts "In draw(board)"
end

def over?(board)
  puts "In over(board)"
end

def winner(board)
  puts "In winner(board)"
end
