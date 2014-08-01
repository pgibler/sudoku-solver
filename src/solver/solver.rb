##
# A `Solver` is any technique that takes in a {Provider}, generates a {BoardState} from it, and then using the
# {BoardState} and {Provider}, solves the Latin square by attempting to produce a sudoku valid board from it.
class Solver

  # The {Solver::SOLVER_NAME} of `Solver` is `'solver'`.
  SOLVER_NAME='solver'

  # Determines if a {BoardState} has a valid sudoku configuration and generates a {BoardState} containing that data.
  # The {BoardState} is retrieved from the provider.
  #
  # @provider_type [Class] A {Provider} type that supplies a {BoardState}.
  #
  # @return [BoardState, Boolean] Returns a tuple of ({BoardState},{Boolean}) which includes the final state and success state of the operation.
  def solve(provider_type)
  end

end