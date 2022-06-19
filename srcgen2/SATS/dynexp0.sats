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

(* end of [ATS3/XATSOPT_dynexp0.sats] *)
