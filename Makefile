all : e1 e2 e3 e4
e1: 
	ocamllex lexeur.mll
e2: 
	ocamlyacc parseur.mly
e3: 
	ocamlc -c  parseur.mli lexeur.ml parseur.ml  main.ml
e4: 
	ocamlc -o  main lexeur.cmo parseur.cmo  main.cmo