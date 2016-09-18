# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [ [0, 1, 2],
                     [3, 4, 5],
                     [6, 7, 8],
                     [0, 3, 6],
                     [1, 4, 7],
                     [2, 5, 8],
                     [2, 4, 6],
                     [0, 4, 8]
                   ]

def won?(board)

  WIN_COMBINATIONS.each do |sub_array|

    combination = []
    x_o_array = []

    sub_array.each do |sub_array_element|

    combination << sub_array_element
    x_o_array << board[sub_array_element]

    end

    return combination if x_o_array == ["X", "X", "X"] || x_o_array == ["O", "O", "O"]

  end

  return false

end

def full?(board)

  board.each{|element| return false if element == " "}

  return true

end

def draw?(board)

  return true if !won?(board) && full?(board)

  return false

end

def over?(board)

  return true if won?(board) || draw?(board)

  return false

end

def winner(board)

  return nil if won?(board) == false

  x_or_o = board[won?(board).first]

  return x_or_o

end
