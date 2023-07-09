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
	writeln(' ');
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
		l:=nuevo				//Su anterior
	else begin
		nuevo^.siguiente := l;	//Su anterior
		l:=nuevo;				//Su siguiente
	end;
end;

//Inciso A
procedure informarMaximo(l:lista);
var
	lPri:lista;	//Lista auxiliar
	v:viajes;
	Max,cantViajes:integer;
begin
	new(lPri);
	lPri:=l;
	
	cantViajes:=0;
	Max:=-1;
	
	v.codigoAvion:=l^.elementos.codigoAvion;
	
	//Primer bucle donde repasara la lista hasta terminar de procesar
	while(lPri<>nil)do
	begin
		
		//Segundo bucle donde recorrera la lista haciendo el conteo de todas las coincidencias hasta el elemento final
		while(l<>nil)do
		begin
			if(v.codigoAvion=l^.elementos.codigoAvion)then
				cantViajes:=cantViajes+1;
			l:=l^.siguiente;
		end;
		
		if(cantViajes>Max)then
		begin
			Max:=cantViajes;
			v.codigoAvion := lPri^.elementos.codigoAvion;
		end;
		cantViajes:=0;
		lPri:=lPri^.siguiente;
	end;
	
	writeln('Se obtuvo que el avion con mas viajes fue el avion con el codigo: ',v.codigoAvion);
	dispose(lPri);
end;

//Inciso C (Falta Desarrollar - Implementar segunda lista)
procedure promedioPasajeros(l:lista);
var
	lPri:lista;
	v:viajes;
	cant:integer;
begin
	new(lPri);
	lPri:=l;
	
	cant:=0;
	
	
	
	//Primer bucle donde repasara la lista hasta terminar de procesar
	while(lPri<>nil)do
	begin
		v.codigoAvion := lPri^.elementos.codigoAvion;
		//Segundo bucle donde recorrera la lista haciendo el conteo de todas las coincidencias hasta el elemento final
		while(l<>nil)do
		begin
			if(v.codigoAvion=l^.elementos.codigoAvion)then
				cant:=cant+l^.elementos.cantidadPasajeros;
			l:=l^.siguiente;
		end;
		
		
		
		lPri:=lPri^.siguiente;
		
	end;
	
	writeln('Se obtuvo que el avion con mas viajes fue el avion con el codigo: ',v.codigoAvion);
	
end;


var
	l:lista;
	i:integer;
BEGIN
	inicializarLista(l);
	for i:=1 to 2 do
	begin
		generarLista(l);
	end;
	informarMaximo(l);
END.
