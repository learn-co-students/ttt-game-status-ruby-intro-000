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
  WIN_COMBINATIONS.each do |win_combo|
    pos_1 = win_combo[0]
    pos_2 = win_combo[1]
    pos_3 = win_combo[2]

    position_1 = board[pos_1]
    position_2 = board[pos_2]
    position_3 = board[pos_3]

    if position_1 == 'X' && position_2 == 'X' && position_3 == 'X'
      return win_combo
    elsif position_1 == 'O' && position_2 == 'O' && position_3 == 'O'
      return win_combo
    end
  end
  false
end

def full?(board)
  board.all? {|position| position == "X" || position =="O"}
end

def draw?(board)
  won?(board) || !full?(board) ? false : true
end

def over?(board)
  won?(board) || full?(board) || draw?(board) ? true : false
end

def winner(board)
  if won?(board)
    win_combo = won?(board)
    position = win_combo[0]
    board[position]
  end
end
