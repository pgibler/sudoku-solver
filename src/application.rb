# #Application uses the #Solver to move the #BoardState as close to a solution as possible.

require_relative 'solver/solver'
require_relative 'provider/provider'
require_relative 'provider/file_provider'

# #Application takes in a set #provider and a hash of #options and returns a #BoardState, if possible.
class Application

  DEFAULT_PROVIDER=FileProvider

  # Runs the #Application by getting the #BoardState from the #Provider and then having #Solver.solve interact with it
  #
  # @provider - The #Provider used to get the #BoardState
  def self.run!(provider_type)
    Solver.solve provider_type
  end

  # Returns a provider class based on name, if available.
  #
  # @provider_name - The name of the requested provider class.
  def self.get_provider_type(provider_name)
    Provider.descendants.find do |clazz|
      clazz.provider_name == provider_name
    end
  end
end