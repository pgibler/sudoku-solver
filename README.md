sudoku-solver
=============

Solves a sudoku puzzle when supplied one.

    Usage: sudoku-solver
        -p, --provider [NAME]            Sets the provider to be used for parsing and generating the solution.
        -s, --solver [NAME]              Sets the solver to be used for searching for a sudoku configuration from the board given by the provider.
        -h, --help                       Show this message

The default `Provider` is set to `FileProvider`. You can manually choose `FileProvider` by using the `--provider`
switch and setting it to `file`, as so - `--provider file`.

As well, you can set the `Solver` in a similar fashion. By default `Solver` is set to `BacktrackingSolver`.
You can manually choose `BacktrackingSolver` by using the `--solver` switch and setting it to `backtracking`,
as so - `--solver backtracking`.

You can add your own `Provider` implementations by forking and adding them to the project.
Some ideas for a custom `Provider` include reading a Latin square off of an image, or reading in a Latin square
from a socket connection.

Example usage:

- Implicitly uses `FileProvider` and `BacktrackingSolver`

```./sudoku-solver /path/to/boardfile```

- Explicitly uses `FileProvider` and `BacktrackingSolver`

```./sudoku-solver -p file -s backtracking /path/to/boardfile```