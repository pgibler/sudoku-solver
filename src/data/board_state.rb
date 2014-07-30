# BoardState is a container for a sudoku puzzle
class BoardState

  # Constructs a #BoardState.
  # @puzzle_array - A 9x9 array of integers that defines the state. Stores as (x,y)
  def initialize(board_array)
    @board_array = board_array
  end

  # Returns the number at position (x,y)
  # @x - The x position
  # @y - The y position
  def at(x,y)
    @board_array[x][y]
  end

  # Returns #true if the board is filled. Otherwise, #false.
  def complete?
    @board_array.each do |column|
      @board_array[column].each do |cell_value|
        return false if cell_value == 0
      end
    end

    # If there were no more 0 numbers, return true.
    true
  end

end