type token =
  | NUMBER of (float)
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
  | GBRAC
  | DBRAC
  | IDENT of (string)
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
  | WHILE
  | FOR
  | DO

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> AST.commande_a list
