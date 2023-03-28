type expression_a =
    | Expr  of expression_a
    | Plus  of expression_a * expression_a
    | Moins of expression_a * expression_a
    | Mult  of expression_a * expression_a
    | Modulo  of expression_a * expression_a
    | Equal  of expression_a * expression_a
    | Not_Equal of expression_a * expression_a
    | Sup_equal  of expression_a * expression_a
    | Sup_strict  of expression_a * expression_a
    | Inf_equal  of expression_a * expression_a
    | Inf_strict  of expression_a * expression_a
    | Not of expression_a
    | Booleen of bool
    | Paren of expression_a
    | Neg   of expression_a
    | Num   of float
;;

type commande_a = expression_a;;


let rec print_code oc = function
| Expr   e -> (print_code oc e); 
| Plus  (g,d) -> print_code oc g; print_code oc d; (Printf.fprintf oc "%s" "AddiNb\n")
| Moins  (g,d) -> print_code oc g; print_code oc d; (Printf.fprintf oc "%s" "SubiNb\n")
| Mult   (g,d) -> print_code oc g; print_code oc d; (Printf.fprintf oc "%s" "MultNb\n")
| Modulo   (g,d) -> print_code oc g; print_code oc d; (Printf.fprintf oc "%s" "ModuNb\n")
| Equal   (g,d) -> print_code oc g; print_code oc d; (Printf.fprintf oc "%s" "Equals\n")
| Not_Equal   (g,d) -> print_code oc g; print_code oc d; (Printf.fprintf oc "%s" "NotEql\n")
| Sup_equal   (g,d) -> print_code oc g; print_code oc d; (Printf.fprintf oc "%s" "GrEqNb\n")
| Sup_strict   (g,d) -> print_code oc g; print_code oc d; (Printf.fprintf oc "%s" "GrStNb\n")
| Inf_equal   (g,d) -> print_code oc g; print_code oc d; (Printf.fprintf oc "%s" "LoEqNb\n")
| Inf_strict   (g,d) -> print_code oc g; print_code oc d; (Printf.fprintf oc "%s" "LoStNb\n")
| Not b -> print_code oc b;(Printf.fprintf oc "Not\n");
| Paren e -> print_code oc e;
| Neg   e -> (print_code oc e);(Printf.fprintf oc "NegaNb \n");
| Num    n    ->  (Printf.fprintf oc "CsteNb %s\n" (string_of_float n))
| Booleen    b    ->  (Printf.fprintf oc "CsteBo %s\n" (string_of_bool b))
;;
