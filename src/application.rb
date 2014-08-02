require_relative 'stdlib/class'
require_relative 'solver/solver'
require_relative 'solver/backtracking_solver'
require_relative 'provider/provider'
require_relative 'provider/file_provider'

##
# {Application} is the entry point of the sudoku solver portion of the program.
#
# @see Application.run!
class Application

  # Runs the {Application} by getting the {BoardState} from the {Provider} and then having {Solver#solve} utilize it.
  #
  # @param provider [Class] The {Provider} which provides the {BoardState}.
  # @param solver [Class] The {Solver} which searches for a sudoku configuration in the {BoardState}.
  #
  # @return [(BoardState, Boolean)] Returns a tuple of ({BoardState}, Boolean) containing the {Provider} used to get the {BoardState} and a Boolean to indicate if the run was successful (true) or not (false).
  def self.run!(options={})

    provider = get_provider_type(options[:provider_name]).new
    solver = get_solver_type(options[:solver_name]).new

    solver.solve provider
  end

  private

  # Returns a {Provider} sub-type based on name, if available.
  #
  # @param provider_name [String] The name of the requested {Provider} sub-type.
  #
  # @return [Class] Returns a {Provider} sub-type based on name, if available.
  def self.get_provider_type(provider_name)
    Provider.descendants.find do |clazz|
      clazz::PROVIDER_NAME == provider_name
    end
  end

  # Returns a {Solver} sub-type based on name, if available.
  #
  # @param solver_name [String] The name of the requested {Solver} sub-type.
  #
  # @return [Class] Returns a {Solver} sub-type based on name, if available.
  def self.get_solver_type(solver_name)
    Solver.descendants.find do |clazz|
      clazz::SOLVER_NAME == solver_name
    end
  end

end