program teoriaLista;
const
	fin = 0;
type
	lista =^ nodo;
	nodo = record
		elemento : integer;
		siguiente: lista;
	end;
	
procedure crearLista(var l:lista);
begin
	l:=nil;
end;

{
*	Procedimientos Agregar 
}

procedure agregarAdelante(var l:lista;x:integer);
var
	nuevo:lista;
begin
	new(nuevo);
	nuevo^.elemento := x;
	nuevo^.siguiente:=nil;		//Por defecto se define a nuevo 
	
	if(l=nil)then				//Si es el primer elemento
		l:=nuevo
	else begin					//Si no lo es
		nuevo^.siguiente:=l;
		l:=nuevo;
	end;
end;
procedure agregarAtras(var l:lista;x:integer);
var
	nuevo,aux:lista;
begin
	new(nuevo);
	nuevo^.elemento := x;
	nuevo^.siguiente:=nil;		//Por defecto se define a nuevo 
	
	if(l=nil)then	//Si la lista esta vacia
		l:=nuevo
	else begin
		aux := l;
		while(aux^.siguiente <> nil)do	//Se ubica hasta el ultimo elemento
			aux:=aux^.siguiente;
		aux^.siguiente := nuevo;	//Indica al siguiente de ultimo que su siguiente sera nuevo
	end;
end;

procedure agregarAtrasUlt(var l,ult:lista; x:integer);
var
	nuevo:lista;
begin
	new(nuevo);
	nuevo^.elemento := x;
	nuevo^.siguiente := nil;
	
	if(l=nil)then
		l:=nuevo
	else
		ult^.siguiente := nuevo;
	ult:= nuevo;
end;



{
*	Agregar Ordenado 
}
procedure agregarOrdenado(var l: lista; x:integer);
var
	actual,anterior,nuevo:lista;	//Utiliza listas auxiliares para referenciar a las direcciones de l para desplazarse y insertar elementos
begin
	new (nuevo);
	nuevo^.elemento:=x;
	nuevo^.siguiente:=nil;
	
	if (l = nil) then 	//Si es el primer elemento
		l:= nuevo
	else begin
		actual:= l; 
		anterior:=l;
		while (actual <> nil)AND(actual^.elemento <> nuevo^.elemento)AND(actual^.elemento < nuevo^.elemento) do		//Condicion a ordenar en la lista (En este caso de menor a mayor y en grupos)
		begin
			anterior:=actual;
			actual:= actual^.siguiente;	//Recorre hasta ubicarse
		end;
	
	
		if (actual = l) then
		begin
			nuevo^.siguiente:= l; 
			l:= nuevo;
		end
		else
		begin
			anterior^.siguiente:= nuevo; 
			nuevo^.siguiente:= actual;
		end;
	end;
End;


{
*	Procedimientos Cargar 
}

//Carga sin procesar la condicion de fin
procedure cargarAdelante(var l:lista);
var
	x:integer;
begin
	readln(x);
	while(x <> fin)do begin
		agregarAdelante(l,x);
		readln(x);
	end;
end;
procedure cargarAtras(var l:lista);
var
	x:integer;
begin
	readln(x);
	while(x <> fin)do begin
		agregarAtras(l,x);
		readln(x);
	end;
end;
procedure cargarAtrasB(var l:lista);
var
	x:integer;
	ultL : lista;
begin
	readln(x);
	ultL:=l;
	while(x <> fin)do begin
		agregarAtrasUlt(l,ultL,x);
		readln(x);
	end;
end;	
procedure cargarOrdenado(var l:lista);
var
	x:integer;
begin
	readln(x);
	while(x <> fin)do begin
		agregarOrdenado(l,x);
		readln(x);
	end;
end;

//Carga procesando la condicion de fin
procedure cargarAdelante2(var l:lista);
var
	x:integer;
begin
	repeat
		readln(x);
		agregarAdelante(l,x);
	until(x = fin);
end;
procedure cargarAtras2(var l:lista);
var
	x:integer;
begin
	repeat
		readln(x);
		agregarAtras(l,x);
	until(x = fin);
end;
procedure cargarOrdenado2(var l:lista);
var
	x:integer;
begin
	repeat
		readln(x);
		agregarOrdenado(l,x);
	until(x = fin);
end;

{
*	Impresion de la lista 
}

procedure imprimirLista(l:lista);
begin
	while(l <> nil)do begin
		writeln(l^.elemento);
		l:=l^.siguiente;
	end;
end;

{
*	Busqueda en la lista 
}

procedure buscarElemento(l:lista);
var
	x:integer;
	encontrado:boolean;
begin
	encontrado := false;
	readln(x);
	while((l <> nil)AND(encontrado=false))do begin
		if(x=l^.elemento)then
			encontrado := true;
		l:=l^.siguiente;
	end;
	
	//Se puede reemplazar para que devuelva el valor boolean
	if(encontrado=true)then
		writeln('Se encontro el elemento')
	else
		writeln('No se encontro el elemento');
end;

{
*	Eliminar elemento de la lista 
}
procedure buscarEliminar(var l:lista);
var
	x:integer;
	encontrado:boolean;
	actual,anterior:lista;
begin
	encontrado := false;
	readln(x);
	actual:=l;
	
	while((actual <> nil)AND(encontrado = false))do begin
		anterior:=actual;
		actual:= actual^.siguiente;
		if(x=actual^.elemento)then
			encontrado := true;
	end;
	
	if(encontrado=true)then begin
		if (actual <> nil) then
			if (actual = l) then
				l:= l^.siguiente
			else
				anterior^.siguiente:= actual^.siguiente;

		dispose (actual);
		
		writeln('Se encontro el elemento');
	end
	else
		writeln('No se encontro el elemento');
end;

VAR
	l:lista;
BEGIN
	crearLista(l);
	cargarAtrasB(l);
	imprimirLista(l);
	//buscarEliminar(l);
	//imprimirLista(l);
END.
