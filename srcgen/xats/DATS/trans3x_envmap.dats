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
// Author: Hongwei Xi
// Start Time: October, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

#staload "./../SATS/locinfo.sats"

(* ****** ****** *)

#staload "./../SATS/statyp2.sats"
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"

(* ****** ****** *)

#staload "./../SATS/trans3x.sats"

(* ****** ****** *)

#staload
_(*TMP*) = "./statyp2_util0.dats"

(* ****** ****** *)

#define
LOC0 the_location_dummy

(* ****** ****** *)

implement
fprint_val<t2ype> = fprint_t2ype

(* ****** ****** *)
//
datavtype
dvarenv =
DVARENV of dvarstk
//
and
dvarstk =
//
| dvarstk_nil of ()
//
| dvarstk_lam0 of dvarstk
| dvarstk_fix0 of (d2var, dvarstk)
//
| dvarstk_let1 of dvarstk
(*
| dvarstk_loc1 of dvarstk
| dvarstk_loc2 of dvarstk
*)
//
| dvarstk_dpat of (d3pat, dvarstk)
| dvarstk_farg of (f3arg, dvarstk)
//
(* ****** ****** *)

local

absimpl
dvarenv_vtype = dvarenv

in(*in-of-local*)

(* ****** ****** *)

implement
dvarenv_add_let1
  (env) =
( fold@(env) ) where
{
//
val+
@DVARENV(xs) = env
val () =
(xs := dvarstk_let1(xs))
//
} (* end of [dvarenv_add_let1] *)

(* ****** ****** *)

implement
dvarenv_add_loc1
  (env) =
( fold@(env) ) where
{
//
val+
@DVARENV(xs) = env
(*
val () =
(xs := dvarstk_loc1(xs))
*)
//
} (* end of [dvarenv_add_loc1] *)

(* ****** ****** *)

implement
dvarenv_add_loc2
  (env) =
( fold@(env) ) where
{
//
val+
@DVARENV(xs) = env
(*
val () =
(xs := dvarstk_loc2(xs))
*)
//
} (* end of [dvarenv_add_loc2] *)

(* ****** ****** *)

implement
dvarenv_pop_let1
  (env) =
( fold@(env) ) where
{
//
val+
@DVARENV(xs) = env
val () = (xs := auxstk(xs))
//
} where
{
//
fun
auxstk
(xs: dvarstk): dvarstk =
(
case- xs of
|
~dvarstk_let1(xs) => xs
|
~dvarstk_dpat(_, xs) => auxstk(xs)
) (* end of [auxstk] *)
//
} (* end of [dvarenv_pop_let1] *)

(* ****** ****** *)

implement
dvarenv_pop_loc12
  (env) =
( fold@(env) ) where
{
//
val+
@DVARENV(xs) = env
val () = (xs := auxstk(xs))
//
} where
{
fun
auxstk(xs: dvarstk): dvarstk = xs
} (* end of [dvarenv_pop_loc12] *)

(* ****** ****** *)
//
implement
dvarenv_make_nil
  ((*void*)) =
(
  DVARENV(dvarstk_nil())
)
//
(* ****** ****** *)
//
implement
dvarenv_free_top
  (env0) =
(
  auxstk(stk0)
) where
{
//
val-
~DVARENV(stk0) = env0
//
fun
auxstk
(xs: dvarstk): void =
(
case- xs of
|
~dvarstk_nil() => ()
|
~dvarstk_dpat(_, xs) => auxstk(xs)
|
~dvarstk_farg(_, xs) => auxstk(xs)
)
//
} (* end of [dvarstk_free_all] *)
//
(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(* end of [xats_trans3x_envmap.dats] *)
