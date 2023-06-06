Program Memoria;
{
* Comparacion de memoria estatica y memoria dinamica:
* 	
* 	Tipos de Variables y su consumo en bytes:(Valores de referencia)
* 	
* 	+Integer: 		2 Bytes
* 	+Real: 			4 Bytes	/ 8 Bytes
* 	+Char:			1 Byte
* 	+String: 		Bytes dependiente de la longitud de la cadena / Total = 256 Bytes
* 	+Record: 		Bytes dependiente de la cantidad de variables que disponga
* 	+Puntero:		4 Bytes
* 	+Boolean: 		1 Byte
* 
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
	x, Nentero: integer;
	Nreal: real;
	Letra: char;
	Cadena: String;
	Booleano: boolean;
	
	apuntador1 : puntero;
	
BEGIN
	
	x:=2;	//Se cuenta la variable x parte del calculo total
	
	writeln('Parte 1');
	
	writeln('La cantidad de bytes que usa un entero es:');
	writeln(sizeof(Nentero),' bytes');
	
	x := x + sizeof(Nentero);
	
	writeln('La cantidad de bytes que usa un real es:');
	writeln(sizeof(Nreal),' bytes');
	
	x := x + sizeof(Nreal);
	
	writeln('La cantidad de bytes que usa un caracter es:');
	writeln(sizeof(Letra),' bytes');
	
	x := x + sizeof(Letra);
	
	writeln('La cantidad de bytes que usa una cadena es:');
	writeln(sizeof(Cadena),' bytes');
	
	x := x + sizeof(Cadena);
	
	writeln('La cantidad de bytes que usa un booleano es:');
	writeln(sizeof(Booleano),' bytes');
	
	x := x + sizeof(Booleano);
	
	writeln('La cantidad de bytes que usa un puntero(con el registro variables) es:');
	writeln(sizeof(apuntador1),' bytes');
	
	x := x + sizeof(apuntador1);
	
	writeln(' ');
	writeln('Lo que en total hay en memoria estatica: ',x,' bytes');
	writeln('Y hay en el total de memoria en uso:',x,' bytes');
	writeln(' ');
	
	//Para el momento el programa solamente usa memoria estatica y ese es el total.
	
	writeln('Parte 2');
	
	new(apuntador1);		//Inicializacion
	
	writeln('La cantidad de bytes que usa un puntero(con el registro variables) es:');
	writeln(sizeof(apuntador1^),' bytes');
	writeln('Lo que resulta ser la memoria dinamica total en uso despues de su inicializacion');
	writeln(' ');
	writeln('Y ahora en total de memoria en uso es:',x+sizeof(apuntador1^),' bytes');
	
	//Para el momento el programa comienza a usar memoria estatica y eso se le incluye al total en uso.
	
	dispose(apuntador1);	//Finalizacion
	
	writeln(' ');
	writeln('Parte 3');
	
	writeln('A lo que despues de su finalizacion la memoria dinamica queda sin uso');
	writeln('Y ahora en total de memoria en uso es:',x,' bytes');
	
	//Para el momento el programa vuelve a la cantidad de memoria estatica ya que se deja de usar la memoria dinamica.
	
END.
