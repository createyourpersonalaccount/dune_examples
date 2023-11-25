#include <stdio.h>

/* For transmitting complex values (such as C strings) from C to
   OCaml. */
#include <caml/alloc.h>
/* For calling OCaml functions from C. */
#include <caml/callback.h>
/* For converting between C and OCaml values. */
#include <caml/mlvalues.h>

#include "cstub.h"

const char *hello(const char *name) {
  static const value* closure = NULL;
  value tmp;
  /* One-time lookup of the hello function in the OCaml
     environment. */
  if (closure == NULL)
    closure = caml_named_value("hello");
  /* Load the C-string into the OCaml environment; it will be garbage
     collected eventually. See
     <https://ocaml.org/docs/garbage-collection>. */
  tmp = caml_copy_string(name);
  /* Call the hello function and record its result. */
  value result = caml_callback_exn(*closure, tmp);
  /* Convert the OCaml string into a C string. */
  return String_val(result);
}

/* Initialize the OCaml runtime. */
void initialize_ocaml (char** argv) {
  caml_startup(argv);
}

int main(int argc, char **argv) {
  initialize_ocaml(argv);
  printf("%s\n", hello("World")); /* Prints Hello, World! */
  return 0;  
}
