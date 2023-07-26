(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2023 Hongwei Xi, ATS Trustful Software, Inc.
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
Tue 25 Jul 2023 05:33:23 PM EDT
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
#staload
_(*TRANS3a*) = "./trans3a.dats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/trans3a.sats"
(* ****** ****** *)
#symload tqas with d2cst_get_tqas
(* ****** ****** *)
#symload lctn with dimpl_get_lctn
#symload node with dimpl_get_node
(* ****** ****** *)
#symload lctn with d3ecl_get_lctn
#symload node with d3ecl_get_node
(* ****** ****** *)
//
fun
d3ecl_tmplocal
( tmps
: d3eclist
, dtmp: d3ecl): d3ecl =
let
val
loc0 = dtmp.lctn() in//let
d3ecl_make_node
(loc0, D3Ctmplocal(dtmp, tmps))
end (*let*) // end-of-[d3ecl_tmplocal]
//
(* ****** ****** *)

#implfun
trans3a_d3ecl
( env0, d3cl ) = let
//
// (*
val
loc0 = d3cl.lctn()
val () =
prerrln
("trans3a_d3ecl: loc0 = ", loc0)
val () =
prerrln
("trans3a_d3ecl: d3cl = ", d3cl)
// *)
//
in//let
//
case+
d3cl.node() of
//
|D3Cnone0 _ => d3cl
|D3Cd2ecl _ => d3cl
|D3Cerrck _ => d3cl
//
|D3Clocal0 _ =>
(
f0_local0(env0, d3cl))
//
| _(*otherwise*) =>
let
  val loc0 = d3cl.lctn()
in//let
  d3ecl_make_node(loc0, D3Cnone2( d3cl ))
end (*let*) // end of [_(*otherwise*)] // temp
//
end where
{
//
fun
f0_local0
( env0
: !tr3aenv
, d3cl: d3ecl): d3ecl =
let
//
val
loc0 = d3cl.lctn()
val-
D3Clocal0
(head, body) = d3cl.node()
//
val
head =
trans3a_d3eclist(env0, head)
val
body =
trans3a_d3eclist(env0, head)
//
in//let
let
//
val tmps =
(
list_filter(head)
)
where {
#typedef x0 = d3ecl
#impltmp
filter$test<x0> = d3ecl_impltmpq
}(*where*) // end of [val(tmps)]
//
val body =
if
list_nilq(tmps)
then body else
(
  list_map(body) ) where
{
//
#typedef x0 = d3ecl//map<x0><y0>
#typedef y0 = d3ecl//map<x0><y0>
//
#impltmp
map$fopr<x0><y0>(x0) =
(
  if
  d3ecl_impltmpq(x0)
  then
  d3ecl_tmplocal(tmps, x0) else x0)
}
//
in//let
  d3ecl(loc0, D3Clocal0(head, body))
end(*let*)
end(*let*)//end-of-[f0_local0(env0,d3cl)]
//
}(*where*)//end of [trans3a_d3ecl(env0,d3cl)]

(* ****** ****** *)
//
#implfun
trans3a_d3eclist
  (env0, dcls) =
(
  list_trans3a_fnp(env0, dcls, trans3a_d3ecl))
//
(* ****** ****** *)
//
#implfun
trans3a_d3eclistopt
  (env0, dopt) =
(
  optn_trans3a_fnp(env0, dopt, trans3a_d3eclist))
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans3a_decl00.dats] *)
