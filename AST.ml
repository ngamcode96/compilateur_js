type expression_a =
    | Expr  of expression_a
    | Plus  of expression_a * expression_a
    | Moins of expression_a * expression_a
    | Mult  of expression_a * expression_a
    | Paren of expression_a
    | Neg   of expression_a
    | Num   of int
;;

type commande_a = expression_a;;


let rec print_code oc = function
| Expr   e -> (print_code oc e); 
| Plus  (g,d) -> print_code oc g; print_code oc d; (Printf.fprintf oc "%s" "AddiNb\n")
| Moins  (g,d) -> print_code oc g; print_code oc d; (Printf.fprintf oc "%s" "SubiNb\n")
| Mult   (g,d) -> print_code oc g; print_code oc d; (Printf.fprintf oc "%s" "MultNb\n")
| Paren e -> print_code oc e;
| Neg   e -> (print_code oc e);(Printf.fprintf oc "NegaNb \n");
| Num    n    ->  (Printf.fprintf oc "CsteNb %s\n" (string_of_int n))
;;
