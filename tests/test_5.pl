factorial(0, 1).

factorial(N, Result) :-
	N > 0,
	Dec_N is N - 1,
	factorial(Dec_N, Next_Factorial),
	Result is N * Next_Factorial.

find_e(0, Sum, Sum + 1).

find_e(Accuracy, Sum, Result) :-
	Accuracy > 0,
	factorial(Accuracy, Next_Factorial),
	Inverse_Factorial is 1 / Next_Factorial,
	New_Sum is Sum + Inverse_Factorial,
	Dec_Accuracy is Accuracy - 1,
	find_e(Dec_Accuracy, New_Sum, Result). % Variables in a functor must be pre-deduced.
	
% find_e(10, 0, X).
% this test fails for now