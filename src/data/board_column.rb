# #BoardColumn contains a column of cells from a #BoardState.
class BoardColumn

  # Constructor for #BoardColumn
  #
  # @numbers - The numbers that appear in the column.
  def initialize(numbers)
    @numbers = numbers
  end

  # Returns #true or #false if the #number is contained in the #BoardColumn.
  #
  # @number - The number to check if it appears in the #BoardColumn.
  def contains?(number)
    @numbers.include?(number)
  end

end