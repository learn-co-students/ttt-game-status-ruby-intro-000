# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

# Helper Method
def won?(board)
	return false if board.all? { |space| space == " " }
  return WIN_COMBINATIONS[0] if board.values_at(0,1,2).uniq==["X"] || board.values_at(0,1,2).uniq==["O"]
  return WIN_COMBINATIONS[1] if board.values_at(3,4,5).uniq==["X"] || board.values_at(3,4,5).uniq==["O"]
  return WIN_COMBINATIONS[2] if board.values_at(6,7,8).uniq==["X"] || board.values_at(6,7,8).uniq==["O"]
  return WIN_COMBINATIONS[3] if board.values_at(0,3,6).uniq==["X"] || board.values_at(0,3,6).uniq==["O"]
  return WIN_COMBINATIONS[4] if board.values_at(1,4,7).uniq==["X"] || board.values_at(1,4,7).uniq==["O"]
  return WIN_COMBINATIONS[5] if board.values_at(2,5,8).uniq==["X"] || board.values_at(2,5,8).uniq==["O"]
  return WIN_COMBINATIONS[6] if board.values_at(0,4,8).uniq==["X"] || board.values_at(0,4,8).uniq==["O"]
  return WIN_COMBINATIONS[7] if board.values_at(6,4,2).uniq==["X"] || board.values_at(6,4,2).uniq==["O"]
end

def full?(board)
	board.all? { |token| token=="X" || token=="O" }
end

def draw?(board)
	return false if won?(board)
    true
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end
