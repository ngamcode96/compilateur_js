type token =
  | NUMBER of (int)
  | PLUS
  | MINUS
  | TIMES
  | GPAREN
  | DPAREN
  | SEMICOLON
  | EOL

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> AST.expression_a
