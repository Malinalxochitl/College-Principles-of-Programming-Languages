department(joe,toy).
head(sam,toy).
report(X,Y) :-
    department(X,Z),
    head(Y,Z).
less_sal(X,Y) :- report(X,Y).

trib(0,0).
trib(1,0).
trib(2,1).
trib(N, T) :-
    N>2,
    N1 is N-1,
    N2 is N-2,
    N3 is N-3,
    trib(N1,S1),
    trib(N2,S2),
    trib(N3,S3),
    T is S1+S2+S3.

echo([],[]).
echo([A], [A,A]).
echo([A|B],[A,A|C]) :-
    echo(B,C).

suppressEchos([],[]).
suppressEchos([A],[A]).
suppressEchos([A,A|B],[A|C]) :-
    suppressEchos([A|B],[A|C]).
suppressEchos([A,D|B],[A|C]) :-
    suppressEchos([D|B],C).








