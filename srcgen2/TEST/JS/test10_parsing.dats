(* ****** ****** *)
#include
"./../..\
/HATS/xatsopt_sats.hats"
#include
"./../..\
/HATS/xatsopt_dats.hats"
(* ****** ****** *)
#staload
"./../../SATS/locinfo.sats"
#staload
"./../../SATS/lexbuf0.sats"
#staload
"./../../SATS/lexing0.sats"
#staload
"./../../SATS/parsing.sats"
#staload
"./../../SATS/preadx0.sats"
(* ****** ****** *)
#include
"./../../DATS/xstamp0.dats"
#include
"./../../DATS/xstamp0_print0.dats"
(* ****** ****** *)
#include
"./../../DATS/xsymbol.dats"
#include
"./../../DATS/xsymbol_print0.dats"
#include
"./../../DATS/xsymbol_mymap0.dats"
#include
"./../../DATS/xsymbol_inits0.dats"
(* ****** ****** *)
#include
"./../../DATS/xlabel0.dats"
#include
"./../../DATS/xlabel0_print0.dats"
(* ****** ****** *)
#include
"./../../DATS/locinfo.dats"
#include
"./../../DATS/locinfo_print0.dats"
(* ****** ****** *)
#include
"./../../DATS/lexbuf0.dats"
#include
"./../../DATS/lexbuf0_cstrx1.dats"
#include
"./../../DATS/lexbuf0_cstrx2.dats"
(* ****** ****** *)
#include
"./../../DATS/lexing0.dats"
#include
"./../../DATS/lexing0_token0.dats"
#include
"./../../DATS/lexing0_print0.dats"
#include
"./../../DATS/lexing0_mymap0.dats"
#include
"./../../DATS/lexing0_kword0.dats"
#include
"./../../DATS/lexing0_utils1.dats"
#include
"./../../DATS/lexing0_utils2.dats"
(* ****** ****** *)
#include
"./../../DATS/staexp0.dats"
#include
"./../../DATS/staexp0_print0.dats"
(* ****** ****** *)
#include
"./../../DATS/dynexp0.dats"
#include
"./../../DATS/dynexp0_print0.dats"
(* ****** ****** *)
#include
"./../../DATS/parsing.dats"
#include
"./../../DATS/parsing_tokbuf.dats"
#include
"./../../DATS/parsing_basics.dats"
#include
"./../../DATS/parsing_utils0.dats"
#include
"./../../DATS/parsing_staexp.dats"
#include
"./../../DATS/parsing_decl00.dats"
(* ****** ****** *)
#include
"./../../DATS/preadx0.dats"
#include
"./../../DATS/preadx0_staexp.dats"
#include
"./../../DATS/preadx0_errmsg.dats"
(* ****** ****** *)
var the_err = 0
(* ****** ****** *)
#define
p1_fun_test p1_fun_test_fpath
#define
pq_fun_test pq_fun_test_fpath
(* ****** ****** *)

val () =
prerrln("optn() = ", optn())
val () =
prerrln("optn(0) = ", optn(0))

(* ****** ****** *)

val () =
prerrln
(
"strm(0,1,2,...) = ", f0(0)
) where
{
fun
f0(x: int): strm(int) =
$lazy(strmcon_cons(x, f0(x+1)))
}

(* ****** ****** *)

val () =
prerrln
(
"strx(0,1,2,...) = ", f0(0)
) where
{
fun
f0(x: int): strx(int) =
$lazy(strxcon_cons(x, f0(x+1)))
}

(* ****** ****** *)

val () =
prerrln0
(
"strm_vt(0,1,2,...) = ", f0(0)
) where
{
fun
f0(x: int): strm_vt(int) =
$llazy(strmcon_vt_cons(x, f0(x+1)))
}

(* ****** ****** *)

val () =
prerrln0
(
"strx_vt(0,1,2,...) = ", f0(0)
) where
{
fun
f0(x: int): strx_vt(int) =
$llazy(strxcon_vt_cons(x, f0(x+1)))
}

(* ****** ****** *)

val () =
prerrln
(
"list(0,1,2,3) = ", list(0,1,2,3))
where
{
#impltmp
{a:t0}
gseq_print$beg<list(a)><a>() = print("$list(")
#impltmp
{a:t0}
gseq_print$sep<list(a)><a>() = print(   ","   )
} (*where*)

(* ****** ****** *)
val () =
let
#impltmp
g_print$out<>() = g_stderr()
in
list_print_begendsep(list(0,1,2,3), "", "", ""); prerrln()
end
(* ****** ****** *)
//
local
//
(* ****** ****** *)
//
#impltmp
optn_print$beg<>() = ()
#impltmp
optn_print$end<>() = ()
//
#impltmp
list_print$beg<>() = ()
#impltmp
list_print$end<>() = ()
#impltmp
list_print$sep<>() = print("\n")
//
(* ****** ****** *)
//
(*
#impltmp
g_print<token>(tok) =
print(tok.lctn(), ":", tok.node())
*)
//
in//local
(* ****** ****** *)
val opt =
p1_fun_test<d0eclist>
("./mytest.sats", p1_d0eclseq_sta)
val ( ) =
prerrln("p1_fun_test(\"mytest.sats\") =\n", opt)
(* ****** ****** *)
endloc (*local*) // end-of-(local)
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_TEST_JS_test10_parsing.dats] *)
