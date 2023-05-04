
%token NUMBER UNDEFINED PLUS MINUS TIMES GPAREN DPAREN SEMICOLON GBRAC DBRAC EOF MODULO DIV NAN ASSIGN
%token IDENT LET
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
%type <unit> main expression
%start main
%%
main:
    {}
    |EOF
    {}
    | commande main
    {}

commande: 
    expression SEMICOLON
    {}
    | IMPORT IDENT SEMICOLON
    {}
    | IF GPAREN expression DPAREN commande ELSE commande
    {}
    | WHILE GPAREN expression DPAREN commande
    {}
    | FOR GPAREN commande expression SEMICOLON expression DPAREN commande
    {}
    | SEMICOLON
    {}
    | GBRAC main DBRAC
    {}
    | FUNCTION IDENT GPAREN decl_args DPAREN GBRAC main DBRAC
    {}
    | RETURN expression SEMICOLON
    {}
    | LET IDENT SEMICOLON
    {}
;

decl_args: 
    {}
    |IDENT
    {}
    |IDENT VIRGULE decl_args
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
    | expression NOT_EQUAL expression
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
    | IDENT GPAREN arguments DPAREN // appel de fonction
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
    |UNDEFINED
    {}
    ;
    arguments:
    {}
    | expression
    {}
    | expression VIRGULE arguments
    {}
    ;
