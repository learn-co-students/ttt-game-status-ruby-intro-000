# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end



def won?(board)

  # display board
    # puts " #{board[0]} | #{board[1]} | #{board[2]}"
    # puts "---|---|---"
    # puts " #{board[3]} | #{board[4]} | #{board[5]}"
    # puts "---|---|---"
    # puts " #{board[6]} | #{board[7]} | #{board[8]}"

  winner = false
  WIN_COMBINATIONS.each do |win|
    # puts "win: #{win}"
    winner_case = win.all? do |cell|
      # puts "(X?) Cell: #{cell}"
      # puts "cell is X? #{board[cell] == "X"}"
      board[cell] == "X"
    end  # winner_case .all?
    if winner_case
      winner = win
      # puts "winner_case: #{winner_case}; winner: #{winner}; win: #{win}"
    end # of if
    winner_case = win.all? do |cell|
      # puts "(O?) Cell: #{cell}"
      # puts "cell is X? #{board[cell] == "O"}"
      board[cell] == "O"
    end  # winner_case .all?
    if winner_case
      winner = win
      # puts "winner_case: #{winner_case}; winner: #{winner}; win: #{win}"
    end # of if
  end # of WIN_COMBINATIONS each
  winner
end # of def winner?

def full?(board)
  i = [0, 1, 2, 3, 4, 5, 6, 7, 8]
  full_board = i.all? do |cell|
    # puts "cell: #{cell}"
    # puts "Taken: #{position_taken?(board, cell)}"
    position_taken?(board, cell)
  end
  full_board
end

def draw?(board)
  puts "won: #{won?(board)}"
  puts "full: #{full?(board)}"
  puts "not won & full: #{!won?(board) && full?(board)}"
  draw_tf = (!won?(board) && full?(board)) ? true : false
end

def over?(board)
  over_tf = (won?(board) || draw?(board) || full?(board)) ? true : false
end


def winner(board)
  winning_three = won?(board)
  !winning_three ? nil : board[winning_three[1]]
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
