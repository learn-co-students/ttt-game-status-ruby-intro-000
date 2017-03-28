# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Left diagonal
  [2,4,6], # Right diagonal
]

def won?(board)
no_win = true
  WIN_COMBINATIONS.each do |win_array|
    win = []
    win_array.select do |position|
      if position_taken?(board, position)
        win << position
        if win.length == 3 && win_array == win && (board[win[0]] == board[win[1]] && board[win[0]] == board[win[2]])
          no_win = false
          return win_array
        end
      end
    end
  end
  if no_win
   false
  end
end

def full?(board)
  [0,1,2,3,4,5,6,7,8].all?{|position| position_taken?(board, position)}
end

def draw?(board)
  full?(board) && !won?(board) ? true : false
end

def over?(board)
  !full?(board) && !won?(board) ? false : true
end

def winner(board)
  !won?(board) ? nil : won?(board).detect{|position| return board[position]}
end
