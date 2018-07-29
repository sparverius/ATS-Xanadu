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
// Start Time: June, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#staload
"./../SATS/location.sats"
//
(* ****** ****** *)

#staload "./../SATS/lexing.sats"
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/dynexp0.sats"
#staload "./../SATS/parsing.sats"

(* ****** ****** *)
//
extern
fun
p_idint: parser(token)
extern
fun
p_idintseq: parser(tokenlst)
//
implement
p_idint
  (buf, err) = let
//
val tok = buf.get0()
val tnd = tok.node()
//
in
//
case+ tnd of
| T_INT1 _ =>
  (buf.incby1(); tok)
| T_IDENT_alp _ =>
  (buf.incby1(); tok)
| T_IDENT_sym _ =>
  (buf.incby1(); tok)
| T_LT() => tok where
  {
    val () = buf.incby1()
    val loc = tok.loc((*void*))
    val tnd = T_IDENT_sym( "<" )
    val tok = token_make_node(loc, tnd)
  }
| T_GT() => tok where
  {
    val () = buf.incby1()
    val loc = tok.loc((*void*))
    val tnd = T_IDENT_sym( ">" )
    val tok = token_make_node(loc, tnd)
  }
| _ (* non-IDENT *) =>
  (err := err + 1; tok)
//
end // end of [p_idint]
implement
p_idintseq
  (buf, err) =
(
//
list_vt2t
(pstar_fun{token}(buf, err, p_idint))
//
) (* end of [p_idintseq] *)
//
(* ****** ****** *)

implement
t_d0eid(tnd) =
(
case+ tnd of
//
| T_IDENT_alp _ => true
| T_IDENT_sym _ => true
//
| T_BACKSLASH() => true
//
| T_LT() => true // "<"
| T_GT() => true // ">"
//
| _ (* non-IDENT *) => false
//
) (* end of [t_d0eid] *)

implement
p_d0eid(buf, err) =
let
//
val tok = buf.get0()
//
in
  case+
  tok.node() of
  | T_IDENT_alp _ =>
    i0dnt_some(tok) where
    {
      val () = buf.incby1()
    }
  | T_IDENT_sym _ =>
    i0dnt_some(tok) where
    {
      val () = buf.incby1()
    }
//
  | T_BACKSLASH() =>
    i0dnt_some(tok) where
    {
      val () = buf.incby1()
    }
//
  | T_LT() =>
    i0dnt_some(tok) where
    {
      val () = buf.incby1()
      val loc = tok.loc((*void*))
      val tnd = T_IDENT_sym( "<" )
      val tok = token_make_node(loc, tnd)
    }
  | T_GT() =>
    i0dnt_some(tok) where
    {
      val () = buf.incby1()
      val loc = tok.loc((*void*))
      val tnd = T_IDENT_sym( ">" )
      val tok = token_make_node(loc, tnd)
    }
//
  | _ (* non-IDENT *) =>
    (err := err + 1; i0dnt_none(tok))
end // end of [p_d0eid]

(* ****** ****** *)

implement
p_i0dnt
  (buf, err) = let
//
val e0 = err
val tok = buf.get0()
//
in
//
case+
tok.node() of
| tnd
  when
  t_s0eid(tnd) =>
    p_s0eid(buf, err)
| tnd
  when
  t_d0eid(tnd) =>
    p_d0eid(buf, err)
| _ (* non-i0dnt *) =>
    (err := e0 + 1; i0dnt_none(tok))
//
end // end of [p_i0dnt]

(* ****** ****** *)
//
extern
fun
p_i0dntseq: parser(i0dntlst)
//
implement
p_i0dntseq
  (buf, err) =
(
//
list_vt2t
(pstar_fun{i0dnt}(buf, err, p_i0dnt))
//
) (* end of [p_i0dntseq] *)
//
(* ****** ****** *)
(*
atmd0exp ::
//
  | i0nt
  | c0har
//
  | d0eid
  | qualid atm0exp
//
  | { d0eclseq }
  | LET d0eclseq IN d0expseq END
//
  | ( d0expseq_COMMA )
  | ( d0expseq_COMMA | d0expseq_COMMA )
//
  | { labd0expseq_COMMA }
  | { labd0expseq_COMMA | labd0expseq_COMMA }
//
*)
extern
fun
p_atmd0exp : parser(d0exp)
//
extern
fun
p_atmd0expseq : parser(d0explst)
//
(* ****** ****** *)
//
implement
p_d0exp(buf, err) =
let
  val e0 = err
  val d0es0 =
  p_atmd0expseq(buf, err)
in
//
case+ d0es0 of
| list_nil
    ((*void*)) => let
    val tok = buf.get0()
  in
    err := e0 + 1;
    d0exp_make_node(tok.loc(), D0Enone(tok))
  end // end of [list_nil]
| list_cons
    (d0e0, d0es1) =>
  (
    case+ d0es1 of
    | list_nil() => d0e0
    | list_cons _ => let
        val d0e1 = list_last(d0es1)
      in
        d0exp_make_node
        (d0e0.loc()+d0e1.loc(), D0Eapps(d0es0))
      end // end of [list_cons]
  ) (* end of [list_cons] *)
//
end
// end of [p_d0exp]
//
(* ****** ****** *)

implement
p_labd0exp
  (buf, err) = let
//
val e0 = err
//
val l0 =
(
  p_l0abl(buf, err)
)
val tok = p_EQ(buf, err)
val d0e = p_d0exp(buf, err)
//
(*
val ((*void*)) =
println! ("p_labd0exp: l0 = ", l0)
val ((*void*)) =
println! ("p_labd0exp: tok = ", tok)
val ((*void*)) =
println! ("p_labd0exp: d0e = ", d0e)
*)
//
in
  err := e0; DL0ABELED(l0, tok, d0e)
end // end of [p_labd0exp]

(* ****** ****** *)

implement
p_atmd0exp
(buf, err) = let
//
val e0 = err
val tok0 = buf.get0()
//
in
//
case+
tok0.node() of
//
| _ when t_i0nt(tok0) =>
  let
    val i0 = p_i0nt(buf, err)
  in
    err := e0;
    d0exp_make_node(i0.loc(), D0Eint(i0))
  end // end of [t_i0nt]
| _ when t_c0har(tok0) =>
  let
    val c0 = p_c0har(buf, err)
  in
    err := e0;
    d0exp_make_node(c0.loc(), D0Echar(c0))
  end // end of [t_c0har]
//
| tnd when t_d0eid(tnd) =>
  let
    val id = p_d0eid(buf, err)
  in
    err := e0;
    d0exp_make_node(id.loc(), D0Eid(id))
  end // end of [t_d0eid]
//
| _ (* error *) => let
    val () = (err := e0 + 1)
  in
    d0exp_make_node(tok0.loc(), D0Enone(tok0))
  end // HX: indicating a parsing error
//
end // end of [p_atmd0exp]

(* ****** ****** *)

implement
p_atmd0expseq
  (buf, err) =
(
//
list_vt2t
(pstar_fun{d0exp}(buf, err, p_atmd0exp))
//
) (* end of [p_atmd0expseq] *)

(* ****** ****** *)

local

extern
fun
p_precopt: parser(precopt)

implement
p_precopt
  (buf, err) = let
//
val tok = buf.get0()
val tnd = tok.node()
//
in
//
case+ tnd of
| T_INT1 _ =>
  PRECOPTsing(tok) where
  {
    val () = buf.incby1()
  }
| T_LPAREN() => let
    val () = buf.incby1()
    val toks =
      p_idintseq(buf, err)
    // end of [val]
    val tok2 = p_RPAREN(buf, err)
  in
    PRECOPTlist(tok, toks, tok2)
  end
//
| _(*non-INT1-LPAREN*) => PRECOPTnil()
//
end // end of [p_precopt]

in (* in-of-local *)

implement
p_d0ecl
  (buf, err) = let
//
val e0 = err
val tok = buf.get0()
//
val loc = tok.loc()
val tnd = tok.node()
//
in
//
case+ tnd of
| T_SRP_NONFIX() => let
    val () = buf.incby1()
    val ids = p_i0dntseq(buf, err)
    val loc =
    (
      case+ ids of
      | list_nil() => loc
      | list_cons _ => let
          val id1 = list_last(ids) in loc + id1.loc()
        end // end of [list_cons]
    ) : loc_t // end of [val]
  in
    d0ecl_make_node(loc, D0Cnonfix(tok, ids))
  end // end of [NONFIX]

| T_SRP_FIXITY(knd) => let
    val () = buf.incby1()
    val opt = p_precopt(buf, err)
    val ids = p_i0dntseq(buf, err)
    val loc =
    (
      case+ ids of
      | list_nil() => loc
      | list_cons _ => let
          val id1 = list_last(ids) in loc + id1.loc()
        end // end of [list_cons]
    ) : loc_t // end of [val]
  in
    d0ecl_make_node(loc, D0Cfixity(tok, opt, ids))
  end // end of [FIXITY(knd)]
| _ (* errorcase *) =>
  let
    val () = (err := e0 + 1) in d0ecl_make_node(loc, D0Cnone(tok))
  end // end of [let]
//
end // end of [p_d0ecl]

end // end of [local]

(* ****** ****** *)

implement
p_d0eclseq
  (buf, err) =
(
//
list_vt2t
(pstar_fun{d0ecl}(buf, err, p_d0ecl))
//
) (* end of [p_d0eclseq] *)

(* ****** ****** *)

(* end of [xats_parsing_dynexp.dats] *)
