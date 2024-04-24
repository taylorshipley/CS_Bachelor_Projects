% Taylor Shipley
% CS 2130-Online
% Program - Boolean Algebra: Prolog for logic gates
% Dr. Huson
% Due: 09/15/22
% Filename: logicGates.pro
% Version: 1.0
% Student discussions: None
% ---------------------------------------------------------------------------------
% Purpose: to use logic programming to simulate the operation of a circuit composed
% of logic gates.
% ---------------------------------------------------------------------------------

% Basic Logic Gate Rules
% Logic : NOT
mynot(0,1).
mynot(1,0).

% Logic: XOR
myxor(0,0,0).
myxor(0,1,1).
myxor(1,0,1).
myxor(1,1,0).

% Logic: OR
myor(0,0,0).
myor(0,1,1).
myor(1,0,1).
myor(1,1,1).


% Logic: AND
myand(0,0,0).
myand(0,1,0).
myand(1,0,0).
myand(1,1,1).

% Logic: NAND
mynand(0,0,1).
mynand(0,1,1).
mynand(1,0,1).
mynand(1,1,0).

% Rules
% Cuircut: Generatse truth table with inputs W,X,Y,Z and output F.
mycircuit(W,X,Y,Z,F) :- myand(W,X,T1),mynot(Y,T2),myor(X,T2,T3),myand(T1,T3,T5),
    myor(Y,Z,T4),mynot(T4,T6),myor(T5,T6,F).



