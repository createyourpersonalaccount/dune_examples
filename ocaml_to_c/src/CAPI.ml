(* Register the hello function from the Lib module so that it may be
   looked up at dynamically by caml_named_value() on the C side. *)
let () =
  Callback.register "hello" Lib.hello
