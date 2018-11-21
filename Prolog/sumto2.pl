%%% sumto(+N, -Sum)
%%%  Sum is the sum of numbers from 1 thru N

sumto(1, 1).
sumto(N, Sum):- N1 is N - 1, sumto(N1, S1), Sum is S1 + N.


%%% sumtoSafe(+N, -Sum)
%%%   version of sumTo that won't crash if you backtrack into it.
sumtoSafe(1, 1).
sumtoSafe(N, Sum):- N>1, N1 is N - 1, sumtoSafe(N1, S1), Sum is S1 + N.
