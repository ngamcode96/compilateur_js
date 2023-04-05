%token<float> NUMBER
%token PLUS MINUS TIMES GPAREN DPAREN SEMICOLON EOF MODULO DIV NAN ASSIGN
%token<string> IDENT
%token IMPORT
%token TRUE FALSE NOT AND
%token EQUAL GRST GREQ LOST LOEQ NOT_EQUAL
%right ASSIGN
%left AND
%left EQUAL NOT_EQUAL
%left GRST GREQ LOST LOEQ
%left PLUS MINUS
%left TIMES MODULO DIV
%nonassoc NOT
%nonassoc UMINUS
%type <AST.commande_a list> main
%type <AST.expression_a>  expression
%type <AST.commande_a> commande
%start main
%%
main:
EOF
{[]}
|commande main
{$1::$2}

commande: 
    expression SEMICOLON
    {Expression($1)}
    |IMPORT IDENT SEMICOLON
    {Import($2)}
;
expression:
IDENT ASSIGN expression
{Assign($1, $3)}
|expression PLUS expression
{Plus($1, $3)}
| expression MINUS expression
{Moins($1, $3)}
| expression TIMES expression
{Mult($1, $3)}
| expression MODULO expression
{Modulo($1, $3)}
| expression DIV expression
{Div($1, $3)}
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
| expression AND expression
{And($1, $3)}
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
|NAN
{Nan}
|IDENT
{Ident($1)}
;
