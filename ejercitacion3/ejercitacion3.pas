program ejercicio;
{
	Reflexion y correccion de enunciado:

	 Una empresa de venta de pasajes aereos esta analizando la informacion de los viajes realizados por sus aviones.
	Para ello se dispone de una estructura de datos con la informacion de todos los viajes. De cada viaje se conoce el codigo de avion
	(entre 1000 y 2500), el año en el que se realizo el viaje, la cantidad de pasajeros que viajaron y la ciudad de destino. La informacion
	no se encuentra ordenada por ningun criterio.
	 Ademas, la empresa dispone de una estructura de datos con informacion sobre la capacidad maxima de cada avion.
	  
	Realizar un programa que procese la informacion de los viajes e:
	 A.Informe el codigo del avion que realizo la mayor cantidad de viajes.
	 B.Genere una lista con los viajes realizados en años multiplo de 10 con destino "Punta Cana" en los que el avion no alcanzo su capacidad
	 maxima.
	 C.Para cada avion,informe el promedio de pasajeros que viajaron entre todos sus viajes.
}

const	//Suponiendo la capacidad maxima de cada avion seria
	capacidadMax = 100;
	destinoClave = 'Punta Cana';
type
	codigo=1000..2500;
	cadena20=String[20];
	
	viajes = record
		codigoAvion:codigo;
		anioViaje:integer;
		cantidadPasajeros:integer;
		ciudadDestino:cadena20;
	end;
	
	lista =^ nodo;
	
	nodo = record
		elementos:viajes;
		siguiente:lista;
	end;
	
procedure inicializarLista(var l:lista);
begin
	l:=nil;
end;

//Inciso B
procedure leerViajes(var v:viajes);
var
	aux:viajes;
begin
	writeln('Ingrese codigo de avion:');
	readln(aux.codigoAvion);
	writeln('Ingrese cantidad de pasajeros:');
	readln(aux.cantidadPasajeros);
	writeln('Ingrese anio de viaje:');
	readln(aux.anioViaje);
	writeln('Ingrese ciudad de destino:');
	readln(aux.ciudadDestino);
	
	if(((aux.anioViaje MOD 10)=0)and(aux.ciudadDestino = destinoClave))then
	begin
		v.codigoAvion := aux.codigoAvion;
		v.cantidadPasajeros := aux.cantidadPasajeros;
		v.anioViaje := aux.anioViaje;
		v.ciudadDestino := aux.ciudadDestino;
	end;
	
end;

//Inciso B
procedure generarLista(var l:lista);
var
	nuevo:lista;
begin
	
	new(nuevo);
	leerViajes(nuevo^.elementos);
	nuevo^.siguiente:=nil;
	
	if(l=nil)then
		l:=nuevo
	else begin
		nuevo^.siguiente := l;
		l:=nuevo;
	end;
end;

//Inciso A
procedure procesarLista();
begin

end;

BEGIN
END.
