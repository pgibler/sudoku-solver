# A #Solver is any technique that takes in a #Provider, generates a #BoardState from it, and then using the
# #BoardState and #Provider, solves the Latin square by attempting to produce a sudoku valid board from it.
class Solver

  # Default #solver_name is 'solver'
  def self.solver_name
    'solver'
  end

  # Determines if a #BoardState has a valid sudoku configuration and generates a #BoardState containing that data.
  # The #BoardState is retrieved from the provider.
  #
  # @provider_type - A #Provider type that supplies a #BoardState.
  def solve(provider_type)
  end

end