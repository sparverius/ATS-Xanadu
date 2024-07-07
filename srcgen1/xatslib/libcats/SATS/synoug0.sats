(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2020 Hongwei Xi, ATS Trustful Software, Inc.
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
HX-2022-06-03
Syntactic candies :)
*)
//
(* ****** ****** *)
//
(*
Author: Hongwei Xi
Start Time: April, 2020
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#staload
"./../SATS/libcats.sats"
(* ****** ****** *)
(*
fun<>
gs_prout0_a00
((*void*)) : void
*)
fun
<a1:vt>
gs_prout0_a01
( x1: ~a1 ) : void
fun
<a1:vt>
<a2:vt>
gs_prout0_a02
( x1: ~a1, x2: ~a2 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
gs_prout0_a03
( x1: ~a1
, x2: ~a2, x3: ~a3 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
gs_prout0_a04
( x1: ~a1, x2: ~a2
, x3: ~a3, x4: ~a4 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
gs_prout0_a05
( x1: ~a1
, x2: ~a2, x3: ~a3
, x4: ~a4, x5: ~a5 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
gs_prout0_a06
( x1: ~a1, x2: ~a2
, x3: ~a3, x4: ~a4
, x5: ~a5, x6: ~a6 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
gs_prout0_a07
( x1: ~a1
, x2: ~a2, x3: ~a3
, x4: ~a4, x5: ~a5
, x6: ~a6, x7: ~a7 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
gs_prout0_a08
( x1: ~a1, x2: ~a2
, x3: ~a3, x4: ~a4
, x5: ~a5, x6: ~a6
, x7: ~a7, x8: ~a8 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
<a9:vt>
gs_prout0_a09
( x1: ~a1
, x2: ~a2, x3: ~a3
, x4: ~a4, x5: ~a5
, x6: ~a6, x7: ~a7
, x8: ~a8, x9: ~a9 ) : void
(* ****** ****** *)
fun
<a01:vt>
<a02:vt>
<a03:vt>
<a04:vt>
<a05:vt>
<a06:vt>
<a07:vt>
<a08:vt>
<a09:vt>
<a10:vt>
gs_prout0_a10
(x01: ~a01, x02: ~a02
,x03: ~a03, x04: ~a04
,x05: ~a05, x06: ~a06
,x07: ~a07, x08: ~a08
,x09: ~a09, x10: ~a10) : void
(* ****** ****** *)
//
#symload prout0 with gs_prout0_a01
#symload prout0 with gs_prout0_a02
#symload prout0 with gs_prout0_a03
#symload prout0 with gs_prout0_a04
#symload prout0 with gs_prout0_a05
#symload prout0 with gs_prout0_a06
#symload prout0 with gs_prout0_a07
#symload prout0 with gs_prout0_a08
#symload prout0 with gs_prout0_a09
#symload prout0 with gs_prout0_a10
//
(* ****** ****** *)
(*
fun<>
gs_prout1_a00
((*void*)) : void
*)
fun
<a1:vt>
gs_prout1_a01
( x1: !a1 ) : void
fun
<a1:vt>
<a2:vt>
gs_prout1_a02
( x1: !a1, x2: !a2 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
gs_prout1_a03
( x1: !a1
, x2: !a2, x3: !a3 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
gs_prout1_a04
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
gs_prout1_a05
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
gs_prout1_a06
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4
, x5: !a5, x6: !a6 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
gs_prout1_a07
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5
, x6: !a6, x7: !a7 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
gs_prout1_a08
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4
, x5: !a5, x6: !a6
, x7: !a7, x8: !a8 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
<a9:vt>
gs_prout1_a09
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5
, x6: !a6, x7: !a7
, x8: !a8, x9: !a9 ) : void
(* ****** ****** *)
fun
<a01:vt>
<a02:vt>
<a03:vt>
<a04:vt>
<a05:vt>
<a06:vt>
<a07:vt>
<a08:vt>
<a09:vt>
<a10:vt>
gs_prout1_a10
(x01: !a01, x02: !a02
,x03: !a03, x04: !a04
,x05: !a05, x06: !a06
,x07: !a07, x08: !a08
,x09: !a09, x10: !a10) : void
(* ****** ****** *)
//
#symload prout with gs_prout1_a01
#symload prout with gs_prout1_a02
#symload prout with gs_prout1_a03
#symload prout with gs_prout1_a04
#symload prout with gs_prout1_a05
#symload prout with gs_prout1_a06
#symload prout with gs_prout1_a07
#symload prout with gs_prout1_a08
#symload prout with gs_prout1_a09
#symload prout with gs_prout1_a10
//
(* ****** ****** *)
//
#symload prout1 with gs_prout1_a01
#symload prout1 with gs_prout1_a02
#symload prout1 with gs_prout1_a03
#symload prout1 with gs_prout1_a04
#symload prout1 with gs_prout1_a05
#symload prout1 with gs_prout1_a06
#symload prout1 with gs_prout1_a07
#symload prout1 with gs_prout1_a08
#symload prout1 with gs_prout1_a09
#symload prout1 with gs_prout1_a10
//
(* ****** ****** *)
//
(*
fun<>
gs_prerr0_a00
((*void*)) : void
*)
fun
<a1:vt>
gs_prerr0_a01
( x1: ~a1 ) : void
fun
<a1:vt>
<a2:vt>
gs_prerr0_a02
( x1: ~a1, x2: ~a2 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
gs_prerr0_a03
( x1: ~a1
, x2: ~a2, x3: ~a3 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
gs_prerr0_a04
( x1: ~a1, x2: ~a2
, x3: ~a3, x4: ~a4 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
gs_prerr0_a05
( x1: ~a1
, x2: ~a2, x3: ~a3
, x4: ~a4, x5: ~a5 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
gs_prerr0_a06
( x1: ~a1, x2: ~a2
, x3: ~a3, x4: ~a4
, x5: ~a5, x6: ~a6 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
gs_prerr0_a07
( x1: ~a1
, x2: ~a2, x3: ~a3
, x4: ~a4, x5: ~a5
, x6: ~a6, x7: ~a7 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
gs_prerr0_a08
( x1: ~a1, x2: ~a2
, x3: ~a3, x4: ~a4
, x5: ~a5, x6: ~a6
, x7: ~a7, x8: ~a8 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
<a9:vt>
gs_prerr0_a09
( x1: ~a1
, x2: ~a2, x3: ~a3
, x4: ~a4, x5: ~a5
, x6: ~a6, x7: ~a7
, x8: ~a8, x9: ~a9 ) : void
//
fun
<a01:vt>
<a02:vt>
<a03:vt>
<a04:vt>
<a05:vt>
<a06:vt>
<a07:vt>
<a08:vt>
<a09:vt>
<a10:vt>
gs_prerr0_a10
(x01: ~a01, x02: ~a02
,x03: ~a03, x04: ~a04
,x05: ~a05, x06: ~a06
,x07: ~a07, x08: ~a08
,x09: ~a09, x10: ~a10) : void
//
(* ****** ****** *)
//
#symload prerr0 with gs_prerr0_a01
#symload prerr0 with gs_prerr0_a02
#symload prerr0 with gs_prerr0_a03
#symload prerr0 with gs_prerr0_a04
#symload prerr0 with gs_prerr0_a05
#symload prerr0 with gs_prerr0_a06
#symload prerr0 with gs_prerr0_a07
#symload prerr0 with gs_prerr0_a08
#symload prerr0 with gs_prerr0_a09
#symload prerr0 with gs_prerr0_a10
//
(* ****** ****** *)
(*
fun<>
gs_prerr1_a00
((*void*)) : void
*)
fun
<a1:vt>
gs_prerr1_a01
( x1: !a1 ) : void
fun
<a1:vt>
<a2:vt>
gs_prerr1_a02
( x1: !a1, x2: !a2 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
gs_prerr1_a03
( x1: !a1
, x2: !a2, x3: !a3 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
gs_prerr1_a04
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
gs_prerr1_a05
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
gs_prerr1_a06
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4
, x5: !a5, x6: !a6 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
gs_prerr1_a07
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5
, x6: !a6, x7: !a7 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
gs_prerr1_a08
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4
, x5: !a5, x6: !a6
, x7: !a7, x8: !a8 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
<a9:vt>
gs_prerr1_a09
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5
, x6: !a6, x7: !a7
, x8: !a8, x9: !a9 ) : void
(* ****** ****** *)
fun
<a01:vt>
<a02:vt>
<a03:vt>
<a04:vt>
<a05:vt>
<a06:vt>
<a07:vt>
<a08:vt>
<a09:vt>
<a10:vt>
gs_prerr1_a10
(x01: !a01, x02: !a02
,x03: !a03, x04: !a04
,x05: !a05, x06: !a06
,x07: !a07, x08: !a08
,x09: !a09, x10: !a10) : void
(* ****** ****** *)
//
#symload prerr with gs_prerr1_a01
#symload prerr with gs_prerr1_a02
#symload prerr with gs_prerr1_a03
#symload prerr with gs_prerr1_a04
#symload prerr with gs_prerr1_a05
#symload prerr with gs_prerr1_a06
#symload prerr with gs_prerr1_a07
#symload prerr with gs_prerr1_a08
#symload prerr with gs_prerr1_a09
#symload prerr with gs_prerr1_a10
//
(* ****** ****** *)
//
#symload prerr1 with gs_prerr1_a01
#symload prerr1 with gs_prerr1_a02
#symload prerr1 with gs_prerr1_a03
#symload prerr1 with gs_prerr1_a04
#symload prerr1 with gs_prerr1_a05
#symload prerr1 with gs_prerr1_a06
#symload prerr1 with gs_prerr1_a07
#symload prerr1 with gs_prerr1_a08
#symload prerr1 with gs_prerr1_a09
#symload prerr1 with gs_prerr1_a10
//
(* ****** ****** *)
//
fun<>
gs_proutln0_a00
((*void*)) : void
fun
<a1:vt>
gs_proutln0_a01
( x1: ~a1 ) : void
fun
<a1:vt>
<a2:vt>
gs_proutln0_a02
( x1: ~a1, x2: ~a2 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
gs_proutln0_a03
( x1: ~a1
, x2: ~a2, x3: ~a3 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
gs_proutln0_a04
( x1: ~a1, x2: ~a2
, x3: ~a3, x4: ~a4) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
gs_proutln0_a05
( x1: ~a1
, x2: ~a2, x3: ~a3 
, x4: ~a4, x5: ~a5 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
gs_proutln0_a06
( x1: ~a1, x2: ~a2
, x3: ~a3, x4: ~a4
, x5: ~a5, x6: ~a6 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
gs_proutln0_a07
( x1: ~a1
, x2: ~a2, x3: ~a3 
, x4: ~a4, x5: ~a5 
, x6: ~a6, x7: ~a7 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
gs_proutln0_a08
( x1: ~a1, x2: ~a2
, x3: ~a3, x4: ~a4
, x5: ~a5, x6: ~a6
, x7: ~a7, x8: ~a8 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
<a9:vt>
gs_proutln0_a09
( x1: ~a1
, x2: ~a2, x3: ~a3
, x4: ~a4, x5: ~a5
, x6: ~a6, x7: ~a7
, x8: ~a8, x9: ~a9 ) : void
fun
<a01:vt>
<a02:vt>
<a03:vt>
<a04:vt>
<a05:vt>
<a06:vt>
<a07:vt>
<a08:vt>
<a09:vt>
<a10:vt>
gs_proutln0_a10
(x01: ~a01, x02: ~a02
,x03: ~a03, x04: ~a04
,x05: ~a05, x06: ~a06
,x07: ~a07, x08: ~a08
,x09: ~a09, x10: ~a10) : void
//
(* ****** ****** *)
//
#symload proutln0 with gs_proutln0_a00
#symload proutln0 with gs_proutln0_a01
#symload proutln0 with gs_proutln0_a02
#symload proutln0 with gs_proutln0_a03
#symload proutln0 with gs_proutln0_a04
#symload proutln0 with gs_proutln0_a05
#symload proutln0 with gs_proutln0_a06
#symload proutln0 with gs_proutln0_a07
#symload proutln0 with gs_proutln0_a08
#symload proutln0 with gs_proutln0_a09
#symload proutln0 with gs_proutln0_a10
//
(* ****** ****** *)
//
fun<>
gs_proutln1_a00
((*void*)) : void
fun
<a1:vt>
gs_proutln1_a01
( x1: !a1 ) : void
fun
<a1:vt>
<a2:vt>
gs_proutln1_a02
( x1: !a1, x2: !a2 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
gs_proutln1_a03
( x1: !a1
, x2: !a2, x3: !a3 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
gs_proutln1_a04
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
gs_proutln1_a05
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
gs_proutln1_a06
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4
, x5: !a5, x6: !a6 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
gs_proutln1_a07
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5
, x6: !a6, x7: !a7 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
gs_proutln1_a08
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4
, x5: !a5, x6: !a6
, x7: !a7, x8: !a8 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
<a9:vt>
gs_proutln1_a09
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5
, x6: !a6, x7: !a7
, x8: !a8, x9: !a9 ) : void
//
fun
<a01:vt>
<a02:vt>
<a03:vt>
<a04:vt>
<a05:vt>
<a06:vt>
<a07:vt>
<a08:vt>
<a09:vt>
<a10:vt>
gs_proutln1_a10
(x01: !a01, x02: !a02
,x03: !a03, x04: !a04
,x05: !a05, x06: !a06
,x07: !a07, x08: !a08
,x09: !a09, x10: !a10) : void
//
(* ****** ****** *)
//
#symload proutln with gs_proutln1_a00
#symload proutln with gs_proutln1_a01
#symload proutln with gs_proutln1_a02
#symload proutln with gs_proutln1_a03
#symload proutln with gs_proutln1_a04
#symload proutln with gs_proutln1_a05
#symload proutln with gs_proutln1_a06
#symload proutln with gs_proutln1_a07
#symload proutln with gs_proutln1_a08
#symload proutln with gs_proutln1_a09
#symload proutln with gs_proutln1_a10
//
(* ****** ****** *)
//
#symload proutln1 with gs_proutln1_a00
#symload proutln1 with gs_proutln1_a01
#symload proutln1 with gs_proutln1_a02
#symload proutln1 with gs_proutln1_a03
#symload proutln1 with gs_proutln1_a04
#symload proutln1 with gs_proutln1_a05
#symload proutln1 with gs_proutln1_a06
#symload proutln1 with gs_proutln1_a07
#symload proutln1 with gs_proutln1_a08
#symload proutln1 with gs_proutln1_a09
#symload proutln1 with gs_proutln1_a10
//
(* ****** ****** *)
//
fun<>
gs_prerrln0_a00
((*void*)) : void
fun
<a1:vt>
gs_prerrln0_a01
( x1: ~a1 ) : void
fun
<a1:vt>
<a2:vt>
gs_prerrln0_a02
( x1: ~a1, x2: ~a2 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
gs_prerrln0_a03
( x1: ~a1
, x2: ~a2, x3: ~a3 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
gs_prerrln0_a04
( x1: ~a1, x2: ~a2
, x3: ~a3, x4: ~a4) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
gs_prerrln0_a05
( x1: ~a1
, x2: ~a2, x3: ~a3 
, x4: ~a4, x5: ~a5 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
gs_prerrln0_a06
( x1: ~a1, x2: ~a2
, x3: ~a3, x4: ~a4
, x5: ~a5, x6: ~a6 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
gs_prerrln0_a07
( x1: ~a1
, x2: ~a2, x3: ~a3 
, x4: ~a4, x5: ~a5 
, x6: ~a6, x7: ~a7 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
gs_prerrln0_a08
( x1: ~a1, x2: ~a2
, x3: ~a3, x4: ~a4
, x5: ~a5, x6: ~a6
, x7: ~a7, x8: ~a8 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
<a9:vt>
gs_prerrln0_a09
( x1: ~a1
, x2: ~a2, x3: ~a3
, x4: ~a4, x5: ~a5
, x6: ~a6, x7: ~a7
, x8: ~a8, x9: ~a9 ) : void
fun
<a01:vt>
<a02:vt>
<a03:vt>
<a04:vt>
<a05:vt>
<a06:vt>
<a07:vt>
<a08:vt>
<a09:vt>
<a10:vt>
gs_prerrln0_a10
(x01: ~a01, x02: ~a02
,x03: ~a03, x04: ~a04
,x05: ~a05, x06: ~a06
,x07: ~a07, x08: ~a08
,x09: ~a09, x10: ~a10) : void
//
(* ****** ****** *)
//
#symload prerrln0 with gs_prerrln0_a00
#symload prerrln0 with gs_prerrln0_a01
#symload prerrln0 with gs_prerrln0_a02
#symload prerrln0 with gs_prerrln0_a03
#symload prerrln0 with gs_prerrln0_a04
#symload prerrln0 with gs_prerrln0_a05
#symload prerrln0 with gs_prerrln0_a06
#symload prerrln0 with gs_prerrln0_a07
#symload prerrln0 with gs_prerrln0_a08
#symload prerrln0 with gs_prerrln0_a09
#symload prerrln0 with gs_prerrln0_a10
//
(* ****** ****** *)
//
fun<>
gs_prerrln1_a00
((*void*)) : void
fun
<a1:vt>
gs_prerrln1_a01
( x1: !a1 ) : void
fun
<a1:vt>
<a2:vt>
gs_prerrln1_a02
( x1: !a1, x2: !a2 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
gs_prerrln1_a03
( x1: !a1
, x2: !a2, x3: !a3 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
gs_prerrln1_a04
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
gs_prerrln1_a05
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
gs_prerrln1_a06
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4
, x5: !a5, x6: !a6 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
gs_prerrln1_a07
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5
, x6: !a6, x7: !a7 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
gs_prerrln1_a08
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4
, x5: !a5, x6: !a6
, x7: !a7, x8: !a8 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
<a9:vt>
gs_prerrln1_a09
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5
, x6: !a6, x7: !a7
, x8: !a8, x9: !a9 ) : void
//
fun
<a01:vt>
<a02:vt>
<a03:vt>
<a04:vt>
<a05:vt>
<a06:vt>
<a07:vt>
<a08:vt>
<a09:vt>
<a10:vt>
gs_prerrln1_a10
(x01: !a01, x02: !a02
,x03: !a03, x04: !a04
,x05: !a05, x06: !a06
,x07: !a07, x08: !a08
,x09: !a09, x10: !a10) : void
//
(* ****** ****** *)
//
#symload prerrln with gs_prerrln1_a00
#symload prerrln with gs_prerrln1_a01
#symload prerrln with gs_prerrln1_a02
#symload prerrln with gs_prerrln1_a03
#symload prerrln with gs_prerrln1_a04
#symload prerrln with gs_prerrln1_a05
#symload prerrln with gs_prerrln1_a06
#symload prerrln with gs_prerrln1_a07
#symload prerrln with gs_prerrln1_a08
#symload prerrln with gs_prerrln1_a09
#symload prerrln with gs_prerrln1_a10
//
(* ****** ****** *)
//
#symload prerrln1 with gs_prerrln1_a00
#symload prerrln1 with gs_prerrln1_a01
#symload prerrln1 with gs_prerrln1_a02
#symload prerrln1 with gs_prerrln1_a03
#symload prerrln1 with gs_prerrln1_a04
#symload prerrln1 with gs_prerrln1_a05
#symload prerrln1 with gs_prerrln1_a06
#symload prerrln1 with gs_prerrln1_a07
#symload prerrln1 with gs_prerrln1_a08
#symload prerrln1 with gs_prerrln1_a09
#symload prerrln1 with gs_prerrln1_a10
//
(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_libcats_synoug0.sats] *)
