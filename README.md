sudoku-solver
=============

Solves a sudoku puzzle when supplied one.

    Usage: sudoku-solver
        -p, --provider [NAME]            Sets the provider to be used for parsing and generating the solution.
        -s, --solver [NAME]              Sets the solver to be used for searching for a sudoku configuration from the board given by the provider.
        -h, --help                       Show this message

## Providers

A `Provider` is a class that implements a strategy to generate a `BoardState`.  

The default `Provider` is set to `FileProvider`. You can manually choose another `Provider` by using the `--provider`
switch and setting it to whatever value the `PROVIDER_NAME` constant for that `Provider` is set to.

The switch to utilize the `FileProvider` would thus be as follow - `--provider file`.

You can add your own `Provider` implementations by forking and adding them to the project.
Some ideas for a custom `Provider` include reading a Latin square off of an image, or reading in a Latin square
from a socket connection.

## Solvers

A `Solver` is a class that implements a strategy for finding `BoardState` with a sudoku configuration from a given `BoardState`.

You can choose the `Solver` you would like to use in a similar fashion to `Provider`. By default `Solver` is set to `BacktrackingSolver`.
Like a `Provider`, you can manually choose a different `Solver` by using the `--solver` switch and setting it to whatever value the `SOLVER_NAME` constant for that `Solver` is set to.

The switch to utilize the `BacktrackingSolver` would thus be as follows - `--solver backtracking`.

You can add your own `Solver` implementations by forking and adding them to the project.
Some ideas for a custom `Solver` include implementing a [stochastic search algorithm](http://en.wikipedia.org/wiki/Sudoku_solving_algorithms#Stochastic_search_.2F_optimization_methods) or a [brute force algorithm](http://en.wikipedia.org/wiki/Sudoku_solving_algorithms#Brute-force_algorithm).

## Example usage

- Implicitly uses `FileProvider` and `BacktrackingSolver`

```./sudoku-solver /path/to/boardfile```

- Explicitly uses `FileProvider` and `BacktrackingSolver`

```./sudoku-solver -p file -s backtracking /path/to/boardfile```

## Documentation generation

To generate documentation, run the following commands.

```
gem install yard
cd /path/to/sudoku-solver
yardoc src
```
