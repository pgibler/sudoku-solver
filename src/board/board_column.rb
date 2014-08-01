##
# BoardColumn contains a column of cells from a {BoardState}.
#
# @see BoardState
class BoardColumn

  # Constructor for BoardColumn.
  #
  # @param numbers [Array<Integer>] The numbers that appear in the column.
  def initialize(numbers)
    @numbers = numbers
  end

  # Returns true if the number is contained in the BoardColumn, otherwise false.
  #
  # @param number [Integer] The number to search for in the BoardColumn.
  #
  # @return [Boolean] Returns true if the number is contained in the BoardColumn, otherwise false.
  def contains?(number)
    @numbers.include?(number)
  end

end