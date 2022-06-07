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
Start Time: May 28th, 2022
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#staload "./../SATS/xbasics.sats"
(* ****** ****** *)

#extern
fun
gint_lnot_uint(u0:uint): uint
#extern
fun
gint_ldsj_uint(u1:uint, u2:uint): uint
#extern
fun
gint_lcnj_uint
(u1:uint, u2:uint): uint = $extnam()

// #symload & with gint_lcnj_uint
#symload lcnj with gint_lcnj_uint
#symload ldsj with gint_ldsj_uint

(* ****** ****** *)

#implfun
sortbox(knd) =
g0u2s
(g0s2u(knd) \land g0s2u(1))

(*
implement
sortlin(knd) =
g0u2s
(lcnj(g0s2u(knd)>>1, g0s2u(1)))

implement
sortprf(knd) =
g0u2s
(lcnj(g0s2u(knd)>>2, g0s2u(1)))

implement
sortpol(knd) =
let
val knd = (knd >> 3)
in//let
  if knd <= 1 then knd else (-1)
end // end of [sortpol]
*)

(* ****** ****** *)

(* end of [ATS3/XATSOPT_xbasics.dats] *)
