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

#method to find out if the board contains any of the win combinations
def won?(board)
  WIN_COMBINATIONS.each do |combo|
    win_combination = [combo[0], combo[1], combo[2]]
    windex1 = win_combination[0]
    windex2 = win_combination[1]
    windex3 = win_combination[2]

    pos1 = board[windex1]
    pos2 = board[windex2]
    pos3 = board[windex3]
    win_combo = [pos1,pos2,pos3]

    if pos1 == "X" && pos2 == "X" && pos3 == "X" || pos1 =="O" && pos2 == "O" && pos3 == "O"
      return win_combination
  end
end
  return false

end

def full?(board)
    if board.any? {|token| token == " "}
      return false
    else
      return true
    end
end

def draw?(board)
  if full?(board) && won?(board) == false
    return true
  else
    return false
  end
end

def over?(board)
  if draw?(board) || won?(board)
    true
  else
    false
  end
end





#checks how many turns have been played
def turn_count(board)
  turn_counter = 0
  board.each do |spot|
    if spot == "X" || spot.upcase == "O"
      turn_counter +=1
    end
  end
  return turn_counter
end

#tells us who the current player is, X or O

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

def winner(board)
  if won?(board)
    what_is_it = won?(board)
    return board[what_is_it[0]]
  else
    return nil
  end
end
