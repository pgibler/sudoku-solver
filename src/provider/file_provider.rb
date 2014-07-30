# #FileProvider will read in the command line options, find the file as the first argument (i.e. #ARGV[0]),
# and then read through the sudoku puzzles 9x9 lines and generate a puzzle.
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
class FileProvider

  # Provider name is 'file'
  def class.provider_name
    'file'
  end

  # Provides a #BoardState by reading through a file, line-by-line, removing all white text, and then converting the lines
  # into an array.
  def provide_puzzle_state
    file = ARGV[0]
    board_array = []

    File.open(file).each do |line|
      board_array << convert_line_to_array(line)
    end

    return BoardState.new(board_array)
  end

  private

  # Converts a line to a row array. Takes a line of the form:
  # - 400520103
  # or
  # - 4 0 0 5 2 0 1 0 3
  #
  # @line - The line that is parsed into an array.
  def convert_line_to_array(line)
    line.gsub(/\s+/, '').to_a
  end

end