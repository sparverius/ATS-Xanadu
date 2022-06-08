(* ****** ****** *)
#include
"./../..\
/HATS/xatsopt_sats.hats"
#include
"./../..\
/HATS/xatsopt_dats.hats"
(* ****** ****** *)
#staload
"./../../SATS/xstamp0.sats"
(* ****** ****** *)
val
tmper0=stamper_new()
(* ****** ****** *)
val () =
prerrln
( "nilq(nil) = "
, nilq(the_stamp_nil))
val () =
prerrln
( "nilq(nil) = "
, neqz(the_stamp_nil))
(* ****** ****** *)
val () =
prerrln
("the_stamp_nil = ", the_stamp_nil)
(* ****** ****** *)
//
val (  ) =
prerrln("tmp1 = ", tmper0.getinc())
val (  ) =
prerrln("tmp2 = ", tmper0.getinc())
//
val tmp3 = tmper0.getinc() and tmp4 = tmper0.getinc()
//
val (  ) = prerrln("cmp(tmp3, tmp3) = ", tmp3 \cmp tmp3)
val (  ) = prerrln("cmp(tmp3, tmp4) = ", tmp3 \cmp tmp4)
val (  ) = prerrln("cmp(tmp4, tmp3) = ", tmp4 \cmp tmp3)
val (  ) = prerrln("cmp(tmp4, tmp4) = ", tmp4 \cmp tmp4)
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_TEST_JS_test03_xstamp0.dats] *)
