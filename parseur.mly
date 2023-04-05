
%token NUMBER PLUS MINUS TIMES GPAREN DPAREN SEMICOLON EOF MODULO DIV NAN ASSIGN
%token IMPORT IDENT
%token TRUE FALSE NOT AND
%token EQUAL GRST GREQ LOST LOEQ
%left EQUAL GRST GREQ LOST LOEQ
%left PLUS MINUS
%left TIMES MODULO DIV
%right ASSIGN
%nonassoc UMINUS
%type <unit> main expression
%start main
%%
main:
EOF
{}
| commande main
{}

commande: 
    expression SEMICOLON
    {}
    | IMPORT IDENT SEMICOLON
    {}
;
expression:
IDENT ASSIGN expression
{}
|expression PLUS expression
{}
| expression MINUS expression
{}
| expression TIMES expression
{}
| expression MODULO expression
{}
| expression DIV expression
{}
| expression EQUAL expression
{}
| expression GRST expression
{}
| expression GREQ expression
{}
| expression LOST expression
{}
| expression LOEQ expression
{}
| expression AND expression
{}
| NOT expression
{}
| GPAREN expression DPAREN
{}
| MINUS expression %prec UMINUS
{}
| NUMBER
{}
| TRUE
{}
| FALSE
{}
|NAN
{}
|IDENT 
{}
;