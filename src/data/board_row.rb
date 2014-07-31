# #BoardRow contains a row of cells from a #BoardState.
class BoardRow

  # Constructor for #BoardRow
  #
  # @numbers - The numbers that appear in the row.
  def initialize(numbers)
    @numbers = numbers
  end

  # Returns #true or #false if the #number is contained in the #BoardRow.
  #
  # @number - The number to check if it appears in the #BoardRow.
  def contains?(number)
    @numbers.include?(number)
  end

end