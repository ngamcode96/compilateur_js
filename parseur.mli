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
  | TRUE
  | FALSE
  | NOT
  | EQUAL
  | GRST
  | GREQ
  | LOST
  | LOEQ
  | NOT_EQUAL

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> unit
