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
Sat 01 Oct 2022 01:51:01 PM EDT
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
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
(* ****** ****** *)

#implfun
sort2_intq(s2t0) =
(
case+ s2t0 of
| S2Tbas(tbas) =>
(
case+ tbas of
| T2Bpre(name) =>
  (name = INT_symbl)
| _ (* non-T2Bpre *) => false
) // end of [S2RTbas]
| _ (* non-S2Tbas *) => false
) (* case+ *) // end of [sort2_intq]

(* ****** ****** *)

#implfun
sort2_addrq(s2t0) =
(
case+ s2t0 of
| S2Tbas(tbas) =>
(
case+ tbas of
| T2Bpre(name) =>
  (name = ADDR_symbl)
| _ (* non-T2Bpre *) => false
) // end of [S2RTbas]
| _ (* non-S2Tbas *) => false
) (* case+ *) // end of [sort2_addrq]

(* ****** ****** *)

#implfun
sort2_boolq(s2t0) =
(
case+ s2t0 of
| S2Tbas(tbas) =>
(
case+ tbas of
| T2Bpre(name) =>
  (name = BOOL_symbl)
| _ (* non-T2Bpre *) => false
) // end of [S2RTbas]
| _ (* non-S2Tbas *) => false
) (* case+ *) // end of [sort2_boolq]

(* ****** ****** *)

#implfun
sort2_charq(s2t0) =
(
case+ s2t0 of
| S2Tbas(tbas) =>
(
case+ tbas of
| T2Bpre(name) =>
  (name = CHAR_symbl)
| _ (* non-T2Bpre *) => false
) // end of [S2RTbas]
| _ (* non-S2Tbas *) => false
) (* case+ *) // end of [sort2_charq]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_staexp2_utils1.dats] *)
