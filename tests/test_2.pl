foo(Bar) :-
	Bar = [3, [4, 5], 5].

baz :- \+ foo(foo); bar(foo).
bob.