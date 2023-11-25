(* Tell Coq: we are going to extract code, and it will be in OCaml. *)
Require Coq.extraction.Extraction.
Extraction Language OCaml.

(* This is not required; we just use it to be able to write f = g for
two functions instead of forall x, f x = g x in [bitflip_correct]. *)
From Coq Require Import Logic.FunctionalExtensionality.

(** Flip a bool. *)
Definition bitflip (x : bool)
  := match x with
     | true => false
     | false => true
     end.

(** This property characterizes the [bitflip] function. *)
Definition bitflip_characterization (f : bool -> bool)
  := (forall b, f b <> b).

(** This theorem characterizes the [bitflip] function. *)
Theorem bitflip_correct : forall (f : bool -> bool),
    bitflip_characterization f -> f = bitflip.
Proof.
  unfold bitflip_characterization.
  (* Introduce f and the characterization hypothesis. *)
  intros f H.
  (* Let b be a boolean value. Let's examine f b and bitflip b. *)
  apply functional_extensionality.
  intro b.
  (* Consider the case f b = true and the case f b = false separately;
     and for each case, consider b = true and b = false separately.
   *)
  destruct (f b) eqn:E1; destruct b eqn:E2.
  - (* f true  = true,  b = true *) apply H in E1. contradiction.
  - (* f false = true,  b = false *) reflexivity.
  - (* f true  = false, b = true *) reflexivity.
  - (* f false = false, b = false *) apply H in E1. contradiction.
Qed.

(* This teaches OCaml to treat our Coq bool type as its bool type. *)
Extract Inductive bool => "bool"      (* Our Coq bool type matches this OCaml type *)
                            [ "true"  (* Our Coq true bool constructor matches this OCaml value *)
                              "false" (* Our Coq false bool constructor matches this OCaml value *)
                            ].

(* Extract the bitflip function into an OCaml file called bitflip.ml,
   with OCaml signature bitflip.mli
 *)
Extraction "bitflip.ml" bitflip.
