PROGRAM Test_random;
USES crt;

VAR D:integer;
BEGIN
Randomize;
REPEAT
D:=random(7)

UNTIL ((D>0)AND(D<7));
writeln(D);
readln;	
END.
