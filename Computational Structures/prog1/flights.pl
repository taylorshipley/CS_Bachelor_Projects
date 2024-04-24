% Taylor Shipley
% CS 2130-Online
% Program-Propositional and Predicate Logic Using Prolog
% Dr. Huson
% Due: 09/08/22
% Filename: flights.pro
% Version: 1.0
% Student discussions: None
% ---------------------------------------------------------------------------------
% This program is used to determine if there are airline flights scheduled betweeen a  list of cities.
% ---------------------------------------------------------------------------------

% Direct flights between cities.
flight(dgz,qyy).
flight(dgz,azi).
flight(qyy,csi).
flight(azi,tva).
flight(csi,ppg).
flight(tva,brw).
flight(brw,csi).


% Rule: Checks for direct flights with 0 stops.
route(A,B,S) :- flight(A,B), S is 0.

% Rule: Checks for non-direct flights & reports connecting airports.
route(A,C,T) :- nl, flight(A,B), write('Connection at '), write(B),
    route(B,C,S), T is S+1.
