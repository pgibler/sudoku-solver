# #BoardZone is a sub-area of a #BoardState.
class BoardZone

  # Constructor for #BoardZone.
  #
  # @zone_array - A 3x3 array of integers for the Latin square. Top arrays stores columns, inner arrays store rows.
  def initialize(zone_array)
    @zone_array = zone_array
  end

  # Checks if the #BoardZone contains the specified #number.
  #
  # @number - The number to search for in the #BoardZone.
  def contains?(number)
    @zone_array.each do |column|
      column.each do |cell|
        # If the cell is the number, return true since the #BoardZone contains it.
        return true if cell == number
      end
    end

    # If the number cannot be found in the #BoardZone, return #false.
    false
  end

end