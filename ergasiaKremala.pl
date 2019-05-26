word([[r,e,l,e,n,t,l,e,s,s],[i,n,t,i,m,i,d,a,t,e],[a,n,i,m,o,s,i,t,y],[s,u,b,s,i,d,y],[v,u,l,n,e,r,a,b,i,l,i,t,y]]).

kremala():-
	word(LEKSIKO),
	length(LEKSIKO,LEKSIKOLENGTH),
	random(1,LEKSIKOLENGTH,NUMBER),
	findTheWord(LEKSIKO,HLEKSH,0,NUMBER),
	write("Vreite ta grammata gia tin parakatw leksi."),
	write("Eisagete mono mikra grammata."),
	write("Exete 5 eukairies: "),
	nl,length(HLEKSH,LENGTHLEKSHS),
	paules(1,LENGTHLEKSHS,LISTWITHFOUNDLETTERS,HLEKSH),
	EUKAIRIES=5,
	repeat,
		nl,write("Gramma: "),read(GRAMMA),
		playing(GRAMMA,HLEKSH,LISTWITHFOUNDLETTERS,EUKAIRIES,MOREEUKAIRIES),nl,
		display(1,LENGTHLEKSHS,LISTWITHFOUNDLETTERS),
		MOREEUKAIRIES=:=0;not(member("_",LISTWITHFOUNDLETTERS)),

	EUKAIRIES=:=0->write("Xasate.");
	write("Kerdisate!!!").


findTheWord([],_,_,_).
findTheWord([H|T],HLEKSH,ARXI,TELOS):-
	(ARXI+1)=:=TELOS,
	HLEKSH=H,
	NEWARXH is ARXI+1,
	findTheWord(T,HLEKSH,NEWARXH,TELOS).

findTheWord([_|T],HLEKSH,ARXI,TELOS):-
	not((ARXI+1)=:=TELOS),
	NEWARXH is ARXI+1,
	findTheWord(T,HLEKSH,NEWARXH,TELOS).

paules(ARXI,TELOS,[H|T1],[H|TAIL]):-
	ARXI=:=1,
	write(H),
	NEWARXI is ARXI+1,
	paules(NEWARXI,TELOS,T1,TAIL).

paules(ARXI,TELOS,["_"|LIST],[_|TLEKSH]):-
	ARXI\=1,ARXI<TELOS,
	write("_ "),
	NEWARXI is ARXI+1,
	paules(NEWARXI,TELOS,LIST,TLEKSH).

paules(ARXI,TELOS,[H|LIST],[H|TAIL]):-
	ARXI=:=TELOS,
	write(H),
	NEWARXI is ARXI+1,
	paules(NEWARXI,TELOS,LIST,TAIL).

paules(ARXI,TELOS,[],[]):-
	ARXI>TELOS.


playing(GRAMMA,HLEKSH,LISTWITHFOUNDLETTERS,_,_):-
	member(GRAMMA,HLEKSH),
	nl,write("Mpravo!!!"),
	eisagwghGrammatos(GRAMMA,LISTWITHFOUNDLETTERS,HLEKSH).

playing(GRAMMA,HLEKSH,_,EUKAIRIES,MOREEUKAIRIES):-
	not(member(GRAMMA,HLEKSH)),
	nl,write("Lathos!!!Exete alles "),
	MOREEUKAIRIES is EUKAIRIES-1,
	write(EUKAIRIES),
	write(" eukairies.").


eisagwghGrammatos(GRAMMA,[_|T],[H|THSLEKSHS]):-
	GRAMMA\=H,
	eisagwghGrammatos(GRAMMA,T,THSLEKSHS).

eisagwghGrammatos(GRAMMA,[GRAMMA|T],[H|THSLEKSHS]):-
	GRAMMA=:=H,
	eisagwghGrammatos(GRAMMA,T,THSLEKSHS).

eisagwghGrammatos(_,[],[]).


display(ARXI,TELOS,[H|T]):-
	not(ARXI>TELOS),
	write(H),
	write(" "),
	NEWARXI is ARXI+1,
	display(NEWARXI,TELOS,T).

display(ARXI,TELOS,_):-
	ARXI>TELOS.






























