
%token<float> NUMBER
%token  PLUS MINUS TIMES GPAREN DPAREN SEMICOLON EOL MODULO
%left PLUS MINUS
%left TIMES MODULO
%nonassoc UMINUS
%type <AST.expression_a> main expression
%type <AST.commande_a> commande
%start main
%%
main:
commande EOL
{$1}

commande: 
    expression SEMICOLON
    {Expr($1)}
;
expression:
expression PLUS expression
{Plus($1, $3)}
| expression MINUS expression
{Moins($1, $3)}
| expression TIMES expression
{Mult($1, $3)}
| expression MODULO expression
{Modulo($1, $3)}
| GPAREN expression DPAREN
{Paren($2)}
| MINUS expression %prec UMINUS
{Neg($2)}
| NUMBER
{Num($1)}
;
