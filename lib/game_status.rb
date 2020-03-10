# Helper Method
def position_taken?(char)
  !(char.nil? || char == " ")
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
  if WIN_COMBINATIONS.any? do |win_combo|
    if win_combo.all? {|slot| board[slot] == "X"}
      return win_combo
    elsif win_combo.all? {|slot| board[slot] == "O"}
      return win_combo
    end
  end
  else
    false
  end
end

def full?(board)
  if board.none? {|slot| slot == " "}
    true
  else
    false
  end
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    true
  else
    false
  end
end

def over?(board)
  if draw?(board) == true || won?(board) != false
    true
  end
end

def winner(board)
  if won?(board) != false
    win_combo = won?(board)
    if win_combo.any? {|slot| board[slot] == "X"}
      "X"
    elsif win_combo.any? {|slot| board[slot] == "O"}
      "O"
    else
      nil
    end
  end
end
