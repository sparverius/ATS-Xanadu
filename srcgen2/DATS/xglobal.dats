(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2022 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
** Free Software Foundation; either version 3, or (at  your  option)  any
** later version.
** 
** ATS is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
** FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
** for more details.
** 
** You  should  have  received  a  copy of the GNU General Public License
** along  with  ATS;  see the  file COPYING.  If not, please write to the
** Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
** 02110-1301, USA.
*)

(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Sun 23 Oct 2022 01:09:31 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsafex.sats"
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/dynexp0.sats"
#staload "./../SATS/parsing.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
#staload "./../SATS/trans01.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/xglobal.sats"
(* ****** ****** *)

local
//
val
the_done =
a0ref_make_1val(0)
val
the_fixenv =
a0ref_make_1val
($UN.cast10{d1topenv}(0))
val
the_fixpath =
"./../../prelude/fixity0.sats"
//
in//local

#implfun
the_fixity_pvsload
  ((*void*)) =
let
val n0 =
the_done[]
val () =
(the_done[] := n0+1)
in//let
if
(n0 > 0)
then (0) else f0_pvsload()
end where
{
//
fun
f0_pvsload() =
let
//
val
dpar =
d0parsed_from_fpath
(0(*sta*), the_fixpath)
//
val
dpar =
d1parsed_from_trans(dpar)
in//let
the_fixenv[] := dpar.topenv(); (1)
end (*let*) // end of [f0_pvsload]
//
} (*where*) // [the_fixity_pvsload]

endloc // end of [the_fixity_pvsload]

(* ****** ****** *)

local

val
the_list =
a0ref_make_1val(list_nil())

in//local
//
#implfun
the_sortenv_toplst
  ((*void*)) = a0ref_get(the_list)
//
#implfun
the_sortenv_toplst_add0
  ( k0, x0 ) =
let
val kxs = a0ref_get(the_list)
in
a0ref_set
(the_list, list_cons(@(k0, x0), kxs))
end (*let*)//end-[the_sortenv_toplst_add0]
//
endloc // end of [local(the_sortenv_toplst)]

(* ****** ****** *)

local

val
the_list =
a0ref_make_1val(list_nil())

in//local
//
#implfun
the_sexpenv_toplst
  ((*void*)) = a0ref_get(the_list)
//
#implfun
the_sexpenv_toplst_add0
  ( k0, x0 ) =
let
val kxs = a0ref_get(the_list)
in
a0ref_set
(the_list, list_cons(@(k0, x0), kxs))
end (*let*)//end-[the_sexpenv_toplst_add0]
//
endloc // end of [local(the_sexpenv_toplst)]

(* ****** ****** *)

local

val
the_list =
a0ref_make_1val(list_nil())

in//local
//
#implfun
the_dexpenv_toplst
  ((*void*)) = a0ref_get(the_list)
//
#implfun
the_dexpenv_toplst_add0
  ( k0, x0 ) =
let
val kxs = a0ref_get(the_list)
in
a0ref_set
(the_list, list_cons(@(k0, x0), kxs))
end (*let*)//end-[the_dexpenv_toplst_add0]
//
endloc // end of [local(the_dexpenv_toplst)]

(* ****** ****** *)
#implfun
the_sortenv_toplst_print() =
the_sortenv_toplst_fprint(g_stdout())
#implfun
the_sortenv_toplst_prerr() =
the_sortenv_toplst_fprint(g_stderr())
(* ****** ****** *)
#implfun
the_sexpenv_toplst_print() =
the_sexpenv_toplst_fprint(g_stdout())
#implfun
the_sexpenv_toplst_prerr() =
the_sexpenv_toplst_fprint(g_stderr())
(* ****** ****** *)
#implfun
the_dexpenv_toplst_prerr() =
the_dexpenv_toplst_fprint(g_stderr())
#implfun
the_dexpenv_toplst_print() =
the_dexpenv_toplst_fprint(g_stdout())
(* ****** ****** *)
//
#implfun
the_sortenv_toplst_fprint
  (out) =
let
#impltmp
g_print$out<>() = out
val kxs = the_sortenv_toplst()
in//let
(
  loop(kxs)) where
{
fun loop
(kxs: list@(sym_t, s2tex)): void =
(
case+ kxs of
|
list_nil() => ()
|
list_cons(kx1, kxs) =>
(
  loop(kxs)) where
{
  val () = println
  ("the_sortenv_toplst:", "(", kx1.0, " -> ", kx1.1, ")")
}
)
} (*where*)//end-[loop(kxs)]
end (*let*)//end-[the_sortenv_toplst_fprint]
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_xglobal.dats] *)
