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
  | IMPORT
  | IDENT
  | TRUE
  | FALSE
  | NOT
  | AND
  | EQUAL
  | GRST
  | GREQ
  | LOST
  | LOEQ

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> unit
