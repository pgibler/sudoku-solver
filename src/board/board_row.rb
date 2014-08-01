##
# `BoardRow` contains a row of cells from a `BoardState`.
#
# @see {BoardState}
class BoardRow

  # Constructor for `BoardRow`.
  #
  # @numbers [Array<Integer>] The numbers that appear in the row.
  def initialize(numbers)
    @numbers = numbers
  end

  # Returns `true` if the `number` is contained in the `BoardRow`, otherwise `false`.
  #
  # @number [Integer] The number to search for in the `BoardRow`.
  #
  # @return [Boolean] Returns `true` if the `number` is contained in the `BoardRow`, otherwise `false`.
  def contains?(number)
    @numbers.include?(number)
  end

end