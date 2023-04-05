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
;;
type commande_a = 
    |Expression of expression_a
    | Import of string;;


let rec print_code oc = function
| Expr   e -> (print_code oc e); 
| Plus  (g,d) -> print_code oc g; print_code oc d; (Printf.fprintf oc "%s" "AddiNb\n")
| Moins  (g,d) -> print_code oc g; print_code oc d; (Printf.fprintf oc "%s" "SubiNb\n")
| Mult   (g,d) -> print_code oc g; print_code oc d; (Printf.fprintf oc "%s" "MultNb\n")
| Modulo   (g,d) -> print_code oc g; print_code oc d; (Printf.fprintf oc "%s" "ModuNb\n")
| Div   (g,d) -> print_code oc g; print_code oc d; (Printf.fprintf oc "%s" "DiviNb\n")
| Equal   (g,d) -> print_code oc g; print_code oc d; (Printf.fprintf oc "%s" "Equals\n")
| Not_Equal   (g,d) -> print_code oc g; print_code oc d; (Printf.fprintf oc "%s" "NotEql\n")
| Sup_equal   (g,d) -> print_code oc g; print_code oc d; (Printf.fprintf oc "%s" "GrEqNb\n")
| Sup_strict   (g,d) -> print_code oc g; print_code oc d; (Printf.fprintf oc "%s" "GrStNb\n")
| Inf_equal   (g,d) -> print_code oc g; print_code oc d; (Printf.fprintf oc "%s" "LoEqNb\n")
| Inf_strict   (g,d) -> print_code oc g; print_code oc d; (Printf.fprintf oc "%s" "LoStNb\n")
| And   (g,d) -> (print_code oc g); (Printf.fprintf oc "%s" "ConJmp label_and\n") ;(print_code oc d); (Printf.fprintf oc "Jump fin\nlabel_and CsteBo false\nfin Noop\n");
| Not b -> print_code oc b;(Printf.fprintf oc "Not\n");
| Paren e -> print_code oc e;
| Neg   e -> (print_code oc e);(Printf.fprintf oc "NegaNb \n");
| Num    n    ->  (Printf.fprintf oc "CsteNb %s\n" (string_of_float n))
| Booleen    b    ->  (Printf.fprintf oc "CsteBo %s\n" (string_of_bool b))
| Nan    ->  (Printf.fprintf oc "CsteNb NaN\n")
| Ident v -> (Printf.fprintf oc "GetVar %s\n" v)
| Assign (v,e) ->(print_code oc e);(Printf.fprintf oc "SetVar %s\n" v)

;;

let read_import_file filename = 
    let f = open_in filename in
    let size = in_channel_length f in
    let content = really_input_string f size in
    close_in f;
    content;;

let rec print_AST oc l = 
    match l with
    |[] -> Printf.fprintf oc "Halt\n"
    |h::d -> match h with
        |Expression e -> (print_code oc e); (print_AST oc d)
        |Import ident -> (Printf.fprintf oc "%s" (read_import_file (ident^".jsm")))
