let () = if Coq_to_ocaml.Bitflip.bitflip true
         then print_endline "bitflip true = true"
         else print_endline "bitflip true = false"
