# #Application uses the #Solver to move the #BoardState as close to a solution as possible.

require_relative 'solver/solver'

# #Application takes in a set #provider and a hash of #options and returns a #BoardState, if possible.
class Application

  # Runs the #Application by getting the #BoardState from the #Provider and then having #Solver.solve interact with it
  #
  # @provider - The #Provider used to get the #BoardState
  def self.run!(provider)
    Solver.solve provider.provide_puzzle_state
  end
end