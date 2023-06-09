program listas2;
type
	Lista =^ nodo;
	nodo = record
		elemento:integer;
		siguiente:Lista;
	end;

procedure inicializarLista(var L:Lista);
begin
	L:=nil;
end;

procedure agregarElemento(var l:lista; num:integer);
var
	nuevoNodo:lista;
begin
	new(nuevoNodo);
	nuevoNodo^.elemento := num;
	nuevoNodo^.siguiente := nil;
	if(l=nil)then l:=nuevoNodo
	else begin
		nuevoNodo^.siguiente := l;
		l:= nuevoNodo;
	end;
end;

procedure llenarLista(var l:lista);
var
	x:integer;
begin
	writeln('Ingrese numeros hasta terminar con 0');
	repeat
		readln(x);
		agregarElemento(l,x);
	until(x=0);
end;

procedure leerLista(l:lista);
begin
	writeln(' ');
	while(l<>nil)do
	begin
		writeln(l^.elemento);
		l:= l^.siguiente;
	end;
end;

procedure buscarElem(var L:Lista);
var
	x:integer;
	actual,ant:Lista;
begin
	actual:=L;
	writeln('Ingrese un numero a eliminar de la lista:');
	readln(x);
	
	while(actual<>nil)do begin
		if(actual^.elemento <> x)then begin
			ant:=actual;
			actual:=actual^.siguiente;
		end
		else begin
			if(actual=L) then
				L:=L^.siguiente
			else
				ant^.siguiente:=actual^.siguiente;
		dispose(actual);
		actual:=ant;		
		end;
	end;
end;

var
	l:Lista;
BEGIN
	inicializarLista(l);
	llenarLista(l);
	leerLista(l);
	buscarElem(l);
	leerLista(l);
END.
