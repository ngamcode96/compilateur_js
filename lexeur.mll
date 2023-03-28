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
| ['0'-'9']+('.'['0'-'9']+)?

{ NUMBER }

| '+'
{ PLUS }
| '-'
{ MINUS }
| '*'
{ TIMES }
| '('
{ GPAREN }
| ')'
{ DPAREN }
| '%'
{MODULO}
| eof
{ raise Eof }
|';'
{SEMICOLON}
| _
{ raise TokenInconu }
