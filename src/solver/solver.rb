##
# A Solver is any technique that takes in a {Provider}, generates a {BoardState} from it, and then using the
# {BoardState} and {Provider}, solves the Latin square by attempting to produce a sudoku valid board from it.
class Solver

  # The {Solver::SOLVER_NAME} of Solver.
  SOLVER_NAME='solver'

  # Determines if a {BoardState} has a valid sudoku configuration and generates a {BoardState} containing that data.
  # The {BoardState} is retrieved from a {Provider} sub-type instance based on the provider_type parameter.
  #
  # @param provider [Class] A {Provider} that supplies a {BoardState}.
  #
  # @return [(BoardState, Boolean)] Returns a tuple of ({BoardState},Boolean) which includes the final {BoardState} and success state of the operation.
  def solve(provider)
  end

end