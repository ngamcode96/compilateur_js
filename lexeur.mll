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
{ NUMBER }
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
| "&&"
{AND}
| "NaN"
{NAN}
|"import"
{IMPORT}
| (['a'-'z' 'A'-'Z']+(['0'-'9']*)?)+
{IDENT}
| eof
{ raise Eof }
|';'
{SEMICOLON}
| _
{ raise TokenInconu }
