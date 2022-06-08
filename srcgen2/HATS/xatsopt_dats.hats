(* ****** ****** *)
(*
HX-2022-06-06:
For ATS3/XATSOPT
*)
(* ****** ****** *)
#include
"prelude\
/HATS/prelude_dats.hats"
(* ****** ****** *)
#staload // _ =
"./..\
/DATS/xatsopt_tmplib.dats"
(* ****** ****** *)
#staload // _ =
"xatslib\
/libcats/DATS/synoug0.dats"
(* ****** ****** *)
#staload _ =
"xatslib\
/githwxi/DATS/f00path.dats"
#staload _ =
"xatslib\
/githwxi/DATS/g00iout.dats"
(* ****** ****** *)
//
// #ifdef(_XATSOPT_JS_)
//
#include
"prelude\
/HATS/CATS/JS/prelude_dats.hats"
#staload
"xatslib\
/githwxi\
/DATS/CATS/JS/Node/basics0.dats"
//
// #endif // end of [ifdef(_XATSOPT_JS_)]
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_xatsopt_dats.hats] *)
