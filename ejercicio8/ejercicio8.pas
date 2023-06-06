program ejercicio8.pas;
{
* Programa indicador de bytes segun las variables:
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
	Puntero =^ integer;
	
var
	Nentero: integer;
	Nreal: real;
	Letra: char;
	Cadena: String;
	Booleano: boolean;
	
	apuntador1 : Puntero;
	
BEGIN
	writeln('La cantidad de bytes que usa un entero es:');
	writeln(sizeof(Nentero),' bytes');
	
	writeln('La cantidad de bytes que usa un real es:');
	writeln(sizeof(Nreal),' bytes');
	
	writeln('La cantidad de bytes que usa un caracter es:');
	writeln(sizeof(Letra),' bytes');
	
	writeln('La cantidad de bytes que usa una cadena es:');
	writeln(sizeof(Cadena),' bytes');
	
	writeln('La cantidad de bytes que usa un booleano es:');
	writeln(sizeof(Booleano),' bytes');
	
	new(apuntador1);
	
	writeln('La cantidad de bytes que usa un puntero(que apunta a un entero) es:');
	writeln(sizeof(apuntador1),' bytes');
	
	dispose(apuntador1);
END.
