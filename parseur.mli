type token =
  | NUMBER of (float)
  | UNDEFINED
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
  | LET
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
  | FUNCTION
  | RETURN
  | VIRGULE

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> AST.commande_a list
