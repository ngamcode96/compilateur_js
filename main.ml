
let _ = 
let fichier = open_in "test.js" in
let output = open_out "output.txt" in
try
let lexbuf = Lexing.from_channel fichier in
while true do 
 AST.print_AST output (Parseur.main Lexeur.token lexbuf)
done
with
| Lexeur.Eof -> (Printf.fprintf output "Halt\n"); exit 0;
| Lexeur.TokenInconu 
| Parsing.Parse_error -> 
Printf.printf ("Syntax error \n")

