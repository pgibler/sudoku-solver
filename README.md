sudoku-solver
=============

Solves a sudoku puzzle when supplied one.

```
Usage: sudoku_solver
    -p, --provider                   Sets the provider to be used for parsing and generating the solution.
    -h, --help                       Show this message
```

The default `Provider` is set to `FileProvider`. You can manually choose `FileProvider` by using the `--provider` switch
and setting it to `file`, as so - `--provider=file`.

You can add your own `Provider` implementations by forking and adding them to the project.
Some ideas for a custom `Provider` include reading a Latin square off of an image, or reading in a Latin square
from a socket connection.