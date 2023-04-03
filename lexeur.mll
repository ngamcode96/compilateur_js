{
open Parseur
exception Eof
exception TokenInconu
}

rule token = parse
[' ' '\t' '\r']
{ token lexbuf }
| ['\n']
{ EOL }
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
| '%'
{MODULO}
| "true"
{ TRUE }
| "false"
{ FALSE }
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
| (['a'-'z' 'A'-'Z']+(['0'-'9']*)?)+
as id
{IDENT(id)}
| eof
{ raise Eof }
|';'
{SEMICOLON}
| _
{ raise TokenInconu }

