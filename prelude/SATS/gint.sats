(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2019 Hongwei Xi, ATS Trustful Software, Inc.
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
// For generic integers
//
(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: June, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

fun
<a:type>
gint_add
{i,j:int}
( x: gint(a, i)
, y: gint(a, j)): gint(a, i+j)
fun
<a:type>
gint_sub
{i,j:int}
( x: gint(a, i)
, y: gint(a, j)): gint(a, i-j)
fun
<a:type>
gint_mul
{i,j:int}
( x: gint(a, i)
, y: gint(a, j)): gint(a, i*j)
fun
<a:type>
gint_div
{i,j:int | j != 0}
( x: gint(a, i)
, y: gint(a, j)): gint(a, i/j)
fun
<a:type>
gint_mod
{i,j:int | j >= 1}
( x: gint(a, i)
, y: gint(a, j)): gint(a, mod(i,j))

(* ****** ****** *)

fun//<>
gint_add_sint_sint
{i,j:int}
(x: sint(i), y: sint(j)): sint(i+j) = $ext()
fun//<>
gint_sub_sint_sint
{i,j:int}
(x: sint(i), y: sint(j)): sint(i-j) = $ext()
fun//<>
gint_mul_sint_sint
{i,j:int}
(x: sint(i), y: sint(j)): sint(i*j) = $ext()
fun//<>
gint_div_sint_sint
{i,j:int | j != 0}
(x: sint(i), y: sint(j)): sint(i/j) = $ext()
fun//<>
gint_mod_sint_sint
{i,j:int | j >= 1}
(x: sint(i), y: sint(j)): sint(mod(i,j)) = $ext()

(* ****** ****** *)

fun//<>
gint_add_uint_uint
{i,j:int}
(x: uint(i), y: uint(j)): uint(i+j) = $ext()
fun//<>
gint_mul_uint_uint
{i,j:int}
(x: uint(i), y: uint(j)): uint(i*j) = $ext()
fun//<>
gint_div_uint_uint
{i,j:int | j >= 1}
(x: uint(i), y: uint(j)): uint(i/j) = $ext()
fun//<>
gint_mod_uint_uint
{i,j:int | j >= 1}
(x: uint(i), y: uint(j)): uint(mod(i,j)) = $ext()

(* ****** ****** *)

(* end of [gint.sats] *)