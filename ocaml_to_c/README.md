# Calling OCaml functions from a C binary

This project contains an example of a C binary linking to an OCaml library.

The relevant files are:

- `src/lib.ml` contains the OCaml function that we wish to export to C.
- `src/CAPI.ml` uses the OCaml registration mechanism as described in [§22.7.2](https://v2.ocaml.org/manual/intfc.html#ss:c-closures) of the OCaml manual.
- `src/cstub.c` is the C source code for the executable.
- `src/cstub.h` is the corresponding header for the `cstub.c` file; this may be omitted, but for a C library (as opposed to a C executable) you would want to have this header installed on the system.

## How to build and use the project

Build:

    dune build

Execute:

    dune exec src/CAPI.exe

Install on your opam installation:

    dune install

Execute the installed version on your opam-aware shell:

    ocaml_to_c.exe

Uninstall:

    dune uninstall

## Resources

See [Chapter 22 of the OCaml manual](https://v2.ocaml.org/manual/intfc.html) for relevant information.

The OCaml C header files included from C source code are found under the `$(ocamlc -where)/caml` directory.
