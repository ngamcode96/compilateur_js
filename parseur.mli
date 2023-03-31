type token =
  | NUMBER
  | PLUS
  | MINUS
  | TIMES
  | GPAREN
  | DPAREN
  | SEMICOLON
  | EOL
  | MODULO
  | DIV
  | NAN
  | IMPORT
  | IDENT
  | TRUE
  | FALSE
  | NOT
  | EQUAL
  | GRST
  | GREQ
  | LOST
  | LOEQ

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> unit
