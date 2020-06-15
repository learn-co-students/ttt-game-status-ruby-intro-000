# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

board=[" "," "," "," "," "," "," "," "," "]
# Define your WIN_COMBINATIONS constant

top_row_win=[0,1,2]
mid_row_win=[3,4,5]
bot_row_win=[6,7,8]
left_col_win=[0,3,6]
mid_col_win=[1,4,7]
right_col_win=[2,5,8]
left_right_win=[0,4,8]
right_left_win=[2,4,6]
WIN_COMBINATIONS=[top_row_win,mid_row_win,bot_row_win,left_col_win,mid_col_win,right_col_win,left_right_win,right_left_win]

board1=["X","X","X"," "," "," "," "," "," "]
board2=[" "," "," ","X","X","X"," "," "," "]
board3=[" "," "," "," "," "," ","X","X","X"]
board4 =["X"," "," ","X"," "," ","X"," "," "]
board5 =[" ","X"," "," ","X"," "," ","X"," "]
board6 =[" "," ","X"," "," ","X"," "," ","X"]
board7 =["X"," "," "," ","X"," "," "," ","X"]
board8 =[" "," ","X"," ","X"," ","X"," "," "]
board9= ["O","O","O"," "," "," "," "," "," "]
board10=["X", "O", "X", "O", "X", "X", "O", "X", "O"]
win_arrays= [board1,board2,board3,board4,board5,board6,board7,board8]

def define_win(win_combination,board)
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]
  position_1 = board[win_index_1] # load the value of the board at win_index_1
  position_2 = board[win_index_2] # load the value of the board at win_index_2
  position_3 = board[win_index_3] # load the value of the board at win_index_3
  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return win_combination # return the win_combination indexes that won.
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combination # return the win_combination indexes that won.
  else
    false
  end
end

def iswin(board)
  win=false
  top_row_win=[0,1,2]
  mid_row_win=[3,4,5]
  bot_row_win=[6,7,8]
  left_col_win=[0,3,6]
  mid_col_win=[1,4,7]
  right_col_win=[2,5,8]
  left_right_win=[0,4,8]
  right_left_win=[2,4,6]
  win_combinations=[top_row_win,mid_row_win,bot_row_win,left_col_win,mid_col_win,right_col_win,left_right_win,right_left_win]
  winlose = [define_win(top_row_win,board), define_win(mid_row_win,board), define_win(bot_row_win,board), define_win(left_col_win,board), define_win(mid_col_win,board), define_win(right_col_win,board), define_win(left_right_win,board), define_win(right_left_win,board)]
  winlose.each do |state|
  win= state if state!=false
  end
  win
end

def won? (board)
  won=false
  if board==[" "," "," "," "," "," "," "," "," "]
    won=false
  elsif iswin(board)!=false
    won=iswin(board)
  else
    won=false
  end
  won
end

def full?(board)
  full=true
  board.each do |slot|
  full=false if slot==" "
  end
  full
end

def draw?(board)
  tie=false
  if full?(board)==true&&won?(board)==false
    tie=true
  end
end

def over?(board)
  ova=false
  if draw?(board)==true || won?(board)!=false
    ova=true
  end
  ova
end

def winner (board)
  winna=""
  if won?(board)!=false && board[iswin(board)[2]]=="X"
    winna="X"
  elsif won?(board)!=false && board[iswin(board)[2]]=="O"
    winna="O"
  else
     winna=nil
   end
  winna
end

#puts board1[iswin(board1)[0]]
#puts iswin(board1)[1]
#puts iswin(board1)[2]
puts winner(board1)
puts winner(board9)
puts winner(board10)==nil
#puts won?(board1)==true
#puts winlose
#puts win

#puts won?(board1)
#puts win_combinations.length-1
#puts define_win(win_combinations[0],board1)

#puts define_win(WIN_COMBINATIONS[0],board10)
#puts iswin(board10)
#puts winlose
#won=false
#puts won
#puts win_arrays[0]
#win_combination = define_win(top_row_win,board1)
#puts define_win(top_row_win,board1).kind_of?(Array)
#define_win(top_row_win,board1)==true
#temp= define_win(top_row_win,board2)
#puts temp
#puts temp.kind_of?(Array)
#temp<<false
#puts temp
#puts win_combination
#puts temp==win_combination
