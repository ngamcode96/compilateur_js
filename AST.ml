type expression_a =
    | Expr  of expression_a
    | Plus  of expression_a * expression_a
    | Moins of expression_a * expression_a
    | Mult  of expression_a * expression_a
    | Modulo  of expression_a * expression_a
    | Div  of expression_a * expression_a
    | Equal  of expression_a * expression_a
    | Not_Equal of expression_a * expression_a
    | Sup_equal  of expression_a * expression_a
    | Sup_strict  of expression_a * expression_a
    | Inf_equal  of expression_a * expression_a
    | Inf_strict  of expression_a * expression_a
    | And  of expression_a * expression_a
    | Not of expression_a
    | Booleen of bool
    | Paren of expression_a
    | Neg   of expression_a
    | Num   of float
    | Nan
    | Ident of string
    | Assign of string * expression_a
    | Function_call of string * expression_a list
;;
type commande_a = 
    |EmptyCommand 
    |Expression of expression_a
    |IfThenElse of expression_a*commande_a*commande_a
    |Import of string
    |While of expression_a*commande_a
    |For of commande_a*expression_a*expression_a*commande_a
    |Do_While of commande_a * expression_a
    |ListCommand of commande_a list
    |Function_declare of string * (string list) * commande_a list
    |Return of expression_a
;;

(* 
let get_ident_value iden = 
    match iden with 
    | Ident v -> v
    | _-> ""

;;  *)

let rec print_code oc = function
| Expr   e -> (print_code oc e); 
| Plus  (g,d) -> print_binary_operation g d "+" oc;
| Moins  (g,d) -> print_binary_operation g d "-" oc;
| Mult   (g,d) -> print_binary_operation g d "*" oc;
| Modulo   (g,d) -> print_binary_operation g d "%" oc;
| Div   (g,d) -> print_binary_operation g d "/" oc;
| Equal   (g,d) -> print_binary_operation g d "==" oc;
| Not_Equal   (g,d) -> print_binary_operation g d "!=" oc;
| Sup_equal   (g,d) -> print_binary_operation g d ">=" oc;
| Sup_strict   (g,d) -> print_binary_operation g d ">" oc;
| Inf_equal   (g,d) -> print_binary_operation g d "<=" oc;
| Inf_strict   (g,d) -> print_binary_operation g d "<" oc;
| And   (g,d) -> (print_code oc g); (Printf.fprintf oc "%s" "ConJmp label_and\n") ;(print_code oc d); (Printf.fprintf oc "Jump fin\nlabel_and CsteBo false\nfin Noop\n");
| Not b -> print_code oc b;(Printf.fprintf oc "Not\n");
| Paren e -> print_code oc e;
| Neg   e -> (print_code oc e);(Printf.fprintf oc "NegaNb \n");
| Num    n    ->  (Printf.fprintf oc "CsteNb %s\n" (string_of_float n))
| Booleen    b    ->  (Printf.fprintf oc "CsteBo %s\n" (string_of_bool b))
| Nan    ->  (Printf.fprintf oc "CsteNb NaN\n")
| Ident v -> (Printf.fprintf oc "GetVar %s\n" v)
| Assign (v,e) ->(print_code oc e);(Printf.fprintf oc "SetVar %s\n" v)
| Function_call (iden,arguments) ->  
                                    (Printf.fprintf oc "GetVar %s\n" iden);
                                    (Printf.fprintf oc "StCall\n");  
                                    (print_argument oc arguments); 
                                    (Printf.fprintf oc "Call \n")

and print_argument oc args = 
match args with
    | [] -> ()
    | h::d -> (print_code oc h);  (Printf.fprintf oc "SetArg \n"); (print_argument oc d)

    
and print_binary_operation e1 e2 op oc= 
    match (e1, e2) with
    |(Num n1, Num n2) -> (match op with
        | "+" -> (Printf.fprintf oc "CsteNb %s\n" (string_of_float (n1+.n2)))
        | "-" -> (Printf.fprintf oc "CsteNb %s\n" (string_of_float (n1-.n2)))
        | "*" -> (Printf.fprintf oc "CsteNb %s\n" (string_of_float (n1*.n2)))
        | "/" -> (Printf.fprintf oc "CsteNb %s\n" (string_of_float (n1/.n2)))
        | "%" -> (Printf.fprintf oc "CsteNb %s\n" (string_of_int ( (int_of_float n1) mod (int_of_float n2))))
        | "==" -> (Printf.fprintf oc "CsteBo %s\n" (string_of_bool (n1 == n2)))
        | "!=" -> (Printf.fprintf oc "CsteBo %s\n" (string_of_bool (n1 != n2)))
        | "<=" -> (Printf.fprintf oc "CsteBo %s\n" (string_of_bool (n1 <= n2)))
        | "<" -> (Printf.fprintf oc "CsteBo %s\n" (string_of_bool (n1 < n2)))
        | ">=" -> (Printf.fprintf oc "CsteBo %s\n" (string_of_bool (n1 >= n2)))
        | ">" -> (Printf.fprintf oc "CsteBo %s\n" (string_of_bool (n1 > n2)))
        | _ -> (Printf.fprintf oc ""))
    | _ -> (match op with 
        | "+" -> (print_code oc e1); (print_code oc e2); (Printf.fprintf oc "%s" "AddiNb\n")
        | "-" -> (print_code oc e1); (print_code oc e2); (Printf.fprintf oc "%s" "SubiNb\n")
        | "*" -> (print_code oc e1); (print_code oc e2); (Printf.fprintf oc "%s" "MultNb\n")
        | "/" -> (print_code oc e1); (print_code oc e2); (Printf.fprintf oc "%s" "DiviNb\n")
        | "%" -> (print_code oc e1); (print_code oc e2); (Printf.fprintf oc "%s" "ModuNb\n")
        | "==" -> (print_code oc e1); (print_code oc e2); (Printf.fprintf oc "%s" "Equals\n")
        | "!=" -> (print_code oc e1); (print_code oc e2); (Printf.fprintf oc "%s" "NotEql\n")
        | "<=" -> (print_code oc e1); (print_code oc e2); (Printf.fprintf oc "%s" "LoEqNb\n")
        | "<" -> (print_code oc e1); (print_code oc e2); (Printf.fprintf oc "%s" "LoStNb\n")
        | ">=" -> (print_code oc e1); (print_code oc e2); (Printf.fprintf oc "%s" "GrEqNb\n")
        | ">" -> (print_code oc e1); (print_code oc e2); (Printf.fprintf oc "%s" "GrStNb\n")
        | _ -> (Printf.fprintf oc ""))
;;

let read_import_file filename = 
    let f = open_in filename in
    let size = in_channel_length f in
    let content = really_input_string f size in
    close_in f;
    content;;

let rec print_command oc c = 
    match c with
        |EmptyCommand -> ()
        |ListCommand list -> (match list with
            | [] -> ()
            | h::d -> (print_command oc h); (print_program oc d);
        )
        |Expression e -> (print_code oc e);
        |Import ident -> (Printf.fprintf oc "%s" (read_import_file (ident^".jsm")))
        |IfThenElse (e,c1,c2) -> (print_code oc e); 
                                (Printf.fprintf oc "%s" "ConJmp else\n") ;
                                (print_command oc c1); 
                                (Printf.fprintf oc "Jump fin\nelse ");
                                (print_command oc c2);
                                (Printf.fprintf oc "fin Noop\n")

        |While (e, c) ->        (Printf.fprintf oc "%s" "loop ");
                                (print_code oc e); 
                                (Printf.fprintf oc "%s" "ConJmp break\n");
                                (print_command oc c); 
                                (Printf.fprintf oc "%s" "Jump loop\n");
                                (Printf.fprintf oc "break Noop\n");

        |For (c1,e1,e2,c2) ->   (print_command oc c1); 
                                (Printf.fprintf oc "%s" "loop ");
                                (print_code oc e1); 
                                (Printf.fprintf oc "%s" "ConJmp break\n");
                                (print_command oc c2); 
                                (print_code oc e2); 
                                (Printf.fprintf oc "%s" "Jump loop\n");
                                (Printf.fprintf oc "break Noop\n");

        |Do_While(c, e) ->      (Printf.fprintf oc "%s" "loop ");
                                (print_command oc c);
                                (print_code oc e); 
                                (Printf.fprintf oc "%s" "ConJmp break\n"); 
                                (Printf.fprintf oc "%s" "Jump loop\n");
                                (Printf.fprintf oc "break Noop\n");
        
        |Function_declare(ident,dec_args, commands) -> 
                                        (Printf.fprintf oc "NewClot %s\n" ident);
                                        (print_dec_args oc dec_args);
                                        (Printf.fprintf oc "SetVar %s\n" ident);
                                        (Printf.fprintf oc "Jump fin%s\n" ident);
                                        (Printf.fprintf oc "%s " ident);
                                        (print_program oc commands);
                                        (Printf.fprintf oc "fin%s Noop\n" ident);

                                   

        
        |Return e -> (print_code oc e); (Printf.fprintf oc "Return\n");


                                
and print_dec_args oc args = 
match args with
    | [] -> ()
    | h::d -> (Printf.fprintf oc "DecArg %s\n" h); (print_dec_args oc d)


and print_program oc l = 
match l with
    |[] -> ()
    |h::d -> (print_command oc h);(print_program oc d);;
;;
        
let rec print_AST oc l = 
    match l with
    |[] -> Printf.fprintf oc "Halt\n"
    |h::d -> (print_command oc h);(print_AST oc d);;