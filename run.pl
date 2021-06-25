:- [ db, solve ].
	   
:- initialization(main).

main :-
	step(room0, [],
		[], _,
		[room0], _).
