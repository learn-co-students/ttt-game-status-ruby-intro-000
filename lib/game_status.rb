# Helper Method
require 'pry'
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def won?(board)
  if board.include?("X") || board.include?("O")
    count=0
    WIN_COMBINATIONS.each do |win_combo|
      #binding.pry #sets each variable in WIN_COMBINATIONS to a single variable
      win_1=win_combo[0]
      win_2=win_combo[1]
      win_3=win_combo[2]
      if board[win_1] == "X" && board[win_2] == "X" && board[win_3] == "X"
        return win_combo
      elsif board[win_1]=="O" && board[win_2]=="O" && board[win_3]=="O"
        #binding.pry
        return win_combo
      else
        count+=1
      end
    end
    if count==board.length()
      return false
    end
  else
    count=0
    (0..board.length()).each do |i|
      if position_taken?(board,i)
        count+=1
      end
    end
    if count==board.length()
      return false
    end
  end
end

def full?(board)
  if !won?(board)
    count=0
    board.each do |position|
      if position=="X" || position=="O"
        count+=1
      end
    end
    if count==board.length()
      return true
    else
      return false
    end
  else
    return false
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if draw?(board) || won?(board)
    return true
  else
    if !full?(board)
      return false
    end
  end
end
def winner(board)
  if won?(board)

    returned_win=won?(board)
    won?(board).each do |position|
      if board[position]=="X"
        return "X"
      else
        return "O"
      end
    end
  else
    return nil
  end
end
