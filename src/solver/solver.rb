# #Solver is to be run with the options and solve a puzzle.
class Solver

  # Determines if a #BoardState has a valid sudoku and generates a #BoardState containing that data.
  #
  # @puzzle_state - A #BoardState instance that will be solved looking for a valid sudoku state for it, if possible.
  def self.solve(puzzle_state)
    # Contains the puzzle states, as they are executed.
    # This gives us a history of our puzzle states.
    puzzle_states_stack = []

    # Put the current puzzle into the puzzle state stack.
    puzzle_states_stack << puzzle_state

    # Iterates through solving puzzle step-by-step.
    while(!puzzle_state.incomplete?)

      # Try to add a number to the #BoardState.
      # #result is set to nil if try_to_add_number_fails.
      puzzle_state = try_to_add_number puzzle_state

      result.nil? ?
          return nil : # Return nil for #solve_puzzle if #result.nil?
          puzzle_states_stack << puzzle_state # Add the next #BoardState to the #puzzle_states_stack
    end

    # Return the puzzle state
    puzzle_state
  end

  # Tries to add a number to a #BoardState, if it is legal.
  def try_to_add_number(puzzle_state)

  end
end