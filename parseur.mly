%token<float> NUMBER
%token UNDEFINED PLUS MINUS TIMES GPAREN DPAREN SEMICOLON EOF MODULO DIV NAN ASSIGN GBRAC DBRAC
%token<string> IDENT
%token LET
%token IMPORT
%token TRUE FALSE NOT AND
%token EQUAL GRST GREQ LOST LOEQ NOT_EQUAL
%token IF ELSE
%token WHILE FOR DO
%token FUNCTION RETURN VIRGULE
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
{[]}
|EOF
{[]}
|commande main
{$1::$2}

commande: 
    expression SEMICOLON
    {Expression($1)}
    |IMPORT IDENT SEMICOLON
    {Import($2)}
    | SEMICOLON
    {EmptyCommand}
    | GBRAC main DBRAC
    {ListCommand($2)}
    |IF GPAREN expression DPAREN commande ELSE commande
    {IfThenElse($3, $5, $7)}
    | WHILE GPAREN expression DPAREN commande
    {While($3, $5)}
    | FOR GPAREN commande expression SEMICOLON expression DPAREN commande
    {For($3, $4, $6, $8)}
    | DO commande WHILE GPAREN expression DPAREN SEMICOLON
    {Do_While($2, $5)}
    | FUNCTION IDENT GPAREN decl_args DPAREN GBRAC main DBRAC
    {Function_declare($2,$4,$7)}
    | RETURN expression SEMICOLON
    {Return($2)}
    |LET IDENT SEMICOLON
    {Let($2)}

;
decl_args: 
    {[]}
    |IDENT
    {[$1]}
    |IDENT VIRGULE decl_args
    {[$1]@$3}
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
| IDENT GPAREN arguments DPAREN
{Function_call($1,$3)}
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
|UNDEFINED
{Undefined}
;

arguments:
{[]}
| expression
{[$1]}
| expression VIRGULE arguments
{[$1]@$3}
;