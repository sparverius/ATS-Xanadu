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
Fri 11 Nov 2022 03:23:24 PM EST
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/staexp2.sats"
(* ****** ****** *)
#staload "./../SATS/tread12.sats"
(* ****** ****** *)
//
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload node with s2exp_get_node
#symload sort with s2exp_get_sort
(* ****** ****** *)
//
(* ****** ****** *)
//
fun
sort2_errck
(lvl0: sint
,s2t0: sort2): sort2 =
(
  S2Terrck(lvl0, s2t0))
//
(* ****** ****** *)
//
fun
s2exp_errck
(lvl0: sint
,s2e0: s2exp): s2exp =
let
val s2t0 = s2e0.sort()
in//let
s2exp_make_node
(s2t0, S2Eerrck(lvl0, s2e0))
end (*let*)//end-of(s2exp_errck)
//
(* ****** ****** *)
//
fun
sort2_errvl_a1
(s2t0: sort2): sint =
(
case+ s2t0 of
|
S2Terrck
(lvl0, _) => lvl0 | _ => 0
)
#symload
sort2_errvl with sort2_errvl_a1
#symload errvl with sort2_errvl_a1
//
(* ****** ****** *)
//
fun
sort2_errvl_a2
(s2t1: sort2
,s2t2: sort2): sint =
gmax
(errvl(s2t1),errvl(s2t2))
#symload
sort2_errvl with sort2_errvl_a2
#symload errvl with sort2_errvl_a2
//
(* ****** ****** *)
//
fun
sort2_errvl_opt
( opt0
: sort2opt): sint =
(
case+ opt0 of
|
optn_nil((*nil*)) => 0
|
optn_cons(s2t1) => errvl(s2t1)
endcas // end of [ case+(opt0) ]
)
//
#symload
sort2_errvl with sort2_errvl_opt
#symload errvl with sort2_errvl_opt
//
(* ****** ****** *)
//
#extern
fun
sort2_errvl_lst
(s2ts: sort2lst): sint
//
#implfun
sort2_errvl_lst
(  s2ts  ) =
(
case+ s2ts of
|
list_nil((*nil*)) => 0
|
list_cons(s2t1,s2ts) =>
gmax
(
errvl(s2t1),sort2_errvl_lst(s2ts))
endcas // end of [ case+( s2ts ) ]
)
//
#symload
sort2_errvl with sort2_errvl_lst
#symload errvl with sort2_errvl_lst
//
(* ****** ****** *)
//
fun
sort2_fun1_errck
( s2ts
: sort2lst
, s2t1: sort2): sort2 =
let
val lvl0 =
gmax(errvl(s2ts), errvl(s2t1))
in//let
sort2_errck(lvl0+1,S2Tfun1(s2ts, s2t1))
endlet // end of [sort2_a2pp_errck(...)]
//
(* ****** ****** *)
//
#implfun
tread12_sort2
( s2t0, err ) =
(
case+ s2t0 of
//
(*
|S2Tid0 _ => s2t0
|S2Tint _ => s2t0
*)
//
|S2Tbas _ => s2t0
//
(*
|S2Ttup _ => s2t0
*)
//
(*
|S2Tfun0 _ => s2t0
*)
|
S2Tfun1(s2ts, s2t1) =>
let
val e00 = err
val
s2ts =
tread12_sort2lst(s2ts, err)
val
s2t1 = tread12_sort2(s2t1, err)
in//let
if
(e00=err)
then (s2t0)
else (sort2_fun1_errck(s2ts, s2t1))
end (*let*) // end of [S2Tfun1(...)]
//
(*
|S2Tapps _ => s2t0
*)
//
(*
|S2Tnone0 _ => s2t0
|S2Tnone1 _ => s2t0
*)
//
| _(*otherwise*) =>
let
val lvl0 = 1
in//let
(
err := err+1; sort2_errck(lvl0,s2t0))
endlet // end of [ _(* otherwise *) ]
//
) where // end-of-[(*case+(s2t0)-of*)]
{
(*
val (  ) =
prerrln("tread12_sort2: s2t0 = ", s2t0)
*)
} (*where*)//end[tread12_sort2(s2t0,err)]
//
(* ****** ****** *)
//
(* ****** ****** *)
//
fun
s2exp_errvl_a1
(s2e0: s2exp): sint =
(
case+ s2e0.node() of
|
S2Eerrck
(lvl0, _) => lvl0 | _ => 0
)
#symload
s2exp_errvl with s2exp_errvl_a1
#symload errvl with s2exp_errvl_a1
//
(* ****** ****** *)
//
fun
s2exp_errvl_a2
(s2e1: s2exp
,s2e2: s2exp): sint =
gmax
(errvl(s2e1),errvl(s2e2))
#symload
s2exp_errvl with s2exp_errvl_a2
#symload errvl with s2exp_errvl_a2
//
(* ****** ****** *)
//
#extern
fun
s2exp_errvl_lst
(s2es: s2explst): sint
//
#implfun
s2exp_errvl_lst
  (  s2es  ) =
(
case+ s2es of
|
list_nil((*nil*)) => 0
|
list_cons(s2e1,s2es) =>
(
gmax
(
errvl(s2e1),s2exp_errvl_lst(s2es)))
endcas // end of [ case+(s2es)-of ]
)
//
#symload errvl with s2exp_errvl_lst
//
(* ****** ****** *)
//
#extern
fun
l2s2e_errvl_lses
(lses: l2s2elst): sint
//
#implfun
l2s2e_errvl_lses
  (   lses   ) =
(
case+ lses of
|
list_nil((*nil*)) => 0
|
list_cons(ls2e,lses) =>
let
val+
S2LAB(lab, s2e1) = ls2e in
gmax
( errvl(s2e1)
, l2s2e_errvl_lses(lses)) end
endcas // end of [ case+(lses)-of ]
)
//
#symload errvl with l2s2e_errvl_lses
//
(* ****** ****** *)
//
fun
s2exp_top0_errck
(s2t0: sort2
,s2e1: s2exp): s2exp =
let
val lvl0 = errvl(s2e1) in
s2exp_errck
(lvl0+1, s2exp(s2t0, S2Etop0(s2e1)))
end (*let*) // end of [s2exp_top0_errck]
//
fun
s2exp_topz_errck
(s2t0: sort2
,s2e1: s2exp): s2exp =
let
val lvl0 = errvl(s2e1) in
s2exp_errck
(lvl0+1, s2exp(s2t0, S2Etopz(s2e1)))
end (*let*) // end of [s2exp_topz_errck]
//
(* ****** ****** *)
fun
s2exp_apps_errck
(s2t0: sort2
,s2f0: s2exp
,s2es: s2explst): s2exp =
let
val lvl0 =
gmax(errvl(s2f0), errvl(s2es))
in//let
s2exp_errck
(lvl0+1,s2exp(s2t0,S2Eapps(s2f0,s2es)))
endlet // end of [s2exp_apps_errck(...)]
(* ****** ****** *)
//
#implfun
tread12_s2exp
( s2e0, err ) =
(
case+
s2e0.node() of
//
(*
|S2Eid0 _ => s2e0
*)
//
|S2Eint _ => s2e0
|S2Echr _ => s2e0
|S2Eflt _ => s2e0
|S2Estr _ => s2e0
//
|S2Ecst _ => s2e0
|S2Evar _ => s2e0
//
|S2Eany _ => s2e0
//
|S2Etop0 _ => f0_top0(s2e0, err)
|S2Etopz _ => f0_topz(s2e0, err)
//
|S2Eapps _ => f0_apps(s2e0, err)
//
| _(*otherwise*) =>
let
val lvl0 = 1
in//let
(
err := err+1; s2exp_errck(lvl0,s2e0))
endlet // end of [ _(* otherwise *) ]
) where // end-of-[(*case+(s2e0)-of*)]
{
//
fun
f0_top0
( s2e: s2exp
, err: &sint >> _): s2exp =
let
//
val e00 = err
//
val-
S2Etop0(s2e1) = s2e.node()
//
val
s2e1 = tread12_s2exp(s2e1, err)
//
in//let
if
(e00 = err)
then (s2e0) else
let
val s2t0 = s2e0.sort() in
s2exp_top0_errck(s2t0, s2e1) end
end (*let*) // end of [ f0_top0(s2e,err) ]
//
fun
f0_topz
( s2e: s2exp
, err: &sint >> _): s2exp =
let
//
val e00 = err
//
val-
S2Etopz(s2e1) = s2e.node()
//
val
s2e1 = tread12_s2exp(s2e1, err)
//
in//let
if
(e00 = err)
then (s2e0) else
let
val s2t0 = s2e0.sort() in
s2exp_topz_errck(s2t0, s2e1) end
end (*let*) // end of [ f0_topz(s2e,err) ]
//
fun
f0_apps
( s2e: s2exp
, err: &sint >> _): s2exp =
let
//
val e00 = err
//
val-
S2Eapps
(s2f0, s2es) = s2e.node()
//
val
s2f0 =
tread12_s2exp(s2f0, err)
val s2es =
tread12_s2explst(s2es, err)
//
in//let
if
(e00 = err)
then (s2e0) else
let
val s2t0 = s2e0.sort() in
s2exp_apps_errck(s2t0, s2f0, s2es)
end (*let*) // else // end-of-(if)
end (*let*) // end of [ f0_apps(s2e,err) ]
//
(*
val (  ) =
prerrln("tread12_s2exp: s2e0 = ", s2e0)
*)
//
} (*where*)//end[tread12_s2exp(s2e0,err)]
//
(* ****** ****** *)
//
(* ****** ****** *)
//
#implfun
tread12_sort2lst
  (  s2ts, err  ) =
list_tread12_fnp(s2ts, err, tread12_sort2)
//
#implfun
tread12_sort2opt
  (  s2ts, err  ) =
optn_tread12_fnp(s2ts, err, tread12_sort2)
//
(* ****** ****** *)
//
#implfun
tread12_s2explst
  (  s2es, err  ) =
list_tread12_fnp(s2es, err, tread12_s2exp)
//
(* ****** ****** *)
//
#implfun
tread12_l2s2elst
  (  lses, err  ) =
list_tread12_fnp(lses, err, tread12_l2s2e)
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_tread12_staexp.dats] *)
