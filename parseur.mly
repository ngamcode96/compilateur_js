
%token NUMBER PLUS MINUS TIMES GPAREN DPAREN SEMICOLON EOL MODULO
%left PLUS MINUS
%left TIMES MODULO
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
| GPAREN expression DPAREN
{}
| MINUS expression %prec UMINUS
{}
| NUMBER
{}
;
