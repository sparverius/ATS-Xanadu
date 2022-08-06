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
Sat Aug  6 12:22:41 EDT 2022
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#staload "./../SATS/xstamp0.sats"
(* ****** ****** *)
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/xsymmap.sats"
(* ****** ****** *)

local

(* ****** ****** *)
#staload
"prelude\
/DATS/CATS/JS/basics1.dats"
(* ****** ****** *)

#typedef key = sint

(* ****** ****** *)

#absimpl
topmap_tbox
(itm:type) = jsobjmap(key, itm)

(* ****** ****** *)
in//local
(* ****** ****** *)

#implfun
topmap_search_opt
  {itm}(map, key) =
let
val key =
g0u2s(uint(key.stmp()))
in//let
XATS2JS_jsobjmap_search_opt<key>{itm}(map,key)
end (*let*) // end of [topmap_search_opt(k0)]

(* ****** ****** *)

endloc (*local*) // end of [  local(topmap)  ]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_xsymmap_topmap.dats] *)
