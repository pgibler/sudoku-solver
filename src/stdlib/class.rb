##
# Add to the base Ruby {Class}
class Class

  # Goes through each sub-type deriving from {Class} and returns them as an Array.
  #
  # @return [Array] Returns the descendant sub-types of the {Class}.
  def descendants
    ObjectSpace.each_object(Class).select { |klass| klass < self }
  end

end
