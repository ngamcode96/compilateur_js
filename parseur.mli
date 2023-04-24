type token =
  | NUMBER
  | PLUS
  | MINUS
  | TIMES
  | GPAREN
  | DPAREN
  | SEMICOLON
  | EOF
  | MODULO
  | DIV
  | NAN
  | ASSIGN
  | IDENT
  | IMPORT
  | TRUE
  | FALSE
  | NOT
  | AND
  | EQUAL
  | GRST
  | GREQ
  | LOST
  | LOEQ
  | NOT_EQUAL
  | IF
  | ELSE

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> unit
