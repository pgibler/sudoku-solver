##
# A Provider is any technique that takes in data and produces a {BoardState} object.
# Some examples of potential providers include reading in from a file, socket connection, or the command line.
# This default one provides provides nothing.
class Provider

  # The {Provider::PROVIDER_NAME} of Provider.
  PROVIDER_NAME='provider'

  # Provides a {BoardState} to the requester.
  #
  # @return [BoardState] Returns a {BoardState}.
  def provide_board_state
  end

  # Determines if a cell is empty or not based on its value.
  #
  # @param value [Integer] The value of the cell being checked.
  #
  # @return [Boolean] Returns true if the value is unassigned.
  def is_value_unassigned?(value)
  end

  # Returns true if the board_state is filled, otherwise, false.
  #
  # @param board_state [BoardState] The {BoardState} whose filled status is being determined.
  #
  # @return [Boolean] Returns true if the {BoardState} is filled, otherwise, false.
  def filled?(board_state)
  end

  # Returns an Array containing the values that could be assigned to a cell given this provider.
  # Unless the {Provider} sub-type does something out of the ordinary, this will usually return (1..9).
  #
  # @return [Array] Returns an Array of values that can be assigned into the Latin square.
  def assignable_values
  end

end
