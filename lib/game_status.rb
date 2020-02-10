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

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(array, index)
  if (array[index] == " " || array[index] == "" || array[index] == nil)
    return false
  else
    return true
  end
end

def valid_move?(array, index)
  if (index < 0 || index > 8)
    return false
  elsif position_taken?(array, index)
    return false
  else
    return true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(array)
  counter = 0
  array.each do |element|
    if (element == "X" || element == "O")
      counter += 1
    else
      # do nothing
    end
  end
  return counter
end

def current_player(board)
  if (turn_count(board).even? == true)
    return "X"
  else
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    if ((position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O"))
      return win_combination
    else
      # do nothing
    end
  end
  return nil
end

def full?(array)
  counter = 0
  array.each do |element|
    if (element == "X" || element == "O")
      counter += 1
    else
      # do nothing
    end
  end
  if counter == 9
    return true
  else
    return false
  end
end

def draw?(array)
  if full?(array) && !won?(array)
    return true
  else
    return false
  end
end

def over?(array)
  if ( won?(array) || draw?(array) || full?(array) )
    return true
  else
    return false
  end
end

def winner(array)
  if won?(array)
    WIN_COMBINATIONS.each do |win_combination|
      position_1 = array[win_combination[0]]
      position_2 = array[win_combination[1]]
      position_3 = array[win_combination[2]]
      if (position_1 == "X" && position_2 == "X" && position_3 == "X")
        return "X"
      elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return "O"
      else
        # do nothing
      end
    end
  else
    return nil
  end
end
