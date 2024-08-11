(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
Sun 11 Aug 2024 12:59:19 PM EDT
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#abstbox
a0rf_vt_tx(a:vt) // 0-dim
#absvtbx
a0rf_vt_vx(a:vt) // 0-dim
//
#typedef
a0rf(a0:vt) = a0rf_vt_tx(a0)
//
#vwtpdef
a0pt(a0:vt) = a0rf_vt_vx(a0)
#vwtpdef
a0rf_vt(a0:vt) = a0rf_vt_vx(a0)
//
(* ****** ****** *)
(* ****** ****** *)
//
#abstbox
a1rf_vt_i0_tx(a:vt,n:i0)//1-dim
#abstbox
a1rf_vt_i0_vt(a:vt,n:i0)//1-dim
//
#typedef
a1rf(a:vt,n:i0) = a1rf_vt_i0_tx(a,n)
//
#vwtpdef
a1pt(a:vt,n:i0) = a1rf_vt_i0_vt(a,n)
#vwtpdef
a1rf_vt(a:vt,n:i0) = a1rf_vt_i0_vt(a,n)
//
(* ****** ****** *)
(* ****** ****** *)
//
#abstbox
a2rf_vt_i0_i0_tx(a:vt,m:i0,n:i0)//2-dim
#abstbox
a2rf_vt_i0_i0_vt(a:vt,m:i0,n:i0)//2-dim
//
#typedef
a2rf(a:vt,m:i0,n:i0) = a2rf_vt_i0_i0_tx(a,m,n)
//
#vwtpdef
a2pt(a:vt,m:i0,n:i0) = a2rf_vt_i0_i0_vt(a,m,n)
#vwtpdef
a2rf_vt(a:vt,m:i0,n:i0) = a2rf_vt_i0_i0_vt(a,m,n)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
a0rf_make_1val
  (elem: a): a0rf(a)
//
#symload
a0rf with a0rf_make_1val of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:t0>
a0rf_get(A: a0rf(a)): (a)
fun
<a:t0>
a0rf_set(A: a0rf(a), x: a): void
//
#symload [] with a0rf_get of 1000
#symload [] with a0rf_set of 1000
#symload get with a0rf_get of 1000
#symload set with a0rf_set of 1000
//
(* ****** ****** *)
//
fun
<a:vt>
a0rf_cget(A: a0rf(a)): (a)
fun
<a:vt>
a0rf_setf(A: a0rf(a), x: a): void
//
#symload cget with a0rf_cget of 1000
#symload setf with a0rf_setf of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_axrf000.sats] *)
