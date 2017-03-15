# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

#Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6] ]

# board = [" ", " ", " ", " ", " ", " ", " ", " ", " "] #empty board
# board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"] #draw
# board = ["O", "O", " ", "X", "X", "X", " ", " ", " "] #[3,4,5]
# board = ["X", "X", "X", "O", "X", "X", " ", " ", " "] #[0,1,2]
# board = ["O", "O", "O", "X", "O", "X", " ", " ", " "]   #[0,1,2] with O
# board = ["O", "O", " ", "X", "X", "X", " ", " ", " "] #middle row win

def won?(board)
    WIN_COMBINATIONS.each do |win|
        board_win = []
        # win.each do |win_detail|
        win_index_1 = win[0]
        # puts "win_index_1 #{win_index_1}"
        position_1 = board[win_index_1]
        # puts "position_1= #{position_1}"
        win_index_2 = win[1]
        # puts "win_index_2 #{win_index_2}"
        position_2 = board[win_index_2]
        # puts "position_2= #{position_2}"
        win_index_3 = win[2]
        # puts "win_index_3 #{win_index_3}"
        position_3 = board[win_index_3]
        # puts "position_3= #{position_3}"

         if ( position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O" )
           board_win.push(win_index_1, win_index_2, win_index_3)
           return board_win # breaks the loop
        #  else
        #   return false # breaks the loop
         end
    end
          false
end

# won?(board)

def full?(board)
  board.all? do |pos|
  	pos == "X" || pos == "O"
  end
end

def draw?(board)
  won?(board) == false && full?(board) == true
end

def over?(board)
  won?(board) == true || full?(board) == true || draw?(board) == true
end

def winner(board)
  WIN_COMBINATIONS.each do |win|
      win_index_1 = win[0]
      position_1 = board[win_index_1]
      win_index_2 = win[1]
      position_2 = board[win_index_2]
      win_index_3 = win[2]
      position_3 = board[win_index_3]

      if ( position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O" )
        return position_1
      end
  end
  nil
end
