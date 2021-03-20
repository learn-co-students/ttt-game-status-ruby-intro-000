require 'pry'

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
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
  WIN_COMBINATIONS.any? do |combo|
    position_1 = board[combo[0]]
    position_2 = board[combo[1]]
    position_3 = board[combo[2]]
    win_1 = position_taken?(board, combo[0])
    win_2 = position_taken?(board, combo[1])
    win_3 = position_taken?(board, combo[2])

    if win_1 == true && win_2 == true && win_3 == true &&
      position_1 == "X" && position_2 == "X" && position_3 == "X"
      return combo
    elsif win_1 == true && win_2 == true && win_3 == true &&
      position_1 == "O" && position_2 == "O" && position_3 == "O"
      return combo
    else
      puts false

    end
  end
end

#full?
def full?(board)
  board.all? do |full|
    full.include?("X") || full.include?("O")
  end
end

#draw
def draw?(board)
  full?(board) == true && won?(board) == false
end

#over?
def over?(board)
  draw?(board) || won?(board)
end


#winner
def winner(board)
  if combo = won?(board)
    if combo.all? {|i| board[i] == "X"}
      "X"
    elsif combo.all? {|i| board[i] == "O"}
      "O"
    end
  else
    return nil
  end
end
