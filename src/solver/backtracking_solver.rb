##
# BacktrackingSolver solves a Latin square into sudoku using the backtracking technique.
# Technique ported from this {http://www.geeksforgeeks.org/backtracking-set-7-suduku/ URL}.
class BacktrackingSolver < Solver

  # The {BacktrackingSolver::SOLVER_NAME} of BacktrackingSolver.
  SOLVER_NAME='backtracking'

  # Searches potential configurations of the {BoardState} supplied by the {Provider} to see if it contains a valid
  # sudoku configuration.
  #
  # @param provider [Class] A {Provider} that supplies a {BoardState}.
  #
  # @return [(BoardState, Boolean)] Returns a tuple of ({BoardState}, {Boolean}) with the furthest {BoardState} achieved and the success state of the operation.
  def solve(provider)

    # Solve the puzzle
    board_state, result = do_solve(provider.provide_board_state)

    # The resulting BoardState and a Boolean indicating if the operation succeeded will be returned.
    return board_state, result
  end

  private

  # Solves sudoku. Returns the resulting {BoardState}.
  #
  # @param board_state [BoardState] The current board state to check.
  #
  # @return [(BoardState, Boolean)] Returns a tuple of ({BoardState},Boolean) which includes the final {BoardState} and success state of the operation.
  def do_solve(board_state)
    # If there is no unassigned location, we are done
    if (board_state.filled?)
      return board_state, true # The BoardState is complete. Done!
    end

    column, row = find_next_unassigned_location(board_state)

    # Iterate through assignable values.
    board_state.assignable_values.each do |num|

      # If num is not present at the unassigned row and column...
      if (is_safe?(board_state, column, row, num))

        # Make tentative assignment.
        updated_board_state = board_state.update(column, row, num)

        # Try and solve the next step. If this returns true,
        # the board_state is complete and we have succeeded.
        result_board_state, operation_result = do_solve(updated_board_state)

        # If it succeeded, return the board_state.
        if (operation_result)
          return result_board_state, true
        else
          next
        end
      end
    end

    # This triggers backtracking.
    return board_state, false
  end

  # Returns true if the `board_state` can be assigned the number value at `column` and `row`.
  # This is possible if that number does not appear in that row, column, or 3x3 subsection
  # corresponding to that location.
  #
  # @param board_state [BoardState] The {BoardState} instance whose safety is being checked.
  # @param column [Integer] The column number to test for insertion safeness.
  # @param row [Integer] The row number to test for insertion safeness.
  # @param number [Integer] The number to insert into the board at (column, row).
  #
  # @return [Boolean] Returns true if it is safe to place a number at position (column, row), otherwise false.
  def is_safe?(board_state, column, row, number)
    if( !board_state.row(row).contains?(number) && # If the row doesn't have the value...
        !board_state.column(column).contains?(number) && # ...and the column doesn't have the value...
        !board_state.zone_at(column, row).contains?(number)) # ...and the zone doesn't have the value.
      true
    else
      false
    end
  end

  # Returns the next (column, row) pair that do not have a value assigned to them.
  #
  # @param board_state [BoardState] The board state to check
  #
  # @return [Integer, Integer] Returns the (column, row) of the next unassigned location.
  def find_next_unassigned_location(board_state)
    board_state.each_cell do |column, row|
      if board_state.is_value_unassigned?( board_state.at(column, row) )
        return column, row
      end
    end

    # If this is called, there is an error with the board_state claiming it's filled when it is not.
    raise 'Board is complete, no empty locations could be found.'
  end
end
