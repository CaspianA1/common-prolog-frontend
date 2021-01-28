% applying a function to its argument
eval([calling(A), with(B)], Global_Env, _, Result) :-
	eval(A, Global_Env, _,
		closure(lambda(var(Bound_Term), Body),
		capturing(Captured_Env))),
	eval(B, Global_Env, _, EB),

	% local env is ahead of global env, which enables variable shadowing
	append(Captured_Env, Global_Env, Priority_Env),
	eval(Body, [[Bound_Term | EB] | Priority_Env], _, Result).

% fetching a term from an environment
find_val([], Unbound_Name, [[], Unbound_Name]).
find_val([[Name | Value] | _], Name, Value).
find_val([[_ | _] | Env], Name, Value) :-
	find_val(Env, Name, Value).