# #BacktrackingSolver solves a Latin square into sudoku using the backtracking technique.
# Technique ported from this URL: http://www.geeksforgeeks.org/backtracking-set-7-suduku/
class BacktrackingSolver < Solver

  # Provider name is 'backtracking'
  def self.solver_name
    'backtracking'
  end

  # Determines if a #BoardState has a valid sudoku configuration and generates a #BoardState containing that data.
  # The #BoardState is retrieved from the provider.
  #
  # @provider_type - A #Provider type that supplies a #BoardState.
  def solve(provider_type)
    @provider = provider_type.new

    # Solve the puzzle
    board_state, result = solve_sudoku(@provider.provide_board_state)

    # The resulting #BoardState and #Provider will be returned.
    return @provider, board_state, result
  end

  private

  # Solves sudoku. Returns the resulting #BoardState.
  #
  # @board_state - The current board state to check
  def solve_sudoku(board_state)
    # If there is no unassigned location, we are done
    if (@provider.filled? board_state)
      return board_state, true # The #board_state is complete. Done!
    end

    column, row = find_next_unassigned_location(board_state)

    # Iterate through assignable values.
    @provider.assignable_values.each do |num|

      # If #num is not present at the unassigned #row and #column...
      if (is_safe?(board_state, column, row, num))

        # Make tentative assignment.
        updated_board_state = board_state.update(column, row, num)

        # Try and solve the next step. If this returns true,
        # the #board_state is complete and we have succeeded.
        result_board_state, operation_result = solve_sudoku(updated_board_state)

        # If it succeeded, return the board_state
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

  # Returns true if the #board_state can be assigned the #num value at #row and #column.
  # This is possible if that number does not appear in that row, column, or 3x3 subsection
  # corresponding to that location
  #
  # @board_state - The #BoardState instance whose safety is being checked.
  # @column - The column number to test for insertion safeness.
  # @row - The row number to test for insertion safeness.
  # @num - The number to insert into the board at (row, column).
  def is_safe?(board_state, column, row, num)
    if( !board_state.row(row).contains?(num) && # If the row doesn't have the value...
        !board_state.column(column).contains?(num) && # ...and the column doesn't have the value...
        !board_state.zone_at(column, row).contains?(num)) # ...and the zone doesn't have the value.
      true
    else
      false
    end
  end

  # Returns the next (row, column) pair that do not have a value assigned to them.
  #
  # @board_state - The board state to check
  def find_next_unassigned_location(board_state)
    board_state.each_cell do |column, row|
      if @provider.is_value_unassigned?( board_state.at(column, row) )
        return column, row
      end
    end

    raise 'Board is complete, no empty locations could be found.'
  end
end