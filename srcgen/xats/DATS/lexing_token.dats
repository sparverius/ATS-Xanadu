(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2018 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: May, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

#staload
UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

#staload "./../SATS/lexing.sats"
#staload "./../SATS/location.sats"

(* ****** ****** *)

local

absimpl
token_tbox = $rec{
token_loc= loc_t, token_node= tnode
} (* token_tbox *)

in (* in-of-local *)

implement
{}(*tmp*)
token_make(loc, node) =
$rec{
  token_loc= loc, token_node= node
} (* end of [token_make] *)

implement
{}(*tmp*)
token_get_loc(tok) = tok.token_loc
implement
{}(*tmp*)
token_get_node(tok) = tok.token_node

end // end of [local]

(* ****** ****** *)
//
implement
print_tnode
  (tok) = fprint_tnode(stdout_ref, tok)
implement
prerr_tnode
  (tok) = fprint_tnode(stderr_ref, tok)
//
(* ****** ****** *)
//
implement
fprint_tnode(out, tnd) =
(
case+ tnd of
//
| T_EOF() => fprint(out, "EOF")
| T_ERR() => fprint(out, "ERR")
//
| T_EOL() => fprint(out, "EOL")
//
| T_AT() => fprint(out, "AT")
| T_BANG() => fprint(out, "BANG")
//
| T_BLANK(x) =>
  fprint!(out, "BLANK(", x, ")")
//
| T_IDENT_alp(x) =>
  fprint!(out, "IDENT_alp(", x, ")")
| T_IDENT_sym(x) =>
  fprint!(out, "IDENT_sym(", x, ")")
//
| T_INT(rep) =>
  fprint!(out, "INT(", rep, ")")
| T_INT(base, rep, _(*sfx*)) =>
  fprint!(out, "INT(", base, ", ", rep, ")")
//
| T_CHAR(chr) =>
  let
    val chr = int2char0(chr)
  in
    fprint!(out, "CHAR(", chr, ")")
  end
| T_STRING(str) =>
  fprint!(out, "STRING(", str, ")")
//
| T_FLOAT(rep) =>
  fprint!(out, "FLOAT(", rep, ")")
| T_FLOAT(base, rep, _(*sfx*)) =>
  fprint!(out, "FLOAT(", base, ", ", rep, ")")
//
| T_CDATA(cdata, asz) => fprint!(out, "CDATA(...)")
//
| T_COMMA() => fprint(out, "COMMA")
| T_SEMICOLON() => fprint(out, "SEMICOLON")
//
| T_LPAREN() => fprint(out, "LPAREN")
| T_RPAREN() => fprint(out, "RPAREN")
| T_LBRACE() => fprint(out, "LBRACE")
| T_RBRACE() => fprint(out, "RBRACE")
| T_LBRACKET() => fprint(out, "LBRACKET")
| T_RBRACKET() => fprint(out, "RBRACKET")
//
| T_SPECHAR(c) => fprint!(out, "SPECHAR(", c, ")")
//
| T_COMMENT_line() => fprint(out, "T_COMMENT_line")
| T_COMMENT_rest() => fprint(out, "T_COMMENT_rest")
| T_COMMENT_block() => fprint(out, "T_COMMENT_block")
//
) (* end of [fprint_tnode] *)
//
(* ****** ****** *)
//
implement
print_token
  (tok) = fprint_token(stdout_ref, tok)
implement
prerr_token
  (tok) = fprint_token(stderr_ref, tok)
//
implement
fprint_token
  (out, tok) = fprint_tnode(out, tok.node())
//
(* ****** ****** *)

implement
tnode_is_comment
  (node) =
(
  case+ node of
  | T_COMMENT_line() => true
  | T_COMMENT_rest() => true
  | T_COMMENT_block() => true
  | _ (* non-T_COMMENT_... *) => false
)

(* ****** ****** *)
//
extern
fun
tnode_insert
(name: string, node: tnode): void
//
(* ****** ****** *)

local
//
#staload
"libats/SATS/hashtbl_linprb.sats"
//
#staload
_(*anon*) = "libats/DATS/hashfun.dats"
#staload
_(*anon*) = "libats/DATS/hashtbl_linprb.dats"
//
typedef key = string and itm = tnode
vtypedef hashtbl = hashtbl(key, itm)
//
val
theCap = 229
val
theHashtbl = 
hashtbl_make_nil<key,itm>(i2sz(theCap))
val
theHashtbl = $UN.castvwtp0{ptr}(theHashtbl)
//
in (* in-of-local *)

implement
tnode_search(name) = let
//
var res: itm?
//
val tbl =
$UN.castvwtp0{hashtbl}(theHashtbl)
val ans =
hashtbl_search<key,itm>(tbl, name, res)
prval ((*void*)) = $UN.cast2void(tbl)
//
in
  if (ans)
  then opt_unsome_get(res)
  else let
    prval () = opt_unnone(res) in T_EOF()
  end // end of [else]
end // end of [tnode_search]

(* ****** ****** *)

implement
tnode_insert
(name, node) = let
//
var res: itm?
val tbl =
$UN.castvwtp0{hashtbl}(theHashtbl)
val ans =
hashtbl_insert<key,itm>(tbl, name, node, res)
//
val ((*void*)) = assertloc(ans = false)
//
prval ((*void*)) = opt_clear(res)
prval ((*void*)) = $UN.cast2void(tbl)
//
in
  // nothing
end // end of [tnode_insert]

end // end of [local]

(* ****** ****** *)

(*
extern val T_DOT : tnode
*)
extern val T_QMARK : tnode
extern val T_PERCENT : tnode
(*
implement T_DOT = T_IDENT_alp "."
*)
implement T_QMARK = T_IDENT_alp "?"
implement T_PERCENT = T_IDENT_alp "%"

(* ****** ****** *)

val () = tnode_insert("@", T_AT)
val () = tnode_insert("!", T_BANG)

(* ****** ****** *)

(* end of [xats_lexing_token.dats] *)
