
%token NUMBER PLUS MINUS TIMES GPAREN DPAREN SEMICOLON EOL MODULO DIV NAN
%token TRUE FALSE NOT
%token EQUAL GRST GREQ LOST LOEQ
%left EQUAL GRST GREQ LOST LOEQ
%left PLUS MINUS
%left TIMES MODULO DIV
%nonassoc UMINUS
%type <unit> main expression
%start main
%%
main:
commande EOL
{}

commande: 
    expression SEMICOLON
    {}
;
expression:
expression PLUS expression
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
;
