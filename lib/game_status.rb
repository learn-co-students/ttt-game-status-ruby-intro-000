# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],

  [0,4,8],
  [2,4,6],

  [0,3,6],
  [1,4,7],
  [2,5,8]
]

#win
def won?(board)
  empty_board = board.all? do |cell|
    cell == " ";
  end
  found_win = WIN_COMBINATIONS.detect do | combo |
    (board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X" ) || (board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O" )
  end
  if found_win == nil || empty_board
    return false
  else
    return found_win
  end
end


def full?(board)
  full_board = board.all? do | slot |
    slot == "X" || slot == "O"
  end
  return full_board;
end

def draw?(board)
  if won?(board)
    return false;
  elsif full?(board)
    return true;
  else
    return false;
  end
end

def over?(board)
  if draw?(board) || won?(board)
    return true
  else
    return false
  end
end


def winner(board)
  winning_coords = won?(board)
  if winning_coords != false
    if board[winning_coords[0]].include?("X");
      return "X";
    elsif board[winning_coords[0]].include?("O")
      return "O";
    else
      return nil;
    end# endif X | Y | nil
  end# endif boolean
end
