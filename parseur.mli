type token =
  | NUMBER
  | PLUS
  | MINUS
  | TIMES
  | GPAREN
  | DPAREN
  | SEMICOLON
  | GBRAC
  | DBRAC
  | EOF
  | MODULO
  | DIV
  | NAN
  | ASSIGN
  | IDENT
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
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> unit
