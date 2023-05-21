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
Wed 28 Dec 2022 04:11:12 PM EST
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
#staload "./../SATS/xbasics.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/trans2a.sats"
(* ****** ****** *)
#staload _ = "./statyp2_tmplib.dats"
(* ****** ****** *)
//
fun
s2typ_fun1
( f2cl
: f2clknd
, npf1: sint
, t2ps
: s2typlst, tres: s2typ): s2typ =
let
val s2t0 =
(
case f2cl of
|
F2CLfun() =>
the_sort2_tbox
|
F2CLclo(knd) =>
(
case+ knd of
| 0 => the_sort2_type
| 1 => the_sort2_vtbx
| _ => the_sort2_tbox))
val f2cl = s2typ_f2cl(f2cl)
in//let
s2typ_make_node
(s2t0, T2Pfun1(f2cl,npf1,t2ps,tres))
end (*let*) // end of [s2typ_fun1(...)]
//
(* ****** ****** *)

#implfun
s2typ_fun1_f2arglst
( f2as, f2cl, tres ) =
let
val
ndyn = f1_ndyn(f2as)
in//let
f0_f2as(f2as, ndyn, tres)
end where
{
//
fun
f0_f2as
( f2as
: f2arglst
, ndyn: sint
, tres: s2typ): s2typ =
(
case+ f2as of
|
list_nil() => tres
|
list_cons(f2a1, f2as) =>
(
case+
f2a1.node() of
|
F2ARGmet0 _ =>
f0_f2as(f2as, ndyn, tres)
|
F2ARGsta0
(s2vs, s2ps) =>
let
val s2t0 = tres.sort()
in//let
s2typ
(s2t0,T2Puni0(s2vs, tres))
end where
{
val
tres =
f0_f2as(f2as, ndyn, tres) }
|
F2ARGdyn0(npf1, d2ps) =>
(
s2typ_fun1
(f2cl,npf1,t2ps,tres)) where
{
val ndyn = ndyn - 1
val tres =
f0_f2as(f2as, ndyn, tres)
val t2ps =
s2typlst_of_d2patlst(d2ps)
val f2cl =
if
(ndyn <= 0)
then (f2cl) else F2CLclo(1) } )
)(*case+*)//end-of-[f0_f2as(f2as,...)]
//
and
f1_ndyn(xs: f2arglst): sint =
(
case+ xs of
|
list_nil() => 0
|
list_cons(x1, xs) =>
(
case+ x1.node() of
|F2ARGdyn0 _ =>
 f1_ndyn(xs) + 1 | _ => f1_ndyn(xs)))
//
}(*where*)//end-[s2typ_fun1_f2arglst]
//
(* ****** ****** *)
//
#implfun
s2typlst_of_d2patlst
( d2ps ) =
(
list_map<x0><y0>(d2ps)) where
{
#typedef x0 = d2pat
#typedef y0 = s2typ
#impltmp
map$fopr<x0><y0>(d2p) = d2p.styp()
}
// end of [s2typlst_of_d2patlst(d2ps)]
//
(* ****** ****** *)
//
#implfun
s2typlst_of_d2explst
( d2es ) =
(
list_map<x0><y0>(d2es)) where
{
#typedef x0 = d2exp
#typedef y0 = s2typ
#impltmp
map$fopr<x0><y0>(d2e) = d2e.styp()
}
// end of [s2typlst_of_d2explst(d2es)]
//
(* ****** ****** *)
//
#implfun
l2t2plst_of_l2d2plst
( ldps ) =
(
list_map<x0><y0>(ldps)) where
{
//
#typedef x0 = l2d2p
#typedef y0 = l2t2p
//
#impltmp
map$fopr<x0><y0>(ldp) =
S2LAB
(l0, d2p.styp()) where
{
  val+D2LAB(l0, d2p) = ldp } }
// end of [l2t2plst_of_l2d2plst(ldps)]
//
(* ****** ****** *)
//
#implfun
l2t2plst_of_l2d2elst
( ldes ) =
(
list_map<x0><y0>(ldes)) where
{
//
#typedef x0 = l2d2e
#typedef y0 = l2t2p
//
#impltmp
map$fopr<x0><y0>(lde) =
S2LAB
(l0, d2e.styp()) where
{
  val+D2LAB(l0, d2e) = lde } }
// end of [l2t2plst_of_l2d2elst(ldes)]
//
(* ****** ****** *)

local

(*
HX-2023-03-07:
[s2vts_make_lctn_tqas] is
implemented in [dynexp2_utils0.dats]
*)

in//local
//
#implfun
d2con2a_s2typ
(  loc0, dcon  ) =
(
case+ svts of
|
list_nil() => t2p0
|
list_cons _ =>
(
s2typ_subst0(t2p0, svts))
) where
{
//
val t2p0 = dcon.styp((*void*))
val t2qs = d2con_get_tqas(dcon)
//
val
svts = s2vts_make_lctn_tqas(loc0, t2qs) }
//(*where*) // end of [d2con2a_s2typ(...)]
//
#implfun
d2cst2a_s2typ
(  loc0, dcst  ) =
(
case+ svts of
|
list_nil() => t2p0
|
list_cons _ =>
(
s2typ_subst0(t2p0, svts))
) where
{
//
val t2p0 = dcst.styp((*void*))
val t2qs = d2cst_get_tqas(dcst)
//
val
svts = s2vts_make_lctn_tqas(loc0, t2qs)}
//(*where*) // end of [d2cst2a_s2typ(...)]
//
endloc//end-of[local(d2con2a/d2cst2a_s2typ)]

(* ****** ****** *)

#implfun
unify2a_s2typ
(env0, t2p1, t2p2) =
let
//
#vwtpdef e1nv = tr2aenv
//
#impltmp
s2typ_eval$s2cst
<e1nv>(env0,s2c0) =
s2cst_get_styp(s2c0)
#impltmp
s2typ_eval$s2var
<e1nv>(env0,s2v0) = optn_vt_nil()
//
(*
val () =
prerrln("unify2a_s2typ: t2p1 = ", t2p1)
val () =
prerrln("unify2a_s2typ: t2p2 = ", t2p2)
*)
//
in//let
unify00_s2typ_e1nv<e1nv>(env0, t2p1, t2p2)
end (*let*) // end of [unify2a_s2typ(env0,...)]

(* ****** ****** *)

#implfun
match2a_s2typ
(env0, t2p1, t2p2) =
let
//
#vwtpdef e1nv = tr2aenv
//
#impltmp
s2typ_eval$s2cst
<e1nv>(env0,s2c0) =
s2cst_get_styp(s2c0)
#impltmp
s2typ_eval$s2var
<e1nv>(env0,s2v0) = optn_vt_nil()
//
(*
val () =
prerrln("match2a_s2typ: t2p1 = ", t2p1)
val () =
prerrln("match2a_s2typ: t2p2 = ", t2p2)
*)
//
in//let
match00_s2typ_e1nv<e1nv>(env0, t2p1, t2p2)
end (*let*) // end of [match2a_s2typ(env0,...)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans2a_utils0.dats] *)
