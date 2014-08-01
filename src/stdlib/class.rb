# Add to the base Ruby #Class
class Class

  # Returns the descendant sub-types of the #Class.
  def descendants
    ObjectSpace.each_object(Class).select { |klass| klass < self }
  end

end