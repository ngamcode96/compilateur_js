type token =
  | NUMBER of (float)
  | PLUS
  | MINUS
  | TIMES
  | GPAREN
  | DPAREN
  | SEMICOLON
  | EOL
  | MODULO

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> AST.expression_a
