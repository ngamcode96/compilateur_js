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
  | DIV
  | NAN
  | IDENT of (string)
  | IMPORT
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
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> AST.commande_a list
