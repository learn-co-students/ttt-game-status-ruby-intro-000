# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #left column
  [1,4,7], #center column
  [2,5,8], #right column
  [0,4,8], #up-left-down-right diagonal
  [2,4,6], #up-right-down-left diagonal
]

def won?(board)
  local_1 = ""
  local_2 = ""
  local_3 = ""
  winning = []
    WIN_COMBINATIONS.each do |wins|
      local_1 = board[wins[0]]
      local_2 = board[wins[1]]
      local_3 = board[wins[2]]
      if position_taken?(board, wins[0]) && ((local_1 == local_2) && (local_2 == local_3))
        winning = [wins[0], wins[1], wins[2]]
        return winning
      end
    end
  if winning == []
    return FALSE
  else
    return winning
  end
end

def full?(board)
  i = [0, 1, 2, 3, 4, 5, 6, 7, 8]
  t = []
    i.each do |i|
      if position_taken?(board, i) == FALSE
        t << FALSE
      else
        t << TRUE
      end
    end
  if t.include?(FALSE)
    return FALSE
  else
    return TRUE
  end
end

def draw?(board)
  winning = []
  won?(board)
  full?(board)
    if won?(board) != FALSE
      return FALSE
    elsif full?(board) == TRUE
      return TRUE
    elsif full?(board) == FALSE
      return FALSE
    end
end

def over?(board)
  winning = []
  won?(board)
    if full?(board)
      return TRUE
    elsif winning == []
      return FALSE
    else
      return TRUE
    end
end

def winner(board)
  winning = won?(board)
    if (winning != FALSE) && (winning != [])
      puts "#{board[winning[0]]} won the game!"
      return board[winning[0]]
    else
      puts "The cat won this one."
      return nil
    end
end
