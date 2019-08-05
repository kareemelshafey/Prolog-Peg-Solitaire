%A predicate that takes to indecies and check if those 2 indecies are in the same row
same_row(I1,I2):-
	X is div(I1,7),
	Y is div(I2,7),
	X = Y.
	
%A predicate that takes to indecies and check if those 2 indecies are in the same column	
same_col(I1,I2):-
	X is mod(I1,7),
	Y is mod(I2,7),
	X = Y.

%A predicate is used to show either it is is on the same row or on the column
columnRow(I1,I2):-
	same_col(I1,I2).
columnRow(I1,I2):-
	same_row(I1,I2).

%Check if the movement from I1 to I2 is possible	
valid_move(I1,I2,Board):-
	columnRow(I1,I2),
	nth0(I1,Board,Output1),
	Output1 = 1,
	nth0(I2,Board,Output2),
	Output2 = 0,
	X is I1+I2,
	Y is div(X,2),
	nth0(Y,Board,Output3),
	Output3 = 1.
	
%A helper predicate to replace the start position of the marble,the eaten marble,the end position of the marble from 0 to 1 or vise versa
help_replace([_|T],0,Z,[Z|T]) .  
help_replace([H|T],X,Z,[H|T1]) :- 
  X>0,                                    
  X1 is X-1,                                
  help_replace(T,X1,Z,T1).  

% A predicate to execute the movement of the marble
execute_move(I1,I2,Board,NewBoard2):-
	valid_move(I1,I2,Board),
	help_replace(Board,I1,0,New1),
	help_replace(New1,I2,1,New2),
	M is I1+I2,
	N is div(M,2),
	help_replace(New2,N,0,NewBoard2).
	
%Predicate that solve the Peg solitare and return the board after finishing the game
peg_s(B,A):-
	execute_move(38,24,B,C),  
	execute_move(33,31,C,D),  
	execute_move(46,32,D,E),  
	execute_move(44,46,E,F),  
	execute_move(25,39,F,G),  
	execute_move(46,32,G,H),  
	execute_move(11,25,H,I),  
	execute_move(20,18,I,J),  
	execute_move(34,20,J,K),  
	execute_move(17,19,K,L),  
	execute_move(20,18,L,M),  
	execute_move(15,17,M,N),  
	execute_move(2,16,N,O),   
	execute_move(23,9,O,P),   
	execute_move(4,2,P,Q),    
	execute_move(2,16,Q,R),   
	execute_move(37,23,R,S),  
	execute_move(28,30,S,T),  
	execute_move(14,28,T,U),  
	execute_move(31,29,U,V),  
	execute_move(28,30,V,W),  
	execute_move(17,19,W,X),  
	execute_move(19,33,X,Y),  
	execute_move(33,31,Y,Z),  
	execute_move(31,29,Z,Z1), 
	execute_move(29,15,Z1,Z2),
	execute_move(15,17,Z2,Z3),
	execute_move(24,26,Z3,Z4),
	execute_move(10,24,Z4,Z5),
	execute_move(23,25,Z5,Z6),
	execute_move(26,24,Z6,A).            

board([-1,-1,1,1,1,-1,-1,-1,-1,1,1,1,-1,-1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,-1,-1,1,1,1,-1,-1,-1,-1,1,1,1,-1,-1]).
