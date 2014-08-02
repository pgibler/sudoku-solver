require_relative '../board/board_state'

##
# FileProvider will read in the command line options, find the file as the first argument (i.e. ARGV[0]),
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

  # The {FileProvider::PROVIDER_NAME} of FileProvider.
  PROVIDER_NAME='file'

  # Provides a {BoardState} by reading through a file, line-by-line, removing all white text, and then converting the
  # lines into an array. The first argument (ARGV[0]) is parsed as the filename.
  #
  # @return [BoardState] The BoardState as loaded from the file.
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

    BoardState.new(board_array)
  end

  private

  # Converts a line to a row array. Takes a line of the form:
  # - 400520103
  # or
  # - 4 0 0 5 2 0 1 0 3
  #
  # @param line [String] The line that is parsed into an array.
  #
  # @return [String] Returns a String with the whitespace removed.
  def convert_line_to_array(line)
    line.scan /\w/
  end

end
