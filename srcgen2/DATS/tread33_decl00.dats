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
Wed 26 Jul 2023 03:03:23 PM EDT
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
#staload "./../SATS/dynexp1.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/tread33.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with d3ecl_get_lctn
#symload node with d3ecl_get_node
(* ****** ****** *)
#symload lctn with d3valdcl_get_lctn
#symload lctn with d3vardcl_get_lctn
#symload lctn with d3fundcl_get_lctn
(* ****** ****** *)
//
fun
d3ecl_errck
(lvl0: sint
,d3cl: d3ecl): d3ecl =
let
val loc0 = d3cl.lctn()
in//let
d3ecl_make_node
(loc0, D3Cerrck(lvl0, d3cl))
end (*let*) // end-of(d3ecl_errck)
//
(* ****** ****** *)
//
#implfun
tread33_d3ecl
  (d3cl, err) =
(
case+
d3cl.node() of
//
|D3Cnone0 _ => d3cl
|D3Cd2ecl _ => d3cl
|D3Cerrck _ => d3cl
//
|
_(*otherwise*) =>
let
val lvl0 = 1
in//let
(err := err+1; d3ecl_errck(lvl0, d3cl))
endlet // end of [  _(* otherwise *)  ]
//
) where// end of [ case+(d3cl.node()) ]
{
(* ****** ****** *)
val (  ) =
prerrln("tread33_d3ecl: d3cl = ", d3cl)
(* ****** ****** *)
} (*where*) // end of [tread33_d3ecl(d3cl,err)]

(* ****** ****** *)
//
#implfun
tread33_d3eclist
  (  dcls, err  ) =
list_tread33_fnp(dcls, err, tread33_d3ecl)
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_tread33_decl00.dats] *)
