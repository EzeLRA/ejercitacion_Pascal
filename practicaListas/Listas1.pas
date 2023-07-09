program Listas1;
type
	numeros = integer;
	
	lista =^ nodo;
	
	nodo = record
		elementos : numeros;
		siguiente : lista;
	end;

procedure inicializarLista(var l:lista);
begin
	l := nil;
end;

procedure agregarAdelante(var l:lista);
var
	nuevo : lista;
begin

	new(nuevo); 					//Se crea un Nodo
	
	writeln('Ingrese un numero');	//Se agrega la informacion en el nodo
	readln(nuevo^.elementos);
	
	nuevo^.siguiente := l;			//Se enlaza con la lista inicial
	
	l := nuevo;						//Se actualiza el primer nodo agregado
	
end;

procedure agregarAtras(var l:lista);
var
	nuevo,aux : lista;
begin
	
	new(nuevo); 					//Se crea un Nodo
	writeln('Ingrese un numero');	//Se agrega la informacion en el nodo
	readln(nuevo^.elementos);
	nuevo^.siguiente := nil;
	
	if(l=nil)then l:= nuevo				//Verifica si la lista no esta vacia
	else begin
		aux := l;
		while(aux^.siguiente <> nil)do		//Recorre la lista hasta quedar ubicado en la ultima posicion
			aux:= aux^.siguiente;
			
		aux^.siguiente := nuevo;			//Asigna al ultimo nodo que su siguiente sera el (nuevo)
	end;
	
end;

procedure agregarOrdenado(var l:lista);	
var
	nuevo,aux : lista;
begin
	
	new(nuevo); 					//Se crea un Nodo
	writeln('Ingrese un numero');	//Se agrega la informacion en el nodo
	readln(nuevo^.elementos);
	nuevo^.siguiente := nil;
	
	if(l=nil)then l:= nuevo				
	else begin
		aux := l;
		while((aux^.siguiente <> nil)AND(aux^.elementos <> nuevo^.elementos))do		
			aux:= aux^.siguiente;
			
		aux^.siguiente := nuevo;			
	end;
	
end;


procedure imprimirElementos(l:lista);
begin
	while(l <> nil)do
	begin
		
		writeln(l^.elementos);
		
		l := l^.siguiente;			//Traspasa al siguiente nodo hasta llegar al nodo final que contiene (nil)
		
	end;
end;

procedure cargarAdelante(var l:lista);
begin
	agregarAdelante(l);
	while(l^.elementos <> 0)do
	begin
		agregarAdelante(l);
	end;
end;

function buscarElemento(l:lista; x : integer):boolean;
var
	encontrado:boolean;
begin
	
	encontrado:=false;
	
	while((l <> nil)and(encontrado = false))do
	begin
		if(l^.elementos = x)then
		encontrado:=true;
		
		l := l^.siguiente;			//Traspasa al siguiente nodo hasta llegar al nodo final que contiene (nil)
	end;
	
	buscarElemento:=encontrado;
	
end;

procedure cargarAtras(var l:lista);
begin
	
	agregarAtras(l);
	while((buscarElemento(l,0)) <> true)do
	begin
		agregarAtras(l);
	end;
end;

procedure cargarOrdenado(var l:lista);
begin
	
	agregarOrdenado(l);
	while((buscarElemento(l,0)) <> true)do
	begin
		agregarOrdenado(l);
	end;
end;

VAR
	l : lista;
BEGIN
	inicializarLista(l);
	
	cargarOrdenado(l);
	
	writeln(' ');
	imprimirElementos(l); 
END.
