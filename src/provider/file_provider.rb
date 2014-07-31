# #BoardState is needed for generation.

require_relative '../board/board_state'

# #FileProvider will read in the command line options, find the file as the first argument (i.e. #ARGV[0]),
# and then read through the sudoku boards 9x9 lines and generate a board.
# Can read in two formats:
# - spaced lines:
#    4 0 0 5 2 0 1 0 3
#    0 9 0 8 0 0 5 0 0
#    1 0 0 0 0 0 0 0 0
#    8 0 0 4 3 0 0 0 0
#    0 0 0 0 0 0 9 0 0
#    0 5 6 0 0 0 7 0 0
#    0 0 0 6 0 0 0 0 0
#    0 3 0 0 0 7 0 0 2
#    0 2 0 0 0 0 4 0 5
# - no whitespace:
#    400520103
#    090800500
#    100000000
#    800430000
#    000000900
#    056000700
#    000600000
#    030007002
#    020000405
#
# It will automatically detect the format and parse correctly.
class FileProvider < Provider

  # Constants

  UNASSIGNED_VALUE=0

  # Provider name is 'file'
  def self.provider_name
    'file'
  end

  # Provides a #BoardState by reading through a file, line-by-line, removing all white text, and then converting the
  # lines into an array.
  def provide_board_state
    filename = ARGV[0]

    if(filename.nil? || filename.strip == '')
      raise 'File cannot be blank. Include a filename as the first argument for the program.'
    end

    board_array = Array.new(9)
    board_array = board_array.map { Array.new(9) }
    current_row = 0

    File.open(filename).each do |line|
      convert_line_to_array(line).each_with_index do |cell, current_column|
        # Convert all cells into integers from strings.
        board_array[current_column][current_row] = cell.to_i
      end

      current_row += 1
    end

    return BoardState.new(board_array)
  end

  # Determines to see if a cell contains 0 or not.
  #
  # @value - The value of the cell being checked.
  def is_value_unassigned?(value)
    value == UNASSIGNED_VALUE
  end

  # Returns #true if the #board_state is filled. Otherwise, #false.
  #
  # @board_state - The #BoardState whose filled status is being determined.
  def filled?(board_state)
    board_state.each_cell do |column, row|
      return false if is_value_unassigned?( board_state.at(column, row) )
    end

    # If there are no more 0 numbers, return #true.
    true
  end

  # Returns an #Array containing the values that could be assigned to a cell.
  def assignable_values
    (1..9)
  end

  private

  # Converts a line to a row array. Takes a line of the form:
  # - 400520103
  # or
  # - 4 0 0 5 2 0 1 0 3
  #
  # @line - The line that is parsed into an array.
  def convert_line_to_array(line)
    line.scan /\w/
  end

end