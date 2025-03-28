(* ****** ****** *)
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsfx00.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"srcgen2\
/prelude/HATS/prelude_dats.hats"
//
#include
"srcgen2\
/prelude/HATS/prelude_JS_dats.hats"
#include
"srcgen2\
/prelude/HATS/prelude_NODE_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
list_vt_inc1by
(xs: !list_vt(sint)): void =
(
case+ xs of
|
list_vt_nil() => ()
|
list_vt_cons(!x1, xs) =>
(x1 := x1 + 1; list_vt_inc1by(xs))
)
//
(* ****** ****** *)
(* ****** ****** *)
//
val xs =
list_vt_3val(1, 2, 3)
val () =
let
val ys = list_vt2t(xs)
in
  prints("xs = ", ys, "\n") end
//
val () =
(
  list_vt_inc1by(xs))
val () =
let
val ys = list_vt2t(xs)
in
  prints("xs = ", ys, "\n") end
//
(* ****** ****** *)
(* ****** ****** *)
//
val () = console_log(the_print_store_flush())
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_TEST_test01_xats2js.dats] *)
