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

end
