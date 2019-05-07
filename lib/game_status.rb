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
	# check won combination
  WIN_COMBINATIONS.each do |combionation|
		if combionation.all? do |i|
				board[i] == "X"
			end
			#return wining x combination
			return combionation
		elsif
			combionation.all? do |i|
				board[i] == "O"
			end
			#return wining 0 combination
			return combionation
		end
  end
	# not won
	return false
end

def full?(board)
  #board.each { |i| position_taken?(board, i) == false } ? false : true
	board.none? { |i| i == " " || i =="" }
end

def draw?(board)
	!won?(board) && full?(board) ? true : false
end

def over?(board)
	won?(board) || draw?(board) || full?(board) ? true : false
end

def winner(board)
	winning_index = won?(board)
  if over?(board)
    return board[winning_index.first]
  end
end
