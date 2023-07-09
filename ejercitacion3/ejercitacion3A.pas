program ejercitacion3A;
{
	Correccion de enunciado:

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

	Teniendo en cuenta:
	* Se dispone de un proceso que crea la lista principal (estructura de datos), por lo que no es necesario construir el proceso mismo
	* la capacidad maxima a raiz de lo anterior mencionado . Se dispone y no se tendria que precisar o suponer,mas que usar de la estructura anterior generada.
	
}
const
	destinoClave = 'Punta Cana';
	dimF=2500;
type
	cod = 1000..2500;
	//cadena20 = String[20];Opcional
	
	viajes = record
		codigoAvion : cod;
		anioViaje : integer;
		pasajeros : integer;
		ciudadDestino : String;
	end;
	
	lista =^ nodo;
	nodo = record
		elemento : viajes;
		siguiente : lista;
	end;
	
	aviones=array[cod] of integer;
	
procedure inicializarArreglo(var a:aviones);
var
	i:cod;
begin
	for i:=1000 to dimF do
	begin
		a[i]:=0;
	end;
end; 

procedure inicializarLista(var l:lista);
begin
	l:=nil;
end;

procedure maximoAviones(var a:aviones; codigo:cod ; avionMax:cod);	//Cuenta los codigos de aviones
var
	i:cod;
begin
	for i:=1000 to dimF do
	begin
		if(codigo = i)then
			a[i]:=a[i]+1;
		if(avionMax < a[i])then
			avionMax := codigo;
	end;
end;

procedure promedioAviones(lAviones:lista;var avion:cod);
var
	avionesCod:aviones;
begin
	inicializarArreglo(avionesCod);
	while(lAviones <> nil)do
	begin
		maximoAviones(avionesCod,lAviones^.elemento.codigoAvion,avion);
		lAviones := lAviones^.siguiente;
	end;
end;
		
procedure leerAviones();
begin
	//Procedimiento encargado de leer todos los aviones , estructura de datos que dispone la empresa
end;

var
	avionMax:cod;
	viajesL:lista;	//Lista para viajes a Punta Cana
	avionesL:lista;	//Lista de los aviones en total con su propia estructura de datos aparte
	pasajerosL:aviones;	//Arreglo con el codigo correspodiente a los aviones en el que guardara la cantidad de pasajeros que llevo;
BEGIN
	//leerAviones(avionesL); Genera la lista de aviones
	//promedioAviones(avionesL,avionMax); Recorre la lista anterior de los aviones que volaron y cuenta el promedio
	//listaPuntaCana(viajesL,avionesL);	Crea y llena la lista con los aviones con destino a Punta Cana y con años multiplo de 10
	//promedioPasajeros(avionesL,pasajerosL);
END.
