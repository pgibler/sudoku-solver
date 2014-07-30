# A #Provider is any technique that takes in data and produces a #BoardState object.
# Some examples of potential providers include reading in from a file, socket connection, or the command line.
# This default one provides provides nothing.
class Provider
  # The provide method
  def provide_puzzle_state

  end

  # Lets us get all descendants of the #Provider object.
  def self.descendants
    ObjectSpace.each_object(Class).select { |klass| klass < self }
  end
end
