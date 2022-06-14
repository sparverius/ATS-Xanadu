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
Start Time: June 11th, 2022
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#extern
fun
EOLq(ch: char): bool
#extern
fun
EMPq(ch: char): bool
(* ****** ****** *)
#extern
fun
DOTq(ch: char): bool
#extern
fun
CLNq(ch: char): bool
(* ****** ****** *)
#extern
fun
ALNUMq(ch: char): bool
#extern
fun
ALNUM_q(ch: char): bool
#extern
fun
DIGITq(ch: char): bool
#extern
fun
XDIGITq(ch: char): bool
(* ****** ****** *)
#extern
fun
IDFSTq(ch: char): bool
#extern
fun
IDRSTq(ch: char): bool
#extern
fun
IDSYMq(ch: char): bool
(* ****** ****** *)
#extern
fun
SYSRPq(ch: char): bool
#extern
fun
SYDLRq(ch: char): bool
(* ****** ****** *)
#extern
fun
SLASHq(ch: char): bool
#extern
fun
STRSKq(ch: char): bool
#extern
fun
SLASH4q(cs: strn): bool
(* ****** ****** *)
#extern
fun
SQUOTEq(ch: char): bool
#extern
fun
DQUOTEq(ch: char): bool
(* ****** ****** *)
//
#implfun
EOLq(ch) = (ch = '\n')
#implfun
EMPq(ch) =
if
(ch = ' ')
then true else
(if (ch = '\t') then true else false)
//
(* ****** ****** *)
//
#implfun
DOTq(ch) = ( ch = '.' )
#implfun
CLNq(ch) = ( ch = ':' )
//
(* ****** ****** *)
//
#implfun
ALNUMq(ch) = isalnum(ch)
#implfun
DIGITq(ch) = isdigit(ch)
//
#implfun
ALNUM_q(ch) =
(
if
isalnum(ch)
then true else (ch = '_')
)
//
#implfun
XDIGITq(ch) = isxdigit(ch)
//
(* ****** ****** *)
//
#implfun
IDFSTq(ch) =
(
case+ 0 of
|
_ when isalpha(ch) => true
|
_ when ( ch = '_' ) => true
//
| _ (* otherwise *) => false
//
) (* case *) // end of [IDFSTq]
//
#implfun
IDRSTq(ch) =
(
case+ 0 of
|
_ when isalnum(ch) => true
|
_ when ( ch = '_' ) => true
|
_ when ( ch = '$' ) => true  // HX: module-sep
|
_ when ( ch = '\'' ) => true // HX: ML-tradition
//
| _ (*  otherwise  *) => false
//
) (* case *) // end of [IDRSTq]
//
(* ****** ****** *)

#implfun
IDSYMq(ch) =
(
gseq_memberq
<strn><cgtz>(symseq, ch)
) where
{
val
symseq = "%&+-./:=@~`^|*!?<>#"
} (*where*) // end of [IDSYMq]

(* ****** ****** *)
#implfun
SYSRPq(ch) = ( ch = '#' )
#implfun
SYDLRq(ch) = ( ch = '$' )
(* ****** ****** *)
//
#implfun
SLASHq(ch) = ( ch = '/' )
#implfun
STRSKq(ch) = ( ch = '*' )
//
#implfun
SLASH4q(cs) =
let
val s4 = "////" in
gseq_prefixq<strn><char>(s4, cs)
end (*let*)// end-of-[ SLASH4q ]
//
(* ****** ****** *)
//
#implfun
SQUOTEq(ch) = ( ch = '\'' )
#implfun
DQUOTEq(ch) = ( ch = '\"' )
//
(* ****** ****** *)
//
#extern
fun
<obj:vt>
lexing_CMNT1_line
(buf: !obj, sym: strn): tnode
#extern
fun
<obj:vt>
lexing_CMNT2_rest
(buf: !obj, sym: strn): tnode
//
#extern
fun
<obj:vt>
lexing_CMNT3_ccbl // cc-style
(buf: !obj, ci0: sint, ci1: sint): tnode
#extern
fun
<obj:vt>
lexing_CMNT4_mlbl // ml-style
(buf: !obj, ci0: sint, ci1: sint): tnode
//
(* ****** ****** *)

#impltmp
<obj>
gobj_lexing_tnode
(   buf   ) = let
//
val ci0 = 
gobj_lexing$getc1<obj>(buf)
val cc0 = char_make_code(ci0)
//
(*
val () =
prerrln
("gobj_lexing_tnode: ci0 = ", ci0)
val () =
prerrln
("gobj_lexing_tnode: cc0 = ", cc0)
*)
//
in//let
//
case+ 0 of
//
| _ when EMPq(cc0) => f0_EMP(buf, ci0)
| _ when EOLq(cc0) => f0_EOL(buf, ci0)
//
| _ when CLNq(cc0) => f0_CLN(buf, ci0)
| _ when DOTq(cc0) => f0_DOT(buf, ci0)
//
| _ when SLASHq(cc0) => f0_SLASH(buf, ci0)
//
(*
| _ when DIGITq(cc0) => f0_DIGIT(buf, ci0)
*)
//
| _ when IDFSTq(cc0) => f0_IDFST(buf, ci0)
//
| _ when SYSRPq(cc0) => f0_SYSRP(buf, ci0)
| _ when SYDLRq(cc0) => f0_SYDLR(buf, ci0)
//
| _ when IDSYMq(cc0) => f0_IDSYM(buf, ci0)
//
| _ when SQUOTEq(cc0) => f0_SQUOTE(buf, ci0)
//
| _ when DQUOTEq(cc0) => f0_DQUOTE(buf, ci0)
//
| _ (*  otherwise  *) => f0_otherwise(buf, ci0)
//
end where
{

(* ****** ****** *)

fun
f0_EMP
( buf: !obj
, ci0: sint): tnode =
  loop( buf ) where
{
//
//HX: [ci0]: dummy
//
fnx
loop
(buf: !obj): tnode =
let
//
val ci0 = 
gobj_lexing$getc1<obj>(buf)
val cc0 = char_make_code(ci0)
//
in//let
//
if
EMPq(cc0)
then loop(buf) else
let
  val cix =
  gobj_lexing$unget(buf, ci0)
in//let
T_BLANK(gobj_lexing$fcseg(buf))
end // end of [else]
//
end // end of [loop(buf,ci0)]
//
} (*where*) // end of [f0_EMP]

(* ****** ****** *)

fun
f0_EOL
( buf: !obj
, ci0: sint): tnode =
let
val () =
gobj_lexing$fcnil(buf) in T_EOL()
end (* let *)// end-of-[ f0_EOL ]

(* ****** ****** *)

fun
f0_CLN
( buf: !obj
, ci0: sint): tnode =
let
//
val ci1 = 
gobj_lexing$getc1<obj>(buf)
val cc1 = char_make_code(ci1)
//
in//let
//
case+ 0 of
|
_ when (cc1 = '<') =>
T_CLNLT(gobj_lexing$fcseg(buf))
|
_(* otherwise *) =>
(
  f0_IDSYM(buf, ci0)) where
{
val cix =
gobj_lexing$unget<obj>(buf, ci1)
}
//
end (* let *)// end of [ f0_CLN ]

(* ****** ****** *)

and
f0_DOT
( buf: !obj
, ci0: sint): tnode =
let
//
val ci1 = 
gobj_lexing$getc1<obj>(buf)
val cc1 = char_make_code(ci1)
//
in//let
//
case+ 0 of
|
_ when (cc1 = '<') =>
T_DOTLT(gobj_lexing$fcseg(buf))
|
_(* otherwise *) =>
(
  f0_IDSYM(buf, ci0)) where
{
val cix =
gobj_lexing$unget<obj>(buf, ci1)
} (*where*) // end of [other...]
//
end (* let *) // end of [f0_DOT]

(* ****** ****** *)

and
f0_SLASH
( buf: !obj
, ci0: sint): tnode = let
//
val ci1 = 
gobj_lexing$getc1<obj>(buf)
val cc1 = char_make_code(ci1)
//
in
//
case+ 0 of
| _
when (cc1 = '*') =>
lexing_CMNT3_ccbl
(  buf, ci0, ci1  ) // cc-style
| _
when (cc1 = '/') =>
let
val-
T_IDSYM
( sym ) = f0_IDSYM(buf, ci0)
in//let
if
SLASH4q(sym)
then
lexing_CMNT2_rest(buf, sym) // rest-style
else
lexing_CMNT1_line(buf, sym) // line-style
end (*let*) // end-of-SLASH
| _
(*  otherwise  *) =>
(
  f0_IDSYM(buf, ci0) where
{
  val cix =
  gobj_lexing$unget(buf, ci1) } )
//
end (* let *) // end of [f0_SLASHq]

(* ****** ****** *)

and
f0_IDFST
( buf: !obj
, ci0: sint): tnode =
  loop( buf ) where
{
//
fnx
loop
(buf: !obj): tnode =
let
//
val ci0 =
gobj_lexing$getc1<obj>(buf)
val cc0 = char_make_code(ci0)
(*
val () =
println("f0_IDFST: loop: cc0 = ", cc0)
*)
//
in//let
//
if
IDRSTq(cc0)
then loop(buf) else let
  val cix =
  gobj_lexing$unget(buf, ci0)
in
T_IDALP(gobj_lexing$fcseg(buf))
end (*else*) // end of [let]
//
end // end of [loop(buf:!obj)]
//
} (*where*) // end of [f0_IDFST]

(* ****** ****** *)

and
f0_SYSRP
( buf: !obj
, ci0: sint): tnode =
(
loop(buf, 0)) where
{
//
fnx
loop
( buf: !obj
, kk0: sint): tnode = let
//
val ci1 = 
gobj_lexing$getc1<obj>(buf)
val cc1 = char_make_code(ci1)
//
(*
val () =
println("f0_SYSRP: loop: cc0 = ", cc0)
*)
//
in//let
//
if
ALNUM_q(cc1)
then
loop(buf, kk0+1)
else
(
let
val cix =
gobj_lexing$unget(buf, ci1)
in
if
(kk0 = 0)
then f0_IDSYM(buf, ci0) else
T_IDSRP(gobj_lexing$fcseg(buf))
end (*let*) // end of [else]
)
//
end // end of [loop(buf, kk0)]
//
} (*where*) // end of [f0_SHARP]

(* ****** ****** *)

and
f0_SYDLR
( buf: !obj
, ci0: sint): tnode =
(
loop(buf, 0)) where
{
//
fnx
loop
( buf: !obj
, kk0: sint): tnode =
let
//
val ci1 = 
gobj_lexing$getc1<obj>(buf)
val cc1 = char_make_code(ci1)
//
(*
val () =
println("f0_SYDLR: loop: cc0 = ", cc0)
*)
//
in//let
//
if
IDRSTq(cc1)
then
loop(buf, kk0+1)
else
(
if
(kk0 > 0)
then
(
if
(cc1 = '.')
then
(
T_IDQUA(gobj_lexing$fcseg(buf))
) // end of [then]
else
let
  val
  cix =
  gobj_lexing$unget(buf, ci1)
in
T_IDDLR(gobj_lexing$fcseg(buf))
end // end of [else]
) (* then *)
else
(
  f0_IDSYM(buf, ci0) where
{
  val
  cix =
  gobj_lexing$unget(buf, ci1) }
) (* else *)
) (* else *) // end-of-( if )
//
end // end-of-[loop(buf, kk0)]
//
} (*where*) // end of [f0_SYDLR]

(* ****** ****** *)

and
f0_IDSYM
( buf: !obj
, ci0: sint): tnode =
  loop( buf ) where
{
//
fnx
loop
(buf: !obj): tnode = let
//
val ci0 =
gobj_lexing$getc1<obj>(buf)
val cc0 = char_make_code(ci0)
//
(*
val () =
println("f0_IDSYM: loop: cc0 = ", cc0)
*)
//
in//let
//
if
IDSYMq(cc0)
then loop(buf) else let
  val cix =
  gobj_lexing$unget(buf, ci0)
in
T_IDSYM(gobj_lexing$fcseg(buf))
end // end of [else]
//
end // end-of-[loop(buf:!obj)]
//
} (*where*) // end of [f0_IDSYM]

(* ****** ****** *)

fun
f0_SQUOTE
( buf: !obj
, ci0: sint ): tnode =
  fmain( buf ) where
{
//
fnx
fmain
(buf: !obj): tnode =
let
//
val ci0 =
gobj_lexing$getc1<obj>(buf)
val cc0 = char_make_code(ci0)
//
in//let
//
case+ 0 of
| _
when (cc0 = '\\') => loop10(buf)
| _
when (cc0 = '\'') => loop20(buf)
| _
(*  otherwise  *) => loop30(buf)
//
end(*let*)// end-of-[fmain(buf)]
//
and
loop10
(buf: !obj): tnode =
let
//
val ci0 =
gobj_lexing$getc1<obj>(buf)
val cc0 = char_make_code(ci0)
//
in//let
//
case+ 0 of
| _
when isdigit(cc0) => loop11(buf)
(*
| _
when isprint(cc0) => loop12(buf)
*)
| _
(*  otherwise  *) => loop12(buf)
//
end // end-of-[loop10(buf:!obj)]
//
and
loop20
(buf: !obj): tnode =
T_CHAR1_nil0(gobj_lexing$fcseg(buf))
//
and
loop30
(buf: !obj): tnode =
let
//
val ci0 =
gobj_lexing$getc1<obj>(buf)
val cc0 = char_make_code(ci0)
//
(*
val () =
prerrln("f0_SQUOTE: loop30: cc0 = ", cc0)
*)
//
in//let
//
case+ 0 of
//
| _
when SQUOTEq(cc0) =>
T_CHAR2_char(gobj_lexing$fcseg(buf))
//
| _
(*  otherwise  *) =>
let
val
cix =
gobj_lexing$unget(buf, ci0)
in// let // unclosed-squote
T_CHAR2_char(gobj_lexing$fcseg(buf))
end // end-of-( otherwise )
//
end // end of [loop30(buf:!obj)]
//
and
loop11
(buf: !obj): tnode = let
//
val ci0 =
gobj_lexing$getc1<obj>(buf)
val cc0 = char_make_code(ci0)
//
in//let
//
case+ 0 of
//
| _
when isdigit(cc0) => loop11(buf)
//
| _
when SQUOTEq(cc0) =>
T_CHAR3_blsh(gobj_lexing$fcseg(buf))
//
| _
(*  otherwise  *) =>
let
val
cix =
gobj_lexing$unget(buf, ci0)
in// let // unclosed-squote
T_CHAR3_blsh(gobj_lexing$fcseg(buf))
end // end-of-( otherwise )
//
end // end-of-[loop11(buf:!obj)]
//
and
loop12
(buf: !obj): tnode = let
//
val ci0 =
gobj_lexing$getc1<obj>(buf)
val cc0 = char_make_code(ci0)
//
in//let
//
case+ 0 of
| _
when SQUOTEq(cc0) =>
T_CHAR3_blsh(gobj_lexing$fcseg(buf))
| _
(*  othereise  *) =>
let
val
cix =
gobj_lexing$unget(buf, ci0)
in// let // unclosed-squote
T_CHAR3_blsh(gobj_lexing$fcseg(buf))
end // end-of-( otherwise )
//
end // end of [loop12(buf:!obj)]
//
} (*where*) // end-of-[f0_SQUOTE]

(* ****** ****** *)

fun
f0_DQUOTE
( buf: !obj
, ci0: sint): tnode =
  loop( buf ) where
{
//
fnx
loop
( buf: !obj ): tnode =
let
//
val ci0 =
gobj_lexing$getc1<obj>(buf)
val cc0 = char_make_code(ci0)
//
(*
val () =
println("f0_DQUOTE: ci0 = ", ci0)
*)
//
in//let
//
case+ 0 of
|
_ when cc0 = '\"' =>
(
  let
    val ccs =
    gobj_lexing$fclst(buf)
    val len = length1(ccs)
  in//let
    T_STRN1_clsd(strn(ccs), len)
  end
)
| _ when cc0 = '\\' =>
(
(*
// HX-2022-06-13:
// The following char is skipped
*)
  (
    loop(buf) ) where {
    val
    ci0 = gobj_lexing$getc1(buf)
  }
)
| _ (* otherwise *) =>
(
(*
// HX-2022-06-13:
// The closing d-quote is missing
*)
  if
  (ci0 >= 0)
  then loop(buf)
  else
  let
    val ccs =
    gobj_lexing$fclst(buf)
    val len = length1(ccs)
  in// let // HX: unclosed!
    T_STRN2_ncls(strn(ccs), len)
  end // else // end-of-(if)
)
//
end // end-of-[loop(buf:!obj)]
//
} (*where*) // end-of-[f0_DQUOTE]

(* ****** ****** *)

fun
f0_otherwise
(buf: !obj, ci0: sint): tnode =
(
  if
  (ci0 >= 0)
  then T_SPCHR(ci0) else T_EOF()
) where
{
  val () = gobj_lexing$fcnil(buf)
} (*where*) // end of [f0_otherwise]

(* ****** ****** *)

} (*where*) // end of [gobj_lexing_tnode]

(* ****** ****** *)

#impltmp
<obj>
lexing_CMNT1_line
  (buf, sym) =
  loop0(buf) where
{
//
fun
loop0
(buf: !obj): tnode =
let
//
val ci0 = 
gobj_lexing$getc1<obj>(buf)
val cc0 = char_make_code(ci0)
//
in
if
EOLq(cc0)
then
let
val cix =
gobj_lexing$unget(buf, ci0)
in
T_CMNT1_line
(sym, gobj_lexing$fcseg<obj>(buf))
end // end of [then]
else
(
if
(ci0 >= 0)
then loop0(buf)
else
T_CMNT1_line
(sym, gobj_lexing$fcseg<obj>(buf))
) (* end of [else] *)
end // end of [loop0]
//
} (* end of [lexing_COMMENT_line] *)

(* ****** ****** *)

#impltmp
<obj>
lexing_CMNT2_rest
  (buf, sym) =
  loop0(buf) where
{
//
fun
loop0
(buf: !obj): tnode =
let
//
val ci0 = 
gobj_lexing$getc1<obj>(buf)
val cc0 = char_make_code(ci0)
//
in
if
(ci0 >= 0)
then loop0(buf)
else
T_CMNT2_rest
(sym, gobj_lexing$fcseg<obj>(buf))
end (*let*) // end of [loop0]
//
} (* end of [lexing_COMMENT_rest] *)

(* ****** ****** *)

#impltmp
<obj>(*tmp*)
lexing_CMNT3_ccbl
  (buf, ci0, ci1) =
(
loop0(buf, 1(*lvl*))) where
{
//
fnx
loop0
( buf: !obj
, lvl: sint): tnode =
if
(lvl > 0)
then let
//
val ci0 =
gobj_lexing$getc1<obj>(buf)
val cc0 = char_make_code(ci0)
//
in//let
//
case+ 0 of
| _
when STRSKq(cc0) => loop1(buf, lvl)
| _
(*non-ASTERISK*) =>
(
if
(ci0 >= 0)
then loop0(buf, lvl) else
T_CMNT3_ccbl(lvl, gobj_lexing$fcseg(buf))
)
//
end // end of [then]
else
T_CMNT3_ccbl(lvl, gobj_lexing$fcseg(buf))
//
and
loop1
( buf: !obj
, lvl: sint): tnode =
let
//
val ci1 =
gobj_lexing$getc1<obj>(buf)
val cc1 = char_make_code(ci0)
//
in
//
case+ 0 of
| _
when SLASHq(cc1) => loop0(buf, lvl-1)
| _
when STRSKq(cc1) => loop1(buf, lvl-0)
| _(*non-SLASH-STRSK*) => loop0(buf, lvl)
//
end (*let*) // end of [ loop1(buf,lvl) ]
//
} (*where*) // end of [lexing_CMNT3_ccbl]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_lexing0_utils0.dats] *)
