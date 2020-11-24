(* ****** ****** *)
(*
Prelude for Xats2js
*)
(* ****** ****** *)
#staload
UN = // for casting
"prelude/SATS/unsafe.sats"
(* ****** ****** *)
#staload _ = 
"prelude/DATS/stream.dats"
#staload _ = 
"prelude/DATS/stream_vt.dats"
(* ****** ****** *)
(*
implfun
{a:vt} // HX: This is
g_free<a>(x0) = () // for JS!!!
*)
(* ****** ****** *)
// prelude/basics
(* ****** ****** *)
//
#extern
fun
XATS2JS_lazy_cfr
{a:t0}
( f0
: ()-<cfr>a
) : lazy(a) = $exname()
#extern
fun
XATS2JS_llazy_cfr
{a:vt}
( f0
: ()-<cfr>a
) : lazy_vt(a) = $exname()
#extern
fun
XATS2JS_lazy_vt_cfr
{a:vt}
( f0
: ()-<cfr>a
) : lazy_vt(a) = $exname()
//
implfun
XATS2JS_lazy_cfr{a}(f0) = $lazy(f0())
implfun
XATS2JS_llazy_cfr{a}(f0) = $llazy(f0())
implfun
XATS2JS_lazy_vt_cfr{a}(f0) = $llazy(f0())
//
(* ****** ****** *)
//
// prelude/optn.sats
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_optn_nil
{a:t0}(): optn(a) = $exname()
#extern
fun
XATS2JS_optn_cons
{a:t0}(x0: a): optn(a) = $exname()
//
implfun
XATS2JS_optn_nil() = optn_nil()
implfun
XATS2JS_optn_cons(x0) = optn_cons(x0)
//
(* ****** ****** *)
//
// prelude/list.sats
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_list_nil
{a:t0}
( (*void*) ): list(a) = $exname()
#extern
fun
XATS2JS_list_cons
{a:t0}
( x0: a
, xs: list(a)): list(a) = $exname()
//
implfun
XATS2JS_list_nil() = list_nil((*void*))
implfun
XATS2JS_list_cons(x0, xs) = list_cons(x0, xs)
//
(* ****** ****** *)
//
// prelude/stream.sats
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_strmcon_nil
{a:t0}
( (*void*) ): strmcon(a) = $exname()
#extern
fun
XATS2JS_strmcon_cons
{a:t0}
( x0: a
, xs: stream(a)): strmcon(a) = $exname()
//
implfun
XATS2JS_strmcon_nil() = strmcon_nil((*void*))
implfun
XATS2JS_strmcon_cons(x0, xs) = strmcon_cons(x0, xs)
//
(* ****** ****** *)
(*
//
#extern
fun
XATS2JS_stream_nil
{a:t0}
( (*void*) ): stream(a) = $exname()
#extern
fun
XATS2JS_stream_cons
{a:t0}
( x0: a
, xs: stream(a)): stream(a) = $exname()
//
implfun
XATS2JS_stream_nil() = stream_nil((*void*))
implfun
XATS2JS_stream_cons(x0, xs) = stream_cons(x0, xs)
//
*)
(* ****** ****** *)
//
// prelude/optn_vt.sats
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_optn_vt_nil
{a:vt}(): optn_vt(a) = $exname()
#extern
fun
XATS2JS_optn_vt_cons
{a:vt}(x0: a): optn_vt(a) = $exname()
//
implfun
XATS2JS_optn_vt_nil() = optn_vt_nil()
implfun
XATS2JS_optn_vt_cons(x0) = optn_vt_cons(x0)
//
(* ****** ****** *)
//
// prelude/list.sats
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_list_vt_nil
{a:vt}
( (*void*) ): list_vt(a) = $exname()
#extern
fun
XATS2JS_list_vt_cons
{a:vt}
( x0: a
, xs: list_vt(a)): list_vt(a) = $exname()
//
implfun
XATS2JS_list_vt_nil() = list_vt_nil((*void*))
implfun
XATS2JS_list_vt_cons(x0, xs) = list_vt_cons(x0, xs)
//
(* ****** ****** *)
//
// prelude/stream_vt.sats
//
(* ****** ****** *)
(*
//
#extern
fun
XATS2JS_stream_vt_nil
{a:vt}
( (*void*) ): stream_vt(a) = $exname()
#extern
fun
XATS2JS_stream_vt_cons
{a:vt}
( x0: a
, xs: stream_vt(a)): stream_vt(a) = $exname()
//
implfun
XATS2JS_stream_vt_nil() = stream_vt_nil((*void*))
implfun
XATS2JS_stream_vt_cons(x0, xs) = stream_vt_cons(x0, xs)
//
*)
(* ****** ****** *)
//
#extern
fun
XATS2JS_strmcon_vt_nil
{a:vt}
( (*void*) ): strmcon_vt(a) = $exname()
#extern
fun
XATS2JS_strmcon_vt_cons
{a:vt}
( x0: a
, xs: stream_vt(a)): strmcon_vt(a) = $exname()
//
implfun
XATS2JS_strmcon_vt_nil() = strmcon_vt_nil((*void*))
implfun
XATS2JS_strmcon_vt_cons(x0, xs) = strmcon_vt_cons(x0, xs)
//
(* ****** ****** *)

#extern
fun
XATS2JS_stream_vt_uncons_cfr
{x0:vt}{r0:vt}
( xs
: stream_vt(x0)
, f0
: (x0, stream_vt(x0))-<cfr>r0): r0 = $exname()
implfun
XATS2JS_stream_vt_uncons_cfr
  (xs, f0) =
let
val-strmcon_vt_cons(x0, xs) = !xs in f0(x0, xs)
end // end of [XATS2JS_stream_vt_uncons_cfr]

(* ****** ****** *)

#extern
fun
XATS2JS_stream_vt_map0_cfr
{x0:vt}
{y0:vt}
( xs: stream_vt(x0)
, f0: (x0) -<cfr> y0): stream_vt(y0) = $exname()
implfun
XATS2JS_stream_vt_map0_cfr
{x0}{y0}
(xs, f0) =
(
stream_vt_map0<x0><y0>(xs)
) where
{
impltmp
map0$fopr<x0><y0>(x0) = f0(x0)
}

(* ****** ****** *)

#extern
fun
XATS2JS_stream_vt_filter0_cfr
{x0:vt}
( xs: stream_vt(x0)
, f0: (x0) -<cfr> bool): stream_vt(x0) = $exname()
implfun
XATS2JS_stream_vt_filter0_cfr
{x0}(xs, f0) =
(
stream_vt_filter0<x0>(xs)
) where
{
  impltmp
  filter0$test<x0>(x0) = f0(x0)
}

(* ****** ****** *)

(* end of [XATS2JS_prelude.dats] *)
