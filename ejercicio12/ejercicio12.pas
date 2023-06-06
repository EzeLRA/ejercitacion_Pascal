program listas;
type
	lista =^ enterosL;	//Lista
	enterosL = record	//Nodo de Lista
		elementos:integer;
		siguiente:lista;
	end;

{
* 
* 	Se puede imaginar la lista como "una fila de punteros" en el que comparten una con otra
* 	una direccion de memoria dinamica y solamente se puede acceder desde el princio hasta el fin de forma secuencial.
* 
* 				Lista => P5 => P4 => P3 => P2 => P1.
* 
}

procedure inicializarLista(var l:lista);
begin
	l := nil;
end;
{	Iniciliza la lista con una direccion nula y siendo la principal:
	
						[Lista=NIL]
	
}


procedure agregarElemento(var l:lista; num:integer);
var
	nuevoNodo:lista;
begin
	new(nuevoNodo);
	nuevoNodo^.elementos := num;
	nuevoNodo^.siguiente := nil;
	if(l=nil)then l:=nuevoNodo
	else begin
		nuevoNodo^.siguiente := l;
		l:= nuevoNodo;
	end;
end;
{	Agrega un elemento a la lista desde el punto principal y con una direccion propia.
	Como a su vez al momento de agregar lo hara en el ultimo nodo creado(dependiendo del procedimiento como lo haga):
	
				[Nodo1=Dir2/siguiente=>Dir1]<--[Lista=Dir1/siguiente=>NIL]

	Cada uno se relaciona con su direccion y con la que le sigue. Hasta llegar al ultimo de todos que termina con NIL ya que no tiene
	a uno que le siga.
}



procedure leerLista(l:lista);
begin
	while(l<>nil)do
	begin
		writeln(l^.elementos);
		l:= l^.siguiente;
	end;
end;
{	Recorre desde el ultimo nodo creado hasta el primer punto en el que termina con NIL:
	
	leerLista(l);
		|
		|-->------->--------->--------->-------|------>----->----->---->------| [FIN]
		V									   V							  V
		
	[Nodo2=Dir3/siguiente=>Dir2]<--[Nodo1=Dir2/siguiente=>Dir1]<--[Lista=Dir1/siguiente=>NIL]
}


var
	L:lista;
	i:integer;
BEGIN
	inicializarLista(l);
	for i:=0 to 10 do
	begin
		if((i MOD 2) = 0)then
		agregarElemento(l,i);
	end;
	leerLista(l);
	
	dispose(l);	//Destruccion de la lista(Solamente al finalizar el programa y ya no necesitar de la misma).Aun que el lenguaje destruye la lista automaticamente.
END.
