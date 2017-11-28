{Le Jeu de l'oie Solo :

Le joueur est caractérisé par un nombre appelé "place" compris entre 0 et 66 qui constitue sa position sur le jeu de l'oie
Sachant qu'après jet des 2 dés 6 faces, on appliques les règles suivantes : on avance du nombre de cases indiqué par la somme des 2 dés.
Si on arrive juste sur la position 66, on arrête le jeu sur une victoire, sinon si on dépasse la case 66, on recule d'autant de cases que de cases parcourues en trop
(donc en gros si on dépasse la case 66, on recule pour chaque case supplémentaire après le 66). Pour les cases, il y a une oie toutes les 9 cases (sauf sur la case
 63), ce qui a pour effet de doubler le déplacement du tour (donc doubler la valeur des dés). Une case 58 Tête de mort renvoie à la case départ (case 0).
Avoir un maximum de constantes, écrire un algorithme clair et lisible, écrire des commentaires, il faudra également vérifier les jets de dés.
L'opérateur MODULO est conseillé, pour tester si une case est un multiple de 9
1ère version : valeurs des dés sont inscrites par l'utilisateur
Version bonus : on code les jets aléatoires de dés, toujours à vérifier}

{ALGORITHME : Jeu_de_l'oie
//BUT : on veut créer un jeu de l'oie textuel pour un seul joueur
//Principe : dans une grande boucle POUR, on prend en compte les jets de dés rentrés par l'utilisateur qui lui permettront de se déplacer;
             dans des SI on vérifie le contact avec des cases spécifiques (les oies, la tête de mort, la case 66),
             et enfin on fait en sorte que le joueur recule si il dépasse la case 66.
//Entrée :  la somme des 2 dés lancés par l'utilisateur (en dehors du programme)
//Sorties : la position de l'utilisateur, jusqu'à ce qu'il soit exactement tombé sur la case 66


CONST
minSommeD6 := 2 : ENTIER
maxSommeD6 := 12 : ENTIER

VAR
SommeD6, place, tour : ENTIER


DEBUT

SommeD6 := 0
place := 0
tour := 1
TANTQUE (place <> 66) FAIRE
	ECRIRE "Tour ", tour, " : ", "Indiquez la somme du resultat de votre jet de deux des 6"
	LIRE SommeD6
		SI ((SommeD6 >= minSommeD6) ET (SommeD6 <= maxSommeD6)) ALORS
			place := place + SommeD6
				SI (place = 63) ALORS
					place := 63
					ECRIRE "Vous etes sur la case", place
					SINON
						SI ((place MOD 9 =0) ET (place <> 63)) FAIRE
							place := place + SommeD6
							ECRIRE "Quelle chance ! Vous etes tombé sur une oie, vous vous deplacez donc du double de vos dés ! Vous etes sur la case ", place
						FINSI
				FINSI
				SI (place = 58) ALORS
					place := 0
					ECRIRE "Pas de chance, vous êtes tombes sur la tete de mort ! Vous retournez sur la case", place
				FINSI
				SI (place > 66) ALORS
					place := place -2*(place -66)
					ECRIRE "Vous n'etes pas tombé directement sur la case 66. Vous avez recules et vous etes sur la case ", place
				FINSI
			SINON
				ECRIRE "Vous etes sur la case ", place
		FINSI

tour := tour +1
FINTANTQUE
SI (place = 66) ALORS
	ECRIRE "VICTOIRE ! Vous etes venu à bout du terrible plateau du jeu de l'oie en ", tour, "tours !"
	FINSI
FIN}



PROGRAM Jeu_oie_solo;
USES crt;

CONST
minSommeD6 = 2;
maxSommeD6 = 12;

VAR
SommeD6, place, tour : INTEGER ;

BEGIN

SommeD6 := 0;
place := 0;
tour := 1;
WHILE (place <> 66) DO
	BEGIN
	writeln ('Tour ', tour, ' : Indiquez la somme du resultat de votre jet de deux des 6');
	readln (SommeD6);
		IF ((SommeD6 >= minSommeD6) AND (SommeD6 <= maxSommeD6)) THEN
			BEGIN
			place := place + SommeD6;
				IF (place = 63) THEN
					BEGIN
					place := 63;
					writeln('Vous etes sur la case', place )
					end
					ELSE
						IF ((place MOD 9 =0) AND (place <> 63)) THEN
						BEGIN
							place := place + SommeD6;
							writeln('Quelle chance ! Vous etes tombe sur une oie, vous vous deplacez donc du double de vos des ! Vous etes sur la case ', place );
						END;
					END;
				IF (place = 58) THEN
					BEGIN
					place := 0;
					writeln('Pas de chance, vous etes tombes sur la tete de mort ! Vous retournez sur la case', place );
					END;
				IF (place > 66) THEN
					BEGIN
					place := place -2*(place -66);
					writeln('Vous etes pas tombe directement sur la case 66. Vous avez recules et vous etes sur la case ', place )

                        END
			ELSE
				writeln('Vous etes sur la case ', place );
				tour := tour +1;

	END ;

IF (place = 66) THEN
	BEGIN
	writeln('VICTOIRE ! Vous etes venu a bout du terrible plateau du jeu de oie en ', tour, 'tours !');
	readln;
	END;
END.



{Jeu de l'oie deuxième version
Dans cette version, j'ai transformé la condition de départ pour se déplacer. En effet, j'ai ajouté un effet d'aléatoire par la commande "Randomize" et la commande Var1:=random(Var2)






PROGRAM Jeu_oie_solo;
USES crt;

CONST
minSommeD6 = 2;
maxSommeD6 = 12;

VAR
SommeD6, place, tour, D1, D2: INTEGER ;
BEGIN

SommeD6 := 2;
place := 0;
tour := 1;
D1:= 1;
D2:= 1;
WHILE (place <> 66) DO
	BEGIN
	Randomize;
	writeln ('Tour ', tour, ' : Appuyez sur la touche ENTREE pour lancer le D1');
	readkey;
		REPEAT
			D1 :=1+random(7);
			//readln(D1)

		UNTIL ((D1>0)AND(D1<7));
			writeln(D1);
	writeln ('Tour ', tour, ' : Appuyez sur la touche ENTREE pour lancer le D2');
	readkey;
		REPEAT
			D2 :=1+random(7);
			//readln(D2)

		UNTIL ((D2>0)AND(D2<7));
			writeln(D2);
	IF ((D1+D2>1)AND(D1+D2<13))THEN
		SommeD6 := D1+D2;
			IF ((SommeD6 >= minSommeD6) AND (SommeD6 <= maxSommeD6)) THEN
				BEGIN
				place := place + SommeD6;
					IF (place = 63) THEN
						BEGIN
						place := 63;
						writeln('Vous etes sur la case', place )
						end
						ELSE
							IF ((place MOD 9 =0) AND (place <> 63)) THEN
							BEGIN
								place := place + SommeD6;
								writeln('Quelle chance ! Vous etes tombe sur une oie, vous vous deplacez donc du double de vos des ! Vous etes sur la case ', place );
							END;
						END;
					IF (place = 58) THEN
						BEGIN
						place := 0;
						writeln('Pas de chance, vous etes tombes sur la tete de mort ! Vous retournez sur la case', place );
						END;
					IF (place > 66) THEN
						BEGIN
						place := place -2*(place -66);
						writeln('Vous etes pas tombe directement sur la case 66. Vous avez recules et vous etes sur la case ', place )

	                        END
				ELSE
					writeln('Vous etes sur la case ', place );
					tour := tour +1;

	END ;

IF (place = 66) THEN
	BEGIN
	writeln('VICTOIRE ! Vous etes venu a bout du terrible plateau du jeu de oie en ', tour, 'tours !');
	readln;
	END;
END.}