# Calling Coq functions from OCaml

This project contains an example of the Coq-to-OCaml extraction feature of Coq and its synergy with Dune.

We have a formal verification of a very simple algorithm, the [boolean negation operator](https://en.wikipedia.org/wiki/Negation), which we call by the name `bitflip`. Coq's `bool` type lines up nicely with OCaml's `bool` type, making that part of the extraction easy for us. 

The relevant files are:

- `bin/main.ml` the OCaml executable that calls `bitflip`.
- `lib/bitflip.v` the Coq code: extraction, definitions and formal verification.

## How to build and use the project

Build:

    dune build

Execute:

    dune exec bin/main.exe

## Resources

See the chapter *Extracting OCaml from Coq* of the [first volume](https://softwarefoundations.cis.upenn.edu/lf-current/index.html) from [Software Foundations](https://softwarefoundations.cis.upenn.edu/) for an example of Coq extraction into OCaml, and the [third volume](https://softwarefoundations.cis.upenn.edu/vfa-current/index.html) for various common algorithms and their formal verification in Coq, and in particular its *Extract* chapter for caveats regarding the OCaml extraction.
