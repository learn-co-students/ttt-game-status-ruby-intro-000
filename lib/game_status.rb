# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end


# Define your WIN_COMBINATIONS constant

board = ["X", "X", "X", " ", " ", " ", " ", " ", " "]

WIN_COMBINATIONS = [
  [0, 1, 2],#WIN_COMBINATIONS[0] win_combination[]
  [3, 4, 5],#WIN_COMBINATIONS[1]
  [6, 7, 8],#WIN_COMBINATIONS[2]
  [0, 3, 6],#WIN_COMBINATIONS[3]
  [1, 4, 7],#WIN_COMBINATIONS[4]
  [2, 5, 8],#WIN_COMBINATIONS[5]
  [0, 4, 8],#WIN_COMBINATIONS[6]
  [2, 4, 6] #WIN_COMBINATIONS[7]
]

def won?(board)
      WIN_COMBINATIONS.each do |win_combination|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]

        position_1 = board[win_index_1]
        position_2 = board[win_index_2]
        position_3 = board[win_index_3]

        if
          position_1 == "X" ||"O" && position_2 == "X" || "O" && position_3 == "X" || "O"
          return win_combination
        else
          return false
        end
      end
  end
