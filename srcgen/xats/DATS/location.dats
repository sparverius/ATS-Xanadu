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
// Start Time: May, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

#staload
UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

#staload "./../SATS/location.sats"

(* ****** ****** *)

local

(* ****** ****** *)

absimpl
position_t0ype =
$extype_struct
"pats_position_struct" of
{
  ntot= int, nrow= int, ncol= int
} // end of [position_t0ype]

(* ****** ****** *)

in (* in-of-local *)

(* ****** ****** *)

implement position_get_ntot(pos) = pos.ntot
implement position_get_nrow(pos) = pos.nrow
implement position_get_ncol(pos) = pos.ncol

(* ****** ****** *)
//
implement
print_position
  (pos) = fprint_position(stdout_ref, pos)
implement
prerr_position
  (pos) = fprint_position(stderr_ref, pos)
//
(* ****** ****** *)

implement
fprint_position
  (out, pos) = let
//
val ntot = pos.ntot
val nrow = pos.nrow
val ncol = pos.ncol
//
in
//
$extfcall
(
  void
,
  "fprintf"
,
  out, "%li(line=%i, offs=%i)", @(ntot+1, nrow+1, ncol+1)
) (* end of [val] *)
//
end // end of [fprint_position]

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(* end of [xats_location.dats] *)
