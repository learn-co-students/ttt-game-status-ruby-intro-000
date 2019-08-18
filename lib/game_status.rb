# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

def won?(array)
  WIN_COMBINATIONS.find do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    position_1 = array[win_index_1]
    position_2 = array[win_index_2]
    position_3 = array[win_index_3]
    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      else
        nil
      end
  end
end

def full?(array)
  array.all? do |spaces|
    if spaces == "X" || spaces == "O"
      true
    else
      false
    end
  end
end

def draw?(array)
  won = won?(array)
  filled = full?(array)
  if won == nil && filled == true
    true
  elsif won.is_a?(Array) == true
    false
  elsif won == nil && filled == false
    false
  end
end

def over?(array)
  if draw?(array) == true || full?(array) == true || won?(array) != nil
    true
#  elsif won?(array) == nil && full(array) == false
#    false
  else
    false
  end
end

def winner(array)
  victor = won?(array)
    if victor.is_a?(Array) == true
      return array[victor[0]]
    else
      nil
    end
end
