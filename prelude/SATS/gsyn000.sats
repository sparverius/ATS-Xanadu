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
//
(*
Author: Hongwei Xi
(*
Sat 27 Jul 2024 01:25:30 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#typedef ni = nint
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
gs_free_a1(x0): void
fun
<x0:vt>
<x1:vt>
gs_free_a2(x0, x1): void
fun
<x0:vt>
<x1:vt>
<x2:vt>
gs_free_a3(x0, x1, x2): void
fun
<x0:vt>
<x1:vt>
<x2:vt>
<x3:vt>
gs_free_a4(x0, x1, x2, x3): void
fun
<x0:vt>
<x1:vt>
<x2:vt>
<x3:vt>
<x4:vt>
gs_free_a5(x0, x1, x2, x3, x4): void
fun
<x0:vt>
<x1:vt>
<x2:vt>
<x3:vt>
<x4:vt>
<x5:vt>
gs_free_a6(x0, x1, x2, x3, x4, x5): void
fun
<x0:vt>
<x1:vt>
<x2:vt>
<x3:vt>
<x4:vt>
<x5:vt>
<x6:vt>
gs_free_a7(x0, x1, x2, x3, x4, x5, x6): void
fun
<x0:vt>
<x1:vt>
<x2:vt>
<x3:vt>
<x4:vt>
<x5:vt>
<x6:vt>
<x7:vt>
gs_free_a8(x0, x1, x2, x3, x4, x5, x6, x7): void
fun
<x0:vt>
<x1:vt>
<x2:vt>
<x3:vt>
<x4:vt>
<x5:vt>
<x6:vt>
<x7:vt>
<x8:vt>
gs_free_a9(x0, x1, x2, x3, x4, x5, x6, x7, x8): void
fun
<x0:vt>
<x1:vt>
<x2:vt>
<x3:vt>
<x4:vt>
<x5:vt>
<x6:vt>
<x7:vt>
<x8:vt>
<x9:vt>
gs_free_a10(x0, x1, x2, x3, x4, x5, x6, x7, x8, x9): void
fun
<x0:vt>
<x1:vt>
<x2:vt>
<x3:vt>
<x4:vt>
<x5:vt>
<x6:vt>
<x7:vt>
<x8:vt>
<x9:vt>
<x10:vt>
gs_free_a11(x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10): void
fun
<x0:vt>
<x1:vt>
<x2:vt>
<x3:vt>
<x4:vt>
<x5:vt>
<x6:vt>
<x7:vt>
<x8:vt>
<x9:vt>
<x10:vt>
<x11:vt>
gs_free_a12(x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11): void
//
#symload frees with gs_free_a1
#symload frees with gs_free_a2
#symload frees with gs_free_a3
#symload frees with gs_free_a4
#symload frees with gs_free_a5
#symload frees with gs_free_a6
#symload frees with gs_free_a7
#symload frees with gs_free_a8
#symload frees with gs_free_a9
#symload frees with gs_free_a10
#symload frees with gs_free_a11
#symload frees with gs_free_a12
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<(*tmp*)>
gs_print$beg(): void
fun
<(*tmp*)>
gs_print$end(): void
(* ****** ****** *)
//
fun
<x0:t0>
gs_print_a1(x0): void
fun
<x0:t0>
<x1:t0>
gs_print_a2(x0, x1): void
fun
<x0:t0>
<x1:t0>
<x2:t0>
gs_print_a3(x0, x1, x2): void
fun
<x0:t0>
<x1:t0>
<x2:t0>
<x3:t0>
gs_print_a4(x0, x1, x2, x3): void
fun
<x0:t0>
<x1:t0>
<x2:t0>
<x3:t0>
<x4:t0>
gs_print_a5(x0, x1, x2, x3, x4): void
fun
<x0:t0>
<x1:t0>
<x2:t0>
<x3:t0>
<x4:t0>
<x5:t0>
gs_print_a6(x0, x1, x2, x3, x4, x5): void
fun
<x0:t0>
<x1:t0>
<x2:t0>
<x3:t0>
<x4:t0>
<x5:t0>
<x6:t0>
gs_print_a7(x0, x1, x2, x3, x4, x5, x6): void
fun
<x0:t0>
<x1:t0>
<x2:t0>
<x3:t0>
<x4:t0>
<x5:t0>
<x6:t0>
<x7:t0>
gs_print_a8(x0, x1, x2, x3, x4, x5, x6, x7): void
fun
<x0:t0>
<x1:t0>
<x2:t0>
<x3:t0>
<x4:t0>
<x5:t0>
<x6:t0>
<x7:t0>
<x8:t0>
gs_print_a9(x0, x1, x2, x3, x4, x5, x6, x7, x8): void
fun
<x0:t0>
<x1:t0>
<x2:t0>
<x3:t0>
<x4:t0>
<x5:t0>
<x6:t0>
<x7:t0>
<x8:t0>
<x9:t0>
gs_print_a10(x0, x1, x2, x3, x4, x5, x6, x7, x8, x9): void
fun
<x0:t0>
<x1:t0>
<x2:t0>
<x3:t0>
<x4:t0>
<x5:t0>
<x6:t0>
<x7:t0>
<x8:t0>
<x9:t0>
<x10:t0>
gs_print_a11(x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10): void
fun
<x0:t0>
<x1:t0>
<x2:t0>
<x3:t0>
<x4:t0>
<x5:t0>
<x6:t0>
<x7:t0>
<x8:t0>
<x9:t0>
<x10:t0>
<x11:t0>
gs_print_a12(x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11): void
//
#symload prints with gs_print_a1
#symload prints with gs_print_a2
#symload prints with gs_print_a3
#symload prints with gs_print_a4
#symload prints with gs_print_a5
#symload prints with gs_print_a6
#symload prints with gs_print_a7
#symload prints with gs_print_a8
#symload prints with gs_print_a9
#symload prints with gs_print_a10
#symload prints with gs_print_a11
#symload prints with gs_print_a12
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_gsyn000.sats] *)
