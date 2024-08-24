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
Mon 05 Aug 2024 10:10:05 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-05:
Mon 05 Aug 2024 10:17:21 PM EDT
ATS3 amply enables programmers to
implement debugging support from the
"outside"; the point to be stressed here
is that these programmers are not supposed
to have any direct access to the internals
of the ATS3/Xanadu implemnetation!
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#abstype
type_vw_t0(a:vw) <= unit
#sexpdef type = type_vw_t0
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
g_type
{t0:t0}(x0: t0): type(t0)
fun<>
g_vwtp
{vt:vt}(x0: !vt): type(vt)
fun<>
g_prop
{pf:pf}(x0: pf|): type(pf)
fun<>
g_view
{vw:vw}(x0: !vw|): type(vw)
//
#symload type with g_type of 0100
#symload vwtp with g_vwtp of 0100
#symload prop with g_prop of 0100
#symload view with g_view of 0100
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-06:
These are the Number~1
functions for debugging
*)
//
fun
<vt:vt>
g_debug( x0:vt ): ( vt )
//
fun
<vw:vw>
g_psort((*void*)): ( void )
fun
<vw:vw>
g_ptype((*void*)): ( void )
//
(* ****** ****** *)
//
#symload debug with g_debug of 0100
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-24:
Sat 24 Aug 2024 06:29:26 PM EDT
*)
//
#typedef
f0un(r0:vt) = () -> r0
//
#typedef
f1un
(a1:t0,r0:vt) = (a1) -> r0
//
#typedef
f2un
(a1:t0
,a2:t0,r0:vt) = (a1,a2) -> r0
//
#typedef
f3un
(a1:t0
,a2:t0
,a3:t0,r0:vt) = (a1,a2,a3) -> r0
//
(* ****** ****** *)
//
fun
<r0:vt>
f_trace_f0un
(msg: strn
,f00: f0un(r0)): f0un(r0)
fun
<a1:t0>
<r0:vt>
f_trace_f1un
(msg: strn
,f00: f1un(a1,r0)): f1un(a1,r0)
fun
<a1:t0>
<a2:t0>
<r0:vt>
f_trace_f2un
(msg: strn
,f00: f2un(a1,a2,r0)): f2un(a1,a2,r0)
fun
<a1:t0>
<a2:t0>
<a3:t0>
<r0:vt>
f_trace_f3un
(msg: strn
,f00: f3un(a1,a2,a3,r0)): f3un(a1,a2,a3,r0)
//
(* ****** ****** *)
//
#symload trace with f_trace_f0un of 1000
#symload trace with f_trace_f1un of 1000
#symload trace with f_trace_f2un of 1000
#symload trace with f_trace_f3un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_gdbg000.sats] *)
