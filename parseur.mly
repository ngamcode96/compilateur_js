
%token<float> NUMBER
%token PLUS MINUS TIMES GPAREN DPAREN SEMICOLON EOL MODULO
%token TRUE FALSE NOT
%token EQUAL GRST GREQ LOST LOEQ NOT_EQUAL
%left EQUAL GRST GREQ LOST LOEQ NOT_EQUAL
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
| expression EQUAL expression
{Equal($1, $3)}
| expression NOT_EQUAL expression
{Not_Equal($1, $3)}
| expression GRST expression
{Sup_strict($1, $3)}
| expression GREQ expression
{Sup_equal($1, $3)}
| expression LOST expression
{Inf_strict($1, $3)}
| expression LOEQ expression
{Inf_equal($1, $3)}
| NOT expression
{Not($2)}
| GPAREN expression DPAREN
{Paren($2)}
| MINUS expression %prec UMINUS
{Neg($2)}
| NUMBER
{Num($1)}
| TRUE
{Booleen(true)}
| FALSE
{Booleen(false)}

;
