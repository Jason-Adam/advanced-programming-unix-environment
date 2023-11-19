# Advanced Programming in the UNIX Environment

Code snippets from the book "Advanced Programming in the UNIX Environment" [1].

To run a specific file, update the `Makefile` variable `FILE_PREFIX` and then run `make build`.  The binary can then be run with `make run`.

To run a program through Valgrind, you can run the following commands:

```bash
make valgrind_run
```

This will create the Valgrind container, mount in the source code and drop you in an interactive prompt. From there you can run:

```bash
make valgrind
```

This will run the program through Valgrind and print issues to stdout.

[1] Advanced Programming in the UNIX Environment, Third Edition - W. Richard Stevens & Stephen A. Rago

