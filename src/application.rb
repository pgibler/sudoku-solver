# #Application uses a #Provider to retrieve a #BoardState and a #Solver to move the #BoardState as close to a solution
# as possible.

require_relative 'stdlib/class'
require_relative 'solver/solver'
require_relative 'solver/backtracking_solver'
require_relative 'provider/provider'
require_relative 'provider/file_provider'

# #Application takes in a set #provider and a hash of #options and returns a #BoardState, if possible.
class Application

  DEFAULT_PROVIDER=FileProvider
  DEFAULT_SOLVER=BacktrackingSolver

  # Runs the #Application by getting the #BoardState from the #Provider and then having #Solver.solve interact with it
  #
  # @provider_type - The #Provider sub-type used to get the #BoardState.
  # @solver_type - The #Solver sub-type used to search for a sudoku configuration in the #BoardState.
  def self.run!(provider_type, solver_type)
    solver_type.new.solve provider_type
  end

  # Returns a #Provider sub-type based on name, if available.
  #
  # @provider_name - The name of the requested #Provider sub-type.
  def self.get_provider_type(provider_name)
    Provider.descendants.find do |clazz|
      clazz.provider_name == provider_name
    end
  end

  # Returns a #Solver sub-type based on name, if available.
  #
  # @solver_name - The name of the requested #Solver sub-type.
  def self.get_solver_type(solver_name)
    Solver.descendants.find do |clazz|
      clazz.solver_name == solver_name
    end
  end

end