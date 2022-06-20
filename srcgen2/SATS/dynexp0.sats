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
#include
"./../HATS/xatsopt_sats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
//
#staload
LAB = "./xlabel0.sats"
#staload
LOC = "./locinfo.sats"
//
#typedef lab_t = $LAB.lab_t
#typedef label = $LAB.label
#typedef loc_t = $LOC.loc_t
#typedef loctn = $LOC.loctn
//
(* ****** ****** *)
//
#staload
SYM = "./xsymbol.sats"
#staload
LEX = "./lexing0.sats"
//
#typedef sym_t = $SYM.sym_t
#typedef token = $LEX.token
//
(* ****** ****** *)
//
#staload
S0E = "./staexp0.sats"
//
(* ****** ****** *)
#typedef i0dnt = $S0E.i0dnt
(* ****** ****** *)
#typedef t0int = $S0E.t0int
#typedef t0chr = $S0E.t0chr
#typedef t0flt = $S0E.t0flt
#typedef t0str = $S0E.t0str
(* ****** ****** *)
#typedef s0tid = $S0E.s0tid
#typedef s0aid = $S0E.s0aid
#typedef s0eid = $S0E.s0eid
#typedef s0qid = $S0E.s0qid
(* ****** ****** *)
//
#typedef sort0 = $S0E.sort0
#typedef s0exp = $S0E.s0exp
#typedef s0tdf = $S0E.s0tdf
//
(* ****** ****** *)
//
#typedef s0arg = $S0E.s0arg
#typedef s0mag = $S0E.s0mag
#typedef t0arg = $S0E.t0arg
#typedef t0mag = $S0E.t0mag
#typedef s0qua = $S0E.s0qua
//
(* ****** ****** *)
#typedef tokenlst = list(token)
#typedef tokenopt = optn(token)
(* ****** ****** *)
#typedef sort0lst = list(sort0)
#typedef sort0opt = optn(sort0)
(* ****** ****** *)
#typedef s0explst = list(s0exp)
#typedef s0expopt = optn(s0exp)
(* ****** ****** *)
#typedef s0arglst = list(s0arg)
#typedef s0maglst = list(s0mag)
#typedef t0arglst = list(t0arg)
#typedef t0maglst = list(t0mag)
#typedef s0qualst = list(s0qua)
(* ****** ****** *)

#abstbox d0exp_tbox // ptr
#abstbox d0pat_tbox // ptr
#abstbox d0ecl_tbox // ptr

(* ****** ****** *)
#typedef d0pat = d0pat_tbox
#typedef d0patlst = list(d0pat)
#typedef d0patopt = optn(d0pat)
(* ****** ****** *)
#typedef d0exp = d0exp_tbox
#typedef d0explst = list(d0exp)
#typedef d0expopt = optn(d0exp)
(* ****** ****** *)
#typedef d0ecl = d0ecl_tbox
#typedef d0eclist = list(d0ecl)
#typedef d0eclopt = optn(d0ecl)
(* ****** ****** *)
//
datatype
d0pat_node =
| D0Etkerr of (token)
//
(* ****** ****** *)
fun
d0pat_fprint(FILR, d0pat): void
(* ****** ****** *)
//
fun
d0pat_get_lctn(d0pat): loc_t
fun
d0pat_get_node(d0pat): d0pat_node
//
#symload lctn with d0pat_get_lctn
#symload node with d0pat_get_node
//
(* ****** ****** *)
fun
d0pat_make_node
(loc:loc_t, nod:d0pat_node): d0pat
#symload d0pat with d0pat_make_node
(* ****** ****** *)
//
datatype
d0exp_node =
//
| D0Eid0 of i0dnt
//
| D0Eint of t0int
| D0Echr of t0chr
| D0Eflt of t0flt
| D0Estr of t0str
//
| D0Etkerr of (token)
//
(* ****** ****** *)
fun
d0exp_fprint(FILR, d0exp): void
(* ****** ****** *)
//
fun
d0exp_get_lctn(d0exp): loc_t
fun
d0exp_get_node(d0exp): d0exp_node
//
#symload lctn with d0exp_get_lctn
#symload node with d0exp_get_node
//
(* ****** ****** *)
fun
d0exp_make_node
(loc:loc_t, nod:d0exp_node): d0exp
#symload d0exp with d0exp_make_node
(* ****** ****** *)
//
datatype
d0ecl_node =
//
(*
indicating error
*)
| D0Ctkerr of token
//
(*
HX-2019:
for skipping synerr:
*)
| D0Ctkskp of (token)
//
|
D0Clocal of
( token(*LOCAL*)
, d0eclist(*head*)
, tokenopt(* IN *)
, d0eclist(*body*), token(*END*))
//
|
D0Csortdef of
( token(*tknd*)
, s0tid, token(*eq*), s0tdf(*def*))
//
|
D0Csexpdef of
( token(*tknd*)
, s0eid(*name*)
, s0maglst, sort0opt, token, s0exp)
//
|
D0Cabsopen of
(token(*ABSOPEN*), s0qid(*qualid*))
|
D0Cabsimpl of
( token
, s0qid
, s0maglst, sort0opt, token, s0exp)
//
(* ****** ****** *)
fun
d0ecl_fprint(FILR, d0ecl): void
(* ****** ****** *)
//
fun
d0ecl_get_lctn(d0ecl): loc_t
fun
d0ecl_get_node(d0ecl): d0ecl_node
//
#symload lctn with d0ecl_get_lctn
#symload node with d0ecl_get_node
//
(* ****** ****** *)
fun
d0ecl_make_node
(loc:loc_t, nod:d0ecl_node): d0ecl
#symload d0ecl with d0ecl_make_node
(* ****** ****** *)

(* end of [ATS3/XATSOPT_dynexp0.sats] *)
