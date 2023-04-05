
let _ = 
let fichier = open_in "test.js" in
try
let lexbuf = Lexing.from_channel fichier in
Parseur.main Lexeur.token lexbuf
with
| Lexeur.TokenInconu 
| Parsing.Parse_error -> 
Printf.printf ("Syntax error \n")

