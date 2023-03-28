all : e1 e2 e3 e4
e1: 
	ocamllex lexeur.mll
e2: 
	ocamlyacc parseur.mly
e3: 
	ocamlc -c  AST.ml parseur.mli lexeur.ml parseur.ml  main.ml
e4: 
	ocamlc -o   main AST.cmo lexeur.cmo parseur.cmo  main.cmo