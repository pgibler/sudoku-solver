# A #Provider is any technique that takes in data and produces a #BoardState object.
# Some examples of potential providers include reading in from a file, socket connection, or the command line.
# This default one provides provides nothing.
class Provider

  # Default #provider_name is 'provider'
  def self.provider_name
    'provider'
  end

  # The provide method
  def provide_board_state
  end

  # Determines if a cell is empty or not based on its value.
  #
  # @value - The value of the cell being checked.
  def is_value_unassigned?(value)
  end

  # Returns #true if the #board_state is filled. Otherwise, #false.
  #
  # @board_state - The #BoardState whose filled status is being determined.
  def filled?(board_state)
  end

  # Returns an #Array containing the values that could be assigned to a cell given this provider.
  # Unless the #Provider sub-type does something out of the ordinary, this will usually return (1..9).
  def assignable_values
  end

  # Gets all descendants of the #Provider object.
  def self.descendants
    ObjectSpace.each_object(Class).select { |klass| klass < self }
  end
end
