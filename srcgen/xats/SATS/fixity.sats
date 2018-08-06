(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
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
// Start Time: August, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#staload
LOC = "./location.sats"
//
  typedef loc_t = $LOC.loc_t
//
(* ****** ****** *)
//
datatype
assoc =
ASSOCnon | ASSOClft | ASSOCrgt
//
fun
print_assoc(assoc): void
fun
prerr_assoc(assoc): void
fun
fprint_assoc: fprint_type(assoc)
//
overload print with print_assoc
overload prerr with prerr_assoc
overload fprint with fprint_assoc
//
(* ****** ****** *)
//
// HX: precedence value
//
abstflat prcdv_tflat = int
//
  typedef prcdv = prcdv_tflat
//
(* ****** ****** *)
//
fun
prcdv2int: prcdv -> int
and
int2prcdv: int -> prcdv
//
fun
print_prcdv(prcdv): void
fun
prerr_prcdv(prcdv): void
fun
fprint_prcdv: fprint_type(prcdv)
//
overload print with print_prcdv
overload prerr with prerr_prcdv
overload fprint with fprint_prcdv
//
(* ****** ****** *)
//
fun
add_prcdv_int(prcdv, int): prcdv
and
sub_prcdv_int(prcdv, int): prcdv
//
overload + with add_prcdv_int
overload - with sub_prcdv_int
//
fun
compare_prcdv_prcdv: (prcdv, prcdv) -> int
//
overload compare with compare_prcdv_prcdv
//
(* ****** ****** *)
//
val
the_neginf_prcdv: prcdv // lowest precedence value
and
the_posinf_prcdv: prcdv // highest precedence value
//
(* ****** ****** *)
//
val app_prcdv : prcdv
//
val select_prcdv : prcdv
//
val exists_prcdv : prcdv
and forall_prcdv : prcdv
//
(* ****** ****** *)
//
val backslash_prcdv : prcdv
val infixtemp_prcdv : prcdv // for temp infix status
//
(* ****** ****** *)

(* end of [xats_fixity.sats] *)
