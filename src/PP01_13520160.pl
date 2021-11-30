/* Bagian 1 */

/* Deklarasi Fakta */
pria(karel).
pria(nikola_tesla).
pria(alan_turing).
pria(sherlock_h).
pria(gabe_newell).
pria(abdi).
pria(richard).
pria(kinantan).
wanita(ada_lovelace).
wanita(jk_rowling).
wanita(tami).
wanita(ra_kartini).
wanita(elsa_pataky).
wanita(marie_curie).
wanita(lia).
wanita(masumi_sera).
usia(karel,80).
usia(ada_lovelace,75).
usia(nikola_tesla,52).
usia(alan_turing,48).
usia(jk_rowling,46).
usia(tami,20).
usia(sherlock_h,25).
usia(ra_kartini,70).
usia(gabe_newell,73).
usia(abdi,45).
usia(richard,39).
usia(kinantan,65).
usia(elsa_pataky,64).
usia(marie_curie,35).
usia(lia,7).
usia(masumi_sera,4).
menikah(karel,ada_lovelace).
menikah(ada_lovelace,karel).
menikah(jk_rowling,abdi).
menikah(abdi,jk_rowling).
menikah(tami,sherlock_h).
menikah(sherlock_h,tami).
menikah(ra_kartini,gabe_newell).
menikah(gabe_newell,ra_kartini).
menikah(richard,marie_curie).
menikah(marie_curie,richard).
menikah(kinantan,elsa_pataky).
menikah(elsa_pataky,kinantan).
anak(nikola_tesla,karel).
anak(nikola_tesla,ada_lovelace).
anak(alan_turing,karel).
anak(alan_turing,ada_lovelace).
anak(jk_rowling,karel).
anak(jk_rowling,ada_lovelace).
anak(sherlock_h,jk_rowling).
anak(sherlock_h,abdi).
anak(abdi,ra_kartini).
anak(abdi,gabe_newell).
anak(richard,ra_kartini).
anak(richard,gabe_newell).
anak(lia,richard).
anak(lia,marie_curie).
anak(masumi_sera,richard).
anak(masumi_sera,marie_curie).
anak(marie_curie,kinantan).
anak(marie_curie,elsa_pataky).
saudara(nikola_tesla,alan_turing).
saudara(nikola_tesla,jk_rowling).
saudara(alan_turing,nikola_tesla).
saudara(alan_turing,jk_rowling).
saudara(jk_rowling,nikola_tesla).
saudara(jk_rowling,alan_turing).
saudara(richard,abdi).
saudara(abdi,richard).
saudara(lia,masumi_sera).
saudara(masumi_sera,lia).

/* Deklarasi Rules */
kakak(X,Y) :- saudara(X,Y), usia(X,UmurX), usia(Y,UmurY), UmurX > UmurY.
keponakan(X,Y) :- anak(X,Z), saudara(Y,Z).
suami(X,Y) :- pria(X), menikah(X,Y).
sepupu(X,Y) :- keponakan(X,Z), anak(Y,Z).
mertua(X,Y) :- anak(Z,X), menikah(Y,Z).
bibi(X,Y) :- keponakan(Y,X), wanita(X).
cucu(X,Y) :- anak(X,Z), anak(Z,Y).
keturunan(X,Y) :- anak(X,Y).
keturunan(X,Y) :- anak(X,Z), keturunan(Z,Y).
anaksulung(X) :- \+ saudara(X,Y), !.
anaksulung(X) :- \+ kakak(Y,X), saudara(X,Y).
anakbungsu(X) :- \+ saudara(X,Y), !.
anakbungsu(X) :- \+ kakak(X,Y), saudara(X,Y).

/* Bagian 2 */

/* Deklarasi Fakta */
/* Basis */
permute(X,0,1).
/* Deklarasi Rules */
/* Rekurens */
permute(X,Y1,Z1) :- Y is Y1 - 1, permute(X,Y,Z), Z1 is Z * (X-Y1+1).

/* Deklarasi Fakta */
/* Basis */
virus(0,N,R,N).
/* Deklarasi Rules */
/* Rekurens */
virus(T1,N,R,Y1) :- T is T1 - 1, virus(T,N,R,Y), Y1 is Y * R.

/* Deklarasi Rules */
/* Basis */
lcm(A,B,A) :- A > B, A mod B =:= 0.
lcm(A,B,B) :- B > A, B mod A =:= 0.
/* Rekurens */
lcm(A1,B1,X) :- A1 < B1, B is B1 + B1, lcm(A1,B,X).
lcm(A1,B1,X) :- A1 > B1, A is A1 + A1, lcm(A,B1,X).

/* Deklarasi Fakta */
/* Basis */
mul(1,B,B).
/* Deklarasi Aturan */
/* Rekurens */
mul(A1,B,X1) :- A is A1 - 1, mul(A,B,X), X1 is X + B.

/* Fungsi lain */
number(A,A).
number(A,B1) :- write(A), B is B1 + 1, number(A,B).
/* Deklarasi Aturan */
/* Basis */
numberTriangle(1) :- number(1,0).
/* Rekurens */
numberTriangle(N1) :- number(N1,0), nl, N is N1 - 1, numberTriangle(N).

/* Bagian 3 */

/* Fungsi lain */
min2(X,Y,X) :- X < Y.
min2(X,Y,Y) :- X > Y.
min2(X,X,X).
max2(X,Y,X) :- X > Y.
max2(X,Y,Y) :- X < Y.
max2(X,X,X).
concat(A,[],[A]).
concat(A,[X|B],[A|[X|B]]).

/* Deklarasi Fakta */
/* Basis */
min([X],X).
/* Deklarasi Aturan */
/* Rekurens */
min([Y|Z],X1) :- min(Z,X2), min2(Y,X2,X1).

/* Deklarasi Fakta */
/* Basis */
max([X],X).
/* Deklarasi Aturan */
/* Rekurens */
max([Y|Z],X1) :- max(Z,X2), max2(Y,X2,X1).

/* Basis */
range([A|[B|[]]],X) :- A >= B, X is A - B.
range([A|[B|[]]],X) :- A < B, X is B - A.
/* Rekurens */
range([A|[B|C]],Xmax) :- range([A|[B|[]]],X1), range([A|C],X2), range([B|C],X3), max2(X2,X3,XA), max2(XA,X1,Xmax).

/* Deklarasi Fakta */
/* Basis */
count([X],1).
/* Deklarasi Aturan */
/* Rekurens */
count([Y|Z],X1) :- count(Z,X), X1 is X + 1.

/* Deklarasi Fakta */
/* Basis */
sum([X],X).
/* Deklarasi Aturan */
/* Rekurens */
sum([Y|Z],X1) :- sum(Z,X), X1 is X + Y.

/* Deklarasi Fakta */
/* Basis */
insertAt([],X,1,[X]).
insertAt([A|B],X,1,[X|[A|B]]).
/* Deklarasi Aturan */
/* Rekurens */
insertAt([A|B],X,Y1,R1) :- Y is Y1 - 1, insertAt(B,X,Y,R), concat(A,R,R1).

/* Deklarasi Fakta */
/* Basis */
slice([],X,Y,[]).
slice([A|B],1,1,[]).
slice([A|B],X,1,[]).
/* Deklarasi Rules */
/* Rekurens */
slice([A|B],1,Y1,R1) :- Y is Y1 - 1, slice(B,X,Y,R), concat(A,R,R1).
slice([A|B],X1,Y1,R) :- X is X1 - 1, Y is Y1 - 1, slice(B,X,Y,R).

/* 4. Bonus */

:- dynamic(tebak/3).
/* Deklarasi Fakta */
tebak(_,_,-999).
/* Deklarasi Rules */
start :- retractall(tebak(_,_,_)), assertz(tebak(1,10,5)), write(5), write('?'), !.
tooLarge :- tebak(Min,_,Tebakan), progress(Tebakan), NewMax is Tebakan - 1, penebak(Min,NewMax).
tooSmall :- tebak(_,Max,Tebakan), progress(Tebakan), NewMin is Tebakan + 1, penebak(NewMin,Max).
right :- tebak(_,_,Tebakan), progress(Tebakan), write('Program berhasil menebak angka yang Anda pilih.'), nl, write('Terima kasih sudah bermain.'), retractall(tebak(_,_,_)), assertz(tebak(_,_,-999)), !.
progress(Tebakan) :- Tebakan \= -999.
penebak(Min, Max) :- Min =< Max, Tebakan is (Min + Max) // 2, retractall(tebak(_,_,_)), assertz(tebak(Min,Max,Tebakan)), write(Tebakan), write('?'), !.
penebak(Min, Max) :- Min > Max, write('Angka Pilihan Anda tidak konsisten.'), fail.