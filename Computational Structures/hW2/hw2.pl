% Taylor Shipley
% CS 2130-Online
% Program-02 - Homework - Recursion, gates, and math in Prolog
% Dr. Huson
% Due: 09/08/22
% Filename: hw2.pro
% Version: 1.0
% Student discussions: None
% ---------------------------------------------------------------------------------
% This program furthers the relationships from hw1.pro to test for
% ancestors and count generations between people.
% ---------------------------------------------------------------------------------

% biologically female family members
female(ann).
female(beth).
female(liz).
female(sue).
female(jill).
female(mary).
female(carol).

% biologically male family members
male(bob).
male(ted).
male(bill).
male(sam).
male(harry).
male(john).
male(matt).

% parental relationships
parentof(beth,bill).
parentof(bill,liz).
parentof(bill,jill).
parentof(ann,jill).
parentof(ann,ted).
parentof(ann,liz).
parentof(liz,matt).
parentof(matt,john).
parentof(bob,carol).
parentof(harry,sue).
parentof(harry, sam).
parentof(carol,sue).
parentof(carol,sam).
parentof(sue,mary).
parentof(mary,john).

% Our rules come next
childof(Child, Parent) :- parentof(Parent,Child).
siblings(Sib1, Sib2) :- parentof(Parent, Sib1),
    parentof(Parent,Sib2),Sib1\== Sib2.
sisterof(Sis, Sib) :- siblings(Sis, Sib), female(Sis).

% added the following for homework 2
ancestor_of(A,B) :- parentof(A,B).
ancestor_of(A,B) :- parentof(A,C), ancestor_of(C,B).

% and for counting the generations
ancestor_gen(A,B,G) :- parentof(A,B), G is 1.
ancestor_gen(A,B,G) :- parentof(A,C),ancestor_gen(C,B,F), G is F + 1.


% Truth Table for logic gate programing

mygate(0,0,0,1).
mygate(0,0,1,1).
mygate(0,1,0,0).
mygate(0,1,1,0).
mygate(1,0,0,1).
mygate(1,0,1,0).
mygate(1,1,0,1).
mygate(1,1,1,1).

% XOR and NAND relationships.

myxor(0,0,0).
myxor(0,1,1).
myxor(1,0,1).
myxor(1,1,0).

mynand(0,0,1).
mynand(0,1,1).
mynand(1,0,1).
mynand(1,1,0).

% Rules for cuircut.

mycircuit(X,Y,Z,F) :- myxor(X,Y,T1), myxor(T1,Z,T2), mynand(T1,T2, F), write(X),
    write(' '), write(Y), write(' '), write(Z), write(' '), write(F), write('\n').

