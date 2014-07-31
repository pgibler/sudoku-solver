# The internal board types are needed, so we require them.

require_relative 'board_row'
require_relative 'board_column'
require_relative 'board_zone'

# #BoardState holds a particular state for a Latin square.
class BoardState

  # Constructs a #BoardState.
  # @board_array - A 9x9 array of integers for the Latin square. Top arrays stores columns, inner arrays store rows.
  def initialize(board_array)
    @board_array = board_array
  end

  # Returns the number at position (x,y)
  # @x - The x-position to check at.
  # @y - The y-position to check at.
  def at(x, y)
    @board_array[x][y]
  end

  # Return the width of the board contained by #BoardState.
  def width
    @board_array.length
  end

  # Return the height of the board contained by #BoardState.
  def height
    @board_array[0].length
  end

  # Generates a new #BoardState by updating the cell at position (x,y) with the new value.
  #
  # @x - The x-position to update
  # @y - The y-position to update
  # @new_value - New value to assign to position (x,y)
  def update(x, y, new_value)
    # Duplicate the 2D board array
    new_board_array = Marshal.load(Marshal.dump(@board_array))

    # Assign the new value to the (x,y) position.
    new_board_array[x][y] = new_value

    # Return a new #BoardState with the updated array.
    BoardState.new(new_board_array)
  end

  # Gets a #BoardRow that represents the row number requested.
  #
  # @number - The row number to get the #BoardRow from.
  def row(number)
    BoardRow.new(generate_row_array(number))
  end

  # Gets a #BoardColumn that represents.
  #
  # @number - The row number to get the #BoardColumn from.
  def column(number)
    BoardColumn.new(@board_array[number])
  end

  # Gets the #BoardZone, a 3x3 subsection of the #BoardState, around position (x,y).
  #
  # @x - The x-position to find the #BoardState at.
  # @y - The y-position to find the #BoardState at.
  def zone_at(x, y)
    BoardZone.new(generate_zone_array(x, y))
  end

  # Returns an array of rows with columns at each index.
  def to_row_array
    (0..height-1).map do |index|
      generate_row_array index
    end
  end

  # Prints out the #BoardState.
  def to_s
    to_row_array.map do |row|
      row.join(' ')
    end.join("\n")
  end

  # Invokes a method on each cell in the #BoardState.
  def each_cell(&block)
    (0..height-1).each do |row|
      (0..width-1).each do |column|
        block.call(column, row)
      end
    end
  end

  private
  # Generates a row array from a row number.
  # Iterates through each column and pulls out the item at the specified row number in the column.
  #
  # @number - The row number to generate the #BoardRow from.
  def generate_row_array(number)
    @board_array.map { |column| column[number] }
  end

  # Generates a zone array from an (x,y) position.
  # Copies out the zone array from the #BoardState.
  #
  # @x - The x-position that contains the desired zone.
  # @y - The y-position that contains the desired zone.
  def generate_zone_array(x, y)
    start_x, end_x = get_zone_x_bounds(x)
    start_y, end_y = get_zone_y_bounds(y)

    # Map out the array, and return it
    (start_x..end_x).map do |x|
      (start_y..end_y).map do |y|
        @board_array[x][y]
      end
    end
  end

  # Gets the zone x bounds
  #
  # @x - The x of the zone where the bounds are being calculated.
  def get_zone_x_bounds(x)
    case
      when x >= 6
        return 6, 8
      when x >= 3
        return 3, 5
      else
        return 0, 2
    end
  end

  # Gets the zone y bounds
  #
  # @y - The y of the zone where the bounds are being calculated.
  def get_zone_y_bounds(y)
    case
      when y >= 6
        return 6, 8
      when y >= 3
        return 3, 5
      else
        return 0, 2
    end
  end

end