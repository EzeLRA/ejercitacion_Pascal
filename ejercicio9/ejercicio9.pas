program ejercicio9.pas;
{	Puntero registro:
}
type
	variables= record
		entero : integer;
		decimal : real;
		caracter : char;
		cadena : string;
		booleano : boolean;
	end;
	
	puntero =^ variables;
	
var
	apuntador1 : puntero;
	
BEGIN
	new(apuntador1);
	
	writeln('el puntero contiene:');
	writeln(sizeof(apuntador1^.entero),' Bytes de entero');
	writeln(sizeof(apuntador1^.decimal), ' Bytes de real');
	writeln(sizeof(apuntador1^.caracter), ' Bytes de caracter');
	writeln(sizeof(apuntador1^.cadena), ' Bytes de cadena');
	writeln(sizeof(apuntador1^.booleano), ' Bytes de booleano');
	writeln('En total de ',sizeof(apuntador1^),' bytes');
	
	dispose(apuntador1);
END.
