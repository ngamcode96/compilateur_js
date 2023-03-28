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
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> AST.expression_a
