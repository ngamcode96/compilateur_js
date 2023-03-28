type token =
  | NUMBER
  | PLUS
  | MINUS
  | TIMES
  | GPAREN
  | DPAREN
  | SEMICOLON
  | EOL

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> unit
