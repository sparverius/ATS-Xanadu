(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2018 Hongwei Xi, ATS Trustful Software, Inc.
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
// Author: Hongwei Xi
// Start Time: August, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

#staload "./../SATS/basics.sats"

(* ****** ****** *)

#staload "./../SATS/symbol.sats"

(* ****** ****** *)

#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"

(* ****** ****** *)

#staload "./../SATS/dynexp3.sats"

(* ****** ****** *)

#staload "./../SATS/trans23.sats"

(* ****** ****** *)
//
(*
implement
t2ype_of_d2pat
  (d2p0) =
(
s2exp_erase(s2exp_of_d2pat(d2p0))
)
//
implement
t2ypelst_of_d2patlst
  (d2ps) =
list_vt2t(d2ps) where
{
val
d2ps =
list_map<d2pat><t2ype>
  (d2ps) where
{
implement
list_map$fopr<d2pat><t2ype> = t2ype_of_d2pat
}
} (* end of [t2ypelst_of_d2patlst] *)
*)
//
(* ****** ****** *)

implement
t2xtv_occurs
(xtv0, t2p0) =
(auxt2p(t2p0)) where
{
//
fun
auxt2p
(t2p0: t2ype): bool = (
//
case+
t2p0.node() of
//
| T2Pbas _ => false
//
| T2Pcst _ => false
| T2Pvar _ => false
//
| T2Pnone0 _ => false
| T2Pnone1 _ => false
//
| T2Pxtv(xtv1) =>
  if
  (xtv0 = xtv1)
  then true else auxt2p(xtv1.type())
//
| T2Pfun
  (fcr, npf, t2ps, t2p1) =>
  if
  auxt2p(t2p1)
  then true else auxt2ps(t2ps)
//
| T2Pexi(s2vs, t2p1) => auxt2p(t2p1)
| T2Puni(s2vs, t2p1) => auxt2p(t2p1)
//
| T2Ptyrec
  (knd, npf, lt2ps) => auxlt2ps(lt2ps)
//
) (* end of [auxt2p] *)
and
auxt2ps
(t2ps: t2ypelst): bool =
(
case+ t2ps of
| list_nil() => false
| list_cons(t2p0, t2ps) =>
  if auxt2p(t2p0) then true else auxt2ps(t2ps)
)
//
and
auxlt2p
(lt2p: labt2ype): bool =
let
  val+TLABELED(lab, t2p) = lt2p in auxt2p(t2p)
end
and
auxlt2ps
(lt2ps: labt2ypelst): bool =
(
case+ lt2ps of
| list_nil() => true
| list_cons(lt2p, lt2ps) =>
  if auxlt2p(lt2p) then true else auxlt2ps(lt2ps)
)
//
} (* end of [t2xtv_occurs] *)

(* ****** ****** *)

implement
ulte_t2ype_t2ype
(loc0, t2p1, t2p2) =
(
let
//
val
t2p1 = t2p1.eval()
and
t2p2 = t2p2.eval()
//
val () =
println!("ulte: t2p1 = ", t2p1)
val () =
println!("ulte: t2p2 = ", t2p2)
//
in (* in-of-let *)
case+
t2p1.node() of
| T2Pxtv(xtv1) =>
  auxtv1(xtv1, t2p2)
| _ (* else *) =>
  (
  case+
  t2p2.node() of
  | T2Pxtv(xtv2) =>
    auxtv2(t2p1, xtv2)
  | _ (* else *) => auxtp0(t2p1, t2p2)
  )
end where
{
//
fun
auxtp0
( t2p1: t2ype
, t2p2: t2ype): bool =
(
case+
t2p1.node() of
| T2Pbas(nam1) =>
  (
  case+
  t2p2.node() of
  | T2Pbas(nam2) =>
    (nam1 = nam2)
  | _ (* else *) => false
  )
| T2Pcst(s2c1) =>
  (
  case+
  t2p2.node() of
  | T2Pcst(s2c2) =>
    (s2c1 = s2c2)
  | _ (* else *) => false
  )
| T2Pvar(s2v1) =>
  (
  case+
  t2p2.node() of
  | T2Pvar(s2v2) =>
    (s2v1 = s2v2)
  | _ (* else *) => false
  )
| T2Pfun
  (fcr1, npf1, arg1, res1) =>
  (
  case+
  t2p2.node() of
  | T2Pfun
    (fcr2, npf2, arg2, res2) =>
    let
      val
      tfcr = true
      val
      tnpf = (npf1 = npf2)
      val
      targ = ulte(loc0, arg2, arg1)
      val
      tres = ulte(loc0, res1, res2)
    in
      (tfcr && (tnpf && (targ && tres)))
    end
  | _ (* else *) => false  
  )
| _ (* else *) => false
)
//
fun
auxtv1
( xtv1: t2xtv
, t2p2: t2ype): bool =
(
case+
t2p2.node() of
| T2Pxtv(xtv2) => true where
  {
    val () =
    if xtv1 = xtv2
      then () else xtv1.type(t2p2)
    // end of [if]
  }
| _ (* else *) =>
  let
    val occurs =
    t2xtv_occurs(xtv1, t2p2) 
    val ((*void*)) =
    println!
    ("auxtv1: occurs = ", occurs)
  in
    if occurs then false else
    let
      val () = xtv1.type(t2p2) in true
    end
  end
)
//
fun
auxtv2
( t2p1: t2ype
, xtv2: t2xtv): bool =
  let
    val occurs =
    t2xtv_occurs(xtv2, t2p1) 
    val ((*void*)) =
    println!
    ("auxtv2: occurs = ", occurs)
  in
    if occurs then false else
    let
      val () = xtv2.type(t2p1) in true
    end
  end
//
} (* end of [where] *)
) (* end of [ulte_t2ype_t2ype] *)

(* ****** ****** *)

implement
ulte_t2ypelst_t2ypelst
  (loc0, t2ps1, t2ps2) =
(
case+ t2ps1 of
| list_nil() =>
  (
  case+ t2ps2 of
  | list_nil() => true
  | list_cons _ => false
  )
| list_cons(t2p1, t2ps1) =>
  (
  case+ t2ps2 of
  | list_nil() => false
  | list_cons(t2p2, t2ps2) =>
    let
      val
      test1 =
      ulte(loc0, t2p1, t2p2)
      val
      test2 =
      ulte(loc0, t2ps1, t2ps2)
    in
      if test1 then test2 else false
    end
  )
) (* end of [ulte_t2ypelst_t2ypelst] *)

(* ****** ****** *)

implement
d3exp_dn
(d3e0, t2p0) = let
//
val test =
ulte(d3e0.loc(), d3e0.type(), t2p0)
//
in
//
if test then d3e0 else d3exp_cast(d3e0, t2p0)
//
end // end of [d3exp_dn]

(* ****** ****** *)

implement
d3explst_dn
(loc0, d3es, t2ps) = let
//
fun
auxt2ps
( t2ps
: t2ypelst
)
: d3explst =
(
case+ t2ps of
| list_nil() =>
  list_nil()
| list_cons(t2p0, t2ps) =>
  let
    val d3e0 =
    d3exp_none0_1(loc0, t2p0)
  in
    list_cons(d3e0, auxt2ps(t2ps))
  end
)
fun
auxd3es
( d3es
: d3explst
)
: d3explst =
(
case+ d3es of
| list_nil() =>
  list_nil()
| list_cons(d3e0, d3es) =>
  let
    val d3e0 =
    d3exp_none2_0(d3e0)
  in
    list_cons(d3e0, auxd3es(d3es))
  end
)
//
in (* in-of-let *)
//
case+ d3es of
| list_nil() => auxt2ps(t2ps)
| list_cons _ =>
  (
  case+ t2ps of
  | list_nil() => auxd3es(d3es)
  | list_cons _ =>
    let
      val+
      list_cons
      (d3e0, d3es) = d3es
      val+
      list_cons
      (t2p0, t2ps) = t2ps
      val
      d3e0 = d3exp_dn(d3e0, t2p0)
    in
      list_cons(d3e0, auxd3es(d3es))
    end
  )
//
end (* end of [d3explst_dn] *)

(* ****** ****** *)

implement
d3exp_dapp_up
( loc0
, d3f0, npf0, d3es) =
let
//
val
targ =
d3explst_get_type(d3es)
//
val tres = t2ype_new(loc0)
//
val tfun =
t2ype_fun0(npf0, targ, tres)
//
val d3f0 = d3exp_dn(d3f0, tfun)
//
in
//
d3exp_make_node
(loc0, tres, D3Edapp(d3f0, npf0, d3es))
//
end // end of [d3exp_dapp_up]

(* ****** ****** *)

implement
d3exp_if0_up
( loc0
, d3e1, d3e2, opt3) =
let
//
val d3e1 =
d3exp_dn
(d3e1, the_t2ype_bool)
val tres =
(
case+ opt3 of
| None _ => the_t2ype_void
| Some _ => t2ype_new(loc0)
) : t2ype // end of [val]
//
val d3e2 =
d3exp_dn(d3e2, tres)
val opt3 =
(
case+ opt3 of
| None() => None()
| Some(d3e3) =>
  Some(d3exp_dn(d3e3, tres))
) : d3expopt // end of [val]
//
in
  d3exp_make_node
  (loc0, tres, D3Eif0(d3e1, d3e2, opt3))
end // end of [d3exp_if0_up]

(* ****** ****** *)

(* end of [trans23_util0.dats] *)
