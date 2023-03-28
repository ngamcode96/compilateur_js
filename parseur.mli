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

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> unit
