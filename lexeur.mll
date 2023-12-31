{
open Parseur
exception Eof
exception TokenInconu
}

rule token = parse
[' ' '\t' '\r' '\n']
{ token lexbuf }
|"//"[^'\n']*
{ token lexbuf}
|"/*" ([^'*'] | '*' [^'/'])* "*/" 
{ token lexbuf}
| ['0'-'9']*('.'['0'-'9']+)?('e' '-'? ['0'-'9']+)?
as lexem
{ NUMBER(float_of_string lexem)}
| '+'
{ PLUS }
| '-'
{ MINUS }
| '*'

{ TIMES }
| '/'
{ DIV }
| '('
{ GPAREN }
| ')'
{ DPAREN }
| '{'
{GBRAC}
| '}'
{DBRAC}
| '%'
{MODULO}
| "true"
{ TRUE }
| "false"
{ FALSE }
| '='
{ASSIGN}
| "=="
{ EQUAL }
| "!="
{ NOT_EQUAL }
| '!'
{ NOT }
| '>'
{GRST}
| ">="
{GREQ}
| '<'
{LOST}
| "<="
{LOEQ}
|"&&"
{AND}
| "NaN"
{NAN}
|"import"
{IMPORT}
|"if"
{IF}
|"else"
{ELSE}
|"while"
{WHILE}
|"for"
{FOR}
|"do"
{DO}
|"function"
{FUNCTION}
|"return"
{RETURN}
|"undefined"
{UNDEFINED}
|"let"
{LET}
| ['a'-'z' 'A'-'Z']+['a'-'z' 'A'-'Z' '_' '0'-'9']*
as id
{IDENT(id)}
| eof
{ EOF}
|';'
{SEMICOLON}
|','
{VIRGULE}
| _
{ raise TokenInconu }

